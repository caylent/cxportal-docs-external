# Change Management Reference

## Column Reference

### Audit Log

| **Column** | **Description** |
|---|---|
| (Bulk badge) | **Bulk (n)** marks a record that groups *n* underlying records |
| Change Type | The operation performed (see Change Types below) |
| Item | The specific item the change applies to, such as a phone number; **-** when the record has no item. Long values are shortened — hover to see the full value. Sortable; records with no item sort to the end |
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
| Item | The specific item the change applies to, such as a phone number; **-** when the request has no item. Long values are shortened — hover to see the full value. Sortable; requests with no item sort to the end |
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
| Item | The specific item the change applies to, such as a phone number; **-** when the change has no item. Long values are shortened — hover to see the full value. Sortable; changes with no item sort to the end |
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

**Audit Log Record Details**: Change Type, Status, Item, Requester, Requester ID, Creation Date, Scheduled?, Connect Change, Is Bulk Request? (bulk only).

**Change Request Details**: Change Type, Requester, Requester ID, Creation Date, Item, Description, Status, Criticality.

 **Scheduled Change Details**: Change Type, Item, Requester, Requester ID, Creation Date, Scheduled Date, Description.

On a bulk record, Item belongs to each individual record rather than to the bulk record itself, so it appears once you open an individual record with **View Individual Records**. Item shows **-** when the record has no item.
