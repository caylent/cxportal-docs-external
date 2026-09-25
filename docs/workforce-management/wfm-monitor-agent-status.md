# Monitoring Live Agent Status

The **Agent Status** page shows live agent status, distribution, and schedule adherence for every agent in the selected instance. You can also step back to a previous day to see how that day went.

## Before You Begin

- An Amazon Connect instance must be selected in the **Instance** selector
- Agents must exist in the selected instance

## Limits and Constraints

- The table shows 100 agents per page; use search, status chips, or Group Filters to narrow large populations rather than paging
- Status chips appear only for statuses currently present in the population (for example, no Available chip when no one is Available)
- The Out of adherence (today) column and Next (scheduled) show — for agents with no schedule data
- The By routing profile breakdown appears only when at least one agent in view names a routing profile
- The Adherence · Today summary appears only once at least one agent in scope has been measured
- Filter dimensions depend on the grouping data configured for the instance — not every instance offers every dimension
- The Adherence (today) panel and the Adherence chips appear on today's view only, and only once at least one agent has an adherence reading
- Adherence filtering is applied across the whole roster rather than only the visible page
- On a previous day the live columns (In status, Next (scheduled), and the contact count) and the Prev/Next pager are replaced by a day summary — the page does not refresh itself and the day arrives as a single response
- Group Filters on a previous day use today's group membership; the historical endpoint cannot filter by group
- Previous days are bounded by the 90-day agent-interval retention, and some instances cannot serve them at all

## Step-by-Step Instructions

### Reading the Status Summary

The top of the page shows the status mix, an adherence summary, and a By routing profile breakdown, separated by horizontal rules:

- **Current status** — A status donut with the total agent count in the center and the caption **Current status** beneath it, beside a status table that fills the rest of the row. The table has the columns **Status**, **Agents**, and **Share** — one row per current status (for example Offline). Click a row to filter the table to that status.
- **Adherence · Today** — Adherence across the same agents, full width: a headline percentage reading *n% in adherence*, the count of evaluated agents beneath it (for example *3 of 8 evaluated agents*), a stacked bar, and a legend of **In adherence**, **Out of adherence**, and **No data** with the agent count for each. Click a legend entry to filter the table to those agents.
- **By routing profile** — A breakdown of agents by routing profile, with a bar and agent count per profile.

Metric labels in the summary and in the agent table carry an information icon. Click it to open a popover with the metric's definition, a **How it's calculated** list, and, where applicable, the data **Source** it reads from.

### Filtering and Sorting the Agent List

1. Use the status chips — **All** plus one chip per current status (for example **Available**, **Offline**) — to filter the table by current status.
2. Use the **Adherence** chips beside the status chips — **Out of adherence**, **In adherence**, or **No adherence data** — to filter by today's adherence reading. The two filters combine, so you can ask for agents who are Available *and* out of adherence. Click the selected chip again, or **Clear all**, to drop it.
3. In the Filters panel, click **+ Filter** under **Group Filters** to filter by other dimensions:
   1. Choose a dimension, for example **LOB**, **Team (hierarchy)**, **Region**, **Team (tag)**, or **Routing Profile**. The dimensions offered depend on the instance's grouping data. A dimension whose values have not arrived yet shows **Loading filters…**, one the instance reports no values for opens to **No values**, and an instance with no grouping data at all shows **No filters available**.
   2. Select one or more values from the submenu. Values are populated from the selected instance (for example, its routing profiles), and each value shows how many agents match it when the instance reports counts (for example L1_KY (13)).
   3. Selected values appear as chips below **+ Filter**, labelled dimension: value (for example Region: East). Each chip has an **✕** remove button for that one value; **Clear Filters** at the top of the Filters panel resets them all.
4. In the search box, enter an agent name or ID to search the list.
5. In the Filters panel's **Sort** dropdown, choose **Time in status**, **Name**, or **Status**.

!!! info ""

    Group Filters scope the donut, the status table, the Adherence · Today summary and the agent table to the same agents. While a filter's membership is still resolving, the page reports no agents rather than the whole instance. If the membership can't be resolved, the page shows: "The group filter could not be applied. Showing no agents rather than everyone."

### Reading the Agent Table

The table shows 100 agents per page — use the **Prev** and **Next** controls below the table to move between pages. Each row has these columns:

| Column | What it shows |
| --- | --- |
| **Agent** | The agent's display name and username. Click the name to open the agent's Agent 360 profile. |
| **Status** | The agent's current status badge (for example Available, Offline). A contact count badge appears next to the status when the agent has contacts in progress (for example 1 contact, 2 contacts). |
| **In status** | How long the agent has been in their current status. |
| **Next (scheduled)** | The agent's next scheduled activity and when it starts (for example Break · in 26m). Shows — when no schedule data exists. The column heading carries an information icon that opens the metric's definition. |
| **Out of adherence (today)** | A miniature bar of the agent's day with the total time out of adherence (for example 2h 16m out). Red segments mark time out of adherence. The column heading carries an information icon that opens the metric's definition. |

[VERIFY: this page names the last column **Out of adherence (today)**, but the heading in PR #1281's diff reads **Adherence**. That heading text was not changed by this release, so the name here is left as-is — confirm the live wording.]

### Opening an Agent's Profile or Scorecard

1. Click the agent's name to open their Agent 360 profile. See [Viewing an Agent's Profile (Agent 360)](wfm-team-scorecard.md#viewing-an-agents-profile-agent-360).
2. To open a scorecard instead, open the Agent Scorecard page and search for the agent. See [Reviewing Agent Scorecards](wfm-agent-scorecards.md).
