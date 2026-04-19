"""
Django Forms for RSPC Module
Provides forms for creating and updating RSPC models
"""

from django import forms
from django.core.exceptions import ValidationError
from .models import (
    ResearchGroup, ResearchArea, FundingAgency, SponsoredProject,
    ProjectExpenditure, ProjectMilestone, ProjectReport,
    ConsultancyProject, Publication, Patent, ResearchScholar,
    TechTransfer, ResearchProject
)


# ==================== BASE FORM CLASSES ====================

class DateInput(forms.DateInput):
    """Custom date input widget"""
    input_type = 'date'


class BaseModelForm(forms.ModelForm):
    """Base model form with common configurations"""
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Add Bootstrap classes to all fields
        for field_name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'
            if isinstance(field.widget, forms.CheckboxInput):
                field.widget.attrs['class'] = 'form-check-input'
            elif isinstance(field.widget, forms.RadioSelect):
                field.widget.attrs['class'] = 'form-check-input'


# ==================== RESEARCH GROUP FORMS ====================

class ResearchGroupForm(BaseModelForm):
    """Form for creating and updating Research Groups"""
    
    established_date = forms.DateField(widget=DateInput, required=False)
    
    class Meta:
        model = ResearchGroup
        fields = ['name', 'acronym', 'discipline', 'head', 'members', 
                 'faculty_under_group', 'students_under_group', 'description', 
                 'website', 'established_date', 'is_active']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 4}),
            'website': forms.URLInput(),
            'members': forms.CheckboxSelectMultiple(),
            'faculty_under_group': forms.CheckboxSelectMultiple(),
            'students_under_group': forms.CheckboxSelectMultiple(),
        }
    
    def clean(self):
        cleaned_data = super().clean()
        if cleaned_data.get('head') and not cleaned_data.get('members'):
            raise ValidationError("Research group must have at least one member")
        return cleaned_data


# ==================== RESEARCH AREA FORMS ====================

class ResearchAreaForm(BaseModelForm):
    """Form for creating and updating Research Areas"""
    
    class Meta:
        model = ResearchArea
        fields = ['name', 'parent_area', 'discipline', 'faculty_experts', 
                 'description', 'is_active']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 3}),
            'faculty_experts': forms.CheckboxSelectMultiple(),
        }


# ==================== FUNDING AGENCY FORMS ====================

class FundingAgencyForm(BaseModelForm):
    """Form for creating and updating Funding Agencies"""
    
    class Meta:
        model = FundingAgency
        fields = ['name', 'acronym', 'agency_type', 'country', 'website', 
                 'email', 'phone', 'contact_info', 'is_active']
        widgets = {
            'website': forms.URLInput(),
            'email': forms.EmailInput(),
            'phone': forms.TextInput(attrs={'type': 'tel'}),
            'contact_info': forms.Textarea(attrs={'rows': 3}),
        }


# ==================== SPONSORED PROJECT FORMS ====================

class SponsoredProjectForm(BaseModelForm):
    """Form for creating and updating Sponsored Projects"""
    
    submission_date = forms.DateField(widget=DateInput, required=False)
    sanction_date = forms.DateField(widget=DateInput, required=False)
    start_date = forms.DateField(widget=DateInput)
    original_end_date = forms.DateField(widget=DateInput)
    extended_end_date = forms.DateField(widget=DateInput, required=False)
    actual_end_date = forms.DateField(widget=DateInput, required=False)
    
    class Meta:
        model = SponsoredProject
        fields = ['title', 'project_number', 'principal_investigator', 
                 'co_principal_investigators', 'research_area', 'research_group',
                 'description', 'funding_agency', 'sanctioned_amount', 'utilized_amount',
                 'currency', 'submission_date', 'sanction_date', 'start_date',
                 'original_end_date', 'extended_end_date', 'actual_end_date',
                 'duration_months', 'status', 'proposal_document', 'sanction_letter',
                 'completion_report', 'notes', 'research_scholars']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 4}),
            'notes': forms.Textarea(attrs={'rows': 3}),
            'co_principal_investigators': forms.CheckboxSelectMultiple(),
            'research_scholars': forms.CheckboxSelectMultiple(),
        }
    
    def clean(self):
        cleaned_data = super().clean()
        start = cleaned_data.get('start_date')
        end = cleaned_data.get('original_end_date')
        
        if start and end and start >= end:
            raise ValidationError("Start date must be before end date")
        
        if cleaned_data.get('sanctioned_amount') and cleaned_data.get('utilized_amount'):
            if cleaned_data['utilized_amount'] > cleaned_data['sanctioned_amount']:
                raise ValidationError("Utilized amount cannot exceed sanctioned amount")
        
        return cleaned_data


class ProjectExpenditureForm(BaseModelForm):
    """Form for creating and updating Project Expenditures"""
    
    date = forms.DateField(widget=DateInput)
    approval_date = forms.DateField(widget=DateInput, required=False)
    
    class Meta:
        model = ProjectExpenditure
        fields = ['project', 'expenditure_head', 'amount', 'date', 'description',
                 'voucher_number', 'status', 'approved_by', 'approval_date',
                 'remarks', 'bill_document']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 3}),
            'remarks': forms.Textarea(attrs={'rows': 3}),
        }
    
    def clean(self):
        cleaned_data = super().clean()
        if cleaned_data.get('amount') and cleaned_data['amount'] <= 0:
            raise ValidationError("Amount must be greater than zero")
        return cleaned_data


class ProjectMilestoneForm(BaseModelForm):
    """Form for creating and updating Project Milestones"""
    
    due_date = forms.DateField(widget=DateInput)
    completed_date = forms.DateField(widget=DateInput, required=False)
    
    class Meta:
        model = ProjectMilestone
        fields = ['project', 'title', 'description', 'due_date', 'completed_date',
                 'status', 'deliverables', 'deliverable_file']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 3}),
            'deliverables': forms.Textarea(attrs={'rows': 2}),
        }


class ProjectReportForm(BaseModelForm):
    """Form for creating and updating Project Reports"""
    
    period_from = forms.DateField(widget=DateInput)
    period_to = forms.DateField(widget=DateInput)
    submitted_date = forms.DateField(widget=DateInput, required=False)
    approved_date = forms.DateField(widget=DateInput, required=False)
    
    class Meta:
        model = ProjectReport
        fields = ['project', 'report_type', 'period_from', 'period_to',
                 'summary', 'achievements', 'challenges', 'next_steps',
                 'status', 'submitted_date', 'approved_date', 'comments',
                 'report_file']
        widgets = {
            'summary': forms.Textarea(attrs={'rows': 3}),
            'achievements': forms.Textarea(attrs={'rows': 3}),
            'challenges': forms.Textarea(attrs={'rows': 3}),
            'next_steps': forms.Textarea(attrs={'rows': 3}),
            'comments': forms.Textarea(attrs={'rows': 2}),
        }


# ==================== CONSULTANCY PROJECT FORMS ====================

class ConsultancyProjectForm(BaseModelForm):
    """Form for creating and updating Consultancy Projects"""
    
    start_date = forms.DateField(widget=DateInput)
    end_date = forms.DateField(widget=DateInput)
    actual_completion_date = forms.DateField(widget=DateInput, required=False)
    
    class Meta:
        model = ConsultancyProject
        fields = ['title', 'project_number', 'consultant', 'co_consultants',
                 'client_name', 'client_type', 'client_contact', 'client_email',
                 'client_phone', 'description', 'contract_amount', 'faculty_share',
                 'institute_share', 'currency', 'payment_received', 'start_date',
                 'end_date', 'actual_completion_date', 'duration', 'status',
                 'agreement_document', 'completion_certificate', 'remarks', 'notes']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 4}),
            'remarks': forms.Textarea(attrs={'rows': 3}),
            'notes': forms.Textarea(attrs={'rows': 3}),
            'client_contact': forms.Textarea(attrs={'rows': 2}),
            'client_email': forms.EmailInput(),
            'client_phone': forms.TextInput(attrs={'type': 'tel'}),
            'co_consultants': forms.CheckboxSelectMultiple(),
        }
    
    def clean(self):
        cleaned_data = super().clean()
        start = cleaned_data.get('start_date')
        end = cleaned_data.get('end_date')
        
        if start and end and start >= end:
            raise ValidationError("Start date must be before end date")
        
        total = 0
        if cleaned_data.get('faculty_share'):
            total += cleaned_data['faculty_share']
        if cleaned_data.get('institute_share'):
            total += cleaned_data['institute_share']
        
        if total and cleaned_data.get('contract_amount'):
            if total != cleaned_data['contract_amount']:
                raise ValidationError("Faculty share + Institute share must equal contract amount")
        
        return cleaned_data


# ==================== PUBLICATION FORMS ====================

class PublicationForm(BaseModelForm):
    """Form for creating and updating Publications"""
    
    verification_date = forms.DateField(widget=DateInput, required=False)
    
    class Meta:
        model = Publication
        fields = ['title', 'abstract', 'keywords', 'publication_type',
                 'faculty_authors', 'student_authors', 'external_authors',
                 'journal_conference_name', 'publisher', 'volume', 'issue',
                 'pages', 'year', 'month', 'index_type', 'impact_factor',
                 'doi', 'issn', 'isbn', 'url', 'associated_project',
                 'is_verified', 'verified_by', 'verification_date', 'pdf_file']
        widgets = {
            'abstract': forms.Textarea(attrs={'rows': 4}),
            'keywords': forms.Textarea(attrs={'rows': 2}),
            'faculty_authors': forms.CheckboxSelectMultiple(),
            'student_authors': forms.CheckboxSelectMultiple(),
            'external_authors': forms.Textarea(attrs={'rows': 2}),
            'url': forms.URLInput(),
        }
    
    def clean(self):
        cleaned_data = super().clean()
        if not cleaned_data.get('faculty_authors') and not cleaned_data.get('student_authors'):
            raise ValidationError("Publication must have at least one faculty or student author")
        return cleaned_data


# ==================== PATENT FORMS ====================

class PatentForm(BaseModelForm):
    """Form for creating and updating Patents"""
    
    filing_date = forms.DateField(widget=DateInput)
    publication_date = forms.DateField(widget=DateInput, required=False)
    grant_date = forms.DateField(widget=DateInput, required=False)
    
    class Meta:
        model = Patent
        fields = ['title', 'abstract', 'patent_type', 'faculty_inventors',
                 'student_inventors', 'external_inventors', 'application_number',
                 'filing_date', 'publication_number', 'publication_date',
                 'grant_number', 'grant_date', 'country', 'organization',
                 'status', 'related_project', 'specification_document',
                 'grant_certificate', 'notes']
        widgets = {
            'abstract': forms.Textarea(attrs={'rows': 4}),
            'external_inventors': forms.Textarea(attrs={'rows': 2}),
            'notes': forms.Textarea(attrs={'rows': 3}),
            'faculty_inventors': forms.CheckboxSelectMultiple(),
            'student_inventors': forms.CheckboxSelectMultiple(),
        }
    
    def clean(self):
        cleaned_data = super().clean()
        if not cleaned_data.get('faculty_inventors') and not cleaned_data.get('student_inventors'):
            raise ValidationError("Patent must have at least one faculty or student inventor")
        return cleaned_data


# ==================== RESEARCH SCHOLAR FORMS ====================

class ResearchScholarForm(BaseModelForm):
    """Form for creating and updating Research Scholars"""
    
    enrollment_date = forms.DateField(widget=DateInput)
    expected_completion = forms.DateField(widget=DateInput, required=False)
    coursework_completion_date = forms.DateField(widget=DateInput, required=False)
    comprehensive_exam_date = forms.DateField(widget=DateInput, required=False)
    synopsis_date = forms.DateField(widget=DateInput, required=False)
    synopsis_approval_date = forms.DateField(widget=DateInput, required=False)
    thesis_submission_date = forms.DateField(widget=DateInput, required=False)
    defense_date = forms.DateField(widget=DateInput, required=False)
    degree_awarded_date = forms.DateField(widget=DateInput, required=False)
    fellowship_start_date = forms.DateField(widget=DateInput, required=False)
    fellowship_end_date = forms.DateField(widget=DateInput, required=False)
    
    class Meta:
        model = ResearchScholar
        fields = ['student', 'enrollment_date', 'expected_completion', 'progress_status',
                 'fellowship_type', 'fellowship_amount', 'fellowship_start_date', 
                 'fellowship_end_date', 'coursework_completed', 'coursework_completion_date',
                 'comprehensive_exam_passed', 'comprehensive_exam_date', 
                 'comprehensive_exam_score', 'synopsis_submitted', 'synopsis_date',
                 'synopsis_approved', 'synopsis_approval_date', 'thesis_submitted',
                 'thesis_submission_date', 'thesis_title', 'defense_date', 'defense_result',
                 'degree_awarded_date', 'publications_count', 'patents_count']
        widgets = {
            'thesis_title': forms.TextInput(attrs={'size': 80}),
        }
    
    def clean(self):
        cleaned_data = super().clean()
        enrollment = cleaned_data.get('enrollment_date')
        expected = cleaned_data.get('expected_completion')
        
        if enrollment and expected and enrollment >= expected:
            raise ValidationError("Enrollment date must be before expected completion date")
        
        return cleaned_data


# ==================== TECH TRANSFER FORMS ====================

class TechTransferForm(BaseModelForm):
    """Form for creating and updating Technology Transfer"""
    
    date_entry = forms.DateField(widget=DateInput)
    start_date = forms.DateField(widget=DateInput, required=False)
    end_date = forms.DateField(widget=DateInput, required=False)
    
    class Meta:
        model = TechTransfer
        fields = ['pf_no', 'details', 'date_entry', 'start_date', 'end_date']
        widgets = {
            'details': forms.Textarea(attrs={'rows': 4}),
        }


# ==================== RESEARCH PROJECT FORMS (LEGACY) ====================

class ResearchProjectForm(BaseModelForm):
    """Form for creating and updating Research Projects (Legacy)"""
    
    start_date = forms.DateField(widget=DateInput, required=False)
    finish_date = forms.DateField(widget=DateInput, required=False)
    date_entry = forms.DateField(widget=DateInput)
    date_submission = forms.DateField(widget=DateInput, required=False)
    
    class Meta:
        model = ResearchProject
        fields = ['pf_no', 'ptype', 'pi', 'co_pi', 'title', 'funding_agency',
                 'financial_outlay', 'start_date', 'finish_date', 'date_entry',
                 'date_submission', 'status']
        widgets = {
            'title': forms.Textarea(attrs={'rows': 2}),
            'financial_outlay': forms.Textarea(attrs={'rows': 2}),
        }