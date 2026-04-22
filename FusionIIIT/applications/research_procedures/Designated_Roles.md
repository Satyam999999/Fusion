# Module Name: Research, Sponsored Projects & Consultancy (RSPC)

## Designated User Roles & Permissions

### 1. Role Name: Faculty (Principal Investigator)

* **Description:** Research faculty member responsible for initiating and managing research proposals, progress reporting, and fund utilization for their own projects.

* **Permissions:**
    * Create/draft new research proposals and projects
    * Submit and resubmit own proposals for review
    * Edit own project details and descriptions
    * Upload progress reports on research activities
    * Submit expenditure requests for project funds
    * View personal project status and timeline
    * Access project budgets and financial summaries
    * Download project documentation and reports
    * Manage associated research scholars under their supervision
    * View feedback and reviewer comments on submissions
    * Track approval/rejection status of submitted proposals

### 2. Role Name: Head of Department (HoD)

* **Description:** Department leadership responsible for vetting and approving departmental research proposals, monitoring research activities, and managing scholar progress records.

* **Permissions:**
    * View all departmental research proposals and projects
    * Approve/reject departmental proposals at the initial review stage
    * Access comprehensive department research portfolio
    * Monitor and update researcher progress reports
    * Manage scholar progression status and milestones
    * View department-level budget allocations and expenditures
    * Generate department research statistics and analytics
    * Assign resources and scholars to projects
    * Coordinate inter-departmental research initiatives
    * Access audit logs for departmental activities
    * Provide feedback on proposals through review workflow

### 3. Role Name: RSPC Administrator

* **Description:** Dedicated system administrator managing the overall RSPC module operations, staff records, publication catalogs, scholar databases, and milestone tracking.

* **Permissions:**
    * Full CRUD (Create, Read, Update, Delete) operations on all module data
    * Manage system-wide research project registry
    * Verify and validate all submitted projects
    * Manage staff member profiles and assignments
    * Maintain publication and patent database
    * Update scholar records and tracking information
    * Create and modify project milestones
    * Approve expenditure requests up to ₹50,000
    * Manage module access controls and permissions
    * Generate system-wide reports and analytics
    * Access all audit trails and activity logs
    * Create and manage research groups and areas
    * Configure module settings and workflows
    * Bulk import/export research data
    * Manage user designations and roles within RSPC
    * Create backup and archive research records

### 4. Role Name: Dean RSPC

* **Description:** Senior academic leadership responsible for making high-level decisions on research proposals, approving significant financial allocations, and overseeing research strategy.

* **Permissions:**
    * Make final institutional decisions on research projects
    * Approve all submitted proposals (post-departmental vetting)
    * Review and approve expenditure requests between ₹50,000 - ₹200,000
    * Access institute-wide research portfolio and statistics
    * Monitor research performance metrics
    * Approve appointment of research scholars
    * Review and endorse publication records
    * Make policy-level decisions on research initiatives
    * Access Dean-level reporting and analytics dashboards
    * Manage senior research staff assignments
    * Coordinate research infrastructure allocation
    * Grant exceptions and waivers for research processes
    * Approve research group formations and modifications
    * Review and manage research partnerships

### 5. Role Name: Director

* **Description:** Highest institutional authority responsible for strategic research direction, large-scale financial approvals, and oversight of all RSPC operations.

* **Permissions:**
    * Final approval/rejection of all research projects
    * Approve expenditure requests exceeding ₹200,000
    * Strategic oversight of institute research direction
    * Access all system data and comprehensive dashboards
    * Make institutional policy decisions affecting research
    * Approve high-impact research initiatives
    * Grant special approvals and exemptions
    * Review and endorse research partnerships and collaborations
    * Monitor institute research rankings and impact
    * Allocate major research infrastructure and resources
    * Approve research infrastructure investments
    * Access director-level audit and governance reports
    * Final decision authority on all escalated research matters

---

## Role Hierarchy & Escalation Chain

```
Director (Top Authority)
    ↓
Dean RSPC (Strategic Level)
    ↓
RSPC Administrator + HoD (Operational Level)
    ↓
Faculty/PI (Individual Level)
```

### Key Workflow Rules:

1. **Proposal Creation & Submission:**
   - Faculty create proposals
   - HoD reviews and provides departmental feedback
   - RSPC Admin validates technical completeness
   - Dean RSPC makes final institutional decision
   - Director can override for policy reasons

2. **Expenditure Authorization:**
   - Faculty submit requests
   - RSPC Admin approves up to ₹50K
   - Dean RSPC approves ₹50K - ₹200K
   - Director approves above ₹200K

3. **Scholar Management:**
   - Faculty supervise and update scholar progress
   - HoD monitors departmental scholar records
   - RSPC Admin maintains database
   - Dean RSPC approves new scholar appointments

4. **Reporting & Analytics:**
   - Faculty view personal project progress
   - HoD access departmental summaries
   - RSPC Admin manage system reports
   - Dean RSPC and Director access strategic reports

---

## Access Control Implementation

- **Authentication:** Token-based authentication required for all API endpoints
- **Authorization:** Role-based access control (RBAC) enforced via permission classes
- **Module Visibility:** RSPC module accessible only to authenticated users with active RSPC designation
- **Student Access:** Students are denied write access; read-only view available for assigned projects only
- **Superuser Override:** System superusers bypass all role restrictions (development/emergency only)

---

## Data Visibility Rules

| Data Element | Faculty | HoD | RSPC Admin | Dean | Director |
|--------------|---------|-----|-----------|------|----------|
| Own Projects | ✓ RW | ✓ R | ✓ RW | ✓ R | ✓ R |
| Department Projects | ✗ | ✓ RW | ✓ RW | ✓ R | ✓ R |
| All Institute Projects | ✗ | ✗ | ✓ RW | ✓ RW | ✓ RW |
| Scholar Records | ✓ RW* | ✓ RW | ✓ RW | ✓ RW | ✓ RW |
| Expenditures | ✓ RW* | ✓ R | ✓ RW | ✓ RW | ✓ RW |
| Audit Logs | ✗ | ✗ | ✓ R | ✓ R | ✓ R |
| System Configuration | ✗ | ✗ | ✓ RW | ✓ R | ✓ RW |

*Note: RW = Read/Write, R = Read-only. Faculty can only edit their own records and assigned scholars.*

---

## Permission Classes Used

- `IsFacultyCreateOrReadOnly` - Faculty may create; all RSPC roles may read
- `IsRSPCAdminOrReadOnly` - Admin has full access; authorized roles can read
- `IsDeanFacultyOrAdmin` - Elevated roles can write; all RSPC roles can read
- `IsFacultyOnly` - Restricted to Faculty Principal Investigators only
- `IsHoDOnly` - Restricted to Head of Department only
- `IsRSPCAdminOnly` - Restricted to RSPC Administrator only
- `IsDeanRSPCOnly` - Restricted to Dean RSPC only
- `IsDirectorOnly` - Restricted to Director only
- `IsFacultyOrAdmin` - Faculty or RSPC Admin (with admin override capability)
- `IsAdminOrAbove` - RSPC Admin, Dean RSPC, or Director
- `IsStudentReadOnly` - Authenticated non-RSPC users get read-only access

---

## Notes & Special Cases

1. **Superuser Privileges:** Superusers (Django admins) bypass all RBAC checks
2. **Role Aliases:** Faculty roles include "Assistant Professor", "Associate Professor", "Professor"
3. **Multiple Designations:** Users can hold multiple roles simultaneously; effective permissions are the union of all assigned roles
4. **Legacy Support:** System maintains backward compatibility with older role naming conventions
5. **Module Visibility:** RSPC module visibility is controlled via `ModuleAccess` model linked to user designations
6. **Date-based Access:** Some roles may be time-limited based on active employment dates

---

## Revision History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-04-21 | Initial comprehensive role documentation for RSPC module |
