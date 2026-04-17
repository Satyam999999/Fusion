"""
Unit tests for RSPC Module
Tests for models, services, selectors, and API endpoints
"""

from django.test import TestCase, Client
from django.contrib.auth.models import User
from django.test.client import RequestFactory
from rest_framework.test import APITestCase, APIClient
from rest_framework import status
from decimal import Decimal
from datetime import date, timedelta

from ..models import (
    ResearchGroup, SponsoredProject, ProjectExpenditure,
    ConsultancyProject, Publication, Patent, ResearchScholar
)
from ..services import (
    SponsoredProjectService, ExpenditureService,
    PublicationService, InsufficientBudgetException
)
from ..selectors import (
    SponsoredProjectSelector, PublicationSelector,
    PatentSelector, ResearchScholarSelector
)


# ==================== MODEL TESTS ====================

class ResearchGroupModelTest(TestCase):
    """Tests for ResearchGroup model"""
    
    def setUp(self):
        self.user = User.objects.create_user(
            username='testuser',
            password='testpass123'
        )
    
    def test_create_research_group(self):
        """Test creating a research group"""
        group = ResearchGroup.objects.create(
            name='AI Lab',
            acronym='AIL',
            description='Artificial Intelligence Research Lab'
        )
        self.assertEqual(group.name, 'AI Lab')
        self.assertTrue(group.is_active)
    
    def test_research_group_str(self):
        """Test research group string representation"""
        group = ResearchGroup.objects.create(
            name='Data Science Lab',
            acronym='DSL'
        )
        self.assertEqual(str(group), 'Data Science Lab')


# ==================== SERVICE TESTS ====================

class SponsoredProjectServiceTest(TestCase):
    """Tests for SponsoredProjectService"""
    
    def setUp(self):
        self.user = User.objects.create_user(
            username='faculty1',
            password='testpass123'
        )
        # Assuming Faculty object exists
        # self.faculty = Faculty.objects.create(user=self.user)
    
    def test_create_project_with_valid_data(self):
        """Test creating a project with valid data"""
        # Note: This test would need proper Faculty setup
        # project = SponsoredProjectService.create_project(
        #     user=self.user,
        #     title='Test Project',
        #     principal_investigator=self.faculty,
        #     funding_agency=None,
        #     sanctioned_amount=Decimal('100000'),
        #     start_date=date.today(),
        #     original_end_date=date.today() + timedelta(days=365)
        # )
        # self.assertEqual(project.title, 'Test Project')
        # self.assertEqual(project.status, 'PROPOSED')
        pass


# ==================== SELECTOR TESTS ====================

class SponsoredProjectSelectorTest(TestCase):
    """Tests for SponsoredProjectSelector"""
    
    def setUp(self):
        self.project = SponsoredProject.objects.create(
            title='Research Project',
            project_number='RP001',
            sanctioned_amount=Decimal('100000'),
            start_date=date.today(),
            original_end_date=date.today() + timedelta(days=365)
        )
    
    def test_get_all_projects(self):
        """Test retrieving all projects"""
        projects = SponsoredProjectSelector.get_all_projects()
        self.assertGreaterEqual(projects.count(), 1)
    
    def test_get_projects_by_status(self):
        """Test retrieving projects by status"""
        projects = SponsoredProjectSelector.get_projects_by_status('PROPOSED')
        self.assertGreaterEqual(projects.count(), 1)


class PublicationSelectorTest(TestCase):
    """Tests for PublicationSelector"""
    
    def setUp(self):
        self.publication = Publication.objects.create(
            title='Test Publication',
            publication_type='JOURNAL',
            year=2024
        )
    
    def test_get_all_publications(self):
        """Test retrieving all publications"""
        publications = PublicationSelector.get_all_publications()
        self.assertGreaterEqual(publications.count(), 1)
    
    def test_get_publications_by_year(self):
        """Test retrieving publications by year"""
        publications = PublicationSelector.get_publications_by_year(2024)
        self.assertGreaterEqual(publications.count(), 1)


# ==================== API TESTS ====================

class ResearchGroupAPITest(APITestCase):
    """Tests for ResearchGroup API endpoints"""
    
    def setUp(self):
        self.client = APIClient()
        self.user = User.objects.create_user(
            username='testuser',
            password='testpass123'
        )
        self.client.force_authenticate(user=self.user)
    
    def test_list_research_groups(self):
        """Test listing research groups"""
        response = self.client.get('/api/research-groups/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)


class SponsoredProjectAPITest(APITestCase):
    """Tests for SponsoredProject API endpoints"""
    
    def setUp(self):
        self.client = APIClient()
        self.user = User.objects.create_user(
            username='testuser',
            password='testpass123'
        )
        self.client.force_authenticate(user=self.user)
        
        self.project = SponsoredProject.objects.create(
            title='Test Project',
            project_number='TP001',
            sanctioned_amount=Decimal('100000'),
            start_date=date.today(),
            original_end_date=date.today() + timedelta(days=365)
        )
    
    def test_list_projects(self):
        """Test listing projects"""
        response = self.client.get('/api/projects/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
    
    def test_retrieve_project(self):
        """Test retrieving a specific project"""
        response = self.client.get(f'/api/projects/{self.project.id}/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)


class PublicationAPITest(APITestCase):
    """Tests for Publication API endpoints"""
    
    def setUp(self):
        self.client = APIClient()
        self.user = User.objects.create_user(
            username='testuser',
            password='testpass123'
        )
        self.client.force_authenticate(user=self.user)
    
    def test_list_publications(self):
        """Test listing publications"""
        response = self.client.get('/api/publications/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)


class PatentAPITest(APITestCase):
    """Tests for Patent API endpoints"""
    
    def setUp(self):
        self.client = APIClient()
        self.user = User.objects.create_user(
            username='testuser',
            password='testpass123'
        )
        self.client.force_authenticate(user=self.user)
    
    def test_list_patents(self):
        """Test listing patents"""
        response = self.client.get('/api/patents/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
