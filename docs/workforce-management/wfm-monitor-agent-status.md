# Monitoring Live Agent Status

The **Agent Status** page shows live agent status, distribution, and schedule adherence for every agent in the selected instance.

## Before You Begin

- An Amazon Connect instance must be selected in the **Instance** selector
- Agents must exist in the selected instance

## Limits and Constraints

- The table shows 100 agents per page; use search, status chips, or Group Filters to narrow large populations rather than paging
- Status chips appear only for statuses currently present in the population (for example, no Available chip when no one is Available)
- The Out of adherence (today) column and Next (scheduled) show — for agents with no schedule data
- The By routing profile breakdown appears only when routing profile data is available for the instance
- Filter dimensions depend on the grouping data configured for the instance — not every instance offers every dimension

## Step-by-Step Instructions

### Reading the Status Summary

The top of the page shows a status donut with the total agent count in the center, a status legend, and a By routing profile breakdown:

- **Status legend** — One entry per current status (for example Offline), with agent count and percentage. Click an entry to filter the table to that status.
- **By routing profile** — A breakdown of agents by routing profile, with a bar and agent count per profile.

### Filtering and Sorting the Agent List

1. Use the status chips — **All** plus one chip per current status (for example **Available**, **Offline**) — to filter the table by current status.
2. In the Filters panel, click **+ Filter** under **Group Filters** to filter by other dimensions:
   1. Choose a dimension, for example **LOB**, **Team (hierarchy)**, **Region**, **Team (tag)**, or **Routing Profile**. The dimensions offered depend on the instance's grouping data.
   2. Select one or more values from the submenu. Values are populated from the selected instance (for example, its routing profiles). When filters are active, use **Clear Filters** at the top of the Filters panel to reset them.
3. In the search box, enter an agent name or ID to search the list.
4. In the Filters panel's **Sort** dropdown, choose **Time in status**, **Name**, or **Status**.

### Reading the Agent Table

The table shows 100 agents per page — use the **Prev** and **Next** controls below the table to move between pages. Each row has these columns:

| Column | What it shows |
| --- | --- |
| **Agent** | The agent's display name and username. Click the name to open the agent's Agent 360 profile. |
| **Status** | The agent's current status badge (for example Available, Offline). A contact count badge appears next to the status when the agent has contacts in progress. |
| **In status** | How long the agent has been in their current status. |
| **Next (scheduled)** | The agent's next scheduled activity and when it starts (for example Break · in 26m). Shows — when no schedule data exists. |
| **Out of adherence (today)** | A miniature bar of the agent's day with the total time out of adherence (for example 2h 16m out). Red segments mark time out of adherence. |

### Opening an Agent's Profile or Scorecard

1. Click the agent's name to open their Agent 360 profile. See [Viewing an Agent's Profile (Agent 360)](wfm-team-scorecard.md#viewing-an-agents-profile-agent-360).
2. To open a scorecard instead, open the Agent Scorecard page and search for the agent. See [Reviewing Agent Scorecards](wfm-agent-scorecards.md).
