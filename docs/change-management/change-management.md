# Change Management

## Overview

Change Management is the central place to review every configuration change made through CxPortal. Use this module to review and approve pending change requests, see changes that are scheduled to execute in the future, and revisit past activity in the audit log — including reverting a change that has already been applied. This gives your team a complete approval workflow and audit trail for changes made across CxPortal modules.

## Who Uses This

- **Business Admins** — Review, approve, or reject change requests; revert changes that were applied in error
- **Operations Teams** — Monitor the audit log, track scheduled changes, and export records for reporting

## Key Concepts

*Change Request* — A change submitted from another CxPortal module that is waiting for review. A request can be approved or rejected, individually or in bulk.

*Audit Log Record* — A record of a change, capturing who requested it, who approved it (if anyone), when it occurred, and the before/after state of the affected configuration.

*Scheduled Change* — An approved change that executes at a future date and time instead of immediately. Scheduled changes can be cancelled before they execute.

*Bulk Change* — A single request or record that groups multiple underlying records (shown with a **Bulk (n)** badge, where *n* is the number of records). Bulk entries can be reviewed as a group or record-by-record.

*Before State / After State* — A side-by-side diff shown when reviewing any change. Added fields are marked **+**, changed fields **~**, and deleted fields **-**, with summary badges such as **+2 added**, **~1 changed**, **-5 deleted**.

*Criticality* — A priority on each change request. Observed values are **Urgent** and **Normal**; urgent requests are listed first.

*Revert* — Rolling back a change that already executed, from its audit log record.

## Prerequisites

Before you begin:
- You must be signed in to CxPortal with access to the **Change Management** module
- An Amazon Connect instance must be selected

> **Warning:** The specific roles or permissions required to view this module, approve requests, or revert changes are not displayed in the portal UI. [To be confirmed with the engineering team before publishing.]

## What You Can Do

- Review and approve or reject change requests → *Reviewing Change Requests*
- Review and cancel scheduled changes → *Managing Scheduled Changes*
- Search and filter the audit log → *Reviewing the Audit Log*
- Revert an executed change → *Reverting a Change*
- Export audit log records → *Exporting Audit Log Records*
- Add a description to any record → *Updating a Record's Description*

## Benefits At a Glance
* **Control** — Only authorized changes go live via approvals
* **Visibility** — View all changes across features in one place
* **Full Audit Trail** — Searchable history of who changed what and when
* **Safe Ops** — Streamline reviews while maintaining accountability

<img width="2000" height="1414" alt="11" src="https://github.com/user-attachments/assets/c552c5e5-406e-4593-bfb6-24346267297f" />


## How it Works

Changes are created in other CxPortal modules (for example DFC entities and items, Proficiency Routing attributes and routing rules, or Bulk Edit agent updates) and flow through Change Management:
1. A change that requires approval appears on the **Change Requests** page with status **Pending**.
1. A reviewer approves or rejects the request. Approved requests change to **Approved**; a bulk request in which some records were rejected shows **Partially Rejected**.
1. A change set to run at a future date appears on the **Scheduled Changes** page until its scheduled date. It can be cancelled from there.
1. Executed changes are recorded on the **Audit Log** page, including changes that did not go through an approval step (these show **-** in the Approver column).
1. An executed change can be reverted from its audit log record.

## Related Modules

- **DFC**, **Proficiency Based Routing**, **Bulk Edit, and Knowledge Management** — changes made in these modules appear in Change Management (see the change types in the Reference section)
- **Centene Framework** — has its own separate **Change Requests** and **Audit Log** pages in the sidebar; those are not part of this module
