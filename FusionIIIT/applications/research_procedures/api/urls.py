"""
URL Configuration for RSPC API
Routes for all API endpoints using DRF ViewSets and DefaultRouter
"""

from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

# Initialize router
router = DefaultRouter()

# ==================== MODEL ROUTERS ====================
router.register(r'research-groups', views.ResearchGroupViewSet, basename='api_research_group')
router.register(r'research-areas', views.ResearchAreaViewSet, basename='api_research_area')
router.register(r'funding-agencies', views.FundingAgencyViewSet, basename='api_funding_agency')
router.register(r'projects', views.SponsoredProjectViewSet, basename='api_sponsored_project')
router.register(r'expenditures', views.ProjectExpenditureViewSet, basename='api_project_expenditure')
router.register(r'milestones', views.ProjectMilestoneViewSet, basename='api_project_milestone')
router.register(r'reports', views.ProjectReportViewSet, basename='api_project_report')
router.register(r'consultancies', views.ConsultancyProjectViewSet, basename='api_consultancy_project')
router.register(r'publications', views.PublicationViewSet, basename='api_publication')
router.register(r'patents', views.PatentViewSet, basename='api_patent')
router.register(r'scholars', views.ResearchScholarViewSet, basename='api_research_scholar')

# Legacy models
router.register(r'tech-transfer', views.TechTransferViewSet, basename='api_tech_transfer')
router.register(r'research-projects', views.ResearchProjectViewSet, basename='api_research_project')

# ==================== API ENDPOINTS ====================
urlpatterns = [
    # Router-generated endpoints
    path('', include(router.urls)),
    
    # Statistics endpoints
    path('faculty/<int:faculty_id>/profile/', views.FacultyResearchProfileView.as_view(
        {'get': 'retrieve'}
    ), name='api_faculty_profile'),
    path('department/<int:department_id>/stats/', views.DepartmentResearchStatsView.as_view(
        {'get': 'retrieve'}
    ), name='api_department_stats'),
    path('institute/stats/', views.InstituteResearchStatsView.as_view(
        {'get': 'retrieve'}
    ), name='api_institute_stats'),
    path('compliance/report/', views.ComplianceReportView.as_view(
        {'get': 'retrieve'}
    ), name='api_compliance_report'),
]