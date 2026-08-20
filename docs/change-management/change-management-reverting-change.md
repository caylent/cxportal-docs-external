# Reverting a Change

Reverting rolls back a change that has already been executed. You revert from the audit log record's details dialog.

> **Caution:** Reverting changes live configuration. Review the Before State / After State diff carefully before clicking Revert.

## Before You Begin

- Find the audit log record for the change you want to roll back (see *Reviewing the Audit Log*)

## Steps

1. In the left sidebar, click **Change Management** > **Audit Log**.
1. Click the row menu (**Open menu**) on the record, then click **Review change** (or **Review bulk change**).
1. Review the **Before State** and **After State**.
1. Click **Revert**.
    - On a bulk record, click **Revert Bulk** to revert the whole group, or click **View Individual Records** and use the per-record **Revert** button to revert a single record within the group.

!!! info ""

Bulk records with **Change Type** **Import** can't be reverted. **Revert** / **Revert Bulk** is disabled for them — both at the bulk level and for individual records within the group — with a tooltip explaining that bulk reversions on imports are disabled.
   

The **Status** filter on the Audit Log page includes **Reversion** and **Reverted** values for tracking reverted activity.

> **Note:** The exact confirmation flow after clicking Revert, and the precise meaning of the Original / Reversion / Reverted statuses, are not fully verifiable from the UI alone. [To be confirmed with the engineering team.]
