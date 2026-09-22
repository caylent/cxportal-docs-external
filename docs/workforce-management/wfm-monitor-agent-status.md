# Monitoring Live Agent Status

The **Agent Status** page shows live agent status, distribution, and schedule adherence for every agent in the selected instance. You can also step back to a previous day to see how that day went.

## Before You Begin

- An Amazon Connect instance must be selected in the **Instance** selector
- Agents must exist in the selected instance

## Limits and Constraints

- The table shows 100 agents per page; use search, status chips, or Group Filters to narrow large populations rather than paging
- Status chips appear only for statuses currently present in the population (for example, no Available chip when no one is Available)
- The Adherence column shows — for agents with no adherence data for the day; Next (scheduled) shows — for agents with no schedule data
- The By routing profile breakdown appears only when routing profile data is available for the instance
- Filter dimensions depend on the grouping data configured for the instance — not every instance offers every dimension
- The Adherence (today) panel and the Adherence chips appear on today's view only, and only once at least one agent has an adherence reading
- Adherence filtering is applied across the whole roster rather than only the visible page
- On a previous day the live columns (In status, Next (scheduled), and the contact count) and the Prev/Next pager are replaced by a day summary — the page does not refresh itself and the day arrives as a single response
- Group Filters on a previous day use today's group membership; the historical endpoint cannot filter by group
- Previous days are bounded by the 90-day agent-interval retention, and some instances cannot serve them at all

## Step-by-Step Instructions

### Reading the Status Summary

On today's view the card at the top of the page is headed **Right now** and holds three panels:

- **Current status** — A status donut with the total agent count in the center, over a status legend with one entry per current status (for example Offline), each with an agent count and percentage. Click an entry to filter the table to that status.
- **Adherence (today)** — A stacked bar of the agents in scope, with the share in adherence and the counts behind it (for example 82% in adherence (14/17)). Beneath it, a legend lists **In adherence**, **Out of adherence**, and **No data** with a count each; click an entry to filter the table to those agents. The panel appears only when at least one agent has an adherence reading.
- **By routing profile** — A breakdown of agents by routing profile, with a bar and agent count per profile.

### Filtering and Sorting the Agent List

1. Use the status chips — **All** plus one chip per current status (for example **Available**, **Offline**) — to filter the table by current status.
2. Use the **Adherence** chips beside the status chips — **Out of adherence**, **In adherence**, or **No adherence data** — to filter by today's adherence reading. The two filters combine, so you can ask for agents who are Available *and* out of adherence. Click the selected chip again, or **Clear all**, to drop it.
3. In the Filters panel, click **+ Filter** under **Group Filters** to filter by other dimensions:
   1. Choose a dimension, for example **LOB**, **Team (hierarchy)**, **Region**, **Team (tag)**, or **Routing Profile**. The dimensions offered depend on the instance's grouping data. A dimension whose values have not arrived yet shows **Loading filters…**, one the instance reports no values for opens to **No values**, and an instance with no grouping data at all shows **No filters available**.
   2. Select one or more values from the submenu. Values are populated from the selected instance (for example, its routing profiles), and each value shows how many agents match it when the instance reports counts (for example L1_KY (13)).
   3. Selected values appear as chips below **+ Filter**, labelled dimension: value (for example Region: East). Each chip has an **✕** remove button for that one value; **Clear Filters** at the top of the Filters panel resets them all.
4. In the search box, enter an agent name or ID to search the list.
5. In the Filters panel's **Sort** dropdown, choose **Time in status**, **Name**, or **Status**.

### Reading the Agent Table

The table shows 100 agents per page — use the **Prev** and **Next** controls below the table to move between pages. Each row has these columns:

| Column | What it shows |
| --- | --- |
| **Agent** | The agent's display name and username. Click the name to open the agent's Agent 360 profile. |
| **Status** | The agent's current status badge (for example Available, Offline). A contact count badge appears next to the status when the agent has contacts in progress (for example 1 contact, 2 contacts). |
| **In status** | How long the agent has been in their current status. |
| **Next (scheduled)** | The agent's next scheduled activity and when it starts (for example Break · in 26m). Shows — when no schedule data exists. |
| **Adherence** | Today's reading: the time out of adherence and its share of the day so far (for example 1h 07m out · 14% of day), **In adherence** when nothing was out of adherence, or — when there is no adherence data for the agent. |

### Reviewing a Previous Day

1. In the summary card's header, click **Previous day** or **Next day** to step a day at a time, or click **Pick a day** and choose a date from the calendar (the calendar covers the last 90 days). **Today** returns to the live view.
2. The card header changes from **Right now** to **Day summary** followed by the date (for example Day summary — Tue 8 Sep 2026) and shows two panels in place of the donut:
   - **Time by status** — The roster's observed time per status for that day as ranked bars, each with its duration and share of observed time (for example 6h 12m (48%)).
   - **How the day went** — **Team adherence** for the day, **Observed time**, **Agents with data** (for example 11 of 14), and **Unobserved** — time no interval covered, which is a pipeline gap rather than idle agents. Unobserved appears only when there was some.
3. Below the filters, the live table is replaced by a table with one row per agent, a column for each status the roster used that day, an **Other** column when further statuses were folded into it, and an **Adherence** column. The search box and the status chips still filter this table — a status chip matches an agent who spent time in that status. An agent with nothing recorded reads *No activity recorded for this day* rather than a row of zeroes.

!!! info ""

    While Group Filters are active on a previous day, the page states that the grouping is as of today: *Group filters use today's membership — the historical endpoint cannot filter by group.* If the instance's backend cannot serve past days at all, the card reads *This Connect instance's backend does not serve historical agent activity yet.*

### Opening an Agent's Profile or Scorecard

1. Click the agent's name to open their Agent 360 profile. See [Viewing an Agent's Profile (Agent 360)](wfm-team-scorecard.md#viewing-an-agents-profile-agent-360).
2. To open a scorecard instead, open the Agent Scorecard page and search for the agent. See [Reviewing Agent Scorecards](wfm-agent-scorecards.md).
