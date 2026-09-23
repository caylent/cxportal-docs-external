# Reviewing Change Requests

The **Change Requests** page lists submitted requests and their current status. The heading shows the total count. Urgent requests are listed before normal ones.

Columns: a selection checkbox, a **Bulk (n)** badge for bulk requests, **Change Type**, **Target**, **Description**, **Requester**, **Criticality**, **Date**, **Status**, and a row actions menu. **Target** names the item the request applies to; hover it to copy it or to see the full value.

## Filtering and Searching

1. Use the **Filters** panel on the left to narrow the list:
    - **Target** — the exact name of one item, to list that item's requests (see [Searching a Target's History](#searching-a-targets-history))
    - **Change type** — the operation requested
    - **Requester** — the user who submitted the request
    - **Status** — the request's current status
    - **Criticality** — **Urgent** or **Normal**

    **Change type**, **Requester**, **Status**, and **Criticality** are searchable multi-selects, and each lists only the values present in the loaded requests. Selecting several values in one filter matches any of them; selections in different filters must all match.
2. Type in the **Search by keyword...** box above the table to filter the requests currently in the table.
3. Click **Clear Filters** to remove all filter selections and the target search, or **Hide filters** to collapse the panel.

[SCREENSHOT: the Change Requests Filters panel, which is new on this page — Target, Change type, Requester, Status, and Criticality]

### Searching a Target's History

The **Target** field in the Filters panel lists every request for one item, rather than filtering the requests already in the table.

1. In the **Filters** panel, type the item's name in the **Target** box.
2. Press **Enter**. The table lists the requests recorded for that target.
3. (Optional) Use the date range button below the **Target** box to limit the results to a period. It reads **All time** until you apply a range, and stays disabled until you have entered a target — hovering it beforehand shows *Enter a target first.*
4. Click the **X** in the **Target** box to clear both the search and its date range.

The target search counts as one active filter, and **Refresh data** reloads its results.

!!! info ""
    The target must be an exact match. When nothing matches, the table shows *No change requests found* with the hint *Target must be an exact match.*


## Reviewing a Single Request

1. In the left sidebar, click **Change Management** > **Change Requests**.
2. Click the row menu (**Open menu**) on the request, then click **Review change**.
3. The **Change Request Details** dialog shows **Change Type**, **Requester**, **Requester ID**, **Creation Date**, **Description**, **Status**, **Criticality**, and the **Before State** / **After State** diff.
4. Click **Approve** to accept the change, **Reject** to decline it, or **Close** to leave it pending.

## Reviewing a Bulk Request

1. Click the row menu on a request with a **Bulk (n)** badge, then click **Review bulk change**.
2. The dialog shows the request metadata and a **Change Summary** (e.g. "4 records affected") with the values being applied.
3. Click **Approve Bulk** or **Reject Bulk** to act on the whole group, or click **View Individual Records** to step through each record before deciding.

A request that is an individual record inside a bulk request shows a **Bulk** badge beside its target. Its row menu offers only **View bulk change**, which opens the bulk request it belongs to, and it cannot be selected for bulk approval or rejection — act on it from the bulk request instead.

## Approving or Rejecting Multiple Requests

1. Select the checkbox on each request you want to act on (or use the select-all checkbox in the header row).
2. Click **Approve Request** or **Reject Request** in the toolbar that appears.
3. Click **Clear** to deselect without acting.
