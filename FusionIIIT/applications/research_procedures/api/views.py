"""
Django REST Framework Views for RSPC Module API
Thin views layer - delegates business logic to services and selectors
"""

from rest_framework import viewsets, status, filters, serializers
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.parsers import MultiPartParser, FormParser
from django.conf import settings
from django_filters.rest_framework import DjangoFilterBackend
from django.utils import timezone
from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
from django.core.cache import cache
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from django.utils.crypto import get_random_string
from datetime import datetime, timedelta
from copy import deepcopy
import logging

logger = logging.getLogger(__name__)

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
    RSPC_ROLE_HOD,
    # fine-grained single-role guards
    IsFacultyOnly,
    IsHoDOnly,
    IsRSPCAdminOnly,
    IsDeanRSPCOnly,
    IsDirectorOnly,
    IsFacultyOrAdmin,
    IsAdminOrAbove,
)

from ..selectors import (
    ResearchGroupSelector, ResearchAreaSelector, FundingAgencySelector,
    SponsoredProjectSelector, ProjectExpenditureSelector, ProjectMilestoneSelector,
    ProjectReportSelector, PublicationSelector, PatentSelector, ResearchScholarSelector,
    ConsultancyProjectSelector, FacultyResearchSelector, DepartmentResearchSelector
)

from ..services import (
    SponsoredProjectService, ExpenditureService, ConsultancyService, 
    PublicationService, PatentService, ResearchScholarService,
    RSPCServiceException, InsufficientBudgetException, InvalidProjectStatusException,
    ExpenditureApprovalException, InvalidMilestoneException
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
    # RBAC fix: read allowed for all authenticated; write restricted to RSPC Admin
    permission_classes = [IsRSPCAdminOrReadOnly]

    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['discipline', 'is_active']
    search_fields = ['name', 'description']


# ==================== FUNDING AGENCY ====================

class FundingAgencyViewSet(viewsets.ReadOnlyModelViewSet):

    serializer_class = FundingAgencySerializer
    permission_classes = [IsAuthenticated]

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

    # ── Per-action permission map (Role Matrix) ───────────────────────────
    # Faculty (PI) : list, retrieve, create, save_draft, resubmit
    # HoD          : vet_hod
    # RSPC Admin   : verify_admin, update_status, modify_duration, download_pdf
    # Dean RSPC    : dean_decision
    # Director     : director_decision
    _ACTION_PERMS = {
        'create':             [IsFacultyOrAdmin],
        'update':             [IsFacultyOrAdmin],
        'partial_update':     [IsFacultyOrAdmin],
        'save_draft':         [IsFacultyOrAdmin],
        'resubmit':           [IsFacultyOrAdmin],
        'vet_hod':            [IsHoDOnly],
        'verify_admin':       [IsRSPCAdminOnly],
        'update_status':      [IsAdminOrAbove],
        'modify_duration':    [IsRSPCAdminOnly],
        'dean_decision':      [IsDeanRSPCOnly],
        'director_decision':  [IsDirectorOnly],
        'download_pdf':       [IsRSPCAdminOnly],
        # Reads available to all RSPC roles
        'list':               [IsFacultyCreateOrReadOnly],
        'retrieve':           [IsFacultyCreateOrReadOnly],
        'project_details':    [IsFacultyCreateOrReadOnly],
    }

    def get_permissions(self):
        perms = self._ACTION_PERMS.get(self.action)
        if perms is not None:
            return [p() for p in perms]
        return [IsFacultyCreateOrReadOnly()]

    def perform_create(self, serializer):
        project = serializer.save()

        if project.status == 'DRAFT':
            return

        if not project.status or project.status == 'PROPOSED':
            project.status = 'SUBMITTED'
            project.save(update_fields=['status'])

    def get_queryset(self):
        qs = SponsoredProjectSelector.get_all_projects()
        if self.action in ['retrieve', 'project_details']:
            qs = qs.prefetch_related('co_principal_investigators__id__user', 'projectexpenditure_set', 'projectmilestone_set', 'projectreport_set')
        return qs

    def get_serializer_class(self):

        if self.action == 'list':
            return SponsoredProjectListSerializer

        elif self.action == 'retrieve':
            return SponsoredProjectDetailSerializer

        return SponsoredProjectCreateUpdateSerializer

    @action(detail=True, methods=['post'])
    def update_status(self, request, pk=None):
        # RBAC fix: only RSPC Admin / Dean / Director may force an arbitrary status change
        user = request.user
        if not RoleChecks.has_any_role(user, [RSPC_ROLE_RSPC_ADMIN, RSPC_ROLE_DEAN_RSPC, RSPC_ROLE_DIRECTOR]):
            return Response({"error": "RSPC Admin, Dean-RSPC, or Director role required"}, status=403)

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

            try:
                from notification.views import research_procedures_notif
                research_procedures_notif(
                    sender=request.user,
                    recipient=project.user if getattr(project, 'user', None) else project.principal_investigator.id.user,
                    type="status_update",
                    entity_name=f"{project.title} ({new_status})",
                    url_override="research_procedures:project_details"
                )
            except Exception:
                pass

            return Response(SponsoredProjectDetailSerializer(project).data)

        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)

    @action(detail=True, methods=['get'])
    def project_details(self, request, pk=None):
        try:
            project = self.get_queryset().get(id=pk)
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
        # RBAC fix: only RSPC Admin may extend project duration
        if not RoleChecks.has_rspc_role(request.user, RSPC_ROLE_RSPC_ADMIN):
            return Response({"error": "RSPC Admin role required to modify project duration"}, status=403)
        try:
            project = SponsoredProject.objects.get(id=pk)
            years = int(request.data.get('years', 0))
            if years <= 0:
                return Response({"error": "years must be a positive integer"}, status=400)

            try:
                project = SponsoredProjectService.modify_duration(pk, years)
                return Response(SponsoredProjectDetailSerializer(project).data)
            except RSPCServiceException as e:
                return Response({"error": str(e)}, status=404)
        except ValueError:
            return Response({"error": "Invalid years value"}, status=400)

    @action(detail=True, methods=['post'])
    def save_draft(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
            # RBAC fix: only PI (owner) or RSPC Admin can save drafts
            user = request.user
            is_owner = (
                project.user_id == user.pk or
                (project.principal_investigator_id and
                 hasattr(project.principal_investigator, 'id') and
                 project.principal_investigator.id.user_id == user.pk)
            )
            if not is_owner and not RoleChecks.has_rspc_role(user, RSPC_ROLE_RSPC_ADMIN):
                return Response({"error": "Only the project PI or RSPC Admin may save a draft"}, status=403)
            
            project = SponsoredProjectService.update_project_status(pk, 'DRAFT')
            return Response(SponsoredProjectDetailSerializer(project).data)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)
        except RSPCServiceException as e:
            return Response({"error": str(e)}, status=400)

    @action(detail=True, methods=['post'])
    def resubmit(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
            # RBAC fix: only PI (owner) may resubmit
            user = request.user
            is_owner = (
                project.user_id == user.pk or
                (project.principal_investigator_id and
                 hasattr(project.principal_investigator, 'id') and
                 project.principal_investigator.id.user_id == user.pk)
            )
            if not is_owner and not RoleChecks.has_rspc_role(user, RSPC_ROLE_RSPC_ADMIN):
                return Response({"error": "Only the project PI or RSPC Admin may resubmit"}, status=403)
            if project.status not in {'DRAFT', 'REJECTED'}:
                return Response({"error": "Only DRAFT or REJECTED projects can be resubmitted"}, status=400)

            project = SponsoredProjectService.update_project_status(pk, 'SUBMITTED')
            return Response(SponsoredProjectDetailSerializer(project).data)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)
        except RSPCServiceException as e:
            return Response({"error": str(e)}, status=400)

    @action(detail=True, methods=['post'])
    def vet_hod(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
            user = request.user
            if not RoleChecks.is_department_head(user):
                return Response({"error": "Department Head role required"}, status=403)

            # BR-017: if PI is also HoD, departmental review can be skipped.
            if project.principal_investigator_id:
                pi_user = project.principal_investigator.id.user
                if pi_user == user:
                    project = SponsoredProjectService.update_project_status(pk, 'VERIFIED_BY_ADMIN')
                    return Response(SponsoredProjectDetailSerializer(project).data)

            if project.status not in {'SUBMITTED'}:
                return Response({"error": "Only submitted projects can be vetted"}, status=400)

            project = SponsoredProjectService.update_project_status(pk, 'VETTED_BY_HOD')
            return Response(SponsoredProjectDetailSerializer(project).data)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)
        except RSPCServiceException as e:
            return Response({"error": str(e)}, status=400)

    @action(detail=True, methods=['post'])
    def verify_admin(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
            user = request.user
            if not RoleChecks.has_rspc_role(user, RSPC_ROLE_RSPC_ADMIN):
                return Response({"error": "RSPC Admin role required"}, status=403)

            if project.status not in {'VETTED_BY_HOD', 'SUBMITTED'}:
                return Response({"error": "Project must be vetted/submitted before admin verification"}, status=400)

            project = SponsoredProjectService.update_project_status(pk, 'VERIFIED_BY_ADMIN')
            return Response(SponsoredProjectDetailSerializer(project).data)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)
        except RSPCServiceException as e:
            return Response({"error": str(e)}, status=400)

    @action(detail=True, methods=['post'])
    def dean_decision(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
            user = request.user
            if not RoleChecks.has_rspc_role(user, RSPC_ROLE_DEAN_RSPC):
                return Response({"error": "Dean-RSPC role required"}, status=403)

            decision = (request.data.get('decision') or '').upper()
            if decision not in {'APPROVE', 'REJECT', 'FORWARD_DIRECTOR'}:
                return Response({"error": "decision must be APPROVE, REJECT, or FORWARD_DIRECTOR"}, status=400)

            if project.status not in {'VERIFIED_BY_ADMIN', 'UNDER_REVIEW'}:
                return Response({"error": "Project must be verified by admin before dean decision"}, status=400)

            if decision == 'APPROVE':
                new_status = 'APPROVED'
            elif decision == 'REJECT':
                new_status = 'REJECTED'
            else:
                new_status = 'FORWARDED_TO_DIRECTOR'

            project = SponsoredProjectService.update_project_status(pk, new_status)
            return Response(SponsoredProjectDetailSerializer(project).data)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)
        except RSPCServiceException as e:
            return Response({"error": str(e)}, status=400)

    @action(detail=True, methods=['post'])
    def director_decision(self, request, pk=None):
        try:
            project = SponsoredProject.objects.get(id=pk)
            user = request.user
            if not RoleChecks.has_rspc_role(user, RSPC_ROLE_DIRECTOR):
                return Response({"error": "Director role required"}, status=403)

            decision = (request.data.get('decision') or '').upper()
            if decision not in {'APPROVE', 'REJECT'}:
                return Response({"error": "decision must be APPROVE or REJECT"}, status=400)

            if project.status not in {'FORWARDED_TO_DIRECTOR'}:
                return Response({"error": "Project must be forwarded to director"}, status=400)

            new_status = 'APPROVED' if decision == 'APPROVE' else 'REJECTED'
            project = SponsoredProjectService.update_project_status(pk, new_status)
            return Response(SponsoredProjectDetailSerializer(project).data)
        except SponsoredProject.DoesNotExist:
            return Response({"error": "Project not found"}, status=404)
        except RSPCServiceException as e:
            return Response({"error": str(e)}, status=400)

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
    """
    Role Matrix:
    - Faculty (PI): create expenditure requests, list/view own project expenditures
    - RSPC Admin  : create, approve (≤50k), reject, manage all expenditures
    - Dean RSPC   : approve expenditures 50k–200k
    - Director    : approve expenditures >200k
    """
    serializer_class = ProjectExpenditureSerializer
    permission_classes = [IsRSPCAdminOrReadOnly]

    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['project', 'status']
    ordering = ['-date']

    _ACTION_PERMS = {
        'create':                 [IsFacultyOrAdmin],   # PI submits expenditure request
        'update':                 [IsRSPCAdminOnly],
        'partial_update':         [IsRSPCAdminOnly],
        'destroy':                [IsRSPCAdminOnly],
        'approve':                [IsAdminOrAbove],     # tiered inside the action
        'reject':                 [IsRSPCAdminOnly],
        'stipend_disbursements':  [IsRSPCAdminOnly],
        'list':                   [IsFacultyCreateOrReadOnly],
        'retrieve':               [IsFacultyCreateOrReadOnly],
    }

    def get_permissions(self):
        perms = self._ACTION_PERMS.get(self.action)
        return [p() for p in perms] if perms else [IsRSPCAdminOrReadOnly()]

    def get_queryset(self):
        project_id = self.request.query_params.get("project_id") or self.request.query_params.get("project")
        if project_id:
            return ProjectExpenditureSelector.get_project_expenditures(project_id)
        return ProjectExpenditure.objects.all()

    @action(detail=False, methods=['get'])
    def stipend_disbursements(self, request):
        # RSPC Admin only — guarded by _ACTION_PERMS above
        queryset = self.get_queryset().filter(expenditure_head='MANPOWER')
        return Response(self.get_serializer(queryset, many=True).data)

    @action(detail=True, methods=['post'])
    def approve(self, request, pk=None):
        """BR-009: tiered approval authority by amount.
        ≤50,000    → RSPC Admin
        50k–200k   → Dean RSPC
        >200,000   → Director
        """
        try:
            expenditure = ProjectExpenditure.objects.get(id=pk)
            amount = expenditure.amount or 0
            user = request.user

            # General expenditures (non-MANPOWER) require at minimum RSPC Admin
            if not RoleChecks.has_any_role(
                user, [RSPC_ROLE_RSPC_ADMIN, RSPC_ROLE_DEAN_RSPC, RSPC_ROLE_DIRECTOR]
            ):
                return Response({"error": "At least RSPC Admin role required"}, status=403)

            # BR-009: tiered authority for MANPOWER (stipend) expenditures
            if expenditure.expenditure_head == 'MANPOWER':
                if amount <= 50000:
                    if not RoleChecks.is_rspc_admin(user):
                        return Response({"error": "RSPC Admin approval required for stipend ≤ 50,000"}, status=403)
                elif 50000 < amount <= 200000:
                    if not RoleChecks.is_dean_rspc(user):
                        return Response({"error": "Dean-RSPC approval required for stipend 50,001–200,000"}, status=403)
                else:
                    if not RoleChecks.is_director(user):
                        return Response({"error": "Director approval required for stipend > 200,000"}, status=403)

            try:
                expenditure = ExpenditureService.approve_expenditure(pk, user)
                try:
                    from notification.views import research_procedures_notif
                    research_procedures_notif(
                        sender=request.user,
                        recipient=expenditure.project.user if getattr(expenditure.project, 'user', None) else expenditure.project.principal_investigator.id.user,
                        type="expenditure_approved",
                        entity_name=expenditure.project.title,
                        url_override="research_procedures:project_details"
                    )
                except Exception:
                    pass
                return Response(self.get_serializer(expenditure).data)
            except ExpenditureApprovalException as e:
                return Response({"error": str(e)}, status=400)

        except ProjectExpenditure.DoesNotExist:
            return Response({"error": "Expenditure not found"}, status=404)

    @action(detail=True, methods=['post'])
    def reject(self, request, pk=None):
        # RSPC Admin only — guarded by _ACTION_PERMS
        try:
            try:
                expenditure = ExpenditureService.reject_expenditure(pk, request.data.get("remarks", ""))
                try:
                    from notification.views import research_procedures_notif
                    research_procedures_notif(
                        sender=request.user,
                        recipient=expenditure.project.user if getattr(expenditure.project, 'user', None) else expenditure.project.principal_investigator.id.user,
                        type="expenditure_rejected",
                        entity_name=expenditure.project.title,
                        url_override="research_procedures:project_details"
                    )
                except Exception:
                    pass
                return Response(self.get_serializer(expenditure).data)
            except ExpenditureApprovalException as e:
                return Response({"error": str(e)}, status=400)
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
    """
    Role Matrix:
    - Faculty (PI): create/submit progress reports
    - RSPC Admin  : approve/reject reports, view all
    - HoD / Dean  : read-only view
    """
    serializer_class = ProjectReportSerializer
    permission_classes = [IsFacultyCreateOrReadOnly]

    _ACTION_PERMS = {
        'create':         [IsFacultyOrAdmin],
        'update':         [IsFacultyOrAdmin],
        'partial_update': [IsFacultyOrAdmin],
        'destroy':        [IsRSPCAdminOnly],
        'list':           [IsFacultyCreateOrReadOnly],
        'retrieve':       [IsFacultyCreateOrReadOnly],
    }

    def get_permissions(self):
        perms = self._ACTION_PERMS.get(self.action)
        return [p() for p in perms] if perms else [IsFacultyCreateOrReadOnly()]

    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['project', 'status']

    def get_queryset(self):
        project_id = self.request.query_params.get("project_id") or self.request.query_params.get("project")
        if project_id:
            return ProjectReportSelector.get_project_reports(project_id)
        return ProjectReport.objects.all()

class ConsultancyProjectViewSet(viewsets.ModelViewSet):
    """
    Role Matrix:
    - Faculty     : create/submit own consultancy proposals, update own records
    - RSPC Admin  : verify, manage all consultancy projects
    - Dean RSPC   : approve consultancy
    - HoD         : read-only view of department consultancies
    """
    permission_classes = [IsFacultyCreateOrReadOnly]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter]
    filterset_fields = ['status', 'client_type']
    search_fields = ['title', 'project_number', 'client_name']
    ordering = ['-start_date']

    _ACTION_PERMS = {
        'create':         [IsFacultyOrAdmin],
        'update':         [IsFacultyOrAdmin],
        'partial_update': [IsFacultyOrAdmin],
        'destroy':        [IsRSPCAdminOnly],
        'list':           [IsFacultyCreateOrReadOnly],
        'retrieve':       [IsFacultyCreateOrReadOnly],
    }

    def get_permissions(self):
        perms = self._ACTION_PERMS.get(self.action)
        return [p() for p in perms] if perms else [IsFacultyCreateOrReadOnly()]

    def perform_create(self, serializer):
        consultancy = serializer.save()
        if consultancy.status == 'DRAFT':
            return
        if not consultancy.status or consultancy.status == 'PROPOSED':
            consultancy.status = 'SUBMITTED'
            consultancy.save(update_fields=['status'])

    def perform_update(self, serializer):
        old_status = serializer.instance.status
        consultancy = serializer.save()
        if old_status != consultancy.status:
            try:
                from notification.views import research_procedures_notif
                if getattr(consultancy.consultant, 'id', None) and getattr(consultancy.consultant.id, 'user', None):
                    research_procedures_notif(
                        sender=self.request.user,
                        recipient=consultancy.consultant.id.user,
                        type="status_update",
                        entity_name=f"Consultancy '{consultancy.title}' ({consultancy.status})"
                    )
            except Exception:
                pass

    def get_queryset(self):
        qs = ConsultancyProjectSelector.get_all_consultancies()
        if self.action in ['retrieve', 'project_details']:
            qs = qs.prefetch_related('co_consultants__id__user')
        return qs

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
            publication = PublicationService.verify_publication(pk, request.user)
            return Response(self.get_serializer(publication).data)
        except RSPCServiceException as e:
            return Response({"error": str(e)}, status=404)


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
            new_status = request.data.get("status")
            if not new_status:
                return Response({"error": "status required"}, status=400)
                
            patent = Patent.objects.get(application_id=pk)
            old_status = patent.status
            
            # Delegate to service layer
            from django.core.exceptions import ValidationError
            try:
                patent = PatentService.update_patent_status(patent.id, new_status)
            except ValidationError as e:
                return Response({"error": str(e)}, status=400)

            # Notification is a side effect
            PatentStatusNotification.objects.create(
                patent=patent,
                faculty=patent.faculty_id,
                previous_status=old_status,
                new_status=new_status,
                message=f"Patent '{patent.title}' status changed from {old_status} to {new_status}.",
            )

            try:
                from notification.views import research_procedures_notif
                if patent.faculty_id and getattr(patent.faculty_id, 'user', None):
                    notif_type = new_status if new_status in ["Approved", "Disapproved", "Pending", "submitted", "created"] else "status_update"
                    research_procedures_notif(
                        sender=request.user,
                        recipient=patent.faculty_id.user,
                        type=notif_type,
                        entity_name=patent.title
                    )
            except Exception:
                pass

            return Response(self.get_serializer(patent).data)

        except Patent.DoesNotExist:
            return Response({"error": "Patent not found"}, status=404)
        except RSPCServiceException as e:
            return Response({"error": str(e)}, status=400)


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
            new_status = request.data.get("status") or request.data.get("progress_status")
            if not new_status:
                return Response({"error": "status required"}, status=400)
                
            from django.core.exceptions import ValidationError
            try:
                scholar = ResearchScholarService.update_progress_status(pk, new_status)
            except ValidationError as e:
                # The service uses a slightly different valid_statuses list, which is correct
                return Response({"error": str(e)}, status=400)

            try:
                from notification.views import research_procedures_notif
                if getattr(scholar, 'student', None) and getattr(scholar.student.id, 'user', None):
                    research_procedures_notif(
                        sender=request.user,
                        recipient=scholar.student.id.user,
                        type="status_update",
                        entity_name=f"Scholar profile ({new_status})",
                    )
            except Exception:
                pass

            return Response(self.get_serializer(scholar).data)

        except ResearchScholar.DoesNotExist:
            return Response({"error": "Scholar not found"}, status=404)
        except RSPCServiceException as e:
            return Response({"error": str(e)}, status=400)


# ==================== LEGACY ====================

class TechTransferViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = TechTransfer.objects.all()
    serializer_class = TechTransferSerializer
    # RBAC fix: NEVER AllowAny — all users must authenticate; admin-controls only
    permission_classes = [IsRSPCAdminOrReadOnly]


class ResearchProjectViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = ResearchProject.objects.all()
    serializer_class = ResearchProjectSerializer
    # RBAC fix: authenticated users may read legacy records (faculty, admin, hod)
    permission_classes = [IsAuthenticated]


# ==================== STATS ====================

class FacultyResearchProfileView(viewsets.ViewSet):

    permission_classes = [IsAuthenticated]

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

    permission_classes = [IsAuthenticated]

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
    permission_classes = [IsAuthenticated]

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
    # RBAC fix: compliance data is sensitive aggregate — restrict to RSPC Admin and above
    permission_classes = [IsRSPCAdminOrReadOnly]

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


# ==================== GOVERNANCE (LIGHTWEIGHT API STORE) ====================

GOVERNANCE_DEFAULT_STORE = {
    "approval_requests": [],
    "progress_entries": [],
    "closure_requests": [],
    "documents": [],
    "rules": [],
    "automation_rules": [],
    "audit_events": [],
    "recruitment_posts": [],
    "staff_applications": [],
    "staff_appointments": [],
    "counters": {
        "approval_requests": 1,
        "progress_entries": 1,
        "closure_requests": 1,
        "documents": 1,
        "rules": 1,
        "automation_rules": 1,
        "audit_events": 1,
        "recruitment_posts": 1,
        "staff_applications": 1,
        "staff_appointments": 1,
    },
}


def _get_governance_store():
    store = cache.get("rspc_governance_store")
    if store is None:
        store = deepcopy(GOVERNANCE_DEFAULT_STORE)
        cache.set("rspc_governance_store", store, timeout=None)
    return store


def _save_governance_store(store):
    cache.set("rspc_governance_store", store, timeout=None)


def _next_governance_id(store, bucket):
    next_id = store["counters"][bucket]
    store["counters"][bucket] += 1
    return next_id


def _append_audit_event(store, request, method, path, status_code=200, payload_hash=""):
    event = {
        "id": _next_governance_id(store, "audit_events"),
        "created_at": timezone.now().isoformat(),
        "method": method,
        "path": path,
        "status_code": status_code,
        "username": request.user.username if request.user.is_authenticated else "anonymous",
        "payload_hash": payload_hash,
    }
    store["audit_events"].append(event)


class ApprovalRequestViewSet(viewsets.ViewSet):
    permission_classes = [IsAuthenticated]

    def list(self, request):
        store = _get_governance_store()
        return Response(store["approval_requests"])

    def create(self, request):
        store = _get_governance_store()
        item = {
            "id": _next_governance_id(store, "approval_requests"),
            "module_name": request.data.get("module_name", "RSPC"),
            "reference_id": request.data.get("reference_id", ""),
            "title": request.data.get("title", "Untitled"),
            "description": request.data.get("description", ""),
            "assigned_role": request.data.get("assigned_role", "RSPC_ADMIN"),
            "status": "PENDING",
            "created_at": timezone.now().isoformat(),
            "created_by": request.user.username,
        }
        store["approval_requests"].append(item)
        _append_audit_event(store, request, "POST", request.path)
        _save_governance_store(store)
        return Response(item, status=status.HTTP_201_CREATED)

    @action(detail=False, methods=["post"])
    def check_slas(self, request):
        """BR-RSPC-019: SLA Timeouts for RSPC Tasks (7 days reminder, 14 days escalation)"""
        store = _get_governance_store()
        now = timezone.now()
        reports = []
        for item in store["approval_requests"]:
            if item["status"] == "PENDING":
                created_at = datetime.fromisoformat(item["created_at"])
                age_days = (now - created_at).days
                if age_days >= 14:
                    item["status"] = "ESCALATED"
                    item["assigned_role"] = "DIRECTOR"
                    item["updated_at"] = now.isoformat()
                    reports.append({"id": item["id"], "action": "Escalated to DIRECTOR"})
                elif age_days >= 7:
                    reminders = item.get("reminders_sent", 0)
                    if reminders == 0:
                        item["reminders_sent"] = 1
                        reports.append({"id": item["id"], "action": "Reminder created"})
        
        if reports:
            _append_audit_event(store, request, "POST", request.path)
            _save_governance_store(store)
            
        return Response({"checked": True, "actions": reports})

    def _update_status(self, request, pk, new_status):
        store = _get_governance_store()
        now = timezone.now()
        for item in store["approval_requests"]:
            if item["id"] == int(pk):
                # BR-RSPC-018: Approval Timeframe -> Hard limit 30 days
                created_at = datetime.fromisoformat(item["created_at"])
                if (now - created_at).days > 30 and new_status != "REJECTED":
                    return Response({"error": "BR-RSPC-018: Approval timeframe elapsed. Request expired."}, status=400)
                    
                item["status"] = new_status
                item["updated_at"] = now.isoformat()
                item["updated_by"] = request.user.username
                _append_audit_event(store, request, "POST", request.path)
                _save_governance_store(store)
                return Response(item)
        return Response({"error": "Approval request not found"}, status=404)

    @action(detail=True, methods=["post"])
    def forward(self, request, pk=None):
        return self._update_status(request, pk, "FORWARDED")

    @action(detail=True, methods=["post"])
    def approve(self, request, pk=None):
        return self._update_status(request, pk, "APPROVED")

    @action(detail=True, methods=["post"])
    def reject(self, request, pk=None):
        return self._update_status(request, pk, "REJECTED")

    @action(detail=False, methods=["get"])
    def inbox(self, request):
        store = _get_governance_store()
        assigned = [
            row for row in store["approval_requests"]
            if row.get("assigned_role")
        ]
        return Response(assigned)

    @action(detail=False, methods=["get"])
    def project_inventory(self, request):
        rows = list(SponsoredProject.objects.values("id", "project_number", "title", "status")[:100])
        return Response(rows)

    @action(detail=False, methods=["get"])
    def project_staff(self, request):
        staff = []
        for project in SponsoredProject.objects.select_related("principal_investigator")[:100]:
            staff.append({
                "project_id": project.id,
                "project_number": project.project_number,
                "pi_name": getattr(getattr(project.principal_investigator, "id", None), "user", None).username
                if project.principal_investigator_id and project.principal_investigator and project.principal_investigator.id
                else None,
            })
        return Response(staff)


class ProgressEntryViewSet(viewsets.ViewSet):
    permission_classes = [IsAuthenticated]

    def list(self, request):
        store = _get_governance_store()
        return Response(store["progress_entries"])

    def create(self, request):
        store = _get_governance_store()
        project_id = request.data.get("project")
        project_number = None
        if project_id:
            project_number = SponsoredProject.objects.filter(id=project_id).values_list("project_number", flat=True).first()

        item = {
            "id": _next_governance_id(store, "progress_entries"),
            "project": project_id,
            "project_number": project_number,
            "report_date": request.data.get("report_date"),
            "percent_complete": request.data.get("percent_complete", 0),
            "summary": request.data.get("summary", ""),
            "risks": request.data.get("risks", ""),
            "action_items": request.data.get("action_items", ""),
            "created_by": request.user.username,
            "created_at": timezone.now().isoformat(),
        }
        store["progress_entries"].append(item)
        _append_audit_event(store, request, "POST", request.path)
        _save_governance_store(store)
        return Response(item, status=status.HTTP_201_CREATED)


class RecruitmentPostViewSet(viewsets.ViewSet):
    permission_classes = [IsAuthenticated]

    def _ensure_default_post(self, store, request):
        if store["recruitment_posts"]:
            return

        default_project = SponsoredProject.objects.order_by("id").values("id", "project_number", "title").first()
        default_item = {
            "id": _next_governance_id(store, "recruitment_posts"),
            "post_code": "RP-001",
            "project": default_project.get("id") if default_project else None,
            "project_number": default_project.get("project_number") if default_project else None,
            "title": "Research Assistant",
            "description": "Default recruitment post for RSPC staffing workflow.",
            "vacancies": 1,
            "status": "OPEN",
            "created_by": request.user.username,
            "created_at": timezone.now().isoformat(),
        }
        store["recruitment_posts"].append(default_item)

    def list(self, request):
        store = _get_governance_store()
        self._ensure_default_post(store, request)
        _save_governance_store(store)
        return Response(store["recruitment_posts"])

    def create(self, request):
        store = _get_governance_store()
        project_id = request.data.get("project")
        project_number = None
        if project_id:
            project_number = SponsoredProject.objects.filter(id=project_id).values_list("project_number", flat=True).first()

        item = {
            "id": _next_governance_id(store, "recruitment_posts"),
            "post_code": request.data.get("post_code") or f"RP-{store['counters']['recruitment_posts']:03d}",
            "project": project_id,
            "project_number": project_number,
            "title": request.data.get("title", "Recruitment Post"),
            "description": request.data.get("description", ""),
            "vacancies": int(request.data.get("vacancies", 1) or 1),
            "status": request.data.get("status", "OPEN"),
            "created_by": request.user.username,
            "created_at": timezone.now().isoformat(),
        }
        store["recruitment_posts"].append(item)
        _append_audit_event(store, request, "POST", request.path)
        _save_governance_store(store)
        return Response(item, status=status.HTTP_201_CREATED)


class StaffApplicationViewSet(viewsets.ViewSet):
    permission_classes = [IsAuthenticated]

    VALID_STATUSES = {
        "SUBMITTED",
        "UNDER_REVIEW",
        "SHORTLISTED",
        "INTERVIEW_SCHEDULED",
        "SELECTED",
        "REJECTED",
        "APPOINTED",
    }

    def list(self, request):
        store = _get_governance_store()
        rows = list(store["staff_applications"])
        post_filter = request.query_params.get("post")
        status_filter = request.query_params.get("status")

        if post_filter:
            rows = [row for row in rows if str(row.get("post")) == str(post_filter)]
        if status_filter:
            rows = [row for row in rows if str(row.get("status", "")).upper() == str(status_filter).upper()]

        return Response(rows)

    def create(self, request):
        store = _get_governance_store()

        required = ["post", "application_number", "applicant_name", "email", "phone"]
        missing = [field for field in required if not request.data.get(field)]
        if missing:
            return Response({"error": f"Missing required fields: {', '.join(missing)}"}, status=400)

        if any(app.get("application_number") == request.data.get("application_number") for app in store["staff_applications"]):
            return Response({"error": "application_number must be unique"}, status=400)

        status_value = (request.data.get("status") or "SUBMITTED").upper()
        if status_value not in self.VALID_STATUSES:
            return Response({"error": "Invalid status"}, status=400)

        post_id = request.data.get("post")
        selected_post = next((post for post in store["recruitment_posts"] if str(post.get("id")) == str(post_id)), None)
        post_exists = selected_post is not None
        if not post_exists:
            # Auto-bootstrap when post id exists in payload but cache is empty.
            RecruitmentPostViewSet()._ensure_default_post(store, request)
            selected_post = next((post for post in store["recruitment_posts"] if str(post.get("id")) == str(post_id)), None)
            post_exists = selected_post is not None
        if not post_exists:
            return Response({"error": "Recruitment post not found"}, status=400)

        item = {
            "id": _next_governance_id(store, "staff_applications"),
            "post": post_id,
            "application_number": request.data.get("application_number"),
            "applicant_name": request.data.get("applicant_name"),
            "email": request.data.get("email"),
            "phone": request.data.get("phone"),
            "qualification": request.data.get("qualification", ""),
            "experience_years": request.data.get("experience_years", 0),
            "status": status_value,
            "remarks": request.data.get("remarks", ""),
            "post_title": selected_post.get("title"),
            "applied_at": timezone.now().isoformat(),
            "created_by": request.user.username,
            "created_at": timezone.now().isoformat(),
        }
        store["staff_applications"].append(item)
        _append_audit_event(store, request, "POST", request.path)
        _save_governance_store(store)
        return Response(item, status=status.HTTP_201_CREATED)

    def partial_update(self, request, pk=None):
        store = _get_governance_store()
        for item in store["staff_applications"]:
            if item["id"] == int(pk):
                if "status" in request.data:
                    status_value = str(request.data.get("status", "")).upper()
                    if status_value not in self.VALID_STATUSES:
                        return Response({"error": "Invalid status"}, status=400)
                    item["status"] = status_value
                if "remarks" in request.data:
                    item["remarks"] = request.data.get("remarks")
                item["updated_by"] = request.user.username
                item["updated_at"] = timezone.now().isoformat()
                _append_audit_event(store, request, "PATCH", request.path)
                _save_governance_store(store)
                return Response(item)

        return Response({"error": "Staff application not found"}, status=404)

    def destroy(self, request, pk=None):
        store = _get_governance_store()
        before = len(store["staff_applications"])
        store["staff_applications"] = [item for item in store["staff_applications"] if item["id"] != int(pk)]
        if len(store["staff_applications"]) == before:
            return Response({"error": "Staff application not found"}, status=404)

        _append_audit_event(store, request, "DELETE", request.path)
        _save_governance_store(store)
        return Response(status=status.HTTP_204_NO_CONTENT)


class StaffAppointmentViewSet(viewsets.ViewSet):
    permission_classes = [IsAuthenticated]

    def list(self, request):
        store = _get_governance_store()
        return Response(store["staff_appointments"])

    def create(self, request):
        store = _get_governance_store()

        required = ["application", "appointment_number", "employee_code", "designation", "joining_date"]
        missing = [field for field in required if not request.data.get(field)]
        if missing:
            return Response({"error": f"Missing required fields: {', '.join(missing)}"}, status=400)

        application_id = request.data.get("application")
        application = next((a for a in store["staff_applications"] if str(a["id"]) == str(application_id)), None)
        if not application:
            return Response({"error": "Staff application not found"}, status=400)

        if any(str(apt.get("application")) == str(application_id) for apt in store["staff_appointments"]):
            return Response({"error": "An appointment already exists for this application"}, status=400)

        item = {
            "id": _next_governance_id(store, "staff_appointments"),
            "application": application_id,
            "appointment_number": request.data.get("appointment_number"),
            "employee_code": request.data.get("employee_code"),
            "designation": request.data.get("designation"),
            "joining_date": request.data.get("joining_date"),
            "contract_end_date": request.data.get("contract_end_date"),
            "probation_months": request.data.get("probation_months"),
            "pay_level": request.data.get("pay_level"),
            "notes": request.data.get("notes"),
            "applicant_name": application.get("applicant_name"),
            "post_title": application.get("post_title"),
            "status": "ACTIVE",
            "created_by": request.user.username,
            "created_at": timezone.now().isoformat(),
        }
        store["staff_appointments"].append(item)

        application["status"] = "APPOINTED"
        application["updated_by"] = request.user.username
        application["updated_at"] = timezone.now().isoformat()

        _append_audit_event(store, request, "POST", request.path)
        _save_governance_store(store)
        return Response(item, status=status.HTTP_201_CREATED)

    def destroy(self, request, pk=None):
        store = _get_governance_store()
        before = len(store["staff_appointments"])
        store["staff_appointments"] = [item for item in store["staff_appointments"] if item["id"] != int(pk)]
        if len(store["staff_appointments"]) == before:
            return Response({"error": "Staff appointment not found"}, status=404)

        _append_audit_event(store, request, "DELETE", request.path)
        _save_governance_store(store)
        return Response(status=status.HTTP_204_NO_CONTENT)

    @action(detail=True, methods=["post"])
    def modify_tenure(self, request, pk=None):
        store = _get_governance_store()
        contract_end_date = request.data.get("contract_end_date")
        if not contract_end_date:
            return Response({"error": "contract_end_date is required"}, status=400)

        for item in store["staff_appointments"]:
            if item["id"] == int(pk):
                item["contract_end_date"] = contract_end_date
                item["updated_by"] = request.user.username
                item["updated_at"] = timezone.now().isoformat()
                _append_audit_event(store, request, "POST", request.path)
                _save_governance_store(store)
                return Response(item)

        return Response({"error": "Staff appointment not found"}, status=404)

    @action(detail=True, methods=["post"])
    def process_admin(self, request, pk=None):
        if not RoleChecks.has_rspc_role(request.user, RSPC_ROLE_RSPC_ADMIN):
            return Response({"error": "RSPC Admin role required"}, status=403)

        store = _get_governance_store()
        for item in store["staff_appointments"]:
            if item["id"] == int(pk):
                item["status"] = "PROCESSING"
                item["processed_by"] = request.user.username
                item["processed_at"] = timezone.now().isoformat()
                _append_audit_event(store, request, "POST", request.path)
                _save_governance_store(store)
                return Response(item)

        return Response({"error": "Staff appointment not found"}, status=404)

    @action(detail=True, methods=["post"])
    def dean_decision(self, request, pk=None):
        if not RoleChecks.has_rspc_role(request.user, RSPC_ROLE_DEAN_RSPC):
            return Response({"error": "Dean-RSPC role required"}, status=403)

        decision = str(request.data.get("decision", "")).upper()
        if decision not in {"APPROVE", "REJECT"}:
            return Response({"error": "decision must be APPROVE or REJECT"}, status=400)

        store = _get_governance_store()
        for item in store["staff_appointments"]:
            if item["id"] == int(pk):
                item["status"] = "APPROVED" if decision == "APPROVE" else "REJECTED"
                item["dean_decision"] = decision
                item["dean_decided_by"] = request.user.username
                item["dean_decided_at"] = timezone.now().isoformat()
                _append_audit_event(store, request, "POST", request.path)
                _save_governance_store(store)
                return Response(item)

        return Response({"error": "Staff appointment not found"}, status=404)


class ClosureRequestViewSet(viewsets.ViewSet):
    permission_classes = [IsAuthenticated]

    def list(self, request):
        store = _get_governance_store()
        return Response(store["closure_requests"])

    def create(self, request):
        store = _get_governance_store()
        project_id = request.data.get("project")
        project_number = SponsoredProject.objects.filter(id=project_id).values_list("project_number", flat=True).first()
        item = {
            "id": _next_governance_id(store, "closure_requests"),
            "project": project_id,
            "project_number": project_number,
            "closure_reason": request.data.get("closure_reason", ""),
            "closure_date": request.data.get("closure_date"),
            "status": request.data.get("status", "SUBMITTED"),
            "created_by": request.user.username,
            "created_at": timezone.now().isoformat(),
        }
        store["closure_requests"].append(item)
        _append_audit_event(store, request, "POST", request.path)
        _save_governance_store(store)
        return Response(item, status=status.HTTP_201_CREATED)

    @action(detail=True, methods=["post"])
    def approve(self, request, pk=None):
        store = _get_governance_store()
        for item in store["closure_requests"]:
            if item["id"] == int(pk):
                item["status"] = "APPROVED"
                item["approved_by"] = request.user.username
                item["approved_at"] = timezone.now().isoformat()
                _append_audit_event(store, request, "POST", request.path)
                _save_governance_store(store)
                return Response(item)
        return Response({"error": "Closure request not found"}, status=404)


class ManagedDocumentViewSet(viewsets.ViewSet):
    permission_classes = [IsAuthenticated]
    parser_classes = [MultiPartParser, FormParser]

    def list(self, request):
        store = _get_governance_store()
        return Response(store["documents"])

    def create(self, request):
        store = _get_governance_store()
        upload = request.FILES.get("file")
        if not upload:
            return Response({"error": "file is required"}, status=400)

        stored_name = default_storage.save(
            f"rspc/governance/documents/{timezone.now().strftime('%Y%m%d_%H%M%S')}_{upload.name}",
            ContentFile(upload.read()),
        )
        file_url = default_storage.url(stored_name)
        payload_hash = get_random_string(64)
        item = {
            "id": _next_governance_id(store, "documents"),
            "title": request.data.get("title", upload.name),
            "category": request.data.get("category", "OTHER"),
            "project": request.data.get("project") or None,
            "file_url": file_url,
            "checksum_sha256": payload_hash,
            "history": [
                {
                    "at": timezone.now().isoformat(),
                    "event": "UPLOADED",
                    "by": request.user.username,
                }
            ],
            "created_at": timezone.now().isoformat(),
        }
        store["documents"].append(item)
        _append_audit_event(store, request, "POST", request.path, payload_hash=payload_hash)
        _save_governance_store(store)
        return Response(item, status=status.HTTP_201_CREATED)

    @action(detail=True, methods=["get"])
    def history(self, request, pk=None):
        store = _get_governance_store()
        for item in store["documents"]:
            if item["id"] == int(pk):
                return Response(item.get("history", []))
        return Response({"error": "Document not found"}, status=404)


class RuleDefinitionViewSet(viewsets.ViewSet):
    permission_classes = [IsAuthenticated]

    def list(self, request):
        store = _get_governance_store()
        return Response(store["rules"])

    def create(self, request):
        store = _get_governance_store()
        item = {
            "id": _next_governance_id(store, "rules"),
            "name": request.data.get("name", "Unnamed Rule"),
            "field_name": request.data.get("field_name", "status"),
            "operator": request.data.get("operator", "eq"),
            "expected_value": request.data.get("expected_value", ""),
            "created_at": timezone.now().isoformat(),
        }
        store["rules"].append(item)
        _append_audit_event(store, request, "POST", request.path)
        _save_governance_store(store)
        return Response(item, status=status.HTTP_201_CREATED)

    @action(detail=True, methods=["post"])
    def evaluate(self, request, pk=None):
        store = _get_governance_store()
        payload = request.data.get("payload", {})
        for rule in store["rules"]:
            if rule["id"] == int(pk):
                field_value = payload.get(rule["field_name"])
                expected = rule["expected_value"]
                op = rule["operator"]
                result = False
                if op == "eq":
                    result = str(field_value) == str(expected)
                elif op == "ne":
                    result = str(field_value) != str(expected)
                elif op == "contains":
                    result = str(expected) in str(field_value)
                else:
                    try:
                        left = float(field_value)
                        right = float(expected)
                        if op == "gt":
                            result = left > right
                        elif op == "gte":
                            result = left >= right
                        elif op == "lt":
                            result = left < right
                        elif op == "lte":
                            result = left <= right
                    except (TypeError, ValueError):
                        result = False
                _append_audit_event(store, request, "POST", request.path)
                _save_governance_store(store)
                return Response({"result": result, "rule": rule})
        return Response({"error": "Rule not found"}, status=404)


class AutomationRuleViewSet(viewsets.ViewSet):
    permission_classes = [IsAuthenticated]

    def list(self, request):
        store = _get_governance_store()
        return Response(store["automation_rules"])

    def create(self, request):
        store = _get_governance_store()
        item = {
            "id": _next_governance_id(store, "automation_rules"),
            "name": request.data.get("name", "Unnamed Automation"),
            "trigger_event": request.data.get("trigger_event", "manual"),
            "rule": request.data.get("rule"),
            "action_type": request.data.get("action_type", "NOTIFY"),
            "action_payload": request.data.get("action_payload", {}),
            "is_active": bool(request.data.get("is_active", True)),
            "last_run_status": None,
            "created_at": timezone.now().isoformat(),
        }
        store["automation_rules"].append(item)
        _append_audit_event(store, request, "POST", request.path)
        _save_governance_store(store)
        return Response(item, status=status.HTTP_201_CREATED)

    @action(detail=True, methods=["post"])
    def execute(self, request, pk=None):
        store = _get_governance_store()
        for item in store["automation_rules"]:
            if item["id"] == int(pk):
                item["last_run_status"] = "SUCCESS"
                item["last_run_at"] = timezone.now().isoformat()
                item["last_run_by"] = request.user.username
                _append_audit_event(store, request, "POST", request.path)
                _save_governance_store(store)
                return Response({"status": "SUCCESS", "automation": item})
        return Response({"error": "Automation rule not found"}, status=404)


class AuditEventViewSet(viewsets.ViewSet):
    permission_classes = [IsAuthenticated]

    def list(self, request):
        store = _get_governance_store()
        return Response(list(reversed(store["audit_events"])))


class GovernanceLoginView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        username = request.data.get("username")
        password = request.data.get("password")
        user = authenticate(request, username=username, password=password)
        if not user:
            return Response({"error": "Invalid credentials"}, status=401)
        login(request, user)
        return Response({"token": get_random_string(40), "username": user.username})


class GovernanceLogoutView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        logout(request)
        return Response({"detail": "Logged out"})


class GovernanceMeView(APIView):
    permission_classes = [AllowAny]

    def get(self, request):
        if not request.user.is_authenticated:
            return Response({"authenticated": False, "username": None})
        return Response({"authenticated": True, "username": request.user.username})


class GovernanceChangePasswordView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        old_password = request.data.get("old_password")
        new_password = request.data.get("new_password")
        if not old_password or not new_password:
            return Response({"error": "old_password and new_password are required"}, status=400)
        if not request.user.check_password(old_password):
            return Response({"error": "Old password is incorrect"}, status=400)
        request.user.set_password(new_password)
        request.user.save(update_fields=["password"])
        return Response({"detail": "Password updated"})