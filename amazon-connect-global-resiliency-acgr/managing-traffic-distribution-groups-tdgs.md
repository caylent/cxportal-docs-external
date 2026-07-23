# Managing Traffic Distribution Groups (TDGs)

## Before You Begin

* You need the **ACGR Admin** role.
* You understand which Region is your primary and which is your secondary (for example, **us-west-2** primary and **us-east-1** secondary).

***

## Viewing Traffic Distribution Groups

To view your TDGs:

1. Go to **ACGR** > **Traffic Distributions**.
2. Review the table, which lists all TDGs and displays:
   * **Name**
   * **Id**
   * **Agents** (number of agents)
   * **Numbers** (number of phone numbers)
   * **Telephony %**
   * **Agent %**

Use the filters to quickly locate groups by **Name** or **ID**. Click the **TDG Names** dropdown to open the name filter, or **TDG IDs** to open the ID filter. Each filter includes a paste-from-clipboard control for bulk-pasting a list of names or IDs. You can sort by clicking the **Name**, **Agents**, or **Numbers** column headers.

The right-side summary cards show **Agents** (Total / Assigned / Unassigned) and **Phone Numbers** (Total / Assigned / Unassigned).

![](../../assets/images/FZsCbu9rfB98u3hyVVEn.png)

***

### Creating a Group

1. On the **Traffic Distributions** page, click **+ Add** in the top-right corner.
2. Enter a name.
3. (Optional) Add a description.
4. Click **Create Traffic Distribution Group**.

The group appears in the list after creation. Updates are applied asynchronously, so it may take a few seconds before the group is visible.

!!! warning ""
    **Warning:** Name and description cannot be changed after creation. Verify all details are correct before clicking Create Traffic Distribution Group.


!!! info ""
    **Note:** After creating a Traffic Distribution Group, assign agents and phone numbers to the group. All phone numbers must belong to a TDG.


***

### Understanding the Traffic Distribution Group Detail Page

To open a group, go to **ACGR** > **Traffic Distributions** and select a group from the table. The **Traffic Distribution Group Detail** page opens, where you manage agents, phone numbers, and regional distributions.

The header card at the top of the page shows:

<table data-header-hidden><thead><tr><th valign="top">Field</th><th valign="top">Description</th></tr></thead><tbody><tr><td valign="top">Name</td><td valign="top">The display name of the TDG (for example, "Default Traffic Distribution Group").</td></tr><tr><td valign="top">ID</td><td valign="top">The system-generated UUID of the TDG.</td></tr><tr><td valign="top">Primary Region</td><td valign="top">The AWS Region designated as the primary (for example, us-west-2).</td></tr><tr><td valign="top">Secondary Region</td><td valign="top">The AWS Region designated as the secondary (for example, us-east-1).</td></tr><tr><td valign="top">Agents</td><td valign="top">The current agent distribution percentage between primary and secondary (for example, "100/0") and the total agent count assigned to the TDG.</td></tr><tr><td valign="top">Phone Numbers</td><td valign="top">The current telephony distribution percentage between primary and secondary (for example, "100/0") and the total phone number count assigned to the TDG.</td></tr></tbody></table>

Below the header, the page contains three panels arranged left to right: **Agents**, **Phone Numbers**, and **Distributions**.

![](../../assets/images/GGjEQRIHtJNrknJDdgdc.png)

***

### Assigning Agents to a TDG

Use the **Agents** panel to add or remove agents from the TDG. The panel header shows the count as assigned/total (for example, "Agents (0/3)"). Each agent entry displays the agent's name and email address.

To assign agents to a TDG:

1. Select the TDG you'd like to edit.
2. In the **Agents** panel, click **+** next to the search bar. The **Add Agents to Traffic Distribution Group** dialog opens. Only unassigned agents are shown.
3. Search by name, email, or agent ID to locate agents.
4. Select one or more agents from the list.
5. Click **Add Agents** to assign them to the TDG, or **Cancel** to discard.

!!! info ""
    **Info:** If no unassigned agents exist, the dialog displays "No agents found."


***

### Removing Agents from a TDG

1. In the **Agents** panel, select the agents to remove using the checkboxes.
2. Click the trash icon.
3. Confirm the removal.

The selected agents are returned to the unassigned pool and can be added to another TDG.

!!! info ""
    **Info:** To move an agent from one TDG to another, remove the agent from the current TDG and add them to the target TDG. Agent reassignment is not available as a single action.


***

### Adding Phone Numbers to a TDG

Use the **Phone Numbers** panel to add or reassign phone numbers. The panel header shows the count as assigned/total (for example, "Phone Numbers (0/1)"). Each phone number entry displays the number and its description.

To add phone numbers to a TDG:

1. Select the TDG you'd like to edit.
2. In the **Phone Numbers** panel, click the **+** (Add) button. The **Add Phone Numbers to Traffic Distribution Group** dialog opens. Only unassigned phone numbers are shown.
3. Search by phone number, ID, or description to locate numbers.
4. Select one or more phone numbers from the list.
5. Click **Add Phone Numbers** to assign them, or **Cancel** to discard.

!!! info ""
    **Info:** If no unassigned phone numbers exist, the dialog displays "No phone numbers found."


!!! warning ""
    **Warning:** When ACGR is enabled, newly created phone numbers are automatically assigned to the **Default TDG**. Only numbers created before ACGR was enabled may appear as unassigned and require manual assignment.


***

### Reassigning Phone Numbers Between TDGs&#xD;

1. On the **Traffic Distribution Group Detail** page, select the phone numbers to reassign using the checkboxes.
2. Click the reassign (swap) icon in the **Phone Numbers** panel. The **Reassign Phone Numbers** dialog opens with the message "Select a traffic distribution group to reassign \[N] selected phone number(s) to."
3. Choose the target TDG from the dropdown. The dropdown lists all other TDGs.
4. Click **Reassign Phone Number**, or **Cancel** to discard.

!!! warning ""
    **Warning:** Reassigning changes which TDG controls traffic distribution for the selected phone numbers. Verify the target TDG's distribution settings before proceeding.


!!! info ""
    **Info:** Reassignment is available for phone numbers only. To change the TDG for an agent, remove the agent from the current TDG and add them to the target TDG.


***

### Updating Distributions Manually&#xD;

The **Distributions** panel controls how traffic is split between Regions for this TDG. The panel includes:

* **Agent Distribution** slider — splits agent routing between the primary Region (left) and secondary Region (right). The current percentage is displayed below the slider.
* **Telephony Distribution** slider — splits incoming call traffic between the primary and secondary Regions.

To update distributions manually:

1. Move the sliders to set the percentage for each Region.
2. Click **Save** to apply the changes.

![](../../assets/images/y3TastwG0zSATF2ME0br.png)

!!! info ""
    **Info:** Adjust distributions in small increments (of 10 or 20%) so you can monitor queues and agent availability while traffic stabilizes.


!!! info ""
    **Info:** Distribution changes can take several minutes until the percentages show as changed. It will override any Playbook value previously applied to this TDG. The most recent change — whether from a Playbook or a manual update — always determines the active distribution.


***

## Troubleshooting

| Problem                                                          | Cause                                                  | Solution                                                                                                  |
| ---------------------------------------------------------------- | ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------- |
| The **Add Agents** dialog shows "No agents found."               | No unassigned agents exist.                            | Agents already assigned to another TDG must be removed from that TDG first.                               |
| The **Add Phone Numbers** dialog shows "No phone numbers found." | No unassigned phone numbers exist.                     | Numbers created after ACGR was enabled are auto-assigned to the Default TDG; reassign from there instead. |
| You cannot rename a TDG.                                         | TDG name and description are immutable after creation. | Create a new TDG with the correct name; names and descriptions cannot be changed after creation.          |

***
