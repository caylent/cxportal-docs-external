# Reviewing the Audit Log

The **Audit Log** page lists every recorded change for the selected instance ("A list of audit log records and their current status"). The heading shows the record count for the current date range, e.g. **Audit Log Records (235)**.

## The Audit Log Table

Columns: a selection checkbox, a **Bulk (n)** badge for bulk records, **Change Type**, **Description**, **Requester**, **Approver**, **Date**, **Status**, and a row actions menu. Click a column header to sort. The table scrolls to load all records — there are no pagination controls.

## Filtering and Searching

1. Use the **Filters** panel on the left to narrow the list. Each filter is a searchable multi-select:
    - **Change type** — the operation performed (see the full list in the Reference section)
    - **Requester** — the user who made or requested the change
    - **Approver** — the user who approved it
    - **Status** — **Original**, **Pending**, **Reversion**, or **Reverted**
1. Click **Clear Filters** to remove all filter selections, or **Hide filters** to collapse the panel.
1. Use the date range button above the table (default **Last 14 days**) to change the time window:

a.                   Choose a preset: **Today**, **Yesterday**, **Last 7 days**, **Last 14 days**, **Last 30 days**, **This Week**, **Last Week**, **This Month**, or **Last Month**.
1. Or select a custom range on the two-month calendar.
1. Click **Update** to apply, or **Clear Filter** to reset.
1. Type in the **Search by query...** box to search the list.
1. Click **Refresh data** to reload the table.

## Reviewing a Record

1. Click the row menu (**Open menu**) on a record.
1. Click **Review change** (or **Review bulk change** on a record with a **Bulk (n)** badge).
1. The **Audit Log Record Details** dialog shows:
    - **Change Type**, **Status**, **Requester**, **Requester ID**, **Creation Date**, **Scheduled?**, **Connect Change**, and **Is Bulk Request?** (bulk records only)
    - For single records: a **Before State** / **After State** diff. Added fields are marked **+**, changed fields **~**, deleted fields **-**, with summary badges (e.g. **+2 added**, **~1 changed**). Use **Expand**/**Collapse** to open nested sections.
    - For bulk records: a **Change Summary** (e.g. "3 records affected") with counts per record type. Click **View Individual Records** to step through each underlying record's diff (**Record 1 of 3**, with per-record navigation and a **Back to Bulk View** button).
1. Click **Close** when finished.

# Exporting Audit Log Records

1. In the left sidebar, click **Change Management** > **Audit Log**.
1. Select the checkbox on each record you want to export (or use the select-all checkbox in the header row).
1. Click **Export Record Details** in the toolbar that appears.
