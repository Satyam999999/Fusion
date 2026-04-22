from datetime import date

from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.test import TestCase

from applications.academic_information.models import Student
from applications.globals.models import DepartmentInfo, ExtraInfo, Faculty

from .models import ConsultancyProject, FundingAgency, ProjectExpenditure, ResearchScholar, SponsoredProject


class RSPCValidationTests(TestCase):
    def setUp(self):
        self.department = DepartmentInfo.objects.create(name="CSE")

        self.faculty_user = User.objects.create_user(username="faculty1", password="pass1234")
        self.faculty_info = ExtraInfo.objects.create(
            id="F001",
            user=self.faculty_user,
            title="Professor",
            user_type="faculty",
            department=self.department,
        )
        self.faculty = Faculty.objects.create(id=self.faculty_info, is_permanent=True)

        self.student_user = User.objects.create_user(username="student1", password="pass1234")
        self.student_info = ExtraInfo.objects.create(
            id="S001",
            user=self.student_user,
            title="Dr.",
            user_type="student",
            department=self.department,
        )
        self.student = Student.objects.create(
            id=self.student_info,
            programme="PhD",
            category="GEN",
        )

        self.funding_agency = FundingAgency.objects.create(
            name="DST",
            agency_type="GOVERNMENT",
        )

    def test_project_rejects_invalid_dates_and_non_permanent_pi(self):
        self.faculty.is_permanent = False
        self.faculty.save(update_fields=["is_permanent"])

        project = SponsoredProject(
            title="Quantum Research",
            project_number="RSPC-001",
            description="Test project",
            principal_investigator=self.faculty,
            funding_agency=self.funding_agency,
            sanctioned_amount=100000,
            utilized_amount=0,
            start_date=date(2025, 1, 1),
            original_end_date=date(2024, 12, 31),
        )

        with self.assertRaises(ValidationError) as ctx:
            project.full_clean()

        self.assertIn("principal_investigator", ctx.exception.message_dict)
        self.assertIn("original_end_date", ctx.exception.message_dict)

    def test_project_budget_cannot_drop_below_committed_expenditure(self):
        self.faculty.is_permanent = True
        self.faculty.save(update_fields=["is_permanent"])

        project = SponsoredProject.objects.create(
            title="AI Systems",
            project_number="RSPC-002",
            description="Test project",
            principal_investigator=self.faculty,
            funding_agency=self.funding_agency,
            sanctioned_amount=100000,
            utilized_amount=0,
            status="ONGOING",
            start_date=date(2025, 1, 1),
            original_end_date=date(2025, 12, 31),
        )

        ProjectExpenditure.objects.create(
            project=project,
            expenditure_head="TRAVEL",
            description="Conference travel",
            amount=25000,
            date=date(2025, 2, 1),
            status="PENDING",
        )

        project.sanctioned_amount = 20000

        with self.assertRaises(ValidationError) as ctx:
            project.save()

        self.assertIn("sanctioned_amount", ctx.exception.message_dict)

    def test_project_accepts_permanent_faculty_titled_dr(self):
        self.faculty_info.title = "Dr."
        self.faculty_info.save(update_fields=["title"])

        project = SponsoredProject(
            title="Signal Processing",
            project_number="RSPC-004",
            description="Test project",
            principal_investigator=self.faculty,
            funding_agency=self.funding_agency,
            sanctioned_amount=100000,
            utilized_amount=0,
            status="ONGOING",
            start_date=date(2025, 1, 1),
            original_end_date=date(2025, 12, 31),
        )

        project.full_clean()

    def test_expenditure_rejects_over_budget(self):
        project = SponsoredProject.objects.create(
            title="Robotics",
            project_number="RSPC-003",
            description="Test project",
            principal_investigator=self.faculty,
            funding_agency=self.funding_agency,
            sanctioned_amount=50000,
            utilized_amount=0,
            status="ONGOING",
            start_date=date(2025, 1, 1),
            original_end_date=date(2025, 12, 31),
        )

        ProjectExpenditure.objects.create(
            project=project,
            expenditure_head="CONSUMABLES",
            description="Parts",
            amount=25000,
            date=date(2025, 2, 1),
            status="PENDING",
        )

        over_budget = ProjectExpenditure(
            project=project,
            expenditure_head="EQUIPMENT",
            description="Additional hardware",
            amount=30000,
            date=date(2025, 3, 1),
        )

        with self.assertRaises(ValidationError) as ctx:
            over_budget.full_clean()

        self.assertIn("amount", ctx.exception.message_dict)

    def test_consultancy_rejects_invalid_payment_and_schedule(self):
        project = ConsultancyProject(
            title="Industry Consultancy",
            project_number="CON-001",
            consultant=self.faculty,
            client_name="Acme Labs",
            contract_amount=100000,
            faculty_share=20000,
            institute_share=30000,
            payment_received=150000,
            start_date=date(2025, 1, 1),
            end_date=date(2024, 12, 31),
            status="PROPOSED",
        )

        with self.assertRaises(ValidationError) as ctx:
            project.full_clean()

        self.assertIn("end_date", ctx.exception.message_dict)
        self.assertIn("payment_received", ctx.exception.message_dict)

    def test_research_scholar_rejects_invalid_completion_dates(self):
        scholar = ResearchScholar(
            student=self.student,
            enrollment_date=date(2025, 1, 1),
            expected_completion=date(2024, 12, 31),
            fellowship_start_date=date(2025, 2, 1),
            fellowship_end_date=date(2025, 1, 1),
        )

        with self.assertRaises(ValidationError) as ctx:
            scholar.full_clean()

        self.assertIn("expected_completion", ctx.exception.message_dict)
        self.assertIn("fellowship_end_date", ctx.exception.message_dict)