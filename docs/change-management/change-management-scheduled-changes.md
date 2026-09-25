# Managing Scheduled Changes

The **Scheduled Changes** page lists approved changes that have not executed yet.

Columns: a **Bulk (n)** badge for bulk changes, **Change Type**, **Target**, **Description**, **Requester**, **Approver**, **Scheduled Date**, and a row actions menu. **Target** names the item the change applies to; hover it to copy it or to see the full value. A change that is one record inside a bulk operation carries a **Bulk** badge beside its target, and its row menu offers only **View bulk change**.

## Filtering and Searching

1. Use the **Filters** panel on the left to narrow the list:
    - **Target** — the exact name of one item, to list that item's scheduled changes (see [Searching a Target's History](#searching-a-targets-history))
    - **Change type** — the operation that will be performed
    - **Requester** — the user who submitted the change
    - **Approver** — the user who approved it

    **Change type**, **Requester**, and **Approver** are searchable multi-selects, and each lists only the values present in the loaded changes. Selecting several values in one filter matches any of them; selections in different filters must all match.
2. Type in the **Search by keyword...** box above the table to filter the changes currently in the table.
3. Click **Clear Filters** to remove all filter selections and the target search, or **Hide filters** to collapse the panel.

### Searching a Target's History

The **Target** field in the Filters panel lists every scheduled change for one item, rather than filtering the scheduled changes already in the table.

1. In the **Filters** panel, type the item's name in the **Target** box.
2. Press **Enter**. The table lists the scheduled changes recorded for that target.
3. (Optional) Use the date range button below the **Target** box to limit the results to a period. It reads **All time** until you apply a range, and stays disabled until you have entered a target — hovering it beforehand shows *Enter a target first.*
4. Click the **X** in the **Target** box to clear both the search and its date range.

The target search counts as one active filter, and **Refresh data** reloads its results.

!!! info ""
    The target must be an exact match. When nothing matches, the table shows *No scheduled changes found* with the hint *Target must be an exact match.*

## Reviewing or Cancelling a Scheduled Change

1. In the left sidebar, click **Change Management** > **Scheduled Changes**.
2. Click the row menu (**Open menu**) on the change, then click **Review change**.
3. The **Scheduled Change Details** shows **Change Type**, **Item**, **Requester**, **Requester ID**, **Creation Date**, **Scheduled Date**, **Description**, and the **Before State** / **After State** diff. **Item** names the specific item the change applies to, such as a phone number, and shows a dash (**-**) when the change doesn't have one.
4. Click **Cancel** to cancel the scheduled change, or **Close** to leave it scheduled.

> **Warning:** Cancelling a scheduled change means it will not execute at its scheduled date.

# Updating a Record's Description

Records on all three pages have an editable description.
1. Click the row menu (**Open menu**) on the record.
2. Click **Update description**.
3. The **Update Description** dialog opens ("Add or edit the description for this entry.").
4. Enter or edit the **Description**.
5. Click **Save**, or **Cancel** to discard your edits.
