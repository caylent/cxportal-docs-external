# Investigating a Contact

Investigate an issue end-to-end using Flow Analyzer. For additional information on the components used in this workflow, see [Flow Analyzer Reference.](flow-analyzer-reference.md)

***

## Before You Begin

* You can access Flow Analyzer under **Flow Insights** (see [Getting Started with Flow Analyzer](getting-started-with-flow-analyzer.md)).
* Have a Contact ID from a log, ticket, or report — or enough details (timeframe, agent, queue, channel, or contact attributes) to filter for the interaction.

***

### Step-by-Step Instructions

#### Step 1: Open Flow Analyzer

1. Go to **CxPortal** > **Flow Insights** > **Flow Analyzer**.
2. Review the contact list panel on the left. It contains the Contact ID search bar, the **Live Contacts** checkbox, the **Advanced** link, and a list of recent contacts.

***

#### Step 2: Find the Contact

Troubleshooting begins by selecting the customer interaction you want to investigate. You can find a contact in one of two ways:

**Option A: Search by Contact ID**

1. Paste a known Contact ID into the search bar to jump directly to that interaction.

When searching by Contact ID, you do not need to apply a date filter. Flow Analyzer returns the contact as long as it is still available in the system.

**Option B: Use Advanced Filters**

When you don't have a specific Contact ID:

1. Click **Advanced** under the search bar.
2. Refine your search by timeline, agent, queue, channel, or contact attributes. See Advanced Filters for each filter category.
3. Apply the filters to update the contact list.

!!! info ""
    **Info:** Every customer interaction in CxPortal is a contact.


***

#### Step 3: Review the Contact Journey

1. Select a contact from the list to open it in Flow View. This view shows exactly how the interaction progressed through the contact flows.
2. Review the path taken by the contact and look for failed paths, error nodes, or unexpected branches.
3. To see a simplified overview of the interaction, switch to **Interaction View**.

!!! success ""
    In Flow View, you can see the full sequence of actions taken during the interaction, including prompts, Lambda calls, and transfers. The view also shows whether the contact followed a success path, a failure path, or a timeout route.

    Flow Analyzer captures the execution time of each block. This makes it easier to identify delays, long-running Lambda functions, or blocks that consistently take longer than expected.

    If the contact moved through more than one flow, each flow and the transitions between them are clearly displayed.


!!! info ""
    **Tip:** Use the navigation controls to move between logs and the corresponding blocks on the canvas. When you identify a block that needs attention, select **Open in Connect** to jump directly to that block in the Amazon Connect flow editor, where it opens highlighted and ready to edit.


***

#### Step 4: Check the Problems Tab

1. Open the **Problems** tab.
2. Review the issues detected in logs, such as slow or failed Lambda functions, slow block execution, or configuration problems.
3. Use these as starting points before a deeper investigation.

***

#### Step 5: Investigate Logs and Review Context

To understand what happened in more detail, use the Flow Logs, Interaction Logs, and Details panel together:

1. Open **Flow Logs** to see the path the contact took through one or more contact flows.
2. Open **Interaction Logs** for a more condensed, step-by-step record of what happened during the interaction.
3. Open the **Details** panel to review attributes, timestamps, endpoints, and routing information for the selected contact. Use this panel to validate data and understand the full context of the interaction.

For a full breakdown of what each log view and panel contains, see [Flow Analyzer Reference](flow-analyzer-reference.md).

***
