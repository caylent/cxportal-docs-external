# Workforce Management Reference

## Agent Status Reference

**Status Summary**

| Tile | Description |
| --- | --- |
| **Current status** | Status donut with the total agent count in the center, over one legend entry per current status, with agent count and percentage |
| **Adherence (today)** | Stacked bar of agents in adherence / out of adherence / no data, with the share in adherence and the counts behind it, plus a clickable legend (today only) |
| **By routing profile** | Agent count per routing profile with a distribution bar |

**Table columns**

| Column | Description |
| --- | --- |
| **Agent** | Display name and username; clicking the name opens the agent's Agent 360 profile |
| **Status** | Current status badge (with a contact count badge — for example 2 contacts — when the agent has contacts in progress) |
| **In status** | Time in the current status |
| **Next (scheduled)** | Next scheduled activity and time until it starts; — when no schedule data |
| **Adherence** | Time out of adherence today and its share of the day so far (for example 1h 07m out · 14% of day); In adherence when nothing was out of adherence; — when there is no adherence data |

Sort options: **Time in status · Name · Status**

Adherence chips: **Out of adherence · In adherence · No adherence data** (today only; they combine with the status chips)

The table is paginated at 100 agents per page (Showing 1–100 of N agents · Prev / Next).

**Previous day (Day summary)**

| Panel or table | Description |
| --- | --- |
| **Time by status** | Roster-wide observed time per status for the day, as ranked bars with a duration and share each |
| **How the day went** | Team adherence · Observed time · Agents with data (n of m) · Unobserved (only when some time was unobserved) |
| Per-agent table | One row per agent, one column per status used that day, **Other** when statuses were folded into it, and **Adherence**; an agent with nothing recorded reads *No activity recorded for this day* |

Day controls: **Previous day** / **Today** / **Pick a day** (last 90 days) / **Next day**. The previous-day view does not refresh itself and has no pager.

## Team Scorecard Reference

**KPIs**

| KPI | Description |
| --- | --- |
| **Team Adherence Today** | Team-wide adherence percentage for the selected day (Team Adherence for Range for past days) |
| **On Schedule Now** | Agents currently on schedule / agents with schedules |
| **Out of Adherence** | Agents currently out of adherence |
| **Time Off** | Agents on time off |
| **Events Today** | Adherence event count for the day (Events for Range for past days) |

**Controls**

| Control | Options |
| --- | --- |
| **Range (Filters panel)** | Today · Pick a day (calendar) · previous/next day arrows |
| **Zoom** | Full range · 1 hour · 2 hours · 4 hours · 8 hours · Custom (drag) |
| **Show** | All · Scheduled · Out of adh. · Time off |
| **Sort (Filters panel)** | Lowest adherence first · Name · Most events |
| **Timezone (Filters panel)** | Pacific (PT) · Mountain (MT) · Central (CT) · Eastern (ET) · UTC |

**Ribbon legend:** Productive · Offline · Non-Productive · Not scheduled / Time Off · No data (gap) · Out of adherence / min

Each ribbon row, top to bottom: **Adherence/min · Scheduled · Actual**.

Stream health reports data freshness: time since the last event, how many agents are reporting recently, and how many have intervals in the selected range. A freshness label shows Live, Stream stale, or Historical.

## Agent Scorecard Reference

**Date ranges:** **Today** (hourly timeline, compared to last day) · **7d** (daily timeline, compared to last week) · **30d** · **Custom** (calendar start and end date), chosen in the Filters panel under Range. A Routing Profile filter is also available in the Filters panel.

**KPI cards**

| Card | Description |
| --- | --- |
| **Adherence** | Adherence percentage for the range, change vs. the prior period, and time in / out of adherence |
| **Schedule Conformance** | Conformance percentage; shows *awaiting data* until data is available |

Adherence and Schedule Conformance are the cards shown by default. Contacts Handled, Avg Handle Time, ACW, and Occupancy are still calculated but hidden unless they are switched on for the selected instance. [GAP: enabling the contact-timing cards is a per-instance configuration change today — there is no admin control in the UI to document]

**Adherence detail table**

| Column | Description |
| --- | --- |
| **Date** | The day |
| **Scheduled Hours** | Total scheduled time for the day |
| **Actual Hours** | Total actual time recorded |
| **Adherence %** | Adherence for the day |
| **Conformance %** | Conformance for the day |
| **Exception Count** | Number of exceptions |
| **Exception Types** | Exception descriptions |

The table exports via **Export CSV**.

## Filter Dimensions

The Filters panel's + Filter menu (under Group Filters) offers these dimensions on Agent Status and Team Scorecard, with values populated from the selected instance's grouping data. You can select multiple values per dimension, and the dimensions offered vary by instance. The same dimensions drive the Program Dashboard's Group by control:

- LOB
- Team (hierarchy)
- Region
- Team (tag)
- Routing Profile
- Staffing Group
- Forecast Group

Each value shows the number of agents matching it when the instance reports counts (for example L1_KY (13)); a missing count shows the bare label. A dimension whose values have not arrived yet is held back from the menu (**Loading filters…**), a dimension the instance reports no values for is listed and opens to **No values**, and an instance with no grouping data at all shows **No filters available**. Selected values appear as chips labelled dimension: value below the + Filter button, each with an ✕ remove button.

## Adherence Measurement

- Adherence is tracked per minute (**Out of adherence / min** in the legends)
- A grace tolerance of **±5 minutes** is applied (shown as **±5m grace**)
- Timelines always show **Top: Scheduled · Bottom: Actual**
- Scheduled activity types observed: **Work**, **Break**, **Lunch**
- Actual status values observed: **Available**, **Break**, **Lunch**, **Offline**
