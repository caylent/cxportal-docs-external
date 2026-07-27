# Managing Playbooks

A **Playbook** is a saved scenario that specifies how one or more Traffic Distribution Groups (TDGs) redistribute agents and phone numbers between Regions. Each Playbook:

* Selects one or more TDGs
* Sets agent distribution percentages for each Region
* Sets telephony (phone number) distribution percentages for each Region

![](../../assets/images/vNEeBxgeiJIfVaYeC4ht.png)

When you execute a Playbook, these distributions are applied automatically. This lets you move traffic quickly without making manual changes during an incident.

You can configure Playbooks for different situations, such as:

* Full failover to a secondary Region
* Partial traffic shifts for testing
* Distributing specific business lines independently

***

## Before You Begin

* You need the **ACGR Admin** role.
* At least one **Traffic Distribution Group** must exist. You cannot create a Playbook without one. [See Managing Traffic Distribution Groups.](managing-traffic-distribution-groups-tdgs.md)

***

## Viewing Playbooks

Navigate to **CxPortal** > **ACGR** > **Playbooks**. The **All Playbooks** table displays:

| Column           | Description                                                                                         |
| ---------------- | --------------------------------------------------------------------------------------------------- |
| **Name**         | The Playbook name, shown as a clickable link. Clicking the name opens the **Edit Playbook** dialog. |
| **Description**  | A short summary of the Playbook's purpose.                                                          |
| **Date created** | The date and time the Playbook was created.                                                         |
| **Last used**    | The date and time the Playbook was last executed.                                                   |
| **No. TDGs**     | The number of Traffic Distribution Groups included in the Playbook.                                 |
| **Actions**      | **Edit** (pencil) and **Delete** (trash) icons.                                                     |

***

### Creating a Playbook

1. **Open Playbooks** — Navigate to **CxPortal** > **ACGR** > **Playbooks**.
2. **Create a new Playbook** — Click **Create New Playbook**.
3. **Name the Playbook** — Enter a clear, recognizable name.
4. **Add a description** — Provide context to help others quickly choose the correct Playbook.
5. **Select TDGs** — Choose the Traffic Distribution Groups to include.
6. **Set distributions** — Configure agent and phone number percentages for each Region.
7. **Click Create Playbook to save the Playbook** — Once saved, the Playbook appears in the **All Playbooks** table and is available for selection from the **Failover Now** dialog.

!!! info ""
    **Info:** Agent Distribution percentages for the primary and secondary Regions must total 100 within each TDG. The same applies to Telephony Distribution.


***

### Editing a Playbook

To update an existing Playbook:

1. Locate the Playbook in the **All Playbooks** table.
2. Click the pencil (**Edit**) icon.
3. Update the fields as required.
4. Click **Update Playbook** to save your changes.

From the **Edit Playbook** dialog you can also:

* Update agent and telephony distribution percentages per TDG.
* Remove a TDG from the Playbook using the delete icon next to it.

***

### Deleting a Playbook

1. Locate the Playbook in the **All Playbooks** table.
2. Click the trash (**Delete**) icon in the **Actions** column.
3. Confirm the deletion.

!!! danger ""
    **Danger:** Deleting a Playbook is permanent and cannot be undone. Deleting a Playbook does not affect the TDGs or agents it referenced; only the Playbook definition is removed.


***
