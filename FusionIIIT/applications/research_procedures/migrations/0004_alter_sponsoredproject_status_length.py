from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('research_procedures', '0003_projectexpenditure_last_date_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sponsoredproject',
            name='status',
            field=models.CharField(
                choices=[
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
                ],
                default='PROPOSED',
                max_length=30,
            ),
        ),
    ]
