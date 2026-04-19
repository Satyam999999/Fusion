"""
Migration: data_integrity_fk_set_null
Changes user FK from CASCADE→SET_NULL on SponsoredProject, ConsultancyProject,
TechTransfer, and ResearchProject to prevent orphaned-record wipe on user deletion.
"""

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ("research_procedures", "0006_merge_20260418_0047"),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        # SponsoredProject.user
        migrations.AlterField(
            model_name="sponsoredproject",
            name="user",
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to=settings.AUTH_USER_MODEL,
            ),
        ),
        # ConsultancyProject.user
        migrations.AlterField(
            model_name="consultancyproject",
            name="user",
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to=settings.AUTH_USER_MODEL,
            ),
        ),
        # TechTransfer.user
        migrations.AlterField(
            model_name="techtransfer",
            name="user",
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to=settings.AUTH_USER_MODEL,
            ),
        ),
        # ResearchProject (legacy).user
        migrations.AlterField(
            model_name="researchproject",
            name="user",
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to=settings.AUTH_USER_MODEL,
            ),
        ),
    ]
