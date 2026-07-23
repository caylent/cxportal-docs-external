# Making Bulk Changes to Agents

Once you've selected the agents you want to update, use the **Bulk Actions** toolbar to apply changes across any of the three configurable fields — **Routing Profile**, **Auto Accept Calls**, and **ACW Time Limit**. The same Change Request workflow applies to all three.

***

## Before You Begin

* You need an administrative role with access to the **Bulk Edit** section. Submitting a bulk change may require Change Management approval, depending on your organization's role and instance configuration. See [Change Requests and Timing.](../../cxportal/editing-agents-in-bulk/change-requests-and-timing.md)
* Find the agents you want to update first. See [Filtering Agents](../proficiency-based-routing.md).

***

## Selecting Agents

1. Use the filter bar to find the agents you want to update.
2. Check the box next to each agent you want to include. To select all agents in the current set, use the **Select all rows** group checkbox at the top of the table.
3. The **Bulk Actions** toolbar appears above the table, showing the number of agents selected (**Bulk Actions: \[count]**) and a button for each available action: **Routing Profile**, **Auto Accept Calls**, **ACW Time Limit**, and **Export Selected**.
4. Click the action you want to apply. To deselect all agents, click **Clear**.

!!! warning ""
    **Warning:** Select all rows selects the entire set reported by the toolbar count — not just the rows currently visible on screen. Check the count before applying a change.


***

## Step-by-Step Instructions

!!! info ""
    Info: Each bulk action opens a dialog that lists every selected agent with their current value, plus a Summary showing how many agents currently hold each existing value (with ??? as the placeholder for the new value you haven't chosen yet). Review the Summary to confirm scope before clicking Apply Changes.


!!! info ""
    **Tip — Remove an agent from inside the dialog:** The bulk-change dialog lists every agent you selected. If you spot one you checked by mistake, you can remove it from the list right there in the dialog before clicking **Apply Changes** — only the agents still listed will be changed. This lets you correct an accidental selection without closing the dialog and starting over.


### Routing Profile

Reassign multiple agents to a new Routing Profile in one action.

1. With agents selected, click **Routing Profile** in the **Bulk Actions** toolbar.
2. The **Bulk Routing Profile Change** panel opens. The left side lists your selected agents and their current Routing Profile.
3. Open the **Select a Routing Profile** dropdown on the right and choose the new profile.
4. Review the **Routing Profile Summary** to confirm how many agents you're changing and from which current profiles. *(Observed in the live UI.)*
5. Click **Apply Changes**.
6. In the **Change Request Details** window, fill in the optional **Description** and set the **Criticality**:
7. a. **Normal** — No immediate business impact. b. **Urgent** — Critical business need or active outage.
8. (Optional) Set a **Date and Time** for the change.
9. Click **Submit**.

***

### Auto Accept Calls

Update whether agents automatically receive contacts or must manually accept them.

1. With agents selected, click **Auto Accept Calls** in the **Bulk Actions** toolbar.
2. The **Bulk Auto Accept Calls Change** panel opens, showing your selected agents and their current setting.
3. Under **New Auto Accept Calls**, choose **Yes** or **No**.
4. Click **Apply Changes**, complete the **Change Request Details** window (see the Routing Profile steps above), and click **Submit**.

***

### ACW Time Limit

Update the After Call Work duration for selected agents.

1. With agents selected, click **ACW Time Limit** in the **Bulk Actions** toolbar.
2. The **Bulk ACW Time Limit Change** panel opens, showing each selected agent and their current ACW value.
3. Under **New ACW Time Limit**, select the value you need from the available options.
4. Click **Apply Changes**, complete the **Change Request Details** window, and click **Submit**.

!!! info ""
    **Info — What happens after you submit:** Whether the change needs approval before it's applied depends on your organization's configuration, and processing time scales with the number of agents. See [Change Requests and Timing](../../cxportal/editing-agents-in-bulk/change-requests-and-timing.md) for the full lifecycle and timing.


***

## Troubleshooting

| Problem                                                 | Cause                                                                                      | Solution                                                                                                        |
| ------------------------------------------------------- | ------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| **Apply Changes** is grayed out                         | You haven't chosen a new value in the dialog yet                                           | Select a value in the **New …** dropdown before clicking **Apply Changes**.                                     |
| The change shows a **Pending** status you didn't expect | Change Management is enabled for your role or instance, so the change is awaiting approval | Contact your CxPortal administrator to confirm whether Change Management is required for your role or instance. |

***
