"""
Django REST Framework Views for RSPC Module API
Thin views layer - delegates business logic to services and selectors
"""

from rest_framework import viewsets, status, filters
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.permissions import AllowAny, IsAuthenticated
from django.conf import settings
from django_filters.rest_framework import DjangoFilterBackend
from django.utils import timezone
from django.http import HttpResponse
from datetime import timedelta

from ..models import (
    ResearchGroup, ResearchArea, FundingAgency, SponsoredProject,
    ProjectExpenditure, ProjectMilestone, ProjectReport,
    ConsultancyProject, Publication, Patent, PatentStatusNotification, ResearchScholar,
    TechTransfer, ResearchProject
)
from applications.globals.permissions import (
    IsDeanFacultyOrAdmin,
    IsFacultyCreateOrReadOnly,
    IsRSPCAdminOrReadOnly,
    RoleChecks,
    RSPC_ROLE_RSPC_ADMIN,
    RSPC_ROLE_DEAN_RSPC,
    RSPC_ROLE_DIRECTOR,
)

from ..selectors import (
    ResearchGroupSelector, ResearchAreaSelector, FundingAgencySelector,
    SponsoredProjectSelector, ProjectExpenditureSelector, ProjectMilestoneSelector,
    ProjectReportSelector, PublicationSelector, PatentSelector, ResearchScholarSelector,
    FacultyResearchSelector, DepartmentResearchSelector
)

from .serializers import (
    ResearchGroupListSerializer, ResearchGroupDetailSerializer, ResearchGroupCreateUpdateSerializer,
    ResearchAreaSerializer, FundingAgencySerializer,
    SponsoredProjectListSerializer, SponsoredProjectDetailSerializer, SponsoredProjectCreateUpdateSerializer,
    ProjectExpenditureSerializer, ProjectMilestoneSerializer, ProjectReportSerializer,
    ConsultancyProjectListSerializer, ConsultancyProjectDetailSerializer, ConsultancyProjectCreateUpdateSerializer,
    PublicationSerializer, PatentSerializer, ResearchScholarSerializer,
    TechTransferSerializer, ResearchProjectSerializer
)


# ==================== RESEARCH GROUP ====================

class ResearchGroupViewSet(viewsets.ModelViewSet):

    permission_classes = [IsFacultyCreateOrReadOnly]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter]

    filterset_fields = ['is_active', 'discipline']
    search_fields = ['name', 'acronym', 'description']
    ordering_fields = ['name', 'established_date']

    ordering = ['-established_date']

    def get_queryset(self):
        return ResearchGroupSelector.get_all_active_groups()

    def get_serializer_class(self):
        if self.action == 'list':
            return ResearchGroupListSerializer
        elif self.action == 'retrieve':
            return ResearchGroupDetailSerializer
        return ResearchGroupCreateUpdateSerializer


# ==================== RESEARCH AREA ====================

class ResearchAreaViewSet(viewsets.ModelViewSet):

    queryset = ResearchArea.objects.all()
    serializer_class = ResearchAreaSerializer
    permission_classes = [AllowAny]  # Lookup table: open in local dev

    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['discipline', 'is_active']
    search_fields = ['name', 'description']


# ==================== FUNDING AGENCY ====================

class FundingAgencyViewSet(viewsets.ReadOnlyModelViewSet):

    serializer_class = FundingAgencySerializer
    permission_classes = [AllowAny]  # Lookup table: open in local dev

    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['agency_type', 'country']
    search_fields = ['name', 'acronym']

    ordering = ['name']

    def get_queryset(self):
        return FundingAgencySelector.get_all_agencies()


# ==================== SPONSORED PROJECT ====================

class SponsoredProjectViewSet(viewsets.ModelViewSet):

    permission_classes = [IsFacultyCreateOrReadOnly]

    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['status', 'funding_agency']
    search_fields = ['title', 'project_number']

    ordering = ['-start_date']

    def perform_create(self, serializer):
        project = serializer.save()

        if project.status == 'DRAFT':
            return

        if not project.status or project.status == 'PROPOSED':
            project.status = 'SUBMITTED'
            project.save(update_fields=['status'])

    def get_queryset(self):
        return SponsoredProjectSelector.get_all_projects()

    def get_serializer_class(self):

        if self.action == 'list':
            return SponsoredProjectListSerializer

        elif self.action == 'retrieve':
            return SponsoredProjectDetailSerializer

        return SponsoredProjectCreateUpdateSerializer

    @action(detail=True, methods=['post'])
    def update_status(self, request, pk=None):

        try:

            project = SponsoredProject.objects.get(id=pk)
            new_status = request.data.get('status')

            if not new_status:
                return Response({"error": "status required"}, status=400)

            allowed = {choice[0] for choice in SponsoredProject.PROJECT_STATUS_CHOICES}
            if new_status not in allowed:
                return Response({"error": "Invalid status"}, status=400)

            project.status = new_status
            project.save()

            return Response(SponsoredProjectDetailSerializer(project).data)

        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)

    @action(detail=True, methods=['get'])
    def project_details(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
            payload = SponsoredProjectDetailSerializer(project).data
            payload['co_pi_details'] = [
                {
                    'id': copi.pk,
                    'name': copi.id.user.get_full_name() or copi.id.user.username,
                    'designation': copi.id.title,
                }
                for copi in project.co_principal_investigators.all()
            ]
            return Response(payload)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)

    @action(detail=True, methods=['post'])
    def modify_duration(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
            years = int(request.data.get('years', 0))
            if years <= 0:
                return Response({"error": "years must be a positive integer"}, status=400)

            project.duration_months = years * 12
            if project.start_date:
                project.extended_end_date = project.start_date + timedelta(days=(years * 365))
            project.save()
            return Response(SponsoredProjectDetailSerializer(project).data)
        except ValueError:
            return Response({"error": "Invalid years value"}, status=400)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)

    @action(detail=True, methods=['post'])
    def save_draft(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
            project.status = 'DRAFT'
            project.save(update_fields=['status'])
            return Response(SponsoredProjectDetailSerializer(project).data)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)

    @action(detail=True, methods=['post'])
    def resubmit(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
            if project.status not in {'DRAFT', 'REJECTED'}:
                return Response({"error": "Only DRAFT or REJECTED projects can be resubmitted"}, status=400)

            project.status = 'SUBMITTED'
            project.save(update_fields=['status'])
            return Response(SponsoredProjectDetailSerializer(project).data)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)

    @action(detail=True, methods=['post'])
    def vet_hod(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
            user = request.user
            if not settings.DEBUG and not RoleChecks.is_department_head(user):
                return Response({"error": "Department Head role required"}, status=403)

            # BR-017: if PI is also HoD, departmental review can be skipped.
            if project.principal_investigator_id:
                pi_user = project.principal_investigator.id.user
                if pi_user == user:
                    project.status = 'VERIFIED_BY_ADMIN'
                    project.save(update_fields=['status'])
                    return Response(SponsoredProjectDetailSerializer(project).data)

            if project.status not in {'SUBMITTED'}:
                return Response({"error": "Only submitted projects can be vetted"}, status=400)

            project.status = 'VETTED_BY_HOD'
            project.save(update_fields=['status'])
            return Response(SponsoredProjectDetailSerializer(project).data)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)

    @action(detail=True, methods=['post'])
    def verify_admin(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
            user = request.user
            if not settings.DEBUG and not RoleChecks.has_rspc_role(user, RSPC_ROLE_RSPC_ADMIN):
                return Response({"error": "RSPC Admin role required"}, status=403)

            if project.status not in {'VETTED_BY_HOD', 'SUBMITTED'}:
                return Response({"error": "Project must be vetted/submitted before admin verification"}, status=400)

            project.status = 'VERIFIED_BY_ADMIN'
            project.save(update_fields=['status'])
            return Response(SponsoredProjectDetailSerializer(project).data)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)

    @action(detail=True, methods=['post'])
    def dean_decision(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
            user = request.user
            if not settings.DEBUG and not RoleChecks.has_rspc_role(user, RSPC_ROLE_DEAN_RSPC):
                return Response({"error": "Dean-RSPC role required"}, status=403)

            decision = (request.data.get('decision') or '').upper()
            if decision not in {'APPROVE', 'REJECT', 'FORWARD_DIRECTOR'}:
                return Response({"error": "decision must be APPROVE, REJECT, or FORWARD_DIRECTOR"}, status=400)

            if project.status not in {'VERIFIED_BY_ADMIN', 'UNDER_REVIEW'}:
                return Response({"error": "Project must be verified by admin before dean decision"}, status=400)

            if decision == 'APPROVE':
                project.status = 'APPROVED'
            elif decision == 'REJECT':
                project.status = 'REJECTED'
            else:
                project.status = 'FORWARDED_TO_DIRECTOR'

            project.save(update_fields=['status'])
            return Response(SponsoredProjectDetailSerializer(project).data)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)

    @action(detail=True, methods=['post'])
    def director_decision(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
            user = request.user
            if not settings.DEBUG and not RoleChecks.has_rspc_role(user, RSPC_ROLE_DIRECTOR):
                return Response({"error": "Director role required"}, status=403)

            decision = (request.data.get('decision') or '').upper()
            if decision not in {'APPROVE', 'REJECT'}:
                return Response({"error": "decision must be APPROVE or REJECT"}, status=400)

            if project.status not in {'FORWARDED_TO_DIRECTOR'}:
                return Response({"error": "Project must be forwarded to director"}, status=400)

            project.status = 'APPROVED' if decision == 'APPROVE' else 'REJECTED'
            project.save(update_fields=['status'])
            return Response(SponsoredProjectDetailSerializer(project).data)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)

    @action(detail=True, methods=['get'])
    def download_pdf(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)

        try:
            from reportlab.pdfgen import canvas
        except Exception:
            return Response({"error": "reportlab is required for PDF generation"}, status=500)

        response = HttpResponse(content_type='application/pdf')
        response['Content-Disposition'] = f'attachment; filename="project_{project.project_number}.pdf"'
        pdf = canvas.Canvas(response)
        y = 800
        for line in [
            f"Project Number: {project.project_number}",
            f"Title: {project.title}",
            f"PI: {project.principal_investigator}",
            f"Status: {project.status}",
            f"Sanctioned Amount: {project.sanctioned_amount}",
            f"Utilized Amount: {project.utilized_amount}",
            f"Start Date: {project.start_date}",
            f"End Date: {project.original_end_date}",
        ]:
            pdf.drawString(72, y, line)
            y -= 22
        pdf.showPage()
        pdf.save()
        return response


# ==================== PROJECT EXPENDITURE ====================

class ProjectExpenditureViewSet(viewsets.ModelViewSet):

    serializer_class = ProjectExpenditureSerializer
    permission_classes = [IsRSPCAdminOrReadOnly]

    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['project', 'status']

    ordering = ['-date']

    def get_queryset(self):

        project_id = self.request.query_params.get("project_id") or self.request.query_params.get("project")

        if project_id:
            return ProjectExpenditureSelector.get_project_expenditures(project_id)

        return ProjectExpenditure.objects.all()

    @action(detail=False, methods=['get'])
    def stipend_disbursements(self, request):
        queryset = self.get_queryset().filter(expenditure_head='MANPOWER')
        return Response(self.get_serializer(queryset, many=True).data)

    @action(detail=True, methods=['post'])
    def approve(self, request, pk=None):

        try:

            expenditure = ProjectExpenditure.objects.get(id=pk)

            # BR-009: enforce approval authority by stipend amount tiers.
            if expenditure.expenditure_head == 'MANPOWER':
                amount = expenditure.amount or 0
                user = request.user
                if amount <= 50000 and not RoleChecks.has_rspc_role(user, RSPC_ROLE_RSPC_ADMIN):
                    return Response({"error": "RSPC Admin approval required for stipend <= 50,000"}, status=403)
                if 50000 < amount <= 200000 and not RoleChecks.has_rspc_role(user, RSPC_ROLE_DEAN_RSPC):
                    return Response({"error": "Dean-RSPC approval required for stipend between 50,001 and 200,000"}, status=403)
                if amount > 200000 and not RoleChecks.has_rspc_role(user, RSPC_ROLE_DIRECTOR):
                    return Response({"error": "Director approval required for stipend above 200,000"}, status=403)

            expenditure.status = "APPROVED"
            expenditure.approved_by = None
            expenditure.save()

            return Response(self.get_serializer(expenditure).data)

        except ProjectExpenditure.DoesNotExist:
            return Response({"error": "Expenditure not found"}, status=404)

    @action(detail=True, methods=['post'])
    def reject(self, request, pk=None):

        try:

            expenditure = ProjectExpenditure.objects.get(id=pk)

            remarks = request.data.get("remarks", "")

            expenditure.status = "REJECTED"
            expenditure.remarks = remarks
            expenditure.save()

            return Response(self.get_serializer(expenditure).data)

        except ProjectExpenditure.DoesNotExist:
            return Response({"error": "Expenditure not found"}, status=404)


# ==================== PROJECT MILESTONE ====================

class ProjectMilestoneViewSet(viewsets.ModelViewSet):

    serializer_class = ProjectMilestoneSerializer
    permission_classes = [IsRSPCAdminOrReadOnly]

    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['project', 'status']

    def get_queryset(self):

        project_id = self.request.query_params.get("project_id") or self.request.query_params.get("project")

        if project_id:
            return ProjectMilestoneSelector.get_project_milestones(project_id)

        return ProjectMilestone.objects.all()


# ==================== PROJECT REPORT ====================

class ProjectReportViewSet(viewsets.ModelViewSet):

    serializer_class = ProjectReportSerializer
    permission_classes = [IsFacultyCreateOrReadOnly]

    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['project', 'status']

    def get_queryset(self):

        project_id = self.request.query_params.get("project_id") or self.request.query_params.get("project")

        if project_id:
            return ProjectReportSelector.get_project_reports(project_id)

        return ProjectReport.objects.all()

class ConsultancyProjectViewSet(viewsets.ModelViewSet):
    """
    API View for Consultancy Projects
    """

    permission_classes = [IsFacultyCreateOrReadOnly]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter]

    filterset_fields = ['status', 'client_type']
    search_fields = ['title', 'project_number', 'client_name']

    ordering = ['-start_date']

    def perform_create(self, serializer):
        consultancy = serializer.save()

        if consultancy.status == 'DRAFT':
            return

        if not consultancy.status or consultancy.status == 'PROPOSED':
            consultancy.status = 'SUBMITTED'
            consultancy.save(update_fields=['status'])

    def get_queryset(self):
        return ConsultancyProject.objects.all()

    def get_serializer_class(self):
        if self.action == "list":
            return ConsultancyProjectListSerializer
        elif self.action == "retrieve":
            return ConsultancyProjectDetailSerializer
        return ConsultancyProjectCreateUpdateSerializer
# ==================== PUBLICATION ====================

class PublicationViewSet(viewsets.ModelViewSet):

    serializer_class = PublicationSerializer
    permission_classes = [IsRSPCAdminOrReadOnly]

    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['year', 'publication_type']

    ordering = ['-year']

    def get_queryset(self):
        return PublicationSelector.get_all_publications()

    @action(detail=True, methods=['post'])
    def verify(self, request, pk=None):

        try:

            publication = Publication.objects.get(id=pk)

            publication.is_verified = True
            publication.verified_by = None
            publication.verification_date = timezone.now().date()
            publication.save()

            return Response(self.get_serializer(publication).data)

        except Publication.DoesNotExist:
            return Response({"error": "Publication not found"}, status=404)


# ==================== PATENT ====================

class PatentViewSet(viewsets.ModelViewSet):

    serializer_class = PatentSerializer
    permission_classes = [IsDeanFacultyOrAdmin]

    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['status', 'country']

    ordering = ['-filing_date']

    def get_queryset(self):
        return PatentSelector.get_all_patents()

    @action(detail=True, methods=['post'])
    def update_status(self, request, pk=None):

        try:

            patent = Patent.objects.get(application_id=pk)

            new_status = request.data.get("status")

            if not new_status:
                return Response({"error": "status required"}, status=400)

            old_status = patent.status
            patent.status = new_status
            patent.save()

            PatentStatusNotification.objects.create(
                patent=patent,
                faculty=patent.faculty_id,
                previous_status=old_status,
                new_status=new_status,
                message=f"Patent '{patent.title}' status changed from {old_status} to {new_status}.",
            )

            return Response(self.get_serializer(patent).data)

        except Patent.DoesNotExist:
            return Response({"error": "Patent not found"}, status=404)


# ==================== RESEARCH SCHOLAR ====================

class ResearchScholarViewSet(viewsets.ModelViewSet):

    serializer_class = ResearchScholarSerializer
    permission_classes = [IsRSPCAdminOrReadOnly]

    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['progress_status']

    ordering = ['-enrollment_date']

    def get_queryset(self):
        return ResearchScholarSelector.get_all_scholars()

    @action(detail=True, methods=['post'])
    def update_status(self, request, pk=None):

        try:

            scholar = ResearchScholar.objects.get(id=pk)

            new_status = request.data.get("status") or request.data.get("progress_status")

            valid_status = [
                "COURSEWORK",
                "COMPREHENSIVE_EXAM",
                "SYNOPSIS_PHASE",
                "THESIS_SUBMITTED",
                "COMPLETED",
                "DROPPED"
            ]

            if new_status not in valid_status:
                return Response({"error": "Invalid status"}, status=400)

            scholar.progress_status = new_status
            scholar.save()

            return Response(self.get_serializer(scholar).data)

        except ResearchScholar.DoesNotExist:
            return Response({"error": "Scholar not found"}, status=404)


# ==================== LEGACY ====================

class TechTransferViewSet(viewsets.ReadOnlyModelViewSet):

    queryset = TechTransfer.objects.all()
    serializer_class = TechTransferSerializer
    permission_classes = [AllowAny] if settings.DEBUG else [IsAuthenticated]


class ResearchProjectViewSet(viewsets.ReadOnlyModelViewSet):

    queryset = ResearchProject.objects.all()
    serializer_class = ResearchProjectSerializer
    permission_classes = [AllowAny] if settings.DEBUG else [IsAuthenticated]


# ==================== STATS ====================

class FacultyResearchProfileView(viewsets.ViewSet):

    permission_classes = [AllowAny] if settings.DEBUG else [IsAuthenticated]  # Public in local testing

    @action(detail=False, methods=['get'], url_path='(?P<faculty_id>[^/.]+)')
    def retrieve(self, request, faculty_id=None):

        from applications.globals.models import Faculty

        try:

            faculty = Faculty.objects.get(id=faculty_id)

            profile = {

                "faculty": faculty.id,

                "projects": FacultyResearchSelector.get_faculty_projects(faculty_id).count(),

                "funded_amount": str(
                    FacultyResearchSelector.get_faculty_sponsored_amount(faculty_id)
                ),

                "publications": PublicationSelector.get_publications_by_faculty(faculty_id).count(),

                "patents": PatentSelector.get_patents_by_faculty(faculty_id).count(),
            }

            return Response(profile)

        except Faculty.DoesNotExist:
            return Response({"error": "Faculty not found"}, status=404)


class DepartmentResearchStatsView(viewsets.ViewSet):

    permission_classes = [AllowAny] if settings.DEBUG else [IsAuthenticated]  # Public in local testing

    @action(detail=False, methods=['get'], url_path='(?P<department_id>[^/.]+)')
    def retrieve(self, request, department_id=None):

        from applications.globals.models import DepartmentInfo

        try:

            department = DepartmentInfo.objects.get(id=department_id)

            stats = {

                "department": department.id,

                "total_projects": DepartmentResearchSelector.get_department_projects_count(department_id),

                "total_funding": str(
                    DepartmentResearchSelector.get_department_total_funding(department_id)
                ),

                "publications": DepartmentResearchSelector.get_department_publication_count(department_id),

                "patents": DepartmentResearchSelector.get_department_patent_count(department_id),
            }

            return Response(stats)

        except DepartmentInfo.DoesNotExist:
            return Response({"error": "Department not found"}, status=404)


class InstituteResearchStatsView(viewsets.ViewSet):
    permission_classes = [AllowAny] if settings.DEBUG else [IsAuthenticated]

    @action(detail=False, methods=['get'])
    def retrieve(self, request):
        total_projects = SponsoredProject.objects.count()
        total_consultancies = ConsultancyProject.objects.count()
        sanctioned_sum = sum([float(p.sanctioned_amount or 0) for p in SponsoredProject.objects.all()])

        payload = {
            "total_projects": total_projects,
            "total_consultancies": total_consultancies,
            "total_sanctioned_funding": sanctioned_sum,
            "active_projects": SponsoredProject.objects.filter(status__in=['ONGOING', 'EXTENDED']).count(),
        }
        return Response(payload)


class ComplianceReportView(viewsets.ViewSet):
    permission_classes = [AllowAny] if settings.DEBUG else [IsAuthenticated]

    @action(detail=False, methods=['get'])
    def retrieve(self, request):
        project_status = list(SponsoredProject.objects.values('status'))
        report_status = list(ProjectReport.objects.values('status'))
        expenditure_status = list(ProjectExpenditure.objects.values('status'))

        return Response(
            {
                "projects": {
                    "total": SponsoredProject.objects.count(),
                    "completed": SponsoredProject.objects.filter(status='COMPLETED').count(),
                    "rejected": SponsoredProject.objects.filter(status='REJECTED').count(),
                    "status_rows": project_status,
                },
                "reports": {
                    "total": ProjectReport.objects.count(),
                    "approved": ProjectReport.objects.filter(status='APPROVED').count(),
                    "pending": ProjectReport.objects.exclude(status='APPROVED').count(),
                    "status_rows": report_status,
                },
                "expenditures": {
                    "total": ProjectExpenditure.objects.count(),
                    "approved": ProjectExpenditure.objects.filter(status='APPROVED').count(),
                    "pending": ProjectExpenditure.objects.filter(status='PENDING').count(),
                    "status_rows": expenditure_status,
                },
            }
        )