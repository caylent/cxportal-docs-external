# Workforce Management Reference

## Agent Status Reference

**Status Summary**

| Tile | Description |
| --- | --- |
| **Status legend** | One legend entry per current status, with agent count and percentage |
| **By routing profile** | Agent count per routing profile with a distribution bar |

**Table columns**

| Column | Description |
| --- | --- |
| **Agent** | Display name and username; clicking the name opens the agent's Agent 360 profile |
| **Status** | Current status badge (with a contact count badge when the agent has contacts in progress) |
| **In status** | Time in the current status |
| **Next (scheduled)** | Next scheduled activity and time until it starts; — when no schedule data |
| **Out of adherence (today)** | Miniature day bar with total time out of adherence; red = out of adherence |

Sort options: **Time in status · Name · Status**

The table is paginated at 100 agents per page (Showing 1–100 of N agents · Prev / Next).

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
| **Contacts Handled** | Contacts handled in the range, with per-day values |

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

## Adherence Measurement

- Adherence is tracked per minute (**Out of adherence / min** in the legends)
- A grace tolerance of **±5 minutes** is applied (shown as **±5m grace**)
- Timelines always show **Top: Scheduled · Bottom: Actual**
- Scheduled activity types observed: **Work**, **Break**, **Lunch**
- Actual status values observed: **Available**, **Break**, **Lunch**, **Offline**
