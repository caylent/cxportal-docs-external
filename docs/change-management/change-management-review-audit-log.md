# Reviewing the Audit Log

The **Audit Log** page lists every recorded change for the selected instance ("A list of audit log records and their current status"). The heading shows the record count for the current date range, e.g. **Audit Log Records (235)**.

## The Audit Log Table

Columns: a selection checkbox, a **Bulk (n)** badge for bulk records, **Change Type**, **Item**, **Description**, **Requester**, **Approver**, **Date**, **Status**, and a row actions menu. Click a column header to sort. The table scrolls to load all records — there are no pagination controls.

**Item** names the specific item the change applies to, such as a phone number. Records without an item show a dash (**-**), and those sort to the end of the list when you sort by **Item**. A long item name is shortened in the cell — hover over it to see the full value.

## Filtering and Searching

1. Use the **Filters** panel on the left to narrow the list:
    - **Target** — the exact name of one item, to list that item's history (see [Searching a Target's History](#searching-a-targets-history))
    - **Change type** — the operation performed (see the full list in the Reference section)
    - **Requester** — the user who made or requested the change
    - **Approver** — the user who approved it
    - **Status** — **Original**, **Pending**, **Reversion**, or **Reverted**

    **Change type**, **Requester**, **Approver**, and **Status** are searchable multi-selects. **Target** is a text field you submit with **Enter**.
2. Click **Clear Filters** to remove all filter selections and the target search, or **Hide filters** to collapse the panel.
3. Use the date range button above the table (default **Last 14 days**) to change the time window:
4. Choose a preset: **Today**, **Yesterday**, **Last 7 days**, **Last 14 days**, **Last 30 days**, **This Week**, **Last Week**, **This Month**, or **Last Month**. Alternatively, select a custom range on the two-month calendar.
5. Click **Update** to apply, or **Clear Filter** to reset.
6. Type in the **Search by query...** box to filter the records currently in the table.
7.  Click **Refresh data** to reload the table.

## Reviewing a Record

1. Click the row menu (**Open menu**) on a record.
2. Click **Review change** (or **Review bulk change** on a record with a **Bulk (n)** badge).
3. The **Audit Log Record Details** dialog shows:
    - **Change Type**, **Status**, **Item**, **Requester**, **Requester ID**, **Creation Date**, **Scheduled?**, **Connect Change**, and **Is Bulk Request?** (bulk records only)
    - For single records: a **Before State** / **After State** diff. Added fields are marked **+**, changed fields **~**, deleted fields **-**, with summary badges (e.g. **+2 added**, **~1 changed**). 
    - For bulk records: a **Change Summary** (e.g. "3 records affected") with counts per record type. Click **View Individual Records** to step through each underlying record's diff. **Item** is shown for each individual record, not for the bulk record as a whole.
4. Click **Close** when finished.

A record that is an individual item inside a bulk operation is reviewed from its bulk change instead: its row menu offers only **View bulk change**, and it cannot be selected for export.

## Searching a Target's History

The **Target** field in the Filters panel lists every record for one item, rather than filtering the records already in the table.

1. In the **Filters** panel, type the item's name in the **Target** box.
2. Press **Enter**. The table lists the audit log records for that target, within the date range selected above the table.
3. Click the **X** in the **Target** box to clear the search and return to the full list.

The target search counts as one active filter, and **Refresh data** reloads its results.

[SCREENSHOT: the Filters panel with a target entered, and the Target column showing a value with its copy control and a **Bulk** badge]

!!! info ""
    The target must be an exact match. When nothing matches, the table shows *No audit log records found* with the hint *Target must be an exact match.*

# Exporting Audit Log Records

1. In the left sidebar, click **Change Management** > **Audit Log**.
2. Select the checkbox on each record you want to export (or use the select-all checkbox in the header row).
3. Click **Export Record Details** in the toolbar that appears.

The exported file includes the columns **Change Type**, **Item**, **Description**, **Requester**, **Approver**, **Date**, and **Status**. Records without an item export a dash (**-**) in the **Item** column.
