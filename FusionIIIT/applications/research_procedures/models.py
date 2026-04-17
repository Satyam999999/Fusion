"""
RSPC (Research, Sponsored Projects and Consultancy) Module - Data Models
Comprehensive model definitions for managing research activities, sponsored projects,
consultancy services, publications, patents, and research scholars.
"""

from django.db import models
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.core.validators import MinValueValidator
from decimal import Decimal
from django.utils import timezone
from datetime import datetime, date

# Import stub models (standalone mode - no full FusionERP needed)
from applications.globals.models import ExtraInfo, Faculty, DepartmentInfo, Student, Discipline


class Constants:
    """Constants for RSPC module"""
    RESPONSE_TYPE = (
        ('Approved', 'Approved'),
        ('Disapproved', 'Disapproved'),
        ('Pending', 'Pending')
    )


# ==================== RESEARCH AREAS ====================

class ResearchGroup(models.Model):
    """Research groups/labs in the institute"""
    
    name = models.CharField(max_length=200, unique=True)
    acronym = models.CharField(max_length=20, blank=True, null=True)
    discipline = models.ForeignKey(
        Discipline, 
        on_delete=models.CASCADE, 
        null=True, 
        blank=True,
        related_name='research_groups'
    )
    description = models.TextField(blank=True, null=True)
    head = models.ForeignKey(
        Faculty, 
        on_delete=models.SET_NULL, 
        null=True, 
        blank=True,
        related_name='led_groups'
    )
    members = models.ManyToManyField(Faculty, related_name='research_groups', blank=True)
    faculty_under_group = models.ManyToManyField(User, related_name="allfaculty", blank=True)
    students_under_group = models.ManyToManyField(User, related_name="allstudents", blank=True)
    established_date = models.DateField(null=True, blank=True)
    website = models.URLField(blank=True, null=True)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['name']
        verbose_name_plural = 'Research Groups'
        indexes = [
            models.Index(fields=['name']),
            models.Index(fields=['is_active']),
        ]

    def __str__(self):
        return f"{self.name} ({self.acronym})" if self.acronym else self.name


class ResearchArea(models.Model):
    """Research areas and specializations"""
    
    name = models.CharField(max_length=200, unique=True)
    description = models.TextField(blank=True, null=True)
    parent_area = models.ForeignKey(
        'self', 
        on_delete=models.SET_NULL, 
        null=True, 
        blank=True,
        related_name='sub_areas'
    )
    discipline = models.ForeignKey(
        Discipline, 
        on_delete=models.CASCADE, 
        null=True, 
        blank=True,
        related_name='research_areas'
    )
    faculty_experts = models.ManyToManyField(Faculty, related_name='expertise_areas', blank=True)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['name']
        verbose_name = 'Research Area'
        verbose_name_plural = 'Research Areas'
        indexes = [
            models.Index(fields=['name']),
            models.Index(fields=['is_active']),
        ]

    def __str__(self):
        return self.name


# ==================== SPONSORED PROJECTS ====================

class FundingAgency(models.Model):
    """Funding agencies (SERB, DST, DRDO, etc.)"""
    
    AGENCY_TYPE_CHOICES = [
        ('GOVERNMENT', 'Government'),
        ('PRIVATE', 'Private'),
        ('INTERNATIONAL', 'International'),
        ('INDUSTRY', 'Industry'),
        ('NGO', 'NGO'),
        ('OTHER', 'Other'),
    ]
    
    name = models.CharField(max_length=200, unique=True)
    acronym = models.CharField(max_length=20, blank=True, null=True)
    agency_type = models.CharField(max_length=20, choices=AGENCY_TYPE_CHOICES)
    country = models.CharField(max_length=50, default='India')
    website = models.URLField(blank=True, null=True)
    contact_info = models.TextField(blank=True, null=True)
    email = models.EmailField(blank=True, null=True)
    phone = models.CharField(max_length=20, blank=True, null=True)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['name']
        verbose_name = 'Funding Agency'
        verbose_name_plural = 'Funding Agencies'
        indexes = [
            models.Index(fields=['name']),
            models.Index(fields=['agency_type']),
        ]

    def __str__(self):
        return f"{self.name} ({self.acronym})" if self.acronym else self.name


class SponsoredProject(models.Model):
    """Sponsored research projects - comprehensive model"""
    
    PROJECT_STATUS_CHOICES = [
        ('DRAFT', 'Draft'),
        ('PROPOSED', 'Proposed'),
        ('SUBMITTED', 'Submitted'),
        ('VETTED_BY_HOD', 'Vetted by HoD'),
        ('VERIFIED_BY_ADMIN', 'Verified by Admin'),
        ('UNDER_REVIEW', 'Under Review'),
        ('FORWARDED_TO_DIRECTOR', 'Forwarded to Director'),
        ('APPROVED', 'Approved'),
        ('SANCTIONED', 'Sanctioned'),
        ('ONGOING', 'Ongoing'),
        ('EXTENDED', 'Extended'),
        ('COMPLETED', 'Completed'),
        ('TERMINATED', 'Terminated'),
        ('REJECTED', 'Rejected'),
    ]
    
    # Basic info
    title = models.CharField(max_length=500)
    project_number = models.CharField(max_length=50, unique=True)
    description = models.TextField()
    research_area = models.ForeignKey(
        ResearchArea, 
        on_delete=models.SET_NULL, 
        null=True, 
        blank=True,
        related_name='sponsored_projects'
    )
    research_group = models.ForeignKey(
        ResearchGroup, 
        on_delete=models.SET_NULL, 
        null=True, 
        blank=True,
        related_name='sponsored_projects'
    )
    
    # Team
    principal_investigator = models.ForeignKey(
        Faculty, 
        on_delete=models.PROTECT, 
        related_name='pi_projects',
        null=True,
        blank=True
    )
    co_principal_investigators = models.ManyToManyField(
        Faculty, 
        related_name='copi_projects', 
        blank=True
    )
    research_scholars = models.ManyToManyField(
        Student, 
        related_name='sponsored_projects', 
        blank=True
    )
    
    # Funding
    funding_agency = models.ForeignKey(
        FundingAgency, 
        on_delete=models.PROTECT,
        null=True,
        blank=True
    )
    sanctioned_amount = models.DecimalField(
        max_digits=15, 
        decimal_places=2,
        default=0,
        validators=[MinValueValidator(Decimal('0.00'))]
    )
    utilized_amount = models.DecimalField(
        max_digits=15, 
        decimal_places=2, 
        default=0,
        validators=[MinValueValidator(Decimal('0.00'))]
    )
    currency = models.CharField(max_length=3, default='INR')
    
    # Timeline
    submission_date = models.DateField(null=True, blank=True)
    sanction_date = models.DateField(null=True, blank=True)
    start_date = models.DateField(null=True, blank=True)
    finish_date = models.DateField(null=True, blank=True)
    original_end_date = models.DateField(null=True, blank=True)
    extended_end_date = models.DateField(null=True, blank=True)
    actual_end_date = models.DateField(null=True, blank=True)
    duration_months = models.IntegerField(null=True, blank=True)
    
    # Status
    status = models.CharField(
        max_length=30,
        choices=PROJECT_STATUS_CHOICES, 
        default='PROPOSED'
    )
    
    # Files and Documents
    proposal_document = models.FileField(
        upload_to='rspc/projects/proposals/', 
        null=True, 
        blank=True
    )
    sanction_letter = models.FileField(
        upload_to='rspc/projects/sanctions/', 
        null=True, 
        blank=True
    )
    completion_report = models.FileField(
        upload_to='rspc/projects/completion/', 
        null=True, 
        blank=True
    )
    
    # Additional fields for backward compatibility
    pf_no = models.IntegerField(null=True, blank=True)
    ptype = models.CharField(max_length=100, default="Research", null=True, blank=True)
    pi = models.CharField(max_length=1000, default=" ", null=True, blank=True)
    co_pi = models.CharField(max_length=1500, default=" ", null=True, blank=True)
    financial_outlay = models.CharField(max_length=150, default=" ", null=True, blank=True)
    
    # Administrative
    notes = models.TextField(blank=True, null=True)
    date_entry = models.DateField(null=True, blank=True, default=timezone.now)
    date_submission = models.DateField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Sponsored Project'
        verbose_name_plural = 'Sponsored Projects'
        indexes = [
            models.Index(fields=['project_number']),
            models.Index(fields=['status']),
            models.Index(fields=['created_at']),
        ]

    def __str__(self):
        return f"{self.project_number}: {self.title}" if self.project_number else f"PF No.: {self.pf_no}  pi: {self.pi}  title: {self.title}"

    def clean(self):
        allowed_designations = {"professor", "assistant professor"}

        if self.principal_investigator_id:
            pi_title = (self.principal_investigator.id.title or "").strip().lower()
            if pi_title and pi_title not in allowed_designations:
                raise ValidationError({
                    "principal_investigator": "PI must be Professor or Assistant Professor."
                })
            if hasattr(self.principal_investigator, 'is_permanent') and not self.principal_investigator.is_permanent:
                raise ValidationError({
                    "principal_investigator": "Only permanent faculty can be assigned as PI."
                })

        if self.pk and self.principal_investigator_id:
            if self.co_principal_investigators.filter(pk=self.principal_investigator_id).exists():
                raise ValidationError({
                    "co_principal_investigators": "PI and Co-PI cannot be the same faculty member."
                })

        if self.duration_months is not None:
            if self.duration_months < 6 or self.duration_months > 60:
                raise ValidationError({
                    "duration_months": "Project duration must be between 6 and 60 months."
                })

    @property
    def is_active(self):
        """Check if project is currently active"""
        return self.status in ['ONGOING', 'EXTENDED']

    @property
    def budget_utilization_percent(self):
        """Calculate budget utilization percentage"""
        if self.sanctioned_amount == 0:
            return 0
        return round((self.utilized_amount / self.sanctioned_amount) * 100, 2)


class ProjectExpenditure(models.Model):
    """Project expenditure tracking"""
    
    EXPENDITURE_HEAD_CHOICES = [
        ('MANPOWER', 'Manpower/Salary'),
        ('EQUIPMENT', 'Equipment'),
        ('CONSUMABLES', 'Consumables'),
        ('TRAVEL', 'Travel'),
        ('PUBLICATIONS', 'Publications'),
        ('CONTINGENCY', 'Contingency'),
        ('OVERHEAD', 'Overhead'),
        ('SERVICES', 'Services'),
        ('OTHER', 'Other'),
    ]
    
    STATUS_CHOICES = [
        ('PENDING', 'Pending'),
        ('APPROVED', 'Approved'),
        ('REJECTED', 'Rejected'),
    ]
    
    project = models.ForeignKey(
        SponsoredProject, 
        on_delete=models.CASCADE, 
        related_name='expenditures'
    )
    expenditure_head = models.CharField(max_length=20, choices=EXPENDITURE_HEAD_CHOICES)
    description = models.TextField()
    amount = models.DecimalField(
        max_digits=15, 
        decimal_places=2,
        validators=[MinValueValidator(Decimal('0.00'))]
    )
    date = models.DateField()
    last_date = models.DateField(null=True, blank=True)
    voucher_number = models.CharField(max_length=50, blank=True, null=True)
    bill_document = models.FileField(
        upload_to='rspc/projects/bills/', 
        null=True, 
        blank=True
    )
    status = models.CharField(
        max_length=20, 
        choices=STATUS_CHOICES, 
        default='PENDING'
    )
    approved_by = models.ForeignKey(
        ExtraInfo, 
        on_delete=models.SET_NULL, 
        null=True,
        blank=True,
        related_name='approved_expenditures'
    )
    approval_date = models.DateField(null=True, blank=True)
    remarks = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['-date']
        verbose_name = 'Project Expenditure'
        verbose_name_plural = 'Project Expenditures'
        indexes = [
            models.Index(fields=['project', 'date']),
            models.Index(fields=['status']),
        ]

    def __str__(self):
        return f"{self.project.project_number} - {self.get_expenditure_head_display()} - {self.amount}"

    def clean(self):
        if self.amount is not None and self.amount <= 0:
            raise ValidationError({"amount": "Expenditure amount must be positive."})

        if self.last_date and self.last_date < date.today():
            raise ValidationError({"last_date": "Expenditure last date cannot be in the past."})


class ProjectMilestone(models.Model):
    """Project milestones and deliverables"""
    
    STATUS_CHOICES = [
        ('PENDING', 'Pending'),
        ('IN_PROGRESS', 'In Progress'),
        ('COMPLETED', 'Completed'),
        ('DELAYED', 'Delayed'),
    ]
    
    project = models.ForeignKey(
        SponsoredProject, 
        on_delete=models.CASCADE, 
        related_name='milestones'
    )
    title = models.CharField(max_length=200)
    description = models.TextField(blank=True, null=True)
    due_date = models.DateField()
    completed_date = models.DateField(null=True, blank=True)
    status = models.CharField(
        max_length=20, 
        choices=STATUS_CHOICES, 
        default='PENDING'
    )
    deliverables = models.TextField(blank=True, null=True)
    deliverable_file = models.FileField(
        upload_to='rspc/projects/deliverables/', 
        null=True, 
        blank=True
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['due_date']
        verbose_name = 'Project Milestone'
        verbose_name_plural = 'Project Milestones'
        indexes = [
            models.Index(fields=['project', 'due_date']),
            models.Index(fields=['status']),
        ]

    def __str__(self):
        return f"{self.project.project_number} - {self.title}"

    @property
    def is_overdue(self):
        """Check if milestone is overdue"""
        if self.status == 'COMPLETED':
            return False
        return timezone.now().date() > self.due_date


class ProjectReport(models.Model):
    """Project progress reports"""
    
    REPORT_TYPE_CHOICES = [
        ('QUARTERLY', 'Quarterly'),
        ('HALF_YEARLY', 'Half Yearly'),
        ('ANNUAL', 'Annual'),
        ('FINAL', 'Final'),
        ('UTILIZATION', 'Utilization Certificate'),
    ]
    
    STATUS_CHOICES = [
        ('DRAFT', 'Draft'),
        ('SUBMITTED', 'Submitted'),
        ('APPROVED', 'Approved'),
        ('REJECTED', 'Rejected'),
    ]
    
    project = models.ForeignKey(
        SponsoredProject, 
        on_delete=models.CASCADE, 
        related_name='reports'
    )
    report_type = models.CharField(max_length=20, choices=REPORT_TYPE_CHOICES)
    period_from = models.DateField()
    period_to = models.DateField()
    summary = models.TextField()
    achievements = models.TextField(blank=True, null=True)
    challenges = models.TextField(blank=True, null=True)
    next_steps = models.TextField(blank=True, null=True)
    report_file = models.FileField(upload_to='rspc/projects/reports/')
    status = models.CharField(
        max_length=20, 
        choices=STATUS_CHOICES, 
        default='DRAFT'
    )
    submitted_date = models.DateField(null=True, blank=True)
    approved_date = models.DateField(null=True, blank=True)
    comments = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['-period_from']
        verbose_name = 'Project Report'
        verbose_name_plural = 'Project Reports'
        indexes = [
            models.Index(fields=['project', 'period_from']),
            models.Index(fields=['status']),
        ]

    def __str__(self):
        return f"{self.project.project_number} - {self.get_report_type_display()}"

    def clean(self):
        required_sections = {
            'summary': self.summary,
            'achievements': self.achievements,
            'challenges': self.challenges,
            'next_steps': self.next_steps,
        }
        missing_sections = [name for name, value in required_sections.items() if not value or not str(value).strip()]
        if missing_sections:
            raise ValidationError({'summary': f"Missing mandatory sections: {', '.join(missing_sections)}"})

        if self.period_from and self.period_to:
            if self.period_to <= self.period_from:
                raise ValidationError({'period_to': 'period_to must be after period_from.'})
            if self.report_type == 'QUARTERLY':
                delta_days = (self.period_to - self.period_from).days
                if delta_days > 100:
                    raise ValidationError({'period_to': 'Quarterly reporting window cannot exceed 100 days.'})


# ==================== CONSULTANCY ====================

class ConsultancyProject(models.Model):
    """Consultancy projects"""
    
    STATUS_CHOICES = [
        ('DRAFT', 'Draft'),
        ('PROPOSED', 'Proposed'),
        ('SUBMITTED', 'Submitted for Verification'),
        ('VERIFIED_BY_ADMIN', 'Verified by Admin'),
        ('NEGOTIATION', 'Under Negotiation'),
        ('APPROVED', 'Approved'),
        ('ONGOING', 'Ongoing'),
        ('COMPLETED', 'Completed'),
        ('CANCELLED', 'Cancelled'),
    ]
    
    CLIENT_TYPE_CHOICES = [
        ('INDUSTRY', 'Industry'),
        ('GOVERNMENT', 'Government'),
        ('NGO', 'NGO'),
        ('ACADEMIC', 'Academic'),
        ('INDIVIDUAL', 'Individual'),
        ('OTHER', 'Other'),
    ]
    
    # Basic info
    title = models.CharField(max_length=500)
    project_number = models.CharField(max_length=50, unique=True, null=True, blank=True)
    description = models.TextField(blank=True, null=True)
    
    # Client
    client_name = models.CharField(max_length=200)
    client_type = models.CharField(max_length=50, choices=CLIENT_TYPE_CHOICES, null=True, blank=True)
    client_contact = models.TextField(blank=True, null=True)
    client_email = models.EmailField(blank=True, null=True)
    client_phone = models.CharField(max_length=20, blank=True, null=True)
    
    # Team
    consultant = models.ForeignKey(
        Faculty, 
        on_delete=models.PROTECT, 
        related_name='consultancies',
        null=True,
        blank=True
    )
    co_consultants = models.ManyToManyField(
        Faculty, 
        related_name='co_consultancies', 
        blank=True
    )
    consultants = models.CharField(max_length=150, null=True, blank=True)
    
    # Financial
    contract_amount = models.DecimalField(
        max_digits=15, 
        decimal_places=2,
        default=0,
        validators=[MinValueValidator(Decimal('0.00'))]
    )
    faculty_share = models.DecimalField(
        max_digits=15, 
        decimal_places=2,
        default=0,
        validators=[MinValueValidator(Decimal('0.00'))]
    )
    institute_share = models.DecimalField(
        max_digits=15, 
        decimal_places=2,
        default=0,
        validators=[MinValueValidator(Decimal('0.00'))]
    )
    financial_outlay = models.IntegerField(null=True, blank=True)
    currency = models.CharField(max_length=3, default='INR')
    payment_received = models.DecimalField(
        max_digits=15, 
        decimal_places=2, 
        default=0,
        validators=[MinValueValidator(Decimal('0.00'))]
    )
    
    # Timeline
    start_date = models.DateField()
    end_date = models.DateField(null=True, blank=True)
    actual_completion_date = models.DateField(null=True, blank=True)
    duration = models.CharField(max_length=500, null=True, blank=True)
    
    # Status
    status = models.CharField(
        max_length=20, 
        choices=STATUS_CHOICES, 
        default='PROPOSED'
    )
    
    # Documents
    agreement_document = models.FileField(
        upload_to='rspc/consultancy/agreements/', 
        null=True, 
        blank=True
    )
    completion_certificate = models.FileField(
        upload_to='rspc/consultancy/certificates/', 
        null=True, 
        blank=True
    )
    
    # Additional fields for backward compatibility
    pf_no = models.IntegerField(null=True, blank=True)
    remarks = models.CharField(max_length=1000, null=True, blank=True)
    
    # Administrative
    notes = models.TextField(blank=True, null=True)
    date_entry = models.DateField(null=True, blank=True, default=timezone.now)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Consultancy Project'
        verbose_name_plural = 'Consultancy Projects'
        indexes = [
            models.Index(fields=['project_number']),
            models.Index(fields=['status']),
        ]

    def __str__(self):
        if self.project_number:
            return f"{self.project_number}: {self.title}"
        else:
            return f'PF No.: {self.pf_no}  Consultants: {self.consultants}'

    @property
    def is_active(self):
        """Check if consultancy is currently active"""
        return self.status == 'ONGOING'

    @property
    def payment_pending(self):
        """Calculate pending payment"""
        return self.contract_amount - self.payment_received

    def clean(self):
        if self.consultant_id and self.status in {'PROPOSED', 'SUBMITTED', 'VERIFIED_BY_ADMIN', 'APPROVED', 'ONGOING'}:
            active_count = ConsultancyProject.objects.filter(
                consultant=self.consultant,
                status__in={'PROPOSED', 'SUBMITTED', 'VERIFIED_BY_ADMIN', 'APPROVED', 'ONGOING'}
            ).exclude(pk=self.pk).count()
            if active_count >= 2:
                raise ValidationError({'consultant': 'Faculty must not have more than 2 active consultancy projects.'})


# ==================== PUBLICATIONS ====================

class Publication(models.Model):
    """Research publications"""
    
    PUBLICATION_TYPE_CHOICES = [
        ('JOURNAL', 'Journal Article'),
        ('CONFERENCE', 'Conference Paper'),
        ('BOOK', 'Book'),
        ('BOOK_CHAPTER', 'Book Chapter'),
        ('PATENT', 'Patent'),
        ('THESIS', 'Thesis'),
        ('TECHNICAL_REPORT', 'Technical Report'),
        ('PREPRINT', 'Preprint'),
        ('OTHER', 'Other'),
    ]
    
    INDEX_TYPE_CHOICES = [
        ('SCI', 'SCI'),
        ('SCIE', 'SCIE'),
        ('SCOPUS', 'Scopus'),
        ('WOS', 'Web of Science'),
        ('UGC_CARE', 'UGC Care List'),
        ('ABDC', 'ABDC'),
        ('OTHER_INDEXED', 'Other Indexed'),
        ('NONE', 'Non-indexed'),
    ]
    
    # Basic info
    title = models.CharField(max_length=500)
    publication_type = models.CharField(max_length=20, choices=PUBLICATION_TYPE_CHOICES)
    
    # Authors (from institute)
    faculty_authors = models.ManyToManyField(
        Faculty, 
        related_name='publications',
        blank=True
    )
    student_authors = models.ManyToManyField(
        Student, 
        related_name='publications', 
        blank=True
    )
    external_authors = models.TextField(blank=True, null=True)
    
    # Publication details
    journal_conference_name = models.CharField(max_length=300)
    publisher = models.CharField(max_length=200, blank=True, null=True)
    volume = models.CharField(max_length=20, blank=True, null=True)
    issue = models.CharField(max_length=20, blank=True, null=True)
    pages = models.CharField(max_length=20, blank=True, null=True)
    year = models.IntegerField()
    month = models.IntegerField(null=True, blank=True)
    
    # Indexing
    index_type = models.CharField(
        max_length=20, 
        choices=INDEX_TYPE_CHOICES, 
        default='NONE'
    )
    impact_factor = models.DecimalField(
        max_digits=6, 
        decimal_places=3, 
        null=True, 
        blank=True
    )
    
    # Identifiers
    doi = models.CharField(max_length=100, blank=True, null=True)
    issn = models.CharField(max_length=20, blank=True, null=True)
    isbn = models.CharField(max_length=20, blank=True, null=True)
    url = models.URLField(blank=True, null=True)
    
    # Associated project
    associated_project = models.ForeignKey(
        SponsoredProject, 
        on_delete=models.SET_NULL, 
        null=True, 
        blank=True,
        related_name='publications'
    )
    
    # File and Metadata
    pdf_file = models.FileField(
        upload_to='rspc/publications/', 
        null=True, 
        blank=True
    )
    abstract = models.TextField(blank=True, null=True)
    keywords = models.CharField(max_length=500, blank=True, null=True)
    
    # Verification
    is_verified = models.BooleanField(default=False)
    verified_by = models.ForeignKey(
        ExtraInfo, 
        on_delete=models.SET_NULL, 
        null=True, 
        blank=True,
        related_name='verified_publications'
    )
    verification_date = models.DateField(null=True, blank=True)
    
    # Administrative
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['-year', '-month']
        verbose_name = 'Publication'
        verbose_name_plural = 'Publications'
        indexes = [
            models.Index(fields=['doi']),
            models.Index(fields=['year']),
            models.Index(fields=['publication_type']),
        ]

    def __str__(self):
        return f"{self.title} ({self.year})"


# ==================== PATENTS ====================

class Patent(models.Model):
    """Patent applications and grants"""
    
    STATUS_CHOICES = [
        ('DRAFT', 'Draft'),
        ('FILED', 'Filed'),
        ('PUBLISHED', 'Published'),
        ('UNDER_EXAMINATION', 'Under Examination'),
        ('GRANTED', 'Granted'),
        ('REJECTED', 'Rejected'),
        ('LAPSED', 'Lapsed'),
        ('ABANDONED', 'Abandoned'),
    ]
    
    PATENT_TYPE_CHOICES = [
        ('NATIONAL', 'National'),
        ('INTERNATIONAL', 'International'),
        ('PCT', 'PCT'),
        ('DESIGN', 'Design'),
        ('TRADEMARK', 'Trademark'),
    ]
    
    # Original fields (backward compatibility)
    application_id = models.AutoField(primary_key=True)
    faculty_id = models.ForeignKey(
        ExtraInfo, 
        on_delete=models.CASCADE,
        null=True,
        blank=True,
        related_name='patents_legacy'
    )
    ipd_form = models.FileField(null=True, blank=True)
    project_details = models.FileField(null=True, blank=True)
    ipd_form_file = models.TextField(null=True, blank=True)
    project_details_file = models.TextField(null=True, blank=True)
    
    # New comprehensive fields
    title = models.CharField(max_length=500)
    abstract = models.TextField(blank=True, null=True)
    patent_type = models.CharField(max_length=20, choices=PATENT_TYPE_CHOICES, default='NATIONAL')
    
    # Inventors
    faculty_inventors = models.ManyToManyField(
        Faculty, 
        related_name='patents',
        blank=True
    )
    student_inventors = models.ManyToManyField(
        Student, 
        related_name='patents', 
        blank=True
    )
    external_inventors = models.TextField(blank=True, null=True)
    
    # Filing details
    application_number = models.CharField(max_length=50, blank=True, null=True, unique=True)
    filing_date = models.DateField(null=True, blank=True)
    publication_number = models.CharField(max_length=50, blank=True, null=True)
    publication_date = models.DateField(null=True, blank=True)
    grant_number = models.CharField(max_length=50, blank=True, null=True)
    grant_date = models.DateField(null=True, blank=True)
    
    # Status
    status = models.CharField(
        max_length=20, 
        choices=STATUS_CHOICES, 
        default='DRAFT'
    )
    
    # Jurisdiction
    country = models.CharField(max_length=50, default='India')
    organization = models.CharField(max_length=100, blank=True, null=True)
    
    # Documents
    specification_document = models.FileField(
        upload_to='rspc/patents/specs/', 
        null=True, 
        blank=True
    )
    grant_certificate = models.FileField(
        upload_to='rspc/patents/certificates/', 
        null=True, 
        blank=True
    )
    
    # Related project
    related_project = models.ForeignKey(
        SponsoredProject, 
        on_delete=models.SET_NULL, 
        null=True, 
        blank=True,
        related_name='patents_new'
    )
    
    # Administrative
    notes = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['-filing_date']
        verbose_name = 'Patent'
        verbose_name_plural = 'Patents'
        indexes = [
            models.Index(fields=['application_number']),
            models.Index(fields=['status']),
            models.Index(fields=['filing_date']),
        ]

    def __str__(self):
        return f"{self.title}"


class PatentStatusNotification(models.Model):
    patent = models.ForeignKey(Patent, on_delete=models.CASCADE, related_name='status_notifications')
    faculty = models.ForeignKey(ExtraInfo, on_delete=models.SET_NULL, null=True, blank=True)
    previous_status = models.CharField(max_length=50, blank=True)
    new_status = models.CharField(max_length=50)
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return f"Patent {self.patent_id} status changed to {self.new_status}"


# ==================== RESEARCH SCHOLARS ====================

class ResearchScholar(models.Model):
    """Extended information for research scholars"""
    
    FELLOWSHIP_TYPE_CHOICES = [
        ('GATE', 'GATE'),
        ('NET', 'NET'),
        ('CSIR', 'CSIR'),
        ('DBT', 'DBT'),
        ('INSTITUTE', 'Institute'),
        ('SPONSORED', 'Sponsored'),
        ('SELF_FUNDED', 'Self Funded'),
        ('OTHER', 'Other'),
    ]
    
    PROGRESS_STATUS_CHOICES = [
        ('REGISTERED', 'Registered'),
        ('COURSEWORK', 'Coursework'),
        ('COMPREHENSIVE_EXAM', 'Comprehensive Exam'),
        ('SYNOPSIS_PHASE', 'Synopsis Phase'),
        ('RESEARCH_PHASE', 'Research Phase'),
        ('THESIS_WRITING', 'Thesis Writing'),
        ('DEFENSE_READY', 'Defense Ready'),
        ('DEFENDED', 'Defended'),
        ('COMPLETED', 'Completed'),
    ]
    
    student = models.OneToOneField(
        Student, 
        on_delete=models.CASCADE, 
        null=True,
        blank=True,
        related_name='research_scholar_info'
    )
    
    # Basic info
    enrollment_date = models.DateField()
    expected_completion = models.DateField(null=True, blank=True)
    
    # Fellowship
    fellowship_type = models.CharField(
        max_length=50, 
        choices=FELLOWSHIP_TYPE_CHOICES,
        blank=True, 
        null=True
    )
    fellowship_amount = models.DecimalField(
        max_digits=10, 
        decimal_places=2, 
        null=True, 
        blank=True,
        validators=[MinValueValidator(Decimal('0.00'))]
    )
    fellowship_start_date = models.DateField(null=True, blank=True)
    fellowship_end_date = models.DateField(null=True, blank=True)
    
    # Progress
    progress_status = models.CharField(
        max_length=20,
        choices=PROGRESS_STATUS_CHOICES,
        default='REGISTERED'
    )
    coursework_completed = models.BooleanField(default=False)
    coursework_completion_date = models.DateField(null=True, blank=True)
    
    # Comprehensive Exam
    comprehensive_exam_passed = models.BooleanField(default=False)
    comprehensive_exam_date = models.DateField(null=True, blank=True)
    comprehensive_exam_score = models.DecimalField(
        max_digits=5, 
        decimal_places=2, 
        null=True, 
        blank=True
    )
    
    # Synopsis
    synopsis_submitted = models.BooleanField(default=False)
    synopsis_date = models.DateField(null=True, blank=True)
    synopsis_approved = models.BooleanField(default=False)
    synopsis_approval_date = models.DateField(null=True, blank=True)
    
    # Thesis
    thesis_submitted = models.BooleanField(default=False)
    thesis_submission_date = models.DateField(null=True, blank=True)
    thesis_title = models.CharField(max_length=500, blank=True, null=True)
    defense_date = models.DateField(null=True, blank=True)
    defense_result = models.CharField(
        max_length=50, 
        blank=True, 
        null=True,
        choices=[
            ('PASS', 'Pass'),
            ('REVISIONS_REQUIRED', 'Revisions Required'),
            ('FAIL', 'Fail'),
        ]
    )
    degree_awarded_date = models.DateField(null=True, blank=True)
    
    # Publications from research
    publications_count = models.IntegerField(default=0)
    patents_count = models.IntegerField(default=0)
    
    # Administrative
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'Research Scholar'
        verbose_name_plural = 'Research Scholars'
        indexes = [
            models.Index(fields=['progress_status']),
            models.Index(fields=['enrollment_date']),
        ]

    def __str__(self):
        return f"{self.student} - {self.progress_status}" if self.student else "Research Scholar"

    @property
    def years_enrolled(self):
        """Calculate years since enrollment"""
        return (timezone.now().date() - self.enrollment_date).days / 365.25


# ==================== TECH TRANSFER ====================

class TechTransfer(models.Model):
    """Technology transfer activities"""
    
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    pf_no = models.IntegerField()
    details = models.CharField(max_length=500, default=" ")
    date_entry = models.DateField(null=True, blank=True, default=timezone.now)
    start_date = models.DateField(null=True, blank=True)
    end_date = models.DateField(null=True, blank=True)

    def __str__(self):
        return f'PF No.: {self.pf_no}   Details: {self.details}'


# ==================== LEGACY RESEARCH PROJECT MODEL ====================

class ResearchProject(models.Model):
    """Legacy Research Project model for backward compatibility"""
    
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    pf_no = models.IntegerField()
    ptype = models.CharField(max_length=100, default="Research")
    pi = models.CharField(max_length=1000, default=" ")
    co_pi = models.CharField(max_length=1500, default=" ")
    title = models.TextField(max_length=5000, default=" ")
    funding_agency = models.CharField(max_length=250, default=" ", null=True)
    financial_outlay = models.CharField(max_length=150, default=" ", null=True)
    STATUS_TYPE_CHOICES = (
        ('Awarded', 'Awarded'),
        ('Submitted', 'Submitted'),
        ('Ongoing', 'Ongoing'),
        ('Completed', 'Completed')
    )
    status = models.CharField(max_length=10, choices=STATUS_TYPE_CHOICES, default='Proposed')
    start_date = models.DateField(null=True, blank=True)
    finish_date = models.DateField(null=True, blank=True)
    date_submission = models.DateField(null=True, blank=True)
    date_entry = models.DateField(null=True, blank=True, default=timezone.now)

    def __str__(self):
        return f'PF No.: {self.pf_no}   pi: {self.pi}  title: {self.title}'