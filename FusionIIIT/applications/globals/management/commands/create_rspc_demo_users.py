"""
Management command to create 5 RSPC demo users (one per role).
Run with: python manage.py create_rspc_demo_users
"""
from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from django.db import transaction


DEMO_USERS = [
    {
        "username":    "faculty_pi",
        "password":    "Faculty@123",
        "first_name":  "Arjun",
        "last_name":   "Sharma",
        "email":       "faculty_pi@iiitdmj.ac.in",
        "designation": "faculty",
        "label":       "Faculty (PI)",
    },
    {
        "username":    "dept_head",
        "password":    "HoD@123456",
        "first_name":  "Meena",
        "last_name":   "Desai",
        "email":       "dept_head@iiitdmj.ac.in",
        "designation": "hod",
        "label":       "Head of Department",
    },
    {
        "username":    "rspc_admin",
        "password":    "Admin@12345",
        "first_name":  "Rajiv",
        "last_name":   "Verma",
        "email":       "rspc_admin@iiitdmj.ac.in",
        "designation": "rspc_admin",
        "label":       "RSPC Admin",
    },
    {
        "username":    "dean_rspc",
        "password":    "Dean@12345",
        "first_name":  "Priya",
        "last_name":   "Nair",
        "email":       "dean_rspc@iiitdmj.ac.in",
        "designation": "dean_rspc",
        "label":       "Dean RSPC",
    },
    {
        "username":    "director",
        "password":    "Director@1",
        "first_name":  "Suresh",
        "last_name":   "Kulkarni",
        "email":       "director@iiitdmj.ac.in",
        "designation": "director",
        "label":       "Director",
    },
]


class Command(BaseCommand):
    help = "Create 5 RSPC demo users (one per role) for testing"

    def handle(self, *args, **options):
        self.stdout.write(self.style.MIGRATE_HEADING("\n=== Creating RSPC Demo Users ===\n"))

        for cfg in DEMO_USERS:
            try:
                with transaction.atomic():
                    # Create or update Django User
                    user, created = User.objects.update_or_create(
                        username=cfg["username"],
                        defaults={
                            "first_name": cfg["first_name"],
                            "last_name":  cfg["last_name"],
                            "email":      cfg["email"],
                            "is_staff":   False,
                            "is_active":  True,
                        },
                    )
                    user.set_password(cfg["password"])
                    user.save()

                    # Try to create/update ExtraInfo (globals app)
                    try:
                        from applications.globals.models import ExtraInfo, Designation, HoldsDesignation
                        ei, _ = ExtraInfo.objects.update_or_create(
                            user=user,
                            defaults={
                                "id": user.username,
                                "user_type": "faculty" if cfg["designation"] != "hod" else "faculty",
                                "user_status": "PRESENT",
                            },
                        )
                        
                        # Set designation
                        desig_obj, _ = Designation.objects.get_or_create(
                            name=cfg["designation"].lower(),
                            defaults={"full_name": cfg["label"], "type": "academic"}
                        )
                        HoldsDesignation.objects.update_or_create(
                            user=user,
                            designation=desig_obj,
                            defaults={"working": user}
                        )
                    except Exception as ei_err:
                        self.stdout.write(
                            self.style.WARNING(
                                f"  [WARN] Could not set ExtraInfo/Designation for {cfg['username']}: {ei_err}"
                            )
                        )

                    status = "CREATED" if created else "UPDATED"
                    self.stdout.write(
                        self.style.SUCCESS(
                            f"  ✓ [{status}] {cfg['label']:25s} | username: {cfg['username']:15s} | password: {cfg['password']}"
                        )
                    )
            except Exception as e:
                self.stdout.write(
                    self.style.ERROR(f"  ✗ Failed to create {cfg['username']}: {e}")
                )

        self.stdout.write(
            self.style.SUCCESS(
                "\n=== Done! Login at http://localhost:8000/accounts/login/ ===\n"
            )
        )
