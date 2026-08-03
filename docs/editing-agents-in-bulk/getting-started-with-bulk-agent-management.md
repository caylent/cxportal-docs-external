# Getting Started with Bulk Agent Management

## How to Access This Module

To open the Agent Management page:

1. Log in to CxPortal.
2. In the left navigation panel, expand **Bulk Edit**.
3. Click **Agents**.

<img width="1897" height="910" alt="agent-management_sanitized" src="https://github.com/user-attachments/assets/d1abd7ff-8117-415c-860c-da47f4285668" />

The page opens to your full agent roster in a filterable, sortable table. The header shows an **Export All** button and a **Filter Agents** panel.

***

### Your First Task

The simplest way to get comfortable with the page is to narrow the agent list with a filter — this changes nothing and shows you how selection and filtering work before you make any bulk change.

**Try it: Apply your first filter**

1. In the **Filter Agents** panel, click the filter button you want — for example, **Agent Names**.
2. Enter your criteria. Depending on the filter, you can: a. Type in the search field. b. Select from the drop-down list. c. Paste a comma-separated list directly into the text box.
3. Click **Apply Filter**. The table updates to show only agents matching your criteria. *(To close a filter without applying it, click **Cancel**.)*
4. Repeat for additional filters as needed.

!!! info ""
    **Note**: To target many agents at once, copy a comma-separated string (for example, a list of Agent IDs or proficiencies) and paste it directly into the filter text box. Most filters also provide a **Paste from clipboard** button that pastes your clipboard contents into the filter in one click.


<details open>

<summary>Sorting the table</summary>

The **Agent Name** and **Routing Profile** column headers are sortable — click a header to sort the table by that column.

</details>

***

## Filtering Agents

Use filters to zero in on exactly the agents you want to update or export — individually or in combination. The filter bar at the top of the page gives you six ways to narrow the agent list before taking action.

### Available Filters

**Agent Names**

Search by name, select from a list, or paste a comma-separated list of names.

**Agent IDs**

Works the same as Agent Names, using each agent's login email address as the identifier.

**Routing Profiles**

Filter to agents currently assigned to one or more specific Routing Profiles.

**Proficiencies**

Filter by skill or proficiency assignment.

**Auto Accept Calls**

Filter by setting: Yes (auto-connected) or No (manual accept).

**ACW Time Limits**

Filter to agents assigned specific ACW durations. Values range from 0 to 1,200 seconds.

!!! info ""
    **Note:** Each filter operates independently. You can apply one or combine several at the same time.


***

### How Filters Interact with Your Selection

Applying or changing a filter does not clear agents you've already checked. Your selection is always preserved.

When you apply a filter, the table pins any agents you've already selected to the top, even if those agents don't match the new filter criteria. This lets you build a selection across multiple filter passes without losing track of agents you've already chosen.

<details>

<summary><strong>Example:</strong></summary>

You select five agents who have different Routing Profiles. You then apply a **Routing Profile** filter that only one of them matches.

The four agents who don't match the filter will still appear at the top of the table with their checkboxes checked, while the filtered results display below them.

</details>

When you run a [**Bulk Change**](making-bulk-changes-to-agents.md) or[ **Export**](exporting-agent-data.md), all checked agents are included, regardless of which filter is currently active.

***

### What to Do Next

Now that you can find the agents you want, here's what to do next:

* Select agents and apply a bulk change → [Making Bulk Changes](making-bulk-changes-to-agents.md)
* Export the agent list for review or record-keeping → [Exporting Agent Data](exporting-agent-data.md)
* Recommendations for applying bulk changes to agents safely → [Best Practices ](best-practices-for-editing-agents-in-bulk.md)

***
