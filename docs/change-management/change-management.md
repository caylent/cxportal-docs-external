# Change Management

## Overview

Change Management is the central place to review every configuration change made through CxPortal. Use this module to review and approve pending change requests, see changes that are scheduled to execute in the future, and revisit past activity in the audit log — including reverting a change that has already been applied. This gives your team a complete approval workflow and audit trail for changes made across CxPortal modules.

## Who Uses This

- **Business Admins** — Review, approve, or reject change requests; revert changes that were applied in error
- **Operations Teams** — Monitor the audit log, track scheduled changes, and export records for reporting

## Key Concepts

| Term                | Definition                                                                                                                                                                              |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Change Request**         |  A change submitted from another CxPortal module that is waiting for review. A request can be approved or rejected, individually or in bulk.                        |
| **Audit Log Record**      |  A record of a change, capturing who requested it, who approved it (if anyone), when it occurred, and the before/after state of the affected configuration.                 |
| **Scheduled Change**    | An approved change that executes at a future date and time instead of immediately. Scheduled changes can be cancelled before they execute. |
| **Bulk Change** |  A single request or record that groups multiple underlying records (shown with a **Bulk (n)** badge, where *n* is the number of records). Bulk entries can be reviewed as a group or record-by-record.|
| **Revert** | Rolling back a change that already executed, from its audit log record. |

***

## Prerequisites

Before you begin:
- You must be signed in to CxPortal with access to the **Change Management** module
- An Amazon Connect instance must be selected


## What You Can Do

- Review and approve or reject change requests → [Review Change Requests](change-management-review-requests.md)
- Review and cancel scheduled changes → [Manage Scheduled Changes](change-management-scheduled-changes.md)
- Search and filter the audit log → [Review the Audit Log](change-management-review-audit-log.md)
- Revert an executed change → [Revert a Change](change-management-reverting-change.md)


## Benefits At a Glance
* **Control** — Only authorized changes go live via approvals
* **Visibility** — View all changes across features in one place
* **Full Audit Trail** — Searchable history of who changed what and when
* **Safe Ops** — Streamline reviews while maintaining accountability

<img width="2000" height="1414" alt="11" src="https://github.com/user-attachments/assets/c552c5e5-406e-4593-bfb6-24346267297f" />


## How it Works

Changes are created in other CxPortal modules (for example DFC entities and items, Proficiency Routing attributes and routing rules, or Bulk Edit agent updates) and flow through Change Management:
1.  A change that requires approval appears on the **Change Requests** page with status **Pending**.
2.  A reviewer approves or rejects the request. Approved requests change to **Approved**; a bulk request in which some records were rejected shows **Partially Rejected**.
3.   A change set to run at a future date appears on the **Scheduled Changes** page until its scheduled date. It can be cancelled from there.
4.   Executed changes are recorded on the **Audit Log** page, including changes that did not go through an approval step (these show **-** in the Approver column).
5.   An executed change can be reverted from its audit log record.

## Related Modules

- **DFC**, **Proficiency Based Routing**, **Bulk Edit, and Knowledge Management** — changes made in these modules appear in Change Management (see the change types in the Reference section)
- **Centene Framework** — has its own separate **Change Requests** and **Audit Log** pages in the sidebar; those are not part of this module
