"""
Management command to seed the RSPC database with realistic demo data.
Run: python manage.py seed_data
"""
from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from django.utils import timezone
from datetime import date, timedelta
import random


class Command(BaseCommand):
    help = 'Seeds the RSPC database with demo data'

    def handle(self, *args, **kwargs):
        self.stdout.write(self.style.NOTICE('🌱 Seeding RSPC demo data...'))

        from applications.globals.models import (
            DepartmentInfo, ExtraInfo, Faculty, Student, Discipline
        )
        from applications.research_procedures.models import (
            FundingAgency, ResearchArea, ResearchGroup,
            SponsoredProject, ProjectExpenditure, ProjectMilestone,
            ConsultancyProject, Publication, Patent, ResearchScholar
        )
        from applications.staff_management.models import (
            StaffRecruitmentPost, StaffApplication, StaffAppointment
        )
        from applications.governance.models import (
            ApprovalRequest, ProgressReportEntry, ProjectClosureRequest,
            RuleDefinition, AutomationRule
        )

        # ── Departments ──────────────────────────────────────────
        depts = []
        for name, abbr in [
            ('Computer Science & Engineering', 'CSE'),
            ('Electronics & Communication', 'ECE'),
            ('Mechanical Engineering', 'ME'),
            ('Civil Engineering', 'CE'),
        ]:
            d, _ = DepartmentInfo.objects.get_or_create(name=name, defaults={'abbreviation': abbr})
            depts.append(d)

        # ── Disciplines ──────────────────────────────────────────
        disc_cs, _ = Discipline.objects.get_or_create(name='Computer Science', defaults={'acronym': 'CS'})
        disc_ee, _ = Discipline.objects.get_or_create(name='Electronics', defaults={'acronym': 'EE'})

        # ── Admin / superuser ────────────────────────────────────
        if not User.objects.filter(username='admin').exists():
            User.objects.create_superuser('admin', 'admin@rspc.edu', 'admin123')
            self.stdout.write('  ✓ Created superuser: admin / admin123')

        # ── Faculty users ────────────────────────────────────────
        faculty_data = [
            ('faculty1', 'Dr. Arun',   'Kumar',  'akumar@rspc.edu'),
            ('faculty2', 'Prof. Bhavna','Sharma', 'bsharma@rspc.edu'),
            ('faculty3', 'Dr. Chetan', 'Patel',  'cpatel@rspc.edu'),
            ('faculty4', 'Dr. Deepa',  'Singh',  'dsingh@rspc.edu'),
        ]
        faculties = []
        for uname, fname, lname, email in faculty_data:
            u, _ = User.objects.get_or_create(username=uname, defaults={
                'first_name': fname, 'last_name': lname, 'email': email,
            })
            if _:
                u.set_password('faculty123')
                u.save()
            ei, _ = ExtraInfo.objects.get_or_create(user=u, defaults={'department': depts[0]})
            fac, _ = Faculty.objects.get_or_create(id=ei, defaults={'department': depts[0]})
            faculties.append(fac)
        self.stdout.write(f'  ✓ {len(faculties)} faculty users ready')

        # ── Research Areas ───────────────────────────────────────
        areas = []
        for aname in ['Artificial Intelligence', 'IoT & Embedded Systems',
                      'Cybersecurity', 'Quantum Computing', 'Biomedical Engineering']:
            a, _ = ResearchArea.objects.get_or_create(
                name=aname, defaults={'discipline': disc_cs, 'is_active': True}
            )
            areas.append(a)

        # ── Funding Agencies ─────────────────────────────────────
        agencies_data = [
            ('Dept. of Science & Technology',            'DST',  'GOVERNMENT'),
            ('Science & Engineering Research Board',     'SERB', 'GOVERNMENT'),
            ('Dept. of Biotechnology',                   'DBT',  'GOVERNMENT'),
            ('Defence R&D Organisation',                 'DRDO', 'GOVERNMENT'),
            ('Council of Scientific & Industrial Research','CSIR','GOVERNMENT'),
            ('Indian Council of Medical Research',       'ICMR', 'GOVERNMENT'),
        ]
        agencies = []
        for name, acr, atype in agencies_data:
            ag, _ = FundingAgency.objects.get_or_create(
                name=name, defaults={'acronym': acr, 'agency_type': atype, 'is_active': True}
            )
            agencies.append(ag)
        self.stdout.write(f'  ✓ {len(agencies)} funding agencies ready')

        # ── Sponsored Projects ───────────────────────────────────
        projects_data = [
            ('AI-based Crop Disease Detection using Deep Learning',        'DST/2024/CS/001',   2500000, 'ONGOING',      faculties[0], agencies[0], areas[0], date(2024,1,15),  date(2027,1,14)),
            ('Quantum Computing Algorithms for Optimization',             'SERB/2022/CS/145',  1800000, 'COMPLETED',    faculties[1], agencies[1], areas[3], date(2022,7,1),   date(2025,6,30)),
            ('Smart Water Management using IoT Sensors',                  'DBT/2024/CS/078',   3200000, 'PROPOSED',     faculties[2], agencies[2], areas[1], date(2024,2,15),  date(2027,2,14)),
            ('ML-based Intrusion Detection System',                       'DRDO/2023/CS/032',  4500000, 'SANCTIONED',   faculties[3], agencies[3], areas[2], date(2023,9,1),   date(2026,8,31)),
            ('CRISPR-based Gene Therapy Research',                        'ICMR/2024/BT/011',  6000000, 'ONGOING',      faculties[0], agencies[5], areas[4], date(2024,3,1),   date(2028,2,28)),
            ('Federated Learning for Privacy-Preserving Health Analytics', 'SERB/2024/CS/201', 2200000, 'ONGOING',      faculties[1], agencies[1], areas[0], date(2024,6,1),   date(2027,5,31)),
            ('5G-enabled Smart Factory Automation using Edge AI',          'DST/2023/EC/089',  3800000, 'SANCTIONED',   faculties[2], agencies[0], areas[1], date(2023,10,1),  date(2026,9,30)),
            ('Natural Language Processing for Hindi Legal Documents',      'CSIR/2024/CS/044', 1500000, 'PROPOSED',     faculties[3], agencies[4], areas[0], date(2024,5,1),   date(2027,4,30)),
            ('Wearable Biosensor for Continuous Glucose Monitoring',       'DBT/2023/BT/055',  5500000, 'ONGOING',      faculties[0], agencies[2], areas[4], date(2023,7,15),  date(2027,7,14)),
            ('Explainable AI for Credit Risk Assessment in Banking',       'DRDO/2024/CS/061', 2900000, 'UNDER_REVIEW', faculties[1], agencies[3], areas[0], date(2024,4,1),   date(2027,3,31)),
            ('Quantum-Safe Cryptography for Government Networks',          'SERB/2023/CS/178', 4100000, 'ONGOING',      faculties[2], agencies[1], areas[3], date(2023,8,1),   date(2026,7,31)),
            ('Autonomous Underwater Vehicle for Ocean Exploration',        'DRDO/2022/ME/033', 7200000, 'COMPLETED',    faculties[3], agencies[3], areas[1], date(2022,4,1),   date(2025,3,31)),
            ('Solar-Powered Desalination using Graphene Membranes',        'DST/2024/ME/092',  3600000, 'PROPOSED',     faculties[0], agencies[0], areas[4], date(2024,7,1),   date(2028,6,30)),
            ('Reinforcement Learning for Power Grid Stability',            'CSIR/2023/CS/067', 2700000, 'EXTENDED',     faculties[1], agencies[4], areas[0], date(2023,3,1),   date(2026,2,28)),
            ('Multi-Modal Brain-Computer Interface for Paralysis',         'ICMR/2023/BT/022', 8500000, 'ONGOING',      faculties[2], agencies[5], areas[4], date(2023,6,1),   date(2028,5,31)),
        ]
        projects = []
        for title, pnum, amount, status, pi, agency, area, sdate, edate in projects_data:
            p, _ = SponsoredProject.objects.get_or_create(
                project_number=pnum,
                defaults={
                    'title': title,
                    'description': f'Research project on {title.lower()}',
                    'principal_investigator': pi,
                    'funding_agency': agency,
                    'research_area': area,
                    'sanctioned_amount': amount,
                    'status': status,
                    'start_date': sdate,
                    'original_end_date': edate,
                }
            )
            projects.append(p)

        # ── Expenditures for first project ───────────────────────
        if projects:
            exp_data = [
                ('EQUIPMENT',  450000, date(2024,3,10), 'GPU Cluster - NVIDIA A100',        'APPROVED'),
                ('MANPOWER',   240000, date(2024,4,1),  'Research Assistant Salary Q1',     'APPROVED'),
                ('TRAVEL',      85000, date(2024,5,20), 'ICML 2024 Conference Travel',      'PENDING'),
                ('CONSUMABLES', 62000, date(2024,6,15), 'Lab chemicals and supplies',       'PENDING'),
                ('OVERHEAD',   125000, date(2024,7,1),  'Institute overhead charges',       'APPROVED'),
            ]
            for head, amt, dt, desc, st in exp_data:
                ProjectExpenditure.objects.get_or_create(
                    project=projects[0], expenditure_head=head, date=dt,
                    defaults={'amount': amt, 'description': desc, 'status': st}
                )

        self.stdout.write(f'  ✓ {len(projects)} sponsored projects + expenditures ready')

        # ── Consultancy Projects ─────────────────────────────────
        cons_data = [
            ('AI-based QC System for Automotive Parts',     'CONS/2024/001', 'TechAuto Pvt. Ltd.',    'INDUSTRY',    850000,  425000, faculties[0], 'ONGOING'),
            ('Effluent Treatment Plant Optimization',       'CONS/2024/002', 'Municipal Corp. Bhopal','GOVERNMENT',  350000,  350000, faculties[1], 'COMPLETED'),
            ('Cybersecurity Framework for Banking',         'CONS/2024/003', 'FinSecure Bank',        'INDUSTRY',   1200000,       0, faculties[2], 'PROPOSED'),
            ('Structural Safety Assessment Heritage Site',  'CONS/2023/011', 'ASI Regional Office',  'GOVERNMENT',  480000,  240000, faculties[3], 'ONGOING'),
        ]
        for title, pnum, client, ctype, amt, recv, cons, status in cons_data:
            ConsultancyProject.objects.get_or_create(
                project_number=pnum,
                defaults={
                    'title': title, 'client_name': client, 'client_type': ctype,
                    'contract_amount': amt, 'payment_received': recv,
                    'consultant': cons, 'status': status,
                    'start_date': date(2024,1,1),
                }
            )
        self.stdout.write('  ✓ 4 consultancy projects ready')

        # ── Publications ─────────────────────────────────────────
        pub_data = [
            ('Deep Learning for Biomedical Image Segmentation',     'JOURNAL',    'IEEE Trans. Medical Imaging',  2024, 'SCI',    True),
            ('Federated Learning in Healthcare Privacy',            'CONFERENCE', 'ICML 2023',                    2023, 'SCOPUS', False),
            ('Blockchain Supply Chain Management',                  'JOURNAL',    'J. Industrial Management',     2023, 'SCIE',   True),
            ('Smart Grid RL Optimization',                          'JOURNAL',    'Energy Systems',               2024, 'SCOPUS', False),
            ('NLP for Regional Indian Languages',                   'CONFERENCE', 'ACL Workshop 2024',            2024, 'SCOPUS', True),
            ('Quantum Error Correction via Topological Codes',      'JOURNAL',    'Physical Review Letters',      2023, 'SCI',    True),
            ('IoT Security in Critical Infrastructure',             'JOURNAL',    'IEEE IoT Journal',             2024, 'SCIE',   False),
        ]
        for title, ptype, journal, year, idx, verified in pub_data:
            Publication.objects.get_or_create(
                title=title,
                defaults={
                    'publication_type': ptype,
                    'journal_conference_name': journal,
                    'year': year,
                    'index_type': idx,
                    'is_verified': verified,
                    'external_authors': 'Kumar A., Sharma B.',
                }
            )
        self.stdout.write('  ✓ 7 publications ready')

        # ── Patents ──────────────────────────────────────────────
        patent_data = [
            ('Novel Algorithm for Real-time Anomaly Detection in Network Traffic', 'IN202341012345', date(2023,3,15),  'GRANTED',           'NATIONAL',      'India', date(2024,8,20)),
            ('IoT-based Smart Irrigation System with Adaptive Control',            'IN202441056789', date(2024,1,10),  'UNDER_EXAMINATION', 'NATIONAL',      'India', None),
            ('Quantum Error Correction Method using Topological Codes',            'US20230012345',  date(2023,6,22),  'FILED',             'INTERNATIONAL', 'USA',   None),
            ('Biodegradable Polymer Composite for Drug Delivery',                  'IN202241098765', date(2022,9,5),   'PUBLISHED',         'NATIONAL',      'India', None),
            ('AI-powered Early Disease Detection Biomarker',                       'IN202441099001', date(2024,4,1),   'FILED',             'NATIONAL',      'India', None),
            ('Deep Learning based Retinal Disease Diagnosis System',               'IN202341023456', date(2023,5,20),  'PUBLISHED',         'NATIONAL',      'India', None),
            ('Secure Multi-party Computation Protocol for Cloud',                  'IN202441078901', date(2024,2,14),  'FILED',             'NATIONAL',      'India', None),
            ('Smart Energy Harvesting using Piezoelectric Nanogenerators',         'IN202341034567', date(2023,8,10),  'UNDER_EXAMINATION', 'NATIONAL',      'India', None),
            ('Blockchain-based Academic Credential Verification System',           'IN202241045678', date(2022,11,3),  'GRANTED',           'NATIONAL',      'India', date(2024,1,15)),
            ('Autonomous Drone Navigation using Reinforcement Learning',           'PCT2024001234',  date(2024,3,22),  'FILED',             'PCT',           'India', None),
        ]
        for title, appno, fdate, status, ptype, country, gdate in patent_data:
            Patent.objects.get_or_create(
                application_number=appno,
                defaults={
                    'title': title, 'filing_date': fdate,
                    'status': status, 'patent_type': ptype,
                    'grant_date': gdate, 'country': country,
                    'external_inventors': 'Dr. A. Kumar, Prof. B. Sharma',
                }
            )
        self.stdout.write(f'  ✓ {len(patent_data)} patents ready')

        # -- Staff Recruitment and Appointments ------------------
        recruitment_posts = [
            ('RSPC-TEACH-2026-001', 'Assistant Professor (AI and Data Science)', depts[0], 'TEACHING', 2, 2, 'Faculty recruitment for AI and Data Science area.', date(2026, 6, 15), 'OPEN'),
            ('RSPC-NT-2026-002', 'Junior Assistant (RSPC Office)', depts[0], 'NON_TEACHING', 1, 1, 'Administrative support for sponsored projects.', date(2026, 5, 20), 'OPEN'),
            ('RSPC-PROJ-2026-003', 'Project Associate-I (IoT Testbed)', depts[1], 'PROJECT', 2, 0, 'Project staff for IoT and embedded systems laboratory.', date(2026, 4, 30), 'CLOSED'),
        ]

        posts = []
        for post_code, title, dept, emp_type, openings, exp_years, desc, deadline, status in recruitment_posts:
            post, _ = StaffRecruitmentPost.objects.get_or_create(
                post_code=post_code,
                defaults={
                    'title': title,
                    'department': dept,
                    'employment_type': emp_type,
                    'openings': openings,
                    'min_experience_years': exp_years,
                    'description': desc,
                    'application_deadline': deadline,
                    'status': status,
                }
            )
            posts.append(post)

        staff_apps = [
            (posts[0], 'APP-2026-1001', 'Ananya Mehta', 'ananya.mehta@example.com', '9876543210', 'PhD in Computer Science', 3, 'Interested in AI and ML research.', 'SHORTLISTED'),
            (posts[0], 'APP-2026-1002', 'Rohit Verma', 'rohit.verma@example.com', '9988776655', 'PhD in Data Science', 2, 'Experience in deep learning and NLP.', 'UNDER_REVIEW'),
            (posts[1], 'APP-2026-2001', 'Neha Sharma', 'neha.sharma@example.com', '9898989898', 'MBA', 4, 'Administrative operations experience.', 'SELECTED'),
        ]

        applications = []
        for post, app_no, name, email, phone, qual, exp_years, cover, status in staff_apps:
            app, _ = StaffApplication.objects.get_or_create(
                application_number=app_no,
                defaults={
                    'post': post,
                    'applicant_name': name,
                    'email': email,
                    'phone': phone,
                    'qualification': qual,
                    'experience_years': exp_years,
                    'cover_letter': cover,
                    'status': status,
                }
            )
            applications.append(app)

        StaffAppointment.objects.get_or_create(
            application=applications[2],
            defaults={
                'appointment_number': 'APT-2026-001',
                'employee_code': 'EMP-RSPC-501',
                'designation': 'Junior Assistant',
                'department': depts[0],
                'joining_date': date(2026, 7, 1),
                'probation_months': 12,
                'pay_level': 'Level-4',
                'notes': 'Initial appointment for RSPC section office.',
            }
        )

        self.stdout.write(f'  ✓ {len(posts)} recruitment posts and {len(applications)} staff applications ready')
        self.stdout.write('  ✓ 1 staff appointment record ready')

        # -- Governance and Automation ---------------------------
        if projects:
            ApprovalRequest.objects.get_or_create(
                module_name='RSPC',
                reference_id=f'PROJECT-{projects[0].id}',
                defaults={
                    'title': f'Approval for {projects[0].project_number}',
                    'description': 'Initial project workflow approval request',
                    'assigned_role': 'SectionHead_RSPC',
                    'status': 'PENDING',
                }
            )

            ProgressReportEntry.objects.get_or_create(
                project=projects[0],
                report_date=date(2026, 3, 15),
                defaults={
                    'percent_complete': 35,
                    'summary': 'Milestone-1 completed and procurement initiated.',
                    'risks': 'Delay in vendor delivery for computing hardware.',
                    'action_items': 'Finalize procurement and schedule pilot testing.',
                }
            )

            ProjectClosureRequest.objects.get_or_create(
                project=projects[1],
                defaults={
                    'closure_reason': 'Project deliverables completed and submitted.',
                    'closure_date': date(2025, 6, 30),
                    'status': 'SUBMITTED',
                }
            )

        completion_rule, _ = RuleDefinition.objects.get_or_create(
            name='Auto Complete when progress >= 100',
            defaults={
                'field_name': 'percent_complete',
                'operator': 'gte',
                'expected_value': '100',
                'is_active': True,
            }
        )

        AutomationRule.objects.get_or_create(
            name='Set project completed automatically',
            defaults={
                'trigger_event': 'progress_report_submitted',
                'rule': completion_rule,
                'action_type': 'UPDATE_PROJECT_STATUS',
                'action_payload': {'status': 'COMPLETED'},
                'is_active': True,
            }
        )

        self.stdout.write('  ✓ governance approvals, progress, closure, and automation rules ready')

        self.stdout.write(self.style.SUCCESS('\n✅ Demo data seeded successfully!'))
        self.stdout.write(self.style.SUCCESS('   Admin login: admin / admin123'))
        self.stdout.write(self.style.SUCCESS('   API root:    http://localhost:8000/'))
        self.stdout.write(self.style.SUCCESS('   API RSPC:    http://localhost:8000/api/rspc/'))