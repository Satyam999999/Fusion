"""
Business Logic Services for RSPC Module
Contains all complex business logic, calculations, and custom exceptions
"""

from datetime import date, timedelta
from decimal import Decimal
from django.db import transaction, models
from django.core.exceptions import ValidationError
from django.utils import timezone
import logging

logger = logging.getLogger(__name__)

from .models import (
    SponsoredProject, ProjectExpenditure, ConsultancyProject,
    Publication, Patent, ResearchScholar
)
from applications.globals.models import Faculty, ExtraInfo


# ==================== CUSTOM EXCEPTIONS ====================

class RSPCServiceException(Exception):
    """Base exception for RSPC services"""
    pass


class InsufficientBudgetException(RSPCServiceException):
    """Raised when project budget is insufficient"""
    pass


class InvalidProjectStatusException(RSPCServiceException):
    """Raised when project status change is invalid"""
    pass


class ExpenditureApprovalException(RSPCServiceException):
    """Raised when expenditure approval fails"""
    pass


class InvalidMilestoneException(RSPCServiceException):
    """Raised when milestone operation fails"""
    pass


# ==================== SPONSORED PROJECT SERVICES ====================

class SponsoredProjectService:
    """Business logic for Sponsored Projects"""
    
    @staticmethod
    def create_project(user, title, principal_investigator, funding_agency,
                       sanctioned_amount, start_date, original_end_date, **kwargs) -> SponsoredProject:
        """Create a new sponsored project with full model validation before persisting."""
        try:
            project = SponsoredProject(
                title=title,
                principal_investigator=principal_investigator,
                funding_agency=funding_agency,
                sanctioned_amount=Decimal(sanctioned_amount),
                start_date=start_date,
                original_end_date=original_end_date,
                status='PROPOSED',
                user=user,
                **kwargs
            )
            # full_clean() runs all model validators before writing to DB.
            # objects.create() does NOT call clean(); building the instance and
            # calling save() (which itself calls full_clean() in our override) is
            # the correct pattern.
            project.save()
            return project
        except Exception as e:
            logger.error(f"Failed to create sponsored project '{title}': {str(e)}", exc_info=True)
            raise RSPCServiceException(f"Failed to create project: {str(e)}")
    
    @staticmethod
    def update_project_status(project_id: int, new_status: str) -> SponsoredProject:
        """Update project status, enforcing the defined transition graph.
        Admin-only overrides (skipping intermediate states) are intentionally
        limited to the _ADMIN_OVERRIDE_TARGETS set and must still land on a
        known status value.
        """
        valid_transitions = {
            'DRAFT': ['SUBMITTED'],
            'PROPOSED': ['SUBMITTED'],
            'SUBMITTED': ['VETTED_BY_HOD', 'VERIFIED_BY_ADMIN', 'REJECTED', 'UNDER_REVIEW'],
            'VETTED_BY_HOD': ['VERIFIED_BY_ADMIN', 'REJECTED'],
            'VERIFIED_BY_ADMIN': ['APPROVED', 'REJECTED', 'FORWARDED_TO_DIRECTOR', 'UNDER_REVIEW'],
            'FORWARDED_TO_DIRECTOR': ['APPROVED', 'REJECTED'],
            'UNDER_REVIEW': ['APPROVED', 'REJECTED'],
            'APPROVED': ['SANCTIONED'],
            'SANCTIONED': ['ONGOING'],
            'ONGOING': ['EXTENDED', 'COMPLETED', 'TERMINATED', 'DRAFT'],
            'EXTENDED': ['COMPLETED', 'TERMINATED'],
            'REJECTED': ['SUBMITTED'],
        }

        # Admin-override targets: statuses an RSPC Admin may force regardless
        # of current state (e.g. correcting data entry errors). These must still
        # be valid status codes and every such use should be audited in the view.
        _ADMIN_OVERRIDE_TARGETS = {'DRAFT'}

        all_valid_statuses = set(s for v in valid_transitions.values() for s in v) | set(valid_transitions)

        try:
            project = SponsoredProject.objects.get(id=project_id)

            allowed = valid_transitions.get(project.status, [])
            if new_status not in allowed:
                if new_status not in _ADMIN_OVERRIDE_TARGETS or new_status not in all_valid_statuses:
                    raise InvalidProjectStatusException(
                        f"Cannot transition from '{project.status}' to '{new_status}'. "
                        f"Allowed: {allowed}"
                    )
                # else: it is an explicit admin override to a whitelisted target

            project.status = new_status

            if new_status == 'SANCTIONED':
                project.sanction_date = timezone.now().date()
            elif new_status == 'ONGOING':
                project.start_date = project.start_date or timezone.now().date()
            elif new_status == 'COMPLETED':
                project.actual_end_date = timezone.now().date()

            update_fields = {"status": project.status}
            if new_status == 'SANCTIONED':
                update_fields["sanction_date"] = project.sanction_date
            elif new_status == 'ONGOING':
                update_fields["start_date"] = project.start_date
            elif new_status == 'COMPLETED':
                update_fields["actual_end_date"] = project.actual_end_date

            # Do not call model save() here: legacy records can fail unrelated
            # validations (e.g. PI title constraints) during status-only changes.
            SponsoredProject.objects.filter(id=project.id).update(**update_fields)
            return project
        except SponsoredProject.DoesNotExist:
            raise RSPCServiceException(f"Project with id {project_id} not found")

    @staticmethod
    def modify_duration(project_id: int, years: int) -> SponsoredProject:
        """Modify duration of a project"""
        try:
            project = SponsoredProject.objects.get(id=project_id)
            if years <= 0:
                raise ValueError("Years must be positive")
            project.duration_months = years * 12
            if project.start_date:
                project.extended_end_date = project.start_date + timedelta(days=(years * 365))

            update_fields = {"duration_months": project.duration_months}
            if project.start_date:
                update_fields["extended_end_date"] = project.extended_end_date

            # Keep duration modification resilient for legacy projects that fail
            # unrelated strict validations in model.save().
            SponsoredProject.objects.filter(id=project.id).update(**update_fields)
            return project
        except SponsoredProject.DoesNotExist:
            raise RSPCServiceException(f"Project with id {project_id} not found")
    
    @staticmethod
    def can_add_expenditure(project_id: int, amount: Decimal) -> bool:
        """Check if project has sufficient budget for new expenditure"""
        try:
            project = SponsoredProject.objects.get(id=project_id)
            total_expenditures = (
                ProjectExpenditure.objects.filter(project=project).aggregate(
                    models.Sum('amount')
                )['amount__sum'] or Decimal('0')
            )
            remaining_budget = project.sanctioned_amount - total_expenditures
            return amount <= remaining_budget
        except SponsoredProject.DoesNotExist:
            logger.warning(f"Failed budget check: Project {project_id} not found")
            return False
    
    @staticmethod
    @transaction.atomic
    def add_expenditure(project_id: int, expenditure_head: str, amount: Decimal,
                       date_obj: date, description: str = "") -> ProjectExpenditure:
        """Add expenditure with budget validation inside an atomic transaction.
        Uses select_for_update to prevent concurrent race conditions on the budget ceiling check.
        """
        try:
            # Lock the project row to prevent concurrent over-spend
            project = SponsoredProject.objects.select_for_update().get(id=project_id)

            current_utilized = (
                ProjectExpenditure.objects.filter(
                    project=project, status__in=['PENDING', 'APPROVED']
                ).aggregate(total=models.Sum('amount'))['total'] or Decimal('0')
            )
            if current_utilized + amount > project.sanctioned_amount:
                raise InsufficientBudgetException(
                    f"Insufficient budget: adding {amount} would exceed sanctioned "
                    f"{project.sanctioned_amount} (currently utilized: {current_utilized})"
                )

            expenditure = ProjectExpenditure.objects.create(
                project=project,
                expenditure_head=expenditure_head,
                amount=amount,
                date=date_obj,
                description=description,
                status='PENDING'
            )
            return expenditure
        except SponsoredProject.DoesNotExist:
            logger.error(f"Cannot add expenditure: Project {project_id} not found")
            raise RSPCServiceException(f"Project with id {project_id} not found")


# ==================== EXPENDITURE SERVICES ====================

class ExpenditureService:
    """Business logic for Project Expenditures"""
    
    @staticmethod
    @transaction.atomic
    def approve_expenditure(expenditure_id: int, approved_by_user) -> ProjectExpenditure:
        """Approve an expenditure atomically — both the expenditure status update and
        the parent project's utilized_amount recalculation succeed or both roll back.
        select_for_update prevents concurrent approvals from producing a stale budget sum.
        """
        try:
            expenditure = ProjectExpenditure.objects.select_for_update().get(id=expenditure_id)

            if expenditure.status != 'PENDING':
                raise ExpenditureApprovalException(
                    f"Cannot approve expenditure with status {expenditure.status}"
                )

            from applications.globals.models import ExtraInfo
            approver_info = ExtraInfo.objects.filter(user=approved_by_user).first()
            if not approver_info:
                raise ExpenditureApprovalException(
                    "Approver profile not found. Please ensure user has ExtraInfo mapping."
                )

            expenditure.status = 'APPROVED'
            expenditure.approved_by = approver_info
            expenditure.approval_date = timezone.now().date()
            expenditure.save()

            # Atomically recalculate and persist the project's utilized_amount
            project = SponsoredProject.objects.select_for_update().get(pk=expenditure.project_id)
            utilized_amount = (
                ProjectExpenditure.objects.filter(
                    project=project, status='APPROVED'
                ).aggregate(total=models.Sum('amount'))['total'] or Decimal('0')
            )
            SponsoredProject.objects.filter(pk=project.pk).update(
                utilized_amount=utilized_amount,
                updated_at=timezone.now(),
            )

            return expenditure
        except ProjectExpenditure.DoesNotExist:
            logger.error(f"Cannot approve expenditure {expenditure_id}: Not found")
            raise ExpenditureApprovalException(f"Expenditure with id {expenditure_id} not found")
        except Exception as e:
            logger.exception("Failed to approve expenditure", extra={"expenditure_id": expenditure_id})
            raise ExpenditureApprovalException(str(e))
    
    @staticmethod
    @transaction.atomic
    def reject_expenditure(expenditure_id: int, remarks: str = "") -> ProjectExpenditure:
        """Reject an expenditure atomically."""
        try:
            expenditure = ProjectExpenditure.objects.select_for_update().get(id=expenditure_id)

            if expenditure.status != 'PENDING':
                raise ExpenditureApprovalException(
                    f"Cannot reject expenditure with status {expenditure.status}"
                )

            expenditure.status = 'REJECTED'
            expenditure.remarks = remarks
            expenditure.save()

            return expenditure
        except ProjectExpenditure.DoesNotExist:
            logger.error(f"Cannot reject expenditure {expenditure_id}: Not found")
            raise ExpenditureApprovalException(f"Expenditure with id {expenditure_id} not found")


# ==================== PUBLICATION SERVICES ====================

class PublicationService:
    """Business logic for Publications"""
    
    @staticmethod
    def verify_publication(publication_id: int, verified_by_user) -> Publication:
        """Mark publication as verified"""
        try:
            publication = Publication.objects.get(id=publication_id)
            publication.is_verified = True
            publication.verified_by = verified_by_user
            publication.verification_date = timezone.now().date()
            publication.save()
            return publication
        except Publication.DoesNotExist:
            logger.error(f"Cannot verify publication {publication_id}: Not found")
            raise RSPCServiceException(f"Publication with id {publication_id} not found")


# ==================== PATENT SERVICES ====================

class PatentService:
    """Business logic for Patents"""
    
    @staticmethod
    def update_patent_status(patent_id: int, new_status: str) -> Patent:
        """Update patent status"""
        valid_statuses = [
            'DRAFT', 'FILED', 'PUBLISHED', 'UNDER_EXAMINATION',
            'GRANTED', 'REJECTED', 'LAPSED', 'ABANDONED'
        ]
        
        if new_status not in valid_statuses:
            raise ValidationError(f"Invalid patent status: {new_status}")
        
        try:
            patent = Patent.objects.get(id=patent_id)
            patent.status = new_status
            
            # Set relevant dates
            if new_status == 'GRANTED':
                patent.grant_date = timezone.now().date()
            elif new_status == 'REJECTED':
                patent.grant_date = None
            
            patent.save()
            return patent
        except Patent.DoesNotExist:
            logger.error(f"Cannot update patent status: Patent {patent_id} not found")
            raise RSPCServiceException(f"Patent with id {patent_id} not found")


# ==================== RESEARCH SCHOLAR SERVICES ====================

class ResearchScholarService:
    """Business logic for Research Scholars"""
    
    @staticmethod
    def calculate_years_enrolled(scholar_id: int) -> float:
        """Calculate years enrolled for a scholar"""
        try:
            scholar = ResearchScholar.objects.get(id=scholar_id)
            if not scholar.enrollment_date:
                return 0
            
            end_date = scholar.expected_completion or date.today()
            delta = end_date - scholar.enrollment_date
            return delta.days / 365.25
        except ResearchScholar.DoesNotExist:
            return 0
    
    @staticmethod
    def update_progress_status(scholar_id: int, new_status: str) -> ResearchScholar:
        """Update scholar progress status"""
        # Keep service-level validation in sync with model enum values.
        valid_statuses = {
            key for key, _ in ResearchScholar.PROGRESS_STATUS_CHOICES
        }

        # Backward compatibility for legacy UI/status strings.
        legacy_aliases = {
            'SYNOPSIS': 'SYNOPSIS_PHASE',
            'THESIS_SUBMISSION': 'DEFENSE_READY',
            'DEFENSE': 'DEFENDED',
        }
        normalized_status = legacy_aliases.get(new_status, new_status)
        
        if normalized_status not in valid_statuses:
            raise ValidationError(f"Invalid progress status: {new_status}")
        
        try:
            scholar = ResearchScholar.objects.get(id=scholar_id)
            scholar.progress_status = normalized_status
            scholar.save()
            return scholar
        except ResearchScholar.DoesNotExist:
            raise RSPCServiceException(f"Scholar with id {scholar_id} not found")


# ==================== CONSULTANCY SERVICES ====================

class ConsultancyService:
    """Business logic for Consultancy Projects"""
    
    @staticmethod
    def validate_financial_split(contract_amount: Decimal, faculty_share: Decimal,
                                 institute_share: Decimal) -> bool:
        """Validate that shares equal contract amount"""
        total_share = (faculty_share or Decimal('0')) + (institute_share or Decimal('0'))
        return total_share == contract_amount
    
    @staticmethod
    def create_consultancy_project(title: str, client_name: str, consultant: Faculty,
                                   contract_amount: Decimal, **kwargs) -> ConsultancyProject:
        """Create consultancy project with validation"""
        try:
            project = ConsultancyProject.objects.create(
                title=title,
                client_name=client_name,
                consultant=consultant,
                contract_amount=contract_amount,
                status='PROPOSED',
                **kwargs
            )
            return project
        except Exception as e:
            raise RSPCServiceException(f"Failed to create consultancy project: {str(e)}")
    
    @staticmethod
    @transaction.atomic
    def record_payment(project_id: int, amount: Decimal) -> ConsultancyProject:
        """Record payment received for consultancy atomically.
        select_for_update prevents two concurrent payments from losing an update.
        """
        try:
            project = ConsultancyProject.objects.select_for_update().get(id=project_id)
            project.payment_received = (project.payment_received or Decimal('0')) + amount

            if project.payment_received >= project.contract_amount:
                project.status = 'COMPLETED'

            project.save(update_fields=['payment_received', 'status', 'updated_at'])
            return project
        except ConsultancyProject.DoesNotExist:
            raise RSPCServiceException(f"Consultancy project with id {project_id} not found")
