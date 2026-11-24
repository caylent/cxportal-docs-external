# Managing Agent Assignments

Use the **Agents** page to see every agent in your instance, check which agents are assigned to a Traffic Distribution Group (TDG), and assign, reassign, or remove agents in bulk.

## Before You Begin

* You need an ACGR role to open the **Agents** page: **ACGR Reader**, **ACGR Editor**, or **ACGR Admin**.
* To assign, reassign, or remove agents, you need permission to manage agent assignments. Without it, you can view the page, but you cannot select agents and the actions are disabled. [VERIFY: which ACGR roles include the permission to manage agent assignments — not defined in this release's diff]
* At least one Traffic Distribution Group must exist before you can assign agents (see [**Managing Traffic Distribution Groups**](managing-traffic-distribution-groups-tdgs.md)).

***

## Viewing Agents

To view your agents:

1. Go to **ACGR** > **Agents**.
2. Review the table, which lists all agents and displays:
   * **Name**
   * **Username** (the agent's Amazon Connect username, or their email address if no username is available)
   * **Status** (**Assigned** or **Unassigned**)
   * **TDG** (the Traffic Distribution Group the agent is assigned to)

The heading shows the number of agents that match your current filters, for example "Agents (25)".

You can sort by clicking the **Name**, **Username**, **Status**, or **TDG** column headers. The table is sorted by **Name** by default. Sorting is not case-sensitive.

!!! info ""
    **Info:** You can also open this page from the Dashboard. Click **Assign** on the unassigned agents card to open the **Agents** page with the **Unassigned** status filter already applied. [VERIFY: the card's label on the Dashboard — the code calls it the "Unassigned Agents" card; the docs call it **Agent Summary**]


***

### Searching and Filtering Agents

* **Search** — Enter text in the **Search by name or username** field. Results match the agent's name, username, or email address.
* **Status** — In the **Filters** panel, open the **Status** dropdown and select **Assigned**, **Unassigned**, or both.
* **Traffic distribution group** — In the **Filters** panel, open the **Traffic distribution group** dropdown and select one or more groups.

When you select more than one value in a filter, agents that match any of the values are shown. When you combine search and filters, only agents that match all of them are shown.

Click **Clear Filters** in the **Filters** panel to reset the **Status** and **Traffic distribution group** filters. If no agents match, the table shows "No agents match your filters"; click **Clear filters** to reset the search and all filters.

!!! info ""
    **Info:** Your search, filters, and sort order are saved in the page URL, so you can bookmark or share a filtered view.


***

### Assigning or Reassigning Agents to a TDG

You can assign unassigned agents and move assigned agents to a different TDG in a single action.

To assign or reassign agents:

1. On the **Agents** page, select the agents using the checkboxes. The page shows how many agents are selected, for example "3 selected of 25 matching".
2. Click **Assign to TDG**. The **Assign to TDG** dialog opens.
3. Choose the target TDG from the dropdown. You can search the list by name or ID.
4. Review the warning message, if one appears. It tells you how many of the selected agents will be moved from their current TDG and how many are already on the selected group.
5. Click **Assign**, or **Cancel** to discard. The button shows how many agents will be assigned or moved, for example **Assign (3)**.

A confirmation message, "Assignment queued. It may take a while to finish.", appears when the request is submitted.

!!! info ""
    **Info:** Agents who are already on the selected TDG stay where they are. If every selected agent is already on that TDG, the **Assign** button stays disabled.


!!! warning ""
    **Warning:** Assigned agents in your selection are moved from their current TDG to the TDG you choose. Verify the target TDG before you click **Assign**.


***

### Removing Agents from a TDG

To remove agents from their TDG:

1. On the **Agents** page, select the agents using the checkboxes.
2. Click **Remove from TDG**. The **Remove from TDG** dialog opens and asks you to confirm the number of agents to remove.
3. Click **Remove** to confirm, or **Cancel** to discard.

A confirmation message, for example "Agents (3) queued for removal.", appears when the request is submitted. Each agent is removed from the TDG they are currently assigned to, so you can remove agents from several TDGs at once.

!!! info ""
    **Info:** Unassigned agents in your selection are skipped, and the dialog shows a warning with how many will be skipped. **Remove from TDG** is disabled when none of the selected agents is assigned to a TDG.


***

### When Changes Appear

Assignments and removals are queued and applied asynchronously. The table does not update immediately; the **Status** and **TDG** columns update when the agents list refreshes. [VERIFY: refresh interval — a code comment in this release references a 60-second refetch]

Actions apply only to selected agents that match your current search and filters.

***

## Troubleshooting

| Problem                                                    | Cause                                                                  | Solution                                                                                                   |
| ---------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| The page shows "Couldn't load agents."                     | The agents list could not be loaded.                                   | [GAP: recovery steps when the agents list fails to load — Source needed: SME / support]                    |
| You cannot select agents, or the action buttons are disabled. | You don't have permission to manage agent assignments.              | Ask your administrator for an ACGR role that allows managing agent assignments.                            |
| The **Assign** button stays disabled after you choose a TDG. | Every selected agent is already on that TDG.                         | Choose a different TDG, or change your selection.                                                           |
| An agent's status or TDG has not changed after an action.  | Changes are queued and applied asynchronously.                         | Wait for the agents list to refresh.                                                                        |
| An error says "Couldn't remove agents (N) from [TDG name]." | The removal request failed for that TDG.                              | The dialog stays open and the affected agents stay selected. Click **Remove** again to retry.               |

***
