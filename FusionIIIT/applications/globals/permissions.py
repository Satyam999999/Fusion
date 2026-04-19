"""Compatibility permission helpers for modules that import globals.permissions.

RBAC Role Matrix for RSPC Module:
- Faculty (PI)     : Submit/draft/resubmit own proposals, progress reports, expenditure requests
- HoD              : Vet department proposals, view dept projects, update scholar progress
- RSPC Admin       : Verify projects, manage staff/publications/scholars/milestones, approve expenditures ≤50k
- Dean RSPC        : Dean decision on projects, approve expenditures 50k-200k
- Director         : Director decision on projects, approve expenditures >200k
"""

from rest_framework.permissions import BasePermission, SAFE_METHODS


# ── Role name constants ─────────────────────────────────────────────────────
RSPC_ROLE_RSPC_ADMIN = "rspc_admin"
RSPC_ROLE_DEAN_RSPC  = "dean_rspc"
RSPC_ROLE_DIRECTOR   = "director"
RSPC_ROLE_HOD        = "hod"

# Faculty aliases accepted across Fusion
_FACULTY_ALIASES = frozenset([
    "faculty", "assistant professor", "associate professor", "professor",
])

# All privileged roles that can act on RSPC workflows
_ELEVATED_ROLES = frozenset([
    RSPC_ROLE_HOD, RSPC_ROLE_RSPC_ADMIN, RSPC_ROLE_DEAN_RSPC, RSPC_ROLE_DIRECTOR,
])

# All roles allowed to authenticate into the RSPC module (excludes students)
_ALL_RSPC_ROLES = _FACULTY_ALIASES | _ELEVATED_ROLES


# ── Role check helpers ──────────────────────────────────────────────────────
class RoleChecks:
    @staticmethod
    def _user_roles(user):
        roles = set()
        if not user or not user.is_authenticated:
            return roles

        # Try to get role from ExtraInfo user_type
        try:
            if hasattr(user, 'extrainfo') and user.extrainfo.user_type:
                roles.add(user.extrainfo.user_type.strip().lower())
        except Exception:
            pass

        # Also get all designations from HoldsDesignation
        try:
            from applications.globals.models import HoldsDesignation
            desigs = HoldsDesignation.objects.filter(working=user).select_related('designation')
            for d in desigs:
                if d.designation and d.designation.name:
                    roles.add(d.designation.name.strip().lower())
        except Exception:
            pass

        try:
            roles.update(g.name.strip().lower() for g in user.groups.all())
        except Exception:
            pass

        return roles

    @staticmethod
    def has_rspc_role(user, role_name):
        if getattr(user, "is_superuser", False):
            return True
        wanted = str(role_name or "").strip().lower()
        return wanted in RoleChecks._user_roles(user)

    @staticmethod
    def has_any_role(user, role_names):
        if getattr(user, "is_superuser", False):
            return True
        roles  = RoleChecks._user_roles(user)
        wanted = {str(r or "").strip().lower() for r in role_names}
        return bool(roles.intersection(wanted))

    @staticmethod
    def is_faculty(user):
        return RoleChecks.has_any_role(user, _FACULTY_ALIASES)

    @staticmethod
    def is_hod(user):
        return RoleChecks.has_any_role(user, [RSPC_ROLE_HOD, "head"])

    @staticmethod
    def is_rspc_admin(user):
        return RoleChecks.has_rspc_role(user, RSPC_ROLE_RSPC_ADMIN)

    @staticmethod
    def is_dean_rspc(user):
        return RoleChecks.has_rspc_role(user, RSPC_ROLE_DEAN_RSPC)

    @staticmethod
    def is_director(user):
        return RoleChecks.has_rspc_role(user, RSPC_ROLE_DIRECTOR)

    # Legacy alias used in existing code
    @staticmethod
    def is_department_head(user):
        return RoleChecks.is_hod(user)


# ── Permission classes ──────────────────────────────────────────────────────

class IsFacultyCreateOrReadOnly(BasePermission):
    """
    Faculty (PI) may create/update resources they own.
    All RSPC-authorised roles may read.
    Students are denied entirely (their roles won't appear in _ALL_RSPC_ROLES).
    """
    def has_permission(self, request, view):
        user = request.user
        if not (user and user.is_authenticated):
            return False

        if request.method in SAFE_METHODS:
            return RoleChecks.has_any_role(user, _ALL_RSPC_ROLES)

        # Write: Faculty + RSPC Admin (admin can create on behalf)
        return RoleChecks.has_any_role(user, list(_FACULTY_ALIASES) + [RSPC_ROLE_RSPC_ADMIN])


class IsRSPCAdminOrReadOnly(BasePermission):
    """
    RSPC Admin has full write access.
    All authorised roles can read; students cannot.
    """
    def has_permission(self, request, view):
        user = request.user
        if not (user and user.is_authenticated):
            return False

        if request.method in SAFE_METHODS:
            return RoleChecks.has_any_role(user, _ALL_RSPC_ROLES)

        return RoleChecks.is_rspc_admin(user)


class IsDeanFacultyOrAdmin(BasePermission):
    """
    Write access: HoD / RSPC Admin / Dean RSPC / Director.
    Read access: all RSPC-authorised roles including plain Faculty.
    Students are denied.
    """
    def has_permission(self, request, view):
        user = request.user
        if not (user and user.is_authenticated):
            return False

        if request.method in SAFE_METHODS:
            return RoleChecks.has_any_role(user, _ALL_RSPC_ROLES)

        return RoleChecks.has_any_role(user, list(_ELEVATED_ROLES))


# ── Per-role atomic permissions ─────────────────────────────────────────────

class IsFacultyOnly(BasePermission):
    """Only Faculty (PI) may perform the action."""
    def has_permission(self, request, view):
        if not (request.user and request.user.is_authenticated):
            return False
        return RoleChecks.is_faculty(request.user)


class IsHoDOnly(BasePermission):
    """Only Head of Department may perform the action."""
    def has_permission(self, request, view):
        if not (request.user and request.user.is_authenticated):
            return False
        return RoleChecks.is_hod(request.user)


class IsRSPCAdminOnly(BasePermission):
    """Only RSPC Admin may perform the action."""
    def has_permission(self, request, view):
        if not (request.user and request.user.is_authenticated):
            return False
        return RoleChecks.is_rspc_admin(request.user)


class IsDeanRSPCOnly(BasePermission):
    """Only Dean RSPC may perform the action."""
    def has_permission(self, request, view):
        if not (request.user and request.user.is_authenticated):
            return False
        return RoleChecks.is_dean_rspc(request.user)


class IsDirectorOnly(BasePermission):
    """Only Director may perform the action."""
    def has_permission(self, request, view):
        if not (request.user and request.user.is_authenticated):
            return False
        return RoleChecks.is_director(request.user)


class IsFacultyOrAdmin(BasePermission):
    """Faculty (PI) or RSPC Admin. Used for PI-owned actions where admin can override."""
    def has_permission(self, request, view):
        if not (request.user and request.user.is_authenticated):
            return False
        return RoleChecks.is_faculty(request.user) or RoleChecks.is_rspc_admin(request.user)


class IsAdminOrAbove(BasePermission):
    """RSPC Admin, Dean RSPC, or Director — any governance/approval authority."""
    def has_permission(self, request, view):
        if not (request.user and request.user.is_authenticated):
            return False
        return RoleChecks.has_any_role(
            request.user,
            [RSPC_ROLE_RSPC_ADMIN, RSPC_ROLE_DEAN_RSPC, RSPC_ROLE_DIRECTOR],
        )


class IsStudentReadOnly(BasePermission):
    """Authenticated users that don't hold any RSPC role get read-only access.
    All write operations are blocked.
    """
    def has_permission(self, request, view):
        if not (request.user and request.user.is_authenticated):
            return False
        return request.method in SAFE_METHODS
