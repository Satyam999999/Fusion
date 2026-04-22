from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('globals', '0005_moduleaccess_database'),
    ]

    operations = [
        migrations.AddField(
            model_name='faculty',
            name='is_permanent',
            field=models.BooleanField(default=True),
        ),
    ]