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



## Diff Notation (Before State / After State)

| **Marker** | **Meaning** |
|---|---|
| **+** / green badge (e.g. **+2 added**) | Field or value added |
| **~** / badge (e.g. **~1 changed**) | Field or value changed |
| **-** / badge (e.g. **-5 deleted**) | Field or value deleted |

Nested sections in the diff can be opened with **Expand** and closed with **Collapse**. "No data available" in Before State means the object did not exist before the change (a create); in After State it means the object no longer exists (a delete).

## Record Details Fields

**Audit Log Record Details**: Change Type, Status, Requester, Requester ID, Creation Date, Scheduled?, Connect Change, Is Bulk Request? (bulk only).

**Change Request Details**: Change Type, Requester, Requester ID, Creation Date, Description, Status, Criticality.

 **Scheduled Change Details**: Change Type, Requester, Requester ID, Creation Date, Scheduled Date, Description.
