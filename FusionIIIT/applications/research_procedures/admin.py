"""
Django Admin Configuration for RSPC Module
Defines admin interfaces for all RSPC models
"""

from django.contrib import admin
from django.utils.html import format_html
from django.db.models import Sum
from .models import (
    ResearchGroup, ResearchArea, FundingAgency, SponsoredProject,
    ProjectExpenditure, ProjectMilestone, ProjectReport,
    ConsultancyProject, Publication, Patent, ResearchScholar,
    TechTransfer, ResearchProject
)


# ==================== INLINE ADMINS ====================

class ProjectExpenditureInline(admin.TabularInline):
    """Inline admin for Project Expenditures"""
    model = ProjectExpenditure
    extra = 1
    fields = ['expenditure_head', 'amount', 'date', 'status']
    readonly_fields = ['created_at']


class ProjectMilestoneInline(admin.TabularInline):
    """Inline admin for Project Milestones"""
    model = ProjectMilestone
    extra = 1
    fields = ['title', 'due_date', 'status', 'completed_date']


class ProjectReportInline(admin.TabularInline):
    """Inline admin for Project Reports"""
    model = ProjectReport
    extra = 1
    fields = ['report_type', 'period_from', 'period_to', 'status']


# ==================== RESEARCH GROUP ADMIN ====================

@admin.register(ResearchGroup)
class ResearchGroupAdmin(admin.ModelAdmin):
    """Admin interface for Research Groups"""
    
    list_display = ('name', 'acronym', 'head', 'is_active', 'established_date')
    list_filter = ('is_active', 'established_date', 'discipline')
    search_fields = ('name', 'acronym', 'description')
    readonly_fields = ('created_at', 'updated_at')
    filter_horizontal = ('members', 'faculty_under_group', 'students_under_group')
    
    fieldsets = (
        ('Basic Information', {
            'fields': ('name', 'acronym', 'discipline', 'description')
        }),
        ('Administration', {
            'fields': ('head', 'members', 'faculty_under_group', 'students_under_group', 'website')
        }),
        ('Dates', {
            'fields': ('established_date', 'is_active')
        }),
        ('System Information', {
            'fields': ('created_at', 'updated_at'),
            'classes': ('collapse',)
        }),
    )


# ==================== RESEARCH AREA ADMIN ====================

@admin.register(ResearchArea)
class ResearchAreaAdmin(admin.ModelAdmin):
    """Admin interface for Research Areas"""
    
    list_display = ('name', 'discipline', 'parent_area', 'is_active')
    list_filter = ('is_active', 'discipline', 'parent_area')
    search_fields = ('name', 'description')
    readonly_fields = ('created_at', 'updated_at')
    filter_horizontal = ('faculty_experts',)
    
    fieldsets = (
        ('Basic Information', {
            'fields': ('name', 'description', 'parent_area', 'discipline')
        }),
        ('Experts', {
            'fields': ('faculty_experts',)
        }),
        ('Status', {
            'fields': ('is_active',)
        }),
        ('System Information', {
            'fields': ('created_at', 'updated_at'),
            'classes': ('collapse',)
        }),
    )


# ==================== FUNDING AGENCY ADMIN ====================

@admin.register(FundingAgency)
class FundingAgencyAdmin(admin.ModelAdmin):
    """Admin interface for Funding Agencies"""
    
    list_display = ('name', 'acronym', 'agency_type', 'country', 'is_active')
    list_filter = ('agency_type', 'country', 'is_active')
    search_fields = ('name', 'acronym', 'contact_info')
    readonly_fields = ('created_at', 'updated_at')
    
    fieldsets = (
        ('Basic Information', {
            'fields': ('name', 'acronym', 'agency_type', 'country')
        }),
        ('Contact Information', {
            'fields': ('website', 'email', 'phone', 'contact_info')
        }),
        ('Status', {
            'fields': ('is_active',)
        }),
        ('System Information', {
            'fields': ('created_at', 'updated_at'),
            'classes': ('collapse',)
        }),
    )


# ==================== SPONSORED PROJECT ADMIN ====================

@admin.register(SponsoredProject)
class SponsoredProjectAdmin(admin.ModelAdmin):
    """Admin interface for Sponsored Projects"""
    
    list_display = ('project_number', 'title_short', 'principal_investigator', 'status_badge', 'budget_utilization')
    list_filter = ('status', 'funding_agency', 'start_date', 'research_area')
    search_fields = ('project_number', 'title', 'principal_investigator__id__user__first_name')
    readonly_fields = ('created_at', 'updated_at', 'utilization_percentage')
    filter_horizontal = ('co_principal_investigators', 'research_scholars')
    inlines = [ProjectExpenditureInline, ProjectMilestoneInline, ProjectReportInline]
    
    fieldsets = (
        ('Basic Information', {
            'fields': ('title', 'project_number', 'description', 'research_area', 'research_group')
        }),
        ('Team', {
            'fields': ('principal_investigator', 'co_principal_investigators', 'research_scholars')
        }),
        ('Funding', {
            'fields': ('funding_agency', 'sanctioned_amount', 'utilized_amount', 'currency')
        }),
        ('Timeline', {
            'fields': ('submission_date', 'sanction_date', 'start_date', 'original_end_date', 
                      'extended_end_date', 'actual_end_date', 'duration_months')
        }),
        ('Status & Documents', {
            'fields': ('status', 'proposal_document', 'sanction_letter', 'completion_report')
        }),
        ('Additional Information', {
            'fields': ('notes', 'pf_no', 'ptype', 'pi', 'co_pi'),
            'classes': ('collapse',)
        }),
        ('System Information', {
            'fields': ('created_at', 'updated_at', 'user'),
            'classes': ('collapse',)
        }),
    )

    def title_short(self, obj):
        return obj.title[:50] + '...' if len(obj.title) > 50 else obj.title
    title_short.short_description = 'Title'

    def status_badge(self, obj):
        colors = {
            'PROPOSED': 'orange',
            'SUBMITTED': 'blue',
            'APPROVED': 'green',
            'ONGOING': 'darkgreen',
            'COMPLETED': 'gray',
            'REJECTED': 'red'
        }
        color = colors.get(obj.status, 'gray')
        return format_html(
            '<span style="background-color: {}; color: white; padding: 3px 10px; border-radius: 3px;">{}</span>',
            color,
            obj.get_status_display()
        )
    status_badge.short_description = 'Status'

    def budget_utilization(self, obj):
        percentage = obj.budget_utilization_percent
        return format_html(
            '<span>{:.1f}%</span>',
            percentage
        )
    budget_utilization.short_description = 'Utilization'

    def utilization_percentage(self, obj):
        return f"{obj.budget_utilization_percent}%"
    utilization_percentage.short_description = 'Budget Utilization'


# ==================== PROJECT EXPENDITURE ADMIN ====================

@admin.register(ProjectExpenditure)
class ProjectExpenditureAdmin(admin.ModelAdmin):
    """Admin interface for Project Expenditures"""
    
    list_display = ('project', 'expenditure_head', 'amount', 'date', 'status')
    list_filter = ('status', 'expenditure_head', 'date', 'project')
    search_fields = ('project__project_number', 'description', 'voucher_number')
    readonly_fields = ('created_at', 'updated_at')
    date_hierarchy = 'date'
    
    fieldsets = (
        ('Project & Head', {
            'fields': ('project', 'expenditure_head')
        }),
        ('Details', {
            'fields': ('description', 'amount', 'date', 'voucher_number')
        }),
        ('Approval', {
            'fields': ('status', 'approved_by', 'approval_date', 'remarks')
        }),
        ('Documents', {
            'fields': ('bill_document',)
        }),
        ('System Information', {
            'fields': ('created_at', 'updated_at'),
            'classes': ('collapse',)
        }),
    )


# ==================== PROJECT MILESTONE ADMIN ====================

@admin.register(ProjectMilestone)
class ProjectMilestoneAdmin(admin.ModelAdmin):
    """Admin interface for Project Milestones"""
    
    list_display = ('project', 'title', 'due_date', 'status', 'is_overdue_indicator')
    list_filter = ('status', 'due_date', 'project')
    search_fields = ('project__project_number', 'title', 'description')
    readonly_fields = ('created_at', 'updated_at')
    date_hierarchy = 'due_date'
    
    fieldsets = (
        ('Project & Title', {
            'fields': ('project', 'title')
        }),
        ('Details', {
            'fields': ('description', 'due_date', 'completed_date', 'status')
        }),
        ('Deliverables', {
            'fields': ('deliverables', 'deliverable_file')
        }),
        ('System Information', {
            'fields': ('created_at', 'updated_at'),
            'classes': ('collapse',)
        }),
    )

    def is_overdue_indicator(self, obj):
        if obj.is_overdue:
            return format_html(
                '<span style="background-color: red; color: white; padding: 3px 8px; border-radius: 3px;">OVERDUE</span>'
            )
        return '✓'
    is_overdue_indicator.short_description = 'Overdue'


# ==================== PROJECT REPORT ADMIN ====================

@admin.register(ProjectReport)
class ProjectReportAdmin(admin.ModelAdmin):
    """Admin interface for Project Reports"""
    
    list_display = ('project', 'report_type', 'period_from', 'period_to', 'status')
    list_filter = ('status', 'report_type', 'period_from', 'project')
    search_fields = ('project__project_number', 'summary')
    readonly_fields = ('created_at', 'updated_at')
    date_hierarchy = 'period_from'
    
    fieldsets = (
        ('Project & Type', {
            'fields': ('project', 'report_type')
        }),
        ('Period', {
            'fields': ('period_from', 'period_to')
        }),
        ('Report Content', {
            'fields': ('summary', 'achievements', 'challenges', 'next_steps')
        }),
        ('Status & Approval', {
            'fields': ('status', 'submitted_date', 'approved_date', 'comments')
        }),
        ('Document', {
            'fields': ('report_file',)
        }),
        ('System Information', {
            'fields': ('created_at', 'updated_at'),
            'classes': ('collapse',)
        }),
    )


# ==================== CONSULTANCY PROJECT ADMIN ====================

@admin.register(ConsultancyProject)
class ConsultancyProjectAdmin(admin.ModelAdmin):
    """Admin interface for Consultancy Projects"""
    
    list_display = ('project_number', 'title_short', 'consultant', 'status_badge', 'contract_amount')
    list_filter = ('status', 'client_type', 'start_date')
    search_fields = ('project_number', 'title', 'client_name', 'consultant__id__user__first_name')
    readonly_fields = ('created_at', 'updated_at')
    filter_horizontal = ('co_consultants',)
    
    fieldsets = (
        ('Basic Information', {
            'fields': ('title', 'project_number', 'description')
        }),
        ('Client', {
            'fields': ('client_name', 'client_type', 'client_contact', 'client_email', 'client_phone')
        }),
        ('Team', {
            'fields': ('consultant', 'co_consultants')
        }),
        ('Financial', {
            'fields': ('contract_amount', 'faculty_share', 'institute_share', 'currency', 'payment_received')
        }),
        ('Timeline', {
            'fields': ('start_date', 'end_date', 'actual_completion_date', 'duration')
        }),
        ('Status & Documents', {
            'fields': ('status', 'agreement_document', 'completion_certificate')
        }),
        ('Additional', {
            'fields': ('remarks', 'notes', 'pf_no'),
            'classes': ('collapse',)
        }),
        ('System Information', {
            'fields': ('created_at', 'updated_at', 'user'),
            'classes': ('collapse',)
        }),
    )

    def title_short(self, obj):
        return obj.title[:50] + '...' if len(obj.title) > 50 else obj.title
    title_short.short_description = 'Title'

    def status_badge(self, obj):
        colors = {
            'PROPOSED': 'orange',
            'NEGOTIATION': 'blue',
            'APPROVED': 'green',
            'ONGOING': 'darkgreen',
            'COMPLETED': 'gray',
            'CANCELLED': 'red'
        }
        color = colors.get(obj.status, 'gray')
        return format_html(
            '<span style="background-color: {}; color: white; padding: 3px 10px; border-radius: 3px;">{}</span>',
            color,
            obj.get_status_display()
        )
    status_badge.short_description = 'Status'


# ==================== PUBLICATION ADMIN ====================

@admin.register(Publication)
class PublicationAdmin(admin.ModelAdmin):
    """Admin interface for Publications"""
    
    list_display = ('title_short', 'publication_type', 'year', 'index_type', 'is_verified')
    list_filter = ('publication_type', 'index_type', 'year', 'is_verified')
    search_fields = ('title', 'journal_conference_name', 'doi')
    readonly_fields = ('created_at', 'updated_at')
    filter_horizontal = ('faculty_authors', 'student_authors')
    
    fieldsets = (
        ('Basic Information', {
            'fields': ('title', 'publication_type', 'abstract', 'keywords')
        }),
        ('Authors', {
            'fields': ('faculty_authors', 'student_authors', 'external_authors')
        }),
        ('Publication Details', {
            'fields': ('journal_conference_name', 'publisher', 'volume', 'issue', 'pages', 'year', 'month')
        }),
        ('Indexing', {
            'fields': ('index_type', 'impact_factor')
        }),
        ('Identifiers', {
            'fields': ('doi', 'issn', 'isbn', 'url')
        }),
        ('Associated Project', {
            'fields': ('associated_project',)
        }),
        ('Verification', {
            'fields': ('is_verified', 'verified_by', 'verification_date')
        }),
        ('Documents', {
            'fields': ('pdf_file',)
        }),
        ('System Information', {
            'fields': ('created_at', 'updated_at'),
            'classes': ('collapse',)
        }),
    )

    def title_short(self, obj):
        return obj.title[:60] + '...' if len(obj.title) > 60 else obj.title
    title_short.short_description = 'Title'


# ==================== PATENT ADMIN ====================

@admin.register(Patent)
class PatentAdmin(admin.ModelAdmin):
    """Admin interface for Patents"""
    
    list_display = ('title_short', 'patent_type', 'status_badge', 'filing_date', 'grant_date')
    list_filter = ('status', 'patent_type', 'country', 'filing_date')
    search_fields = ('title', 'application_number', 'grant_number', 'abstract')
    readonly_fields = ('created_at', 'updated_at')
    filter_horizontal = ('faculty_inventors', 'student_inventors')
    
    fieldsets = (
        ('Basic Information', {
            'fields': ('title', 'abstract', 'patent_type')
        }),
        ('Inventors', {
            'fields': ('faculty_inventors', 'student_inventors', 'external_inventors')
        }),
        ('Filing Details', {
            'fields': ('application_number', 'filing_date', 'publication_number', 'publication_date')
        }),
        ('Grant Details', {
            'fields': ('grant_number', 'grant_date', 'country', 'organization')
        }),
        ('Status', {
            'fields': ('status',)
        }),
        ('Related Project', {
            'fields': ('related_project',)
        }),
        ('Documents', {
            'fields': ('specification_document', 'grant_certificate')
        }),
        ('Legacy Fields', {
            'fields': ('faculty_id', 'ipd_form', 'project_details', 'ipd_form_file', 'project_details_file'),
            'classes': ('collapse',)
        }),
        ('Additional', {
            'fields': ('notes',)
        }),
        ('System Information', {
            'fields': ('created_at', 'updated_at'),
            'classes': ('collapse',)
        }),
    )

    def title_short(self, obj):
        return obj.title[:60] + '...' if len(obj.title) > 60 else obj.title
    title_short.short_description = 'Title'

    def status_badge(self, obj):
        colors = {
            'DRAFT': 'gray',
            'FILED': 'blue',
            'PUBLISHED': 'lightblue',
            'UNDER_EXAMINATION': 'orange',
            'GRANTED': 'green',
            'REJECTED': 'red',
            'LAPSED': 'darkred'
        }
        color = colors.get(obj.status, 'gray')
        return format_html(
            '<span style="background-color: {}; color: white; padding: 3px 10px; border-radius: 3px;">{}</span>',
            color,
            obj.get_status_display()
        )
    status_badge.short_description = 'Status'


# ==================== RESEARCH SCHOLAR ADMIN ====================

@admin.register(ResearchScholar)
class ResearchScholarAdmin(admin.ModelAdmin):
    """Admin interface for Research Scholars"""
    
    list_display = ('student', 'progress_status', 'enrollment_date', 'fellowship_type', 'years_enrolled_display')
    list_filter = ('progress_status', 'fellowship_type', 'enrollment_date')
    search_fields = ('student__id__user__first_name', 'thesis_title')
    readonly_fields = ('created_at', 'updated_at', 'years_enrolled_display')
    date_hierarchy = 'enrollment_date'
    
    fieldsets = (
        ('Student', {
            'fields': ('student',)
        }),
        ('Enrollment', {
            'fields': ('enrollment_date', 'expected_completion', 'years_enrolled_display')
        }),
        ('Fellowship', {
            'fields': ('fellowship_type', 'fellowship_amount', 'fellowship_start_date', 'fellowship_end_date')
        }),
        ('Progress', {
            'fields': ('progress_status', 'coursework_completed', 'coursework_completion_date')
        }),
        ('Comprehensive Exam', {
            'fields': ('comprehensive_exam_passed', 'comprehensive_exam_date', 'comprehensive_exam_score')
        }),
        ('Synopsis', {
            'fields': ('synopsis_submitted', 'synopsis_date', 'synopsis_approved', 'synopsis_approval_date')
        }),
        ('Thesis & Defense', {
            'fields': ('thesis_submitted', 'thesis_submission_date', 'thesis_title', 'defense_date', 'defense_result')
        }),
        ('Completion', {
            'fields': ('degree_awarded_date', 'publications_count', 'patents_count')
        }),
        ('System Information', {
            'fields': ('created_at', 'updated_at'),
            'classes': ('collapse',)
        }),
    )

    def years_enrolled_display(self, obj):
        return f"{obj.years_enrolled:.1f} years"
    years_enrolled_display.short_description = 'Years Enrolled'


# ==================== TECH TRANSFER ADMIN ====================

@admin.register(TechTransfer)
class TechTransferAdmin(admin.ModelAdmin):
    """Admin interface for Technology Transfer"""
    
    list_display = ('pf_no', 'details', 'start_date', 'end_date')
    list_filter = ('date_entry', 'start_date', 'end_date')
    search_fields = ('pf_no', 'details')
    date_hierarchy = 'date_entry'
    
    fieldsets = (
        ('Basic Information', {
            'fields': ('pf_no', 'details')
        }),
        ('Timeline', {
            'fields': ('date_entry', 'start_date', 'end_date')
        }),
        ('User', {
            'fields': ('user',)
        }),
    )


# ==================== RESEARCH PROJECT ADMIN (LEGACY) ====================

@admin.register(ResearchProject)
class ResearchProjectAdmin(admin.ModelAdmin):
    """Admin interface for Research Projects (Legacy)"""
    
    list_display = ('pf_no', 'pi', 'title_short', 'status', 'start_date')
    list_filter = ('status', 'start_date', 'finish_date')
    search_fields = ('pf_no', 'pi', 'title', 'funding_agency')
    date_hierarchy = 'date_entry'
    
    fieldsets = (
        ('Basic Information', {
            'fields': ('pf_no', 'ptype', 'title', 'user')
        }),
        ('Investigators', {
            'fields': ('pi', 'co_pi')
        }),
        ('Funding', {
            'fields': ('funding_agency', 'financial_outlay')
        }),
        ('Timeline', {
            'fields': ('start_date', 'finish_date', 'date_submission', 'date_entry')
        }),
        ('Status', {
            'fields': ('status',)
        }),
    )

    def title_short(self, obj):
        return obj.title[:50] + '...' if len(obj.title) > 50 else obj.title
    title_short.short_description = 'Title'


# Customize admin site
admin.site.site_header = "RSPC Module Administration"
admin.site.site_title = "RSPC Admin"
admin.site.index_title = "Welcome to RSPC Module Administration"