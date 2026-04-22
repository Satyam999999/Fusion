"""
Django REST Framework Serializers for RSPC Module
Provides serialization for all RSPC models with nested relationships
"""

from decimal import Decimal

from rest_framework import serializers
from django.db.models import Sum
from datetime import date
from ..models import (
    ResearchGroup, ResearchArea, FundingAgency, SponsoredProject,
    ProjectExpenditure, ProjectMilestone, ProjectReport,
    ConsultancyProject, Publication, Patent, ResearchScholar,
    TechTransfer, ResearchProject
)
from .validation_utils import add_date_order_error, normalize_flexible_date, parse_date_fields


# ==================== NESTED SERIALIZERS ====================

class ProjectExpenditureSerializer(serializers.ModelSerializer):
    expenditure_head_display = serializers.CharField(source='get_expenditure_head_display', read_only=True)
    status_display = serializers.CharField(source='get_status_display', read_only=True)

    class Meta:
        model = ProjectExpenditure
        fields = ['id', 'project', 'expenditure_head', 'expenditure_head_display', 'amount', 'date', 'last_date',
                 'description', 'voucher_number', 'status', 'status_display', 'approved_by',
                 'approval_date', 'remarks', 'bill_document', 'created_at', 'updated_at']
        read_only_fields = ['created_at', 'updated_at']

    def validate(self, attrs):
        instance = getattr(self, 'instance', None)
        project = attrs.get('project') or (instance.project if instance else None)
        expenditure_date = attrs.get('date') or (instance.date if instance else None)

        if attrs.get('amount') is not None and attrs['amount'] <= 0:
            raise serializers.ValidationError({'amount': 'Expenditure amount must be positive.'})

        if project and project.status in {'COMPLETED', 'TERMINATED', 'REJECTED'}:
            raise serializers.ValidationError({'project': 'Expenditures cannot be added to closed projects.'})

        if project and project.start_date and expenditure_date and expenditure_date < project.start_date:
            raise serializers.ValidationError({'date': 'Expenditure date cannot be earlier than project start date.'})

        last_date_value = attrs.get('last_date')
        if isinstance(last_date_value, str):
            attrs['last_date'] = normalize_flexible_date(last_date_value)
            last_date_value = attrs['last_date']

        if last_date_value and isinstance(last_date_value, date) and last_date_value < date.today():
            raise serializers.ValidationError({'last_date': 'Expenditure last date cannot be in the past.'})

        if project and attrs.get('amount') is not None:
            # BR-010: prevent overdraw beyond sanctioned amount.
            current_total = project.expenditures.exclude(
                pk=instance.pk if instance else None
            ).exclude(status='REJECTED').aggregate(
                total=Sum('amount')
            )['total'] or Decimal('0')
            proposed_total = current_total + attrs['amount']
            if project.sanctioned_amount and proposed_total > project.sanctioned_amount:
                raise serializers.ValidationError({
                    'amount': 'Expenditure exceeds sanctioned project budget.'
                })

            if attrs.get('expenditure_head') == 'MANPOWER':
                current_manpower = project.expenditures.exclude(
                    pk=instance.pk if instance else None
                ).exclude(status='REJECTED').filter(expenditure_head='MANPOWER').aggregate(
                    total=Sum('amount')
                )['total'] or Decimal('0')
                proposed_manpower = current_manpower + attrs['amount']
                manpower_cap = (project.sanctioned_amount or Decimal('0')) * Decimal('0.60')
                if project.sanctioned_amount and proposed_manpower > manpower_cap:
                    raise serializers.ValidationError({
                        'amount': 'Manpower expenditure cannot exceed 60% of sanctioned amount.'
                    })
        return attrs


class ProjectMilestoneSerializer(serializers.ModelSerializer):
    status_display = serializers.CharField(source='get_status_display', read_only=True)
    is_overdue = serializers.BooleanField(read_only=True)

    class Meta:
        model = ProjectMilestone
        fields = ['id', 'project', 'title', 'description', 'due_date', 'completed_date',
                 'status', 'status_display', 'deliverables', 'deliverable_file',
                 'is_overdue', 'created_at', 'updated_at']
        read_only_fields = ['created_at', 'updated_at', 'is_overdue']


class ProjectReportSerializer(serializers.ModelSerializer):
    report_type_display = serializers.CharField(source='get_report_type_display', read_only=True)
    status_display = serializers.CharField(source='get_status_display', read_only=True)

    class Meta:
        model = ProjectReport
        fields = ['id', 'project', 'report_type', 'report_type_display', 'period_from', 'period_to',
                 'summary', 'achievements', 'challenges', 'next_steps', 'status',
                 'status_display', 'submitted_date', 'approved_date', 'comments',
                 'report_file', 'created_at', 'updated_at']
        read_only_fields = ['created_at', 'updated_at']


# ==================== RESEARCH GROUP SERIALIZERS ====================

class ResearchGroupListSerializer(serializers.ModelSerializer):
    class Meta:
        model = ResearchGroup
        fields = ['id', 'name', 'acronym', 'is_active', 'established_date']


class ResearchGroupDetailSerializer(serializers.ModelSerializer):
    discipline_name = serializers.CharField(source='discipline.name', read_only=True)
    head_name = serializers.CharField(source='head.id.user.get_full_name', read_only=True)
    members_count = serializers.SerializerMethodField()

    class Meta:
        model = ResearchGroup
        fields = ['id', 'name', 'acronym', 'discipline', 'discipline_name', 'head', 'head_name',
                 'members', 'faculty_under_group', 'students_under_group', 'description',
                 'website', 'established_date', 'is_active', 'members_count', 'created_at', 'updated_at']
        read_only_fields = ['created_at', 'updated_at']

    def get_members_count(self, obj):
        return obj.members.count()


class ResearchGroupCreateUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = ResearchGroup
        fields = ['name', 'acronym', 'discipline', 'head', 'members',
                 'faculty_under_group', 'students_under_group', 'description',
                 'website', 'established_date', 'is_active']


# ==================== RESEARCH AREA SERIALIZERS ====================

class ResearchAreaSerializer(serializers.ModelSerializer):
    discipline_name = serializers.CharField(source='discipline.name', read_only=True)
    parent_area_name = serializers.CharField(source='parent_area.name', read_only=True)
    faculty_experts_count = serializers.SerializerMethodField()

    class Meta:
        model = ResearchArea
        fields = ['id', 'name', 'parent_area', 'parent_area_name', 'discipline', 'discipline_name',
                 'faculty_experts', 'faculty_experts_count', 'description', 'is_active',
                 'created_at', 'updated_at']
        read_only_fields = ['created_at', 'updated_at']

    def get_faculty_experts_count(self, obj):
        return obj.faculty_experts.count()


# ==================== FUNDING AGENCY SERIALIZERS ====================

class FundingAgencySerializer(serializers.ModelSerializer):
    agency_type_display = serializers.CharField(source='get_agency_type_display', read_only=True)

    class Meta:
        model = FundingAgency
        fields = ['id', 'name', 'acronym', 'agency_type', 'agency_type_display', 'country',
                 'website', 'email', 'phone', 'contact_info', 'is_active', 'created_at', 'updated_at']
        read_only_fields = ['created_at', 'updated_at']


# ==================== SPONSORED PROJECT SERIALIZERS ====================

class SponsoredProjectListSerializer(serializers.ModelSerializer):
    status_display = serializers.CharField(source='get_status_display', read_only=True)
    pi_name = serializers.CharField(source='principal_investigator.id.user.get_full_name', read_only=True)
    budget_utilization = serializers.SerializerMethodField()

    class Meta:
        model = SponsoredProject
        fields = ['id', 'project_number', 'title', 'principal_investigator', 'pi_name',
                 'status', 'status_display', 'start_date', 'original_end_date',
                 'sanctioned_amount', 'budget_utilization', 'created_at']
        read_only_fields = ['created_at']

    def get_budget_utilization(self, obj):
        return f"{obj.budget_utilization_percent:.2f}%"


class SponsoredProjectDetailSerializer(serializers.ModelSerializer):
    status_display = serializers.CharField(source='get_status_display', read_only=True)
    is_active = serializers.BooleanField(read_only=True)
    budget_utilization_percent = serializers.SerializerMethodField()
    expenditures = ProjectExpenditureSerializer(many=True, read_only=True)
    milestones = ProjectMilestoneSerializer(many=True, read_only=True)
    reports = ProjectReportSerializer(many=True, read_only=True)

    class Meta:
        model = SponsoredProject
        fields = ['id', 'title', 'project_number', 'principal_investigator', 'co_principal_investigators',
                 'research_area', 'research_group', 'description', 'funding_agency', 'sanctioned_amount',
                 'utilized_amount', 'currency', 'submission_date', 'sanction_date',
                 'start_date', 'original_end_date', 'extended_end_date', 'actual_end_date', 'duration_months',
                 'status', 'status_display', 'is_active', 'budget_utilization_percent', 'proposal_document',
                 'sanction_letter', 'completion_report', 'notes', 'research_scholars', 'expenditures',
                 'milestones', 'reports', 'created_at', 'updated_at']
        read_only_fields = ['created_at', 'updated_at', 'is_active']

    def get_budget_utilization_percent(self, obj):
        return obj.budget_utilization_percent


class SponsoredProjectCreateUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = SponsoredProject
        fields = ['title', 'project_number', 'principal_investigator', 'co_principal_investigators',
                 'research_area', 'research_group', 'description', 'funding_agency', 'sanctioned_amount',
                 'utilized_amount', 'currency', 'submission_date', 'sanction_date', 'start_date',
                 'original_end_date', 'extended_end_date', 'actual_end_date', 'duration_months', 'status',
                 'proposal_document', 'sanction_letter', 'completion_report', 'notes', 'research_scholars']

    def validate(self, attrs):
        parse_date_fields(attrs, [
            'submission_date',
            'sanction_date',
            'start_date',
            'original_end_date',
            'extended_end_date',
            'actual_end_date',
        ])

        submission_date = attrs.get('submission_date')
        sanction_date = attrs.get('sanction_date')
        start_date = attrs.get('start_date')
        original_end_date = attrs.get('original_end_date')
        extended_end_date = attrs.get('extended_end_date')
        actual_end_date = attrs.get('actual_end_date')
        sanctioned_amount = attrs.get('sanctioned_amount')
        utilized_amount = attrs.get('utilized_amount')
        errors = {}

        if (
            sanctioned_amount is not None
            and utilized_amount is not None
            and utilized_amount > sanctioned_amount
        ):
            errors['utilized_amount'] = 'Utilized amount cannot exceed sanctioned amount.'

        add_date_order_error(
            errors,
            submission_date,
            sanction_date,
            'sanction_date',
            'Sanction date cannot be earlier than submission date.',
        )
        add_date_order_error(
            errors,
            start_date,
            original_end_date,
            'original_end_date',
            'Original end date must be after project start date.',
        )
        add_date_order_error(
            errors,
            original_end_date,
            extended_end_date,
            'extended_end_date',
            'Extended end date must be on or after the original end date.',
        )
        add_date_order_error(
            errors,
            start_date,
            actual_end_date,
            'actual_end_date',
            'Actual end date cannot be earlier than project start date.',
        )

        pi = attrs.get('principal_investigator')
        copi_list = attrs.get('co_principal_investigators', [])
        if pi and pi in copi_list:
            errors['co_principal_investigators'] = 'PI and Co-PI cannot be the same.'

        research_scholars = attrs.get('research_scholars') or []
        if research_scholars:
            scholar_ids = [getattr(scholar, 'pk', scholar) for scholar in research_scholars]
            if len(scholar_ids) != len(set(scholar_ids)):
                errors['research_scholars'] = 'Duplicate research scholars are not allowed.'

        if pi:
            if hasattr(pi, 'is_permanent') and not pi.is_permanent:
                errors['principal_investigator'] = 'Only permanent faculty can be assigned as PI.'

        if errors:
            raise serializers.ValidationError(errors)

        return attrs


# ==================== CONSULTANCY PROJECT SERIALIZERS ====================

class ConsultancyProjectListSerializer(serializers.ModelSerializer):
    status_display = serializers.CharField(source='get_status_display', read_only=True)
    client_type_display = serializers.CharField(source='get_client_type_display', read_only=True)

    class Meta:
        model = ConsultancyProject
        fields = ['id', 'project_number', 'title', 'client_name', 'client_type', 'client_type_display',
                 'status', 'status_display', 'start_date', 'end_date', 'contract_amount', 'created_at']
        read_only_fields = ['created_at']


class ConsultancyProjectDetailSerializer(serializers.ModelSerializer):
    status_display = serializers.CharField(source='get_status_display', read_only=True)
    client_type_display = serializers.CharField(source='get_client_type_display', read_only=True)
    consultant_name = serializers.SerializerMethodField()

    def get_consultant_name(self, obj):
        try:
            return obj.consultant.id.user.get_full_name()
        except Exception:
            return None

    class Meta:
        model = ConsultancyProject
        fields = ['id', 'title', 'project_number', 'consultant', 'consultant_name', 'co_consultants',
                 'client_name', 'client_type', 'client_type_display', 'client_contact', 'client_email',
                 'client_phone', 'description', 'contract_amount', 'faculty_share', 'institute_share',
                 'currency', 'payment_received', 'start_date', 'end_date',
                 'actual_completion_date', 'duration', 'status', 'status_display', 'agreement_document',
                 'completion_certificate', 'remarks', 'notes', 'created_at', 'updated_at']
        read_only_fields = ['created_at', 'updated_at']


class ConsultancyProjectCreateUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = ConsultancyProject
        fields = ['title', 'project_number', 'consultant', 'co_consultants', 'client_name',
                 'client_type', 'client_contact', 'client_email', 'client_phone', 'description',
                 'contract_amount', 'faculty_share', 'institute_share', 'currency', 'payment_received',
                 'start_date', 'end_date', 'actual_completion_date', 'duration', 'status',
                 'agreement_document', 'completion_certificate', 'remarks', 'notes']

    def validate(self, attrs):
        parse_date_fields(attrs, [
            'start_date',
            'end_date',
            'actual_completion_date',
        ])

        contract_amount = attrs.get('contract_amount')
        faculty_share = attrs.get('faculty_share')
        institute_share = attrs.get('institute_share')
        start_date = attrs.get('start_date')
        end_date = attrs.get('end_date')
        actual_completion_date = attrs.get('actual_completion_date')
        payment_received = attrs.get('payment_received')
        errors = {}

        # BR-RSPC-020: Faculty members MUST NOT have more than 2 active consultancy projects.
        consultant = attrs.get('consultant')
        status = attrs.get('status', 'PROPOSED')
        instance_id = self.instance.pk if self.instance else None
        
        if consultant and status in {'PROPOSED', 'SUBMITTED', 'VERIFIED_BY_ADMIN', 'APPROVED', 'ONGOING'}:
            active_count = ConsultancyProject.objects.filter(
                consultant=consultant,
                status__in={'PROPOSED', 'SUBMITTED', 'VERIFIED_BY_ADMIN', 'APPROVED', 'ONGOING'}
            ).exclude(pk=instance_id).count()
            if active_count >= 2:
                errors['consultant'] = 'BR-RSPC-020: Faculty must not have more than 2 active consultancy projects.'

        add_date_order_error(
            errors,
            start_date,
            end_date,
            'end_date',
            'End date must be after start date.',
        )
        add_date_order_error(
            errors,
            start_date,
            actual_completion_date,
            'actual_completion_date',
            'Completion date cannot be earlier than start date.',
        )
        add_date_order_error(
            errors,
            end_date,
            actual_completion_date,
            'actual_completion_date',
            'Completion date cannot be earlier than scheduled end date.',
        )

        if contract_amount is not None and contract_amount <= 0:
            errors['contract_amount'] = 'Contract amount must be positive.'

        if payment_received is not None and payment_received < 0:
            errors['payment_received'] = 'Payment received cannot be negative.'

        if contract_amount is not None and payment_received is not None and payment_received > contract_amount:
            errors['payment_received'] = 'Payment received cannot exceed contract amount.'

        if contract_amount is not None and contract_amount < Decimal('50000'):
            errors['contract_amount'] = 'Minimum consultancy contract amount is 50,000.'

        if contract_amount is not None and institute_share is not None:
            min_institute_share = contract_amount * Decimal('0.30')
            if institute_share < min_institute_share:
                errors['institute_share'] = 'Institute overhead share must be at least 30% of contract amount.'

        if faculty_share is not None and institute_share is not None and contract_amount is not None:
            if (faculty_share + institute_share) > contract_amount:
                errors['faculty_share'] = 'Faculty share + institute share cannot exceed contract amount.'

        if errors:
            raise serializers.ValidationError(errors)

        return attrs


# ==================== PUBLICATION SERIALIZERS ====================

class PublicationSerializer(serializers.ModelSerializer):
    publication_type_display = serializers.CharField(source='get_publication_type_display', read_only=True)
    index_type_display = serializers.CharField(source='get_index_type_display', read_only=True)
    student_authors = serializers.SerializerMethodField()

    def get_student_authors(self, obj):
        try:
            return list(obj.student_authors.values_list('pk', flat=True))
        except Exception:
            # Keep publications endpoint resilient on legacy schemas.
            return []

    class Meta:
        model = Publication
        fields = ['id', 'title', 'abstract', 'keywords', 'publication_type', 'publication_type_display',
                 'faculty_authors', 'student_authors', 'external_authors', 'journal_conference_name',
                 'publisher', 'volume', 'issue', 'pages', 'year', 'month', 'index_type',
                 'index_type_display', 'impact_factor', 'doi', 'issn', 'isbn', 'url',
                 'associated_project', 'is_verified', 'verified_by', 'verification_date',
                 'pdf_file', 'created_at', 'updated_at']
        read_only_fields = ['created_at', 'updated_at']


# ==================== PATENT SERIALIZERS ====================

class PatentSerializer(serializers.ModelSerializer):
    status_display = serializers.CharField(source='get_status_display', read_only=True)
    patent_type_display = serializers.CharField(source='get_patent_type_display', read_only=True)
    student_inventors = serializers.SerializerMethodField()

    def get_student_inventors(self, obj):
        try:
            return list(obj.student_inventors.values_list('pk', flat=True))
        except Exception:
            return []

    class Meta:
        model = Patent
        fields = ['application_id', 'title', 'abstract', 'patent_type', 'patent_type_display',
                 'faculty_inventors', 'student_inventors', 'external_inventors', 'application_number',
                 'filing_date', 'publication_number', 'publication_date', 'grant_number', 'grant_date',
                 'country', 'organization', 'status', 'status_display', 'related_project',
                 'specification_document', 'grant_certificate', 'notes', 'created_at', 'updated_at']
        read_only_fields = ['application_id', 'created_at', 'updated_at']


# ==================== RESEARCH SCHOLAR SERIALIZERS ====================

class ResearchScholarSerializer(serializers.ModelSerializer):
    progress_status_display = serializers.CharField(source='get_progress_status_display', read_only=True)
    fellowship_type_display = serializers.CharField(source='get_fellowship_type_display', read_only=True)
    student_name = serializers.SerializerMethodField()
    years_enrolled = serializers.SerializerMethodField()

    def get_student_name(self, obj):
        try:
            return obj.student.id.user.get_full_name()
        except Exception:
            return None

    class Meta:
        model = ResearchScholar
        fields = ['id', 'student', 'student_name', 'enrollment_date', 'expected_completion',
                 'progress_status', 'progress_status_display', 'fellowship_type', 'fellowship_type_display',
                 'fellowship_amount', 'fellowship_start_date', 'fellowship_end_date', 'coursework_completed',
                 'coursework_completion_date', 'comprehensive_exam_passed', 'comprehensive_exam_date',
                 'comprehensive_exam_score', 'synopsis_submitted', 'synopsis_date', 'synopsis_approved',
                 'synopsis_approval_date', 'thesis_submitted', 'thesis_submission_date', 'thesis_title',
                 'defense_date', 'defense_result', 'degree_awarded_date', 'publications_count',
                 'patents_count', 'years_enrolled', 'created_at', 'updated_at']
        read_only_fields = ['created_at', 'updated_at']

    def get_years_enrolled(self, obj):
        return obj.years_enrolled


# ==================== LEGACY MODEL SERIALIZERS ====================

class TechTransferSerializer(serializers.ModelSerializer):
    class Meta:
        model = TechTransfer
        fields = ['id', 'pf_no', 'details', 'date_entry', 'start_date', 'end_date']


class ResearchProjectSerializer(serializers.ModelSerializer):
    status_display = serializers.CharField(source='get_status_display', read_only=True)

    class Meta:
        model = ResearchProject
        fields = ['id', 'pf_no', 'ptype', 'pi', 'co_pi', 'title',
                 'funding_agency', 'financial_outlay', 'start_date', 'finish_date',
                 'date_entry', 'date_submission', 'status', 'status_display']
