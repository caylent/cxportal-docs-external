# Change Management Reference

## Column Reference

### Audit Log

| **Column** | **Description** |
|---|---|
| (Bulk badge) | **Bulk (n)** marks a record that groups *n* underlying records |
| Change Type | The operation performed (see Change Types below) |
| Description | Optional, user-editable note on the record; **-** when empty |
| Requester | Email of the user who made or requested the change |
| Approver | Email of the approving user; **-** when the change had no approver |
| Date | Date and time of the record (e.g. 07/27/2026, 05:23:44) |
| Status | **Original**, **Pending**, **Reversion**, or **Reverted** |

### Change Requests

| **Column** | **Description** |
|---|---|
| (Bulk badge) | **Bulk (n)** marks a request covering *n* records |
| Change Type | The operation requested |
| Description | Optional, user-editable note on the request; **-** when empty |
| Requester | Email of the user who submitted the request |
| Criticality | **Urgent** or **Normal**; urgent requests are listed first |
| Date | Date and time the request was created |
| Status | Observed values: **Pending**, **Approved**, **Partially Rejected** |

### Scheduled Changes

| **Column** | **Description** |
|---|---|
| (Bulk badge) | **Bulk (n)** marks a scheduled change covering *n* records |
| Change Type | The operation that will be performed |
| Description | Optional, user-editable note; **-** when empty |
| Requester | Email of the user who submitted the change |
| Approver | Email of the approving user; **-** when none |
| Scheduled Date | Date and time the change will execute |

## Status Definitions

Audit Log statuses (from the Status filter): **Original**, **Pending**, **Reversion**, **Reverted**.

Change Request statuses observed in the QA environment: **Pending** (awaiting review), **Approved** (accepted by a reviewer), **Partially Rejected** (a bulk request in which some records were rejected).

> **Note:** Full definitions and transitions for each status value are not documented in the UI. [To be confirmed with the engineering team.]

## Change Types

The following change types appear in the Audit Log's **Change type** filter for the QA instance:

Bulk Add Tags · Bulk Delete Items · Bulk Remove Tags · Bulk Update Agent ACW Time Limit · Bulk Update Agent Auto Accept Calls · Bulk Update Agent Routing Profiles · Bulk Update Items · Create Entity · Create Item · Create Sub-Entity · Create Value · Delete Entity · Delete Item · Delete Sub-Entity · Generate AI Summary · Import · Update Entity · Update Item · Update Routing Rule · Update Sub-Entity

Additional change types observed on the Change Requests page: Update Agent Assignments · Delete Predefined Attribute · Update Predefined Attribute · Create Predefined Attribute · Update Value.

> **Note:** The filter list is built from activity in the selected instance and date range, so it may not be the complete set of possible change types.

## Diff Notation (Before State / After State)

| **Marker** | **Meaning** |
|---|---|
| **+** / green badge (e.g. **+2 added**) | Field or value added |
| **~** / badge (e.g. **~1 changed**) | Field or value changed |
| **-** / badge (e.g. **-5 deleted**) | Field or value deleted |

Nested sections in the diff can be opened with **Expand** and closed with **Collapse**. "No data available" in Before State means the object did not exist before the change (a create); in After State it means the object no longer exists (a delete).

## Record Details Fields

Shown in the **Audit Log Record Details** dialog: Change Type, Status, Requester, Requester ID, Creation Date, Scheduled?, Connect Change, Is Bulk Request? (bulk only).

Shown in the **Change Request Details** dialog: Change Type, Requester, Requester ID, Creation Date, Description, Status, Criticality.

Shown in the **Scheduled Change Details** dialog: Change Type, Requester, Requester ID, Creation Date, Scheduled Date, Description.
