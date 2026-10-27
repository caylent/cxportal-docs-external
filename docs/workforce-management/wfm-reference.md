# Workforce Management Reference

## Agent Status Reference

**Status Summary**

| Tile | Description |
| --- | --- |
| **Current status** | A status donut captioned **Current status**, beside a status table with the columns **Status · Agents · Share** — one row per current status; rows filter the agent table |
| **Adherence · Today** | A headline *n% in adherence*, the evaluated-agent count, a stacked bar, and a legend of **In adherence · Out of adherence · No data**; legend entries filter the agent table. Shown only once at least one agent in scope has been measured |
| **By routing profile** | Agent count per routing profile with a distribution bar; shown only when at least one agent in view names a routing profile |

**Table columns**

| Column | Description |
| --- | --- |
| **Agent** | Display name and username; clicking the name opens the agent's Agent 360 profile |
| **Status** | Current status badge (with a contact count badge — for example 2 contacts — when the agent has contacts in progress) |
| **In status** | Time in the current status |
| **Next (scheduled)** | Next scheduled activity and time until it starts; — when no schedule data |
| **Adherence** | Time out of adherence today and its share of the day so far (for example 1h 07m out · 14% of day); In adherence when nothing was out of adherence; — when there is no adherence data |

Sort options: **Name · Status · Time in status · Adherence % · % of day completed** — Time in status, Adherence %, and % of day completed on today's view only. **Ascending** / **Descending** buttons set the direction, with a line naming what ascending means for the chosen column (A to Z · longest first · lowest first · least completed first). The **Agent**, **Status**, **In status**, **Adherence %**, and **% of day completed** column headings are buttons over the same setting, marked **▲** / **▼**. Rows with no figure sort last in both directions.

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
| **Show** | All · Scheduled · Out of adherence · Time off |
| **Sort (Filters panel)** | Lowest adherence first · Highest adherence first · Name · Most events (rows with no adherence figure sort last in both adherence orders) |
| **Timezone (Filters panel)** | Pacific (PT) · Mountain (MT) · Central (CT) · Eastern (ET) · UTC |

**Ribbon legend:** Productive · Offline · Non-Productive · Not scheduled / Time Off · Out of adherence / min

Each ribbon row, top to bottom: **Adherence/min · Scheduled · Actual**.

Stream health reports data freshness: time since the last event, how many agents are reporting recently, and how many have intervals in the selected range. A freshness label shows Live, Stream stale, or Historical.

## Agent Scorecard Reference

**Date ranges:** **Today** (hourly timeline, compared to last day) · **7d** (daily timeline, compared to last week) · **30d** · **Custom** (calendar start and end date), chosen in the Filters panel under Range. A Routing Profile filter is also available in the Filters panel, as is a **Timezone** dropdown that appears alongside Range.

**KPI cards**

| Card | Description |
| --- | --- |
| **Adherence** | Adherence percentage for the range, change vs. the prior period, and time in / out of adherence |
| **Schedule Conformance** | Conformance percentage; shows *awaiting data* until data is available |

Adherence and Schedule Conformance are the cards shown by default. Contacts Handled, Avg Handle Time, ACW, and Occupancy are still calculated but hidden unless they are switched on for the selected instance. 

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

The table exports via **Export CSV** in the page header.

## Time Off Reference

**Summary tiles:** **Out today** · **Out in range** (agents on approved leave, with hours) · **Pending** (All dates) · **Approved** · **Denied** · **Cancelled** (In selected range). The status tiles filter the table.

**Table columns:** **Agent** · **Category** · **Dates** · **Duration** · **Status** · **Requested** (shown when the table has room) · **Decided** · **Last changed**. Every column sorts both ways; **Default order** groups Pending, Approved, Denied, then Cancelled, soonest start first.

**Statuses:** **Pending** · **Approved** · **Denied** · **Cancelled** (shown in neutral grey — a withdrawn request is not a refusal)

**Filters panel:** **Date range** (Today · Next 7d · Next 30d · Custom) · **Decided on** (Today · Pick a day, up to 89 days back) · **Group Filters** · **Agents** · **Status** · **Category**

**Per-day chart:** **Forecasted coverage per day** where the forecast reaches the range, otherwise **Agents off per day**. Clicking a day filters the table to it.

See [Reviewing Team Time Off](wfm-time-off.md).

## Exporting Workforce Management Data

Agent Status, Team Scorecard, Agent Scorecard, Forecast, Capacity, and Scheduling, Program Dashboard, and Time Off each carry **Export CSV** and **Export PDF** in the page header.

| Page | Export CSV contents |
| --- | --- |
| **Agent Status** | One row per agent under the current filters and sort, across the whole roster (today), or the day summary's per-agent table (previous day) |
| **Team Scorecard** | One row per agent the ribbon lists |
| **Agent Scorecard** | One row per day of the Adherence detail table |
| **Forecast, Capacity, and Scheduling** | One row per 15-minute interval of the rolling 12-hour plan; the coverage heat-map is not exported |
| **Program Dashboard** | One row per Group Performance group |
| **Time Off** | One row per request under the current filters, in the table's order |

- Each CSV holds every row under the current filters and sort, not only the rows on screen. **Export CSV** is unavailable while the page is loading or after a failed load.
- In the CSV, times carry the page's time-zone offset alongside a UTC column, durations are numbers of minutes, and percentages are plain numbers. An agent with no reading gets an empty cell, not a zero.
- **Export PDF** produces a US Letter, portrait report. Every page carries a CxPortal header naming the module and view, and a footer with when it was generated and *Page n of N*. Filter controls are left out of the capture; in their place, page one lists what the report shows — such as instance, period, time zone, agent population, and active filters.
- While an export runs, the buttons read **Exporting...** or **Generating...**. A failed CSV export shows *The CSV could not be exported. Try again.*

## Settings Reference

The **Settings** page is read-only and is visible only to a Workforce Management admin. See [Reviewing Workforce Management Settings](wfm-settings.md).

| Card | Contents |
| --- | --- |
| **Reporting population** | Headline *n of m agents counted*, then one row per security profile on the instance: **Security profile id** · **Agents** · **Status**, where Status is **Counted**, **Not counted**, or **Unknown** |
| **Performance thresholds** | **Adherence** — Target % and At-risk floor %. **Conformance** — a Set a conformance target toggle, with Target % and At-risk floor % |
| **Display defaults** | **Default time zone** and **Adherence grace minutes** |

## Metric Information Icons

Metric labels across Workforce Management carry an information icon. Clicking it opens a popover with the metric's definition, a **How it's calculated** list, and, where applicable, the data **Source**. Reading a definition never triggers the row or card the label sits in.

| Page | Labels with an information icon |
| --- | --- |
| **Agent Status** | Adherence · Today (summary heading); **Next (scheduled)** and the adherence column heading in the agent table |
| **Team Scorecard** | Team Adherence Today (Team Adherence for Range) · On Schedule Now |
| **Forecast, Capacity, and Scheduling** | Forecasted Agents · Scheduled Agents · Forecast vs Scheduled · Volume Forecast · Occupancy · Available Agents · Scheduled vs Available · Understaffed windows (banner) |
| **Program Dashboard** | Total Agents Active · Scheduled Adherence · Schedule Conformance · Adherence % · Conformance % · the Group Performance status column |
| **Time Off** | Out today · Out in range (how the hours are counted) |

## Filter Dimensions

The Filters panel's + Filter menu (under Group Filters) offers these dimensions on Agent Status, Team Scorecard, and Time Off, with values populated from the selected instance's grouping data. You can select multiple values per dimension, and the dimensions offered vary by instance. The same dimensions drive the Program Dashboard's Group by control:

- LOB
- Team (hierarchy)
- Region
- Team (tag)
- Routing Profile
- Staffing Group
- Forecast Group

Each value shows the number of agents matching it when the instance reports counts (for example L1_KY (13)); a missing count shows the bare label. A dimension whose values have not arrived yet is held back from the menu (**Loading filters…**), a dimension the instance reports no values for is listed and opens to **No values**, and an instance with no grouping data at all shows **No filters available**. Selected values appear as chips labelled dimension: value below the + Filter button, each with an ✕ remove button.

## Remembered View Preferences

Agent Status, Team Scorecard, Agent Scorecard, Forecast, Capacity and Scheduling, and the Program Dashboard remember the time zone and group filters you last used, and Agent Status also remembers the ordering. Time Off remembers the group filters, leave categories, and table ordering. Preferences are held per viewer, per Amazon Connect instance, and per page, so switching instance switches preferences with it.

Where a page's address names a time zone, a filter, or a drill-in scope, the address wins over the remembered preference — a shared link shows its recipient what the sender saw. Pages that carry no preference yet open in the instance's default time zone, and in the browser's time zone where the instance names none.

## Adherence Measurement

**No adherence figure** — where an agent has no scored minutes, the Team Scorecard row and the Agent Scorecard timeline header show a label with a hover explanation instead of a percentage:

| Label | Meaning |
| --- | --- |
| **Not scheduled** | Nothing scheduled in the range |
| **Time off** | The agent is on leave for the whole range |
| **Not started** | The shift has not started yet |
| **Not tracked** | Every scheduled minute so far is on an activity Connect excludes from adherence |

- Adherence is tracked per minute (**Out of adherence / min** in the legends)
- A grace tolerance of **±5 minutes** is applied (shown as **±5m grace**)
- Timelines always show **Top: Scheduled · Bottom: Actual**
- Scheduled activity types observed: **Work**, **Break**, **Lunch**
- Actual status values observed: **Available**, **Break**, **Lunch**, **Offline**
- Adherence is measured over agents with a measured day; agents with no status data for their scheduled time are reported as **No data** rather than averaged into the percentage
- Conformance is uncapped and can read above 100% when an agent works beyond their scheduled time; the Schedule Conformance Trend axis grows past 100% rather than clipping such a day
