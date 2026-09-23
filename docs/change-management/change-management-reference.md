# Change Management Reference

## Column Reference

### Audit Log

| **Column** | **Description** |
|---|---|
| (Bulk badge) | **Bulk (n)** marks a record that groups *n* underlying records |
| Change Type | The operation performed (see Change Types below) |
| Target | Name of the item the change was made to; **-** when the record has no target. Hover to copy the value or to see it in full. A **Bulk** badge here marks a record that is one item inside a bulk operation, and opens that bulk change |
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
| Target | Name of the item the request applies to; **-** when the request has no target. A **Bulk** badge here marks a record that is one item inside a bulk request |
| Description | Optional, user-editable note on the request; **-** when empty |
| Requester | Email of the user who submitted the request |
| Criticality | **Urgent** or **Normal**; urgent requests are listed first |
| Date | Date and time the request was created |
| Status | **Pending**, **Approved**, **Rejected**, **Partially Approved**, or **Partially Rejected** |

### Scheduled Changes

| **Column** | **Description** |
|---|---|
| (Bulk badge) | **Bulk (n)** marks a scheduled change covering *n* records |
| Change Type | The operation that will be performed |
| Target | Name of the item the change applies to; **-** when the change has no target. A **Bulk** badge here marks a record that is one item inside a bulk operation |
| Description | Optional, user-editable note; **-** when empty |
| Requester | Email of the user who submitted the change |
| Approver | Email of the approving user; **-** when none |
| Scheduled Date | Date and time the change will execute |

## Filters Panel Reference

Each page has a **Filters** panel with a **Target** field above its multi-select filters. The multi-selects narrow the records already loaded; the **Target** field instead lists the history of the one item you name.

| Page | Multi-select filters | Target date range |
|---|---|---|
| Audit Log | Change type · Requester · Approver · Status | Uses the page's own date range button above the table (default **Last 14 days**) |
| Change Requests | Change type · Requester · Status · Criticality | Its own date range below the **Target** box, **All time** until you apply one |
| Scheduled Changes | Change type · Requester · Approver | Its own date range below the **Target** box, **All time** until you apply one |

Target search behaviour:

- The name must be an exact match; a partial name returns nothing
- Submit with **Enter**; clear with the **X** in the box, which also resets the target date range where the page has one
- On Change Requests and Scheduled Changes the target date range stays disabled until a target is entered (*Enter a target first.*)
- An active target search counts as one filter in the panel's count, is cleared by **Clear Filters**, and is reloaded by **Refresh data**
- Starting a target search, or changing it, clears any row selection

[GAP: what the Target value holds for each change type — for example a DFC entity name, a Proficiency Routing attribute, or an agent's username — Source needed: product owner, or one worked example per change type]

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

Each dialog also labels the record's target as **Target:**.

## Audit Log Export Columns

**Export Record Details** writes the selected records to a CSV with the columns **Change Type**, **Target**, **Description**, **Requester**, **Approver**, **Date**, and **Status**. A bulk record exports as a single summary row, with its record count in the Change Type cell.
