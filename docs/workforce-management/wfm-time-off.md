# Reviewing Team Time Off

The **Time Off** page shows who is out, and which time-off requests are waiting on a decision, for the agents in the selected instance. Use it to see today's and upcoming leave, check a day's forecasted coverage before you act on pending requests, and look up the requests decided on a given day.

## Before You Begin

- An Amazon Connect instance must be selected in the **Instance** selector
- Your role must carry the Time Off permission. It is separate from the Agent Status permission: access to Agent Status, even at admin level, does not open Time Off.

## Limits and Constraints

- The page opens on the next 30 days. Date ranges look ahead: **Today**, **Next 7d**, **Next 30d**, or a custom range on the calendar
- **Pending** counts every pending request, whatever its dates; the date range limits which leave you see, not which decisions are waiting
- Hours on the **Out today** and **Out in range** tiles count approved leave only, and are an estimate for requests that run past the window: Connect reports one total per request, so each request is split in proportion to how much of it falls inside
- Dates and times are shown in the time zone the page's data is reported in (the instance's time zone)
- Connect does not publish who approved or denied a request, so the page does not show it
- The forecasted coverage chart reaches about a week ahead; requests after the last forecast day are in the table only
- Coverage is shown for the whole contact center, or for one forecast or staffing group; other filter selections show the agents-off chart instead
- **Decided on** looks back up to 89 days and cannot pick a future day
- The **Requested** column appears only when the table has room for it; collapse the Filters panel or widen the window to show it

## Step-by-Step Instructions

### Reading the Summary Tiles

The tiles across the top of the page summarize the selected range:

| Tile | What it shows |
| --- | --- |
| **Out today** | Agents on approved leave today, with their hours of leave beneath (or *No leave today*). The information icon explains how the hours are counted. |
| **Out in range** | Agents on approved leave across the selected range, with their hours (or *No leave in range*). |
| **Pending** | Requests waiting on a decision, subtitled **All dates**. |
| **Approved**, **Denied**, **Cancelled** | Requests in each outcome, subtitled **In selected range**. |

Tiles count agents, not requests: one agent with two requests is one agent off. Click **Pending**, **Approved**, **Denied**, or **Cancelled** to filter the table to that status, and click it again to clear the filter.

### Reading the Per-Day Chart

Below the tiles, a chart shows each day of the range. It does not appear for a single-day range.

- **Forecasted coverage per day** — Where the forecast reaches the range, each bar shows the day's coverage at its busiest moment (scheduled agents over required agents), read against a **100% coverage** line. A day at or above the line is **Covered** (green); a day **Under 100%** is red and marked with **!**. Pending leave sits on top of a bar as a yellow slice: the coverage approving it all would take away. Weekends are shaded, and a day inside the forecast span without data is banded *No forecast yet*. Where the forecast ends before the range does, a note reads *The forecast reaches <day>. Requests after that are in the table below.*
- **Agents off per day** — Where the forecast reaches none of the range, the chart shows approved agents per day with pending agents stacked on top, names the **Busiest** day, and says why no coverage is shown.

Hover a day to see its full date, its approved, pending, and denied counts, and, where forecast, a **Forecast** section — for example *100% at 2:00 PM: 14 of 14 needed* and *93% if pending is approved, 1 short*. A line under 100% shows in red.

To narrow the table to one day, click its bar. The table reads *Showing requests on <day>* with a **Clear** link; click the bar again or **Clear** to remove it. Changing the date range drops a chosen day.

### Filtering the Requests

In the Filters panel:

1. Under **Date range**, click **Today**, **Next 7d**, or **Next 30d**, or click **Custom** and pick a start and an end date.
2. Under **Group Filters**, click **+ Filter** to narrow to a team or other group. 
3. Under **Agents**, type in **Search agents…** and select one or more agents.
4. In the **Status** dropdown, select one or more statuses. 
5. In the **Category** dropdown, select one or more leave categories. The list is searchable and always offers every category in the range.
6. To reset every filter, click **Clear Filters** at the top of the panel.

When a status filter is active, a line above the table reads, for example, *Showing Pending only*, with a **Clear** link that removes just that filter. The group filters, categories, and table order are remembered for your next visit; the date range, statuses, and agents are kept in the page address, so a copied link shows its recipient the same view.

### Reviewing Requests Decided on a Day

1. In the Filters panel under **Decided on**, click **Today**, or click **Pick a day** and choose a date.
2. The table lists the requests decided that day, whatever their leave dates. The date range and the per-day chart are hidden, and the tiles show only **Approved**, **Denied**, and **Cancelled**, subtitled **Decided that day**.
3. To return to the leave-date view, click **Clear** on the *Requests decided on <day>* line above the table.

### Reading the Requests Table

The table lists one row per request. By default, pending requests come first, then approved, denied, and cancelled, with the soonest start first within each group.

| Column | What it shows |
| --- | --- |
| **Agent** | The agent's name, with their Connect username beneath when available. Click the name to open the agent's Agent 360 profile. |
| **Category** | The leave category from Connect. |
| **Dates** | The days the request covers. The year is left out for the current year. |
| **Duration** | The request's length in hours and minutes (for example 8h 30m). |
| **Status** | **Pending**, **Approved**, **Denied**, or **Cancelled**. |
| **Requested** | When the request was made. Appears only when the table has room for it. |
| **Decided** | When the request reached its current decision. Shows — while the request is pending or when Connect does not have the time. |
| **Last changed** | When the request last changed in Connect. |

Click a column heading to sort by it, and click it again to reverse the order. Requests with no time in the sorted column are listed last. To return to the default order, click **Default order** above the table.

### Exporting Time Off

In the page header:

- Click **Export CSV** to download every request under the current filters, in the table's order.
- Click **Export PDF** to download the tiles, chart, and table as a PDF. The first page lists the date range (or the decided-on day), time zone, request count, and active filters.

See [Exporting Workforce Management Data](wfm-reference.md#exporting-workforce-management-data).

## Troubleshooting

| Message | What it means |
| --- | --- |
| *Time off could not be loaded. Check your connection and try again.* | The request for the page's data failed. Click **Retry**. |
| *No time off requests for this range.* | No requests fall in the selected range. Try a longer date range. |
| *No requests match the active filters.* | Your filters exclude every request. Widen the selection or click **Clear all filters**. |
| *No requests were decided on this day.* | Nothing was decided on the chosen **Decided on** day. |
