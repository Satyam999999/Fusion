"""
Database Query Selectors for RSPC Module
Contains all .objects queries and complex ORM operations
"""

from django.db.models import Q, Sum, Count, F, Case, When, IntegerField
from datetime import date, timedelta
from decimal import Decimal

from .models import (
    ResearchGroup, ResearchArea, FundingAgency, SponsoredProject,
    ProjectExpenditure, ProjectMilestone, ProjectReport,
    ConsultancyProject, Publication, Patent, ResearchScholar,
    TechTransfer, ResearchProject
)
from applications.globals.models import Faculty, ExtraInfo


# ==================== RESEARCH GROUP SELECTORS ====================

class ResearchGroupSelector:
    """Database queries for Research Groups"""
    
    @staticmethod
    def get_all_active_groups():
        """Get all active research groups"""
        return ResearchGroup.objects.filter(is_active=True).order_by('name')
    
    @staticmethod
    def get_groups_by_discipline(discipline_id: int):
        """Get research groups by discipline"""
        return ResearchGroup.objects.filter(
            discipline_id=discipline_id, is_active=True
        )
    
    @staticmethod
    def get_group_members_count(group_id: int) -> int:
        """Get count of members in a group"""
        group = ResearchGroup.objects.get(id=group_id)
        return group.members.count()
    
    @staticmethod
    def get_group_with_details(group_id: int):
        """Get group with all related information"""
        return ResearchGroup.objects.select_related(
            'head', 'discipline'
        ).prefetch_related(
            'members', 'faculty_under_group', 'students_under_group'
        ).get(id=group_id)


# ==================== RESEARCH AREA SELECTORS ====================

class ResearchAreaSelector:
    """Database queries for Research Areas"""
    
    @staticmethod
    def get_all_areas():
        """Get all research areas"""
        return ResearchArea.objects.filter(is_active=True).order_by('name')
    
    @staticmethod
    def get_parent_areas():
        """Get all parent (root) research areas"""
        return ResearchArea.objects.filter(parent_area__isnull=True, is_active=True)
    
    @staticmethod
    def get_child_areas(parent_id: int):
        """Get child areas for a parent"""
        return ResearchArea.objects.filter(
            parent_area_id=parent_id, is_active=True
        )
    
    @staticmethod
    def get_areas_by_faculty(faculty_id: int):
        """Get research areas where faculty is an expert"""
        return ResearchArea.objects.filter(
            faculty_experts__id=faculty_id,
            is_active=True
        )


# ==================== FUNDING AGENCY SELECTORS ====================

class FundingAgencySelector:
    """Database queries for Funding Agencies"""
    
    @staticmethod
    def get_all_agencies():
        """Get all active funding agencies"""
        return FundingAgency.objects.filter(is_active=True).order_by('name')
    
    @staticmethod
    def get_agencies_by_type(agency_type: str):
        """Get agencies by type"""
        return FundingAgency.objects.filter(
            agency_type=agency_type, is_active=True
        )
    
    @staticmethod
    def get_agencies_by_country(country: str):
        """Get agencies by country"""
        return FundingAgency.objects.filter(
            country=country, is_active=True
        )


# ==================== SPONSORED PROJECT SELECTORS ====================

class SponsoredProjectSelector:
    """Database queries for Sponsored Projects"""
    
    @staticmethod
    def get_all_projects():
        """Get all sponsored projects"""
        return SponsoredProject.objects.select_related(
            'principal_investigator__id__user', 'funding_agency', 'research_area'
        ).order_by('-start_date')
    
    @staticmethod
    def get_projects_by_faculty(faculty_id: int):
        """Get projects where faculty is PI or co-PI"""
        return SponsoredProject.objects.select_related(
            'principal_investigator__id__user', 'funding_agency', 'research_area'
        ).prefetch_related('co_principal_investigators').filter(
            Q(principal_investigator__id=faculty_id) |
            Q(co_principal_investigators__id=faculty_id)
        ).distinct().order_by('-start_date')
    
    @staticmethod
    def get_projects_by_status(status: str):
        """Get projects by status"""
        return SponsoredProject.objects.select_related(
            'principal_investigator__id__user', 'funding_agency', 'research_area'
        ).filter(
            status=status
        ).order_by('-start_date')
    
    @staticmethod
    def get_ongoing_projects():
        """Get all ongoing projects"""
        return SponsoredProject.objects.select_related(
            'principal_investigator__id__user', 'funding_agency', 'research_area'
        ).filter(
            status__in=['ONGOING', 'EXTENDED']
        ).order_by('-start_date')
    
    @staticmethod
    def get_projects_by_funding_agency(agency_id: int):
        """Get projects funded by specific agency"""
        return SponsoredProject.objects.select_related(
            'principal_investigator__id__user', 'funding_agency', 'research_area'
        ).filter(
            funding_agency_id=agency_id
        ).order_by('-start_date')
    
    @staticmethod
    def get_project_expenditure_summary(project_id: int):
        """Get expenditure summary for a project"""
        return SponsoredProject.objects.filter(
            id=project_id
        ).annotate(
            total_expenditure=Sum('projectexpenditure__amount'),
            pending_expenditure=Sum(
                'projectexpenditure__amount',
                filter=Q(projectexpenditure__status='PENDING')
            ),
            approved_expenditure=Sum(
                'projectexpenditure__amount',
                filter=Q(projectexpenditure__status='APPROVED')
            )
        ).values(
            'total_expenditure', 'pending_expenditure', 'approved_expenditure'
        ).first()
    
    @staticmethod
    def get_projects_by_research_area(area_id: int):
        """Get projects in a research area"""
        return SponsoredProject.objects.select_related(
            'principal_investigator__id__user', 'funding_agency', 'research_area'
        ).filter(
            research_area_id=area_id
        ).order_by('-start_date')
    
    @staticmethod
    def get_total_project_funding():
        """Get total funding for all projects"""
        return SponsoredProject.objects.aggregate(
            total=Sum('sanctioned_amount')
        )['total'] or Decimal('0')


# ==================== PROJECT EXPENDITURE SELECTORS ====================

class ProjectExpenditureSelector:
    """Database queries for Project Expenditures"""
    
    @staticmethod
    def get_project_expenditures(project_id: int):
        """Get all expenditures for a project"""
        return ProjectExpenditure.objects.filter(
            project_id=project_id
        ).order_by('-date')
    
    @staticmethod
    def get_pending_expenditures(project_id: int):
        """Get pending expenditures for approval"""
        return ProjectExpenditure.objects.filter(
            project_id=project_id,
            status='PENDING'
        ).order_by('-date')
    
    @staticmethod
    def get_expenditures_by_head(project_id: int, expenditure_head: str):
        """Get expenditures by type"""
        return ProjectExpenditure.objects.filter(
            project_id=project_id,
            expenditure_head=expenditure_head
        ).order_by('-date')
    
    @staticmethod
    def get_expenditure_summary_by_head(project_id: int):
        """Get expenditure totals by head"""
        return ProjectExpenditure.objects.filter(
            project_id=project_id
        ).values('expenditure_head').annotate(
            total=Sum('amount'),
            count=Count('id')
        )


# ==================== PROJECT MILESTONE SELECTORS ====================

class ProjectMilestoneSelector:
    """Database queries for Project Milestones"""
    
    @staticmethod
    def get_project_milestones(project_id: int):
        """Get all milestones for a project"""
        return ProjectMilestone.objects.filter(
            project_id=project_id
        ).order_by('due_date')
    
    @staticmethod
    def get_overdue_milestones(project_id: int = None):
        """Get overdue milestones"""
        today = date.today()
        query = ProjectMilestone.objects.filter(
            due_date__lt=today,
            status__in=['PENDING', 'ONGOING']
        )
        if project_id:
            query = query.filter(project_id=project_id)
        return query.order_by('due_date')
    
    @staticmethod
    def get_completed_milestones(project_id: int):
        """Get completed milestones"""
        return ProjectMilestone.objects.filter(
            project_id=project_id,
            status='COMPLETED'
        ).order_by('-completed_date')
    
    @staticmethod
    def get_upcoming_milestones(days_ahead: int = 30):
        """Get milestones due in next N days"""
        today = date.today()
        future = today + timedelta(days=days_ahead)
        return ProjectMilestone.objects.filter(
            due_date__gte=today,
            due_date__lte=future,
            status__in=['PENDING', 'ONGOING']
        ).order_by('due_date')


# ==================== PROJECT REPORT SELECTORS ====================

class ProjectReportSelector:
    """Database queries for Project Reports"""
    
    @staticmethod
    def get_project_reports(project_id: int):
        """Get all reports for a project"""
        return ProjectReport.objects.filter(
            project_id=project_id
        ).order_by('-period_from')
    
    @staticmethod
    def get_pending_reports(project_id: int):
        """Get pending reports for approval"""
        return ProjectReport.objects.filter(
            project_id=project_id,
            status='PENDING'
        ).order_by('-period_from')
    
    @staticmethod
    def get_approved_reports(project_id: int):
        """Get approved reports"""
        return ProjectReport.objects.filter(
            project_id=project_id,
            status='APPROVED'
        ).order_by('-period_from')


# ==================== CONSULTANCY PROJECT SELECTORS ====================

class ConsultancyProjectSelector:
    """Database queries for Consultancy Projects"""
    
    @staticmethod
    def get_all_consultancies():
        """Get all consultancy projects"""
        return ConsultancyProject.objects.select_related(
            'consultant__id__user'
        ).order_by('-start_date')
    
    @staticmethod
    def get_consultancies_by_faculty(faculty_id: int):
        """Get consultancies where faculty is consultant"""
        return ConsultancyProject.objects.select_related(
            'consultant__id__user'
        ).filter(
            Q(consultant__id=faculty_id) |
            Q(co_consultants__id=faculty_id)
        ).distinct().order_by('-start_date')
    
    @staticmethod
    def get_consultancies_by_status(status: str):
        """Get consultancies by status"""
        return ConsultancyProject.objects.select_related(
            'consultant__id__user'
        ).filter(
            status=status
        ).order_by('-start_date')
    
    @staticmethod
    def get_consultancies_by_client_type(client_type: str):
        """Get consultancies by client type"""
        return ConsultancyProject.objects.select_related(
            'consultant__id__user'
        ).filter(
            client_type=client_type
        ).order_by('-start_date')
    
    @staticmethod
    def get_total_consultancy_value():
        """Get total value of all consultancies"""
        return ConsultancyProject.objects.aggregate(
            total=Sum('contract_amount')
        )['total'] or Decimal('0')


# ==================== PUBLICATION SELECTORS ====================

class PublicationSelector:
    """Database queries for Publications"""
    
    @staticmethod
    def get_all_publications():
        """Get all publications"""
        # Avoid touching legacy student_authors relation here: some local DBs
        # use an older join-table shape and this can raise runtime SQL errors.
        return Publication.objects.prefetch_related(
            'faculty_authors'
        ).order_by('-year')
    
    @staticmethod
    def get_publications_by_faculty(faculty_id: int):
        """Get publications by faculty"""
        return Publication.objects.prefetch_related('faculty_authors').filter(
            faculty_authors__id=faculty_id
        ).distinct().order_by('-year')
    
    @staticmethod
    def get_verified_publications():
        """Get verified publications"""
        return Publication.objects.prefetch_related('faculty_authors').filter(
            is_verified=True
        ).order_by('-year')
    
    @staticmethod
    def get_publications_by_type(pub_type: str):
        """Get publications by type"""
        return Publication.objects.prefetch_related('faculty_authors').filter(
            publication_type=pub_type
        ).order_by('-year')
    
    @staticmethod
    def get_sci_publications():
        """Get SCI indexed publications"""
        return Publication.objects.prefetch_related('faculty_authors').filter(
            index_type__in=['SCI', 'SCIE']
        ).order_by('-year')
    
    @staticmethod
    def get_publications_by_year(year: int):
        """Get publications by year"""
        return Publication.objects.prefetch_related('faculty_authors').filter(year=year).order_by('-year')


# ==================== PATENT SELECTORS ====================

class PatentSelector:
    """Database queries for Patents"""
    
    @staticmethod
    def get_all_patents():
        """Get all patents"""
        # Avoid touching legacy student_inventors relation here: some local
        # DBs use an older join-table shape and this can raise SQL errors.
        return Patent.objects.prefetch_related(
            'faculty_inventors'
        ).order_by('-filing_date')
    
    @staticmethod
    def get_patents_by_faculty(faculty_id: int):
        """Get patents invented by faculty"""
        return Patent.objects.prefetch_related('faculty_inventors').filter(
            faculty_inventors__id=faculty_id
        ).distinct().order_by('-filing_date')
    
    @staticmethod
    def get_patents_by_status(status: str):
        """Get patents by status"""
        return Patent.objects.prefetch_related('faculty_inventors').filter(
            status=status
        ).order_by('-filing_date')
    
    @staticmethod
    def get_granted_patents():
        """Get granted patents"""
        return Patent.objects.prefetch_related('faculty_inventors').filter(
            status='GRANTED'
        ).order_by('-grant_date')
    
    @staticmethod
    def get_patents_by_country(country: str):
        """Get patents by country"""
        return Patent.objects.prefetch_related('faculty_inventors').filter(
            country=country
        ).order_by('-filing_date')


# ==================== RESEARCH SCHOLAR SELECTORS ====================

class ResearchScholarSelector:
    """Database queries for Research Scholars"""
    
    @staticmethod
    def get_all_scholars():
        """Get all research scholars"""
        # Avoid select_related on student for legacy schemas where FK type differs.
        return ResearchScholar.objects.order_by('-enrollment_date')
    
    @staticmethod
    def get_scholars_by_status(status: str):
        """Get scholars by progress status"""
        return ResearchScholar.objects.filter(
            progress_status=status
        ).order_by('-enrollment_date')
    
    @staticmethod
    def get_scholars_with_fellowship():
        """Get scholars receiving fellowship"""
        return ResearchScholar.objects.exclude(
            fellowship_type__isnull=True
        ).order_by('-enrollment_date')
    
    @staticmethod
    def get_scholars_by_fellowship_type(fellowship_type: str):
        """Get scholars by fellowship type"""
        return ResearchScholar.objects.filter(
            fellowship_type=fellowship_type
        ).order_by('-enrollment_date')
    
    @staticmethod
    def get_scholars_with_thesis_submitted():
        """Get scholars who have submitted thesis"""
        return ResearchScholar.objects.filter(
            thesis_submitted=True
        ).order_by('-thesis_submission_date')
    
    @staticmethod
    def get_scholars_statistics():
        """Get statistics on research scholars"""
        return ResearchScholar.objects.values('progress_status').annotate(
            count=Count('id'),
            total_publications=Sum('publications_count'),
            total_patents=Sum('patents_count')
        )


# ==================== FACULTY RESEARCH PROFILE ====================

class FacultyResearchSelector:
    """Database queries for faculty research information"""
    
    @staticmethod
    def get_faculty_projects(faculty_id: int):
        """Get all projects for a faculty"""
        return SponsoredProject.objects.filter(
            Q(principal_investigator__id=faculty_id) |
            Q(co_principal_investigators__id=faculty_id)
        ).distinct()
    
    @staticmethod
    def get_faculty_sponsored_amount(faculty_id: int) -> Decimal:
        """Get total sponsored project funding for faculty"""
        total = SponsoredProject.objects.filter(
            Q(principal_investigator__id=faculty_id) |
            Q(co_principal_investigators__id=faculty_id)
        ).aggregate(
            total=Sum('sanctioned_amount')
        )['total'] or Decimal('0')
        return total
    
    @staticmethod
    def get_faculty_publication_stats(faculty_id: int):
        """Get publication statistics for faculty"""
        return Publication.objects.filter(
            faculty_authors__id=faculty_id
        ).values('publication_type', 'index_type').annotate(count=Count('id'))
    
    @staticmethod
    def get_faculty_patent_count(faculty_id: int) -> int:
        """Get patent count for faculty"""
        return Patent.objects.filter(
            faculty_inventors__id=faculty_id
        ).count()


# ==================== DEPARTMENT RESEARCH STATISTICS ====================

class DepartmentResearchSelector:
    """Database queries for department research statistics"""
    
    @staticmethod
    def get_department_projects_count(department_id: int) -> int:
        """Get total projects count for department"""
        return SponsoredProject.objects.filter(
            principal_investigator__id__extrainfo__department_id=department_id
        ).count()
    
    @staticmethod
    def get_department_total_funding(department_id: int) -> Decimal:
        """Get total research funding for department"""
        total = SponsoredProject.objects.filter(
            principal_investigator__id__extrainfo__department_id=department_id
        ).aggregate(
            total=Sum('sanctioned_amount')
        )['total'] or Decimal('0')
        return total
    
    @staticmethod
    def get_department_publication_count(department_id: int) -> int:
        """Get publication count for department"""
        return Publication.objects.filter(
            faculty_authors__id__extrainfo__department_id=department_id
        ).distinct().count()
    
    @staticmethod
    def get_department_patent_count(department_id: int) -> int:
        """Get patent count for department"""
        return Patent.objects.filter(
            faculty_inventors__id__extrainfo__department_id=department_id
        ).distinct().count()
