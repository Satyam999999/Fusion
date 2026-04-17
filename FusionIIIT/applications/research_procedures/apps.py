"""
Django app configuration for RSPC Module
"""

from django.apps import AppConfig


class ResearchProceduresConfig(AppConfig):
    """Configuration class for the Research Procedures (RSPC) app"""
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'applications.research_procedures'
    verbose_name = 'Research, Sponsored Projects and Consultancy'
