"""
Business Logic Services for RSPC Module
Contains all complex business logic, calculations, and custom exceptions
"""

from datetime import date, timedelta
from decimal import Decimal
from django.db import transaction
from django.core.exceptions import ValidationError
from django.utils import timezone

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
        """Create a new sponsored project with validation"""
        try:
            project = SponsoredProject.objects.create(
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
            return project
        except Exception as e:
            raise RSPCServiceException(f"Failed to create project: {str(e)}")
    
    @staticmethod
    def update_project_status(project_id: int, new_status: str) -> SponsoredProject:
        """Update project status with validation"""
        valid_transitions = {
            'PROPOSED': ['SUBMITTED'],
            'SUBMITTED': ['UNDER_REVIEW', 'REJECTED'],
            'UNDER_REVIEW': ['APPROVED', 'REJECTED'],
            'APPROVED': ['SANCTIONED'],
            'SANCTIONED': ['ONGOING'],
            'ONGOING': ['EXTENDED', 'COMPLETED', 'TERMINATED'],
            'EXTENDED': ['COMPLETED', 'TERMINATED'],
        }
        
        try:
            project = SponsoredProject.objects.get(id=project_id)
            
            if new_status not in valid_transitions.get(project.status, []):
                raise InvalidProjectStatusException(
                    f"Cannot transition from {project.status} to {new_status}"
                )
            
            project.status = new_status
            
            # Set timestamp based on status
            if new_status == 'SANCTIONED':
                project.sanction_date = timezone.now().date()
            elif new_status == 'ONGOING':
                project.start_date = timezone.now().date()
            elif new_status == 'COMPLETED':
                project.actual_end_date = timezone.now().date()
            
            project.save()
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
            return False
    
    @staticmethod
    def add_expenditure(project_id: int, expenditure_head: str, amount: Decimal, 
                       date_obj: date, description: str = "") -> ProjectExpenditure:
        """Add expenditure with budget validation"""
        if not SponsoredProjectService.can_add_expenditure(project_id, amount):
            raise InsufficientBudgetException(
                f"Insufficient budget for expenditure of {amount}"
            )
        
        try:
            project = SponsoredProject.objects.get(id=project_id)
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
            raise RSPCServiceException(f"Project with id {project_id} not found")


# ==================== EXPENDITURE SERVICES ====================

class ExpenditureService:
    """Business logic for Project Expenditures"""
    
    @staticmethod
    def approve_expenditure(expenditure_id: int, approved_by_user) -> ProjectExpenditure:
        """Approve an expenditure"""
        try:
            expenditure = ProjectExpenditure.objects.get(id=expenditure_id)
            
            if expenditure.status != 'PENDING':
                raise ExpenditureApprovalException(
                    f"Cannot approve expenditure with status {expenditure.status}"
                )
            
            expenditure.status = 'APPROVED'
            expenditure.approved_by = approved_by_user
            expenditure.approval_date = timezone.now().date()
            expenditure.save()
            
            # Update project utilized amount
            project = expenditure.project
            project.utilized_amount = (
                ProjectExpenditure.objects.filter(
                    project=project, status='APPROVED'
                ).aggregate(models.Sum('amount'))['amount__sum'] or Decimal('0')
            )
            project.save()
            
            return expenditure
        except ProjectExpenditure.DoesNotExist:
            raise ExpenditureApprovalException(f"Expenditure with id {expenditure_id} not found")
    
    @staticmethod
    def reject_expenditure(expenditure_id: int, remarks: str = "") -> ProjectExpenditure:
        """Reject an expenditure"""
        try:
            expenditure = ProjectExpenditure.objects.get(id=expenditure_id)
            
            if expenditure.status != 'PENDING':
                raise ExpenditureApprovalException(
                    f"Cannot reject expenditure with status {expenditure.status}"
                )
            
            expenditure.status = 'REJECTED'
            expenditure.remarks = remarks
            expenditure.save()
            
            return expenditure
        except ProjectExpenditure.DoesNotExist:
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
        valid_statuses = [
            'REGISTERED', 'COURSEWORK', 'COMPREHENSIVE_EXAM', 'SYNOPSIS',
            'THESIS_WRITING', 'THESIS_SUBMISSION', 'DEFENSE', 'COMPLETED'
        ]
        
        if new_status not in valid_statuses:
            raise ValidationError(f"Invalid progress status: {new_status}")
        
        try:
            scholar = ResearchScholar.objects.get(id=scholar_id)
            scholar.progress_status = new_status
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
    def record_payment(project_id: int, amount: Decimal) -> ConsultancyProject:
        """Record payment received for consultancy"""
        try:
            project = ConsultancyProject.objects.get(id=project_id)
            project.payment_received = (project.payment_received or Decimal('0')) + amount
            
            if project.payment_received >= project.contract_amount:
                project.status = 'COMPLETED'
            
            project.save()
            return project
        except ConsultancyProject.DoesNotExist:
            raise RSPCServiceException(f"Consultancy project with id {project_id} not found")
