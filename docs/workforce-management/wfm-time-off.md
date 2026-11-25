# Reviewing Team Time Off

The **Time Off** page shows who is out, and which time-off requests are waiting on a decision, for the agents in the selected instance. Use it to see today's and upcoming leave, check a day's forecasted coverage before you act on pending requests, and look up the requests decided on a given day.

## Before You Begin

- An Amazon Connect instance must be selected in the **Instance** selector
- Your role must carry the Time Off permission. It is separate from the Agent Status permission and access to Agent Status, even at admin level, does not open Time Off.

## Limits and Constraints

- The page opens on **All**: every pending request, whatever its dates, plus approved, denied, and cancelled leave from 90 days back to 90 days ahead. The other date ranges look ahead: **Today**, **Next 7d**, **Next 30d**, or a custom range on the calendar
- The table opens on **Pending** requests only; click **Show all statuses** to list every status
- **Pending** counts every pending request, whatever its dates; the date range limits which leave you see, not which decisions are waiting
- Hours on the **Out today** and **Out in range** tiles count approved leave only, and are an estimate for requests that run past the window: Connect reports one total per request, so each request is split in proportion to how much of it falls inside
- Connect publishes a request's hours only once the request is approved. A pending request shows an estimate from the agent's scheduled paid time, marked **est.**, where the schedule is published; a request denied before approval has no hours. When an approved request counted on the **Out today** or **Out in range** tile has no published hours, the tile reads *Hours not published yet* instead of a total
- Dates and times are shown in the time zone the page's data is reported in (the instance's time zone)
- Connect does not publish who approved or denied a request, so the page does not show it
- The forecasted coverage chart reaches about a week ahead; requests after the last forecast day are in the table only
- Coverage is shown for the whole contact center, or for one forecast or staffing group; other filter selections show the agents-off chart instead
- **Decided on** looks back up to 89 days and cannot pick a future day
- The **Decided** and **Last changed** columns appear only when the table has room for them, and **Staffing group** needs more room still; collapse the Filters panel or widen the window to show them
- **Headroom by forecast group** covers a year at most

## Step-by-Step Instructions

### Reading the Summary Tiles

The tiles across the top of the page summarize the selected range:

| Tile | What it shows |
| --- | --- |
| **Out today** | Agents on approved leave today, with their hours of leave beneath (or *No leave today*, or *Hours not published yet*). The information icon explains how the hours are counted. |
| **Out in range** | Agents on approved leave across the selected range, with their hours (or *No leave in range*, or *Hours not published yet*). |
| **Pending** | Requests waiting on a decision, subtitled **All dates**. |
| **Approved**, **Denied**, **Cancelled** | Requests in each outcome, subtitled **In selected range**. |

Tiles count agents, not requests: one agent with two requests is one agent off. Click **Pending**, **Approved**, **Denied**, or **Cancelled** to filter the table to that status, and click it again to clear the filter.

### Reading the Per-Day Chart

The per-day chart sits in the **Forecast and coverage** section below the requests table. The section is closed when the page opens; its header names the busiest day ahead (for example *Busiest day ahead: <day>, 5 off (2 pending)*). Click **Show** to open it and **Hide** to close it. The chart does not appear for a single-day range.

- **Forecasted coverage per day** — Where the forecast reaches the range, each bar shows the day's coverage at its busiest moment (scheduled agents over required agents), read against a **100% coverage** line. A day at or above the line is **Covered** (green); a day **Under 100%** is red and marked with **!**. Pending leave sits on top of a bar as a yellow slice: the coverage approving it all would take away. Weekends are shaded, and a day inside the forecast span without data is banded *No forecast yet*. Where the forecast ends before the range does, a note reads *The forecast reaches <day>. Requests after that are in the table below.*
- **Agents off per day** — Where the forecast reaches none of the range, the chart shows approved agents per day with pending agents stacked on top, names the **Busiest** day, and says why no coverage is shown.

Hover a day to see its full date, its approved, pending, and denied counts, and, where forecast, a **Forecast** section — for example *100% at 2:00 PM: 14 of 14 needed* and *93% if pending is approved, 1 short*. A line under 100% shows in red.

To narrow the table to one day, click its bar. The table reads *Showing requests on <day>* with a **Clear** link; click the bar again or **Clear** to remove it. Changing the date range drops a chosen day.

### Reading Headroom by Forecast Group

Below the chart in the **Forecast and coverage** section, **Headroom by forecast group** shows approved and pending leave per day against the forecast, for one forecast group at a time.

1. Choose a group in the **Forecast group** dropdown. **No forecast group** is offered when agents without a forecast group have leave in the range. Days are shown in the time zone named beside the dropdown (*Days in <zone>*).
2. Read each day's row: **Day** · **Approved** · **Pending (est.)** · **Headroom** · **If pending approved**, in hours and minutes. A negative headroom figure is a shortfall and shows in red with a minus sign, and a day that would fall short if the pending leave were approved is highlighted. A line such as *+2 requests not estimated* or *+1 request without hours* counts leave the hours leave out. A day with no forecast shows —.

Headroom is shown for the whole contact center, or for one forecast or staffing group; other filter selections show a note instead of figures.

### Filtering the Requests

In the Filters panel:

1. Under **Date range**, click **All**, **Today**, **Next 7d**, or **Next 30d**, or click **Custom** and pick a start and an end date.
2. Under **Group Filters**, click **+ Filter** to narrow to a team or other group. 
3. Under **Agents**, type in **Search agents…** and select one or more agents.
4. In the **Status** dropdown, select one or more statuses. The page opens with **Pending** selected. 
5. In the **Category** dropdown, select one or more leave categories. The list is searchable and always offers every category in the range.
6. To reset every filter, click **Clear Filters** at the top of the panel.

When a status filter is active, a line above the table reads, for example, *Showing Pending only*. On the default Pending view the line ends in **Show all statuses**, which lists every status; once you choose statuses yourself, it ends in a **Clear** link that removes just that filter. The group filters, categories, and table order are remembered for your next visit; the date range, statuses, and agents are kept in the page address, so a copied link shows its recipient the same view.

### Reviewing Requests Decided on a Day

1. In the Filters panel under **Decided on**, click **Today**, or click **Pick a day** and choose a date.
2. The table lists the requests decided that day, whatever their leave dates. The date range and the per-day chart are hidden, and the tiles show only **Approved**, **Denied**, and **Cancelled**, subtitled **Decided that day**.
3. To return to the leave-date view, click **Clear** on the *Requests decided on <day>* line above the table.

### Reading the Requests Table

When requests carry staffing groups, the table is titled **Requests by staffing group** and lists one row per staffing group, alphabetically, with **No staffing group** last. Every group is closed when the page opens: click a group's row to list its requests beneath it, or click **Expand all** or **Collapse all**. A group row shows its request count, the next pending start (*Next is <date>*), its pending hours (marked **est.** when they include an estimate), *+N not estimated* when some pending requests have no hours, and an *N pending* chip when the group also holds other statuses. Without staffing groups, the table is titled **Requests** and lists one row per request.

By default, pending requests come first, then approved, denied, and cancelled, with the soonest start first within each group. A pending request whose dates have passed is tinted and marked **Date passed**.

| Column | What it shows |
| --- | --- |
| **Agent** | The agent's name, with their Connect username beneath when available. Click the name to open the agent's Agent 360 profile. |
| **Category** | The leave category from Connect. |
| **Dates** | The days the request covers. The year is left out for the current year. When leave starts or ends part-way through a day, the clock times show beneath the dates. |
| **Duration** | The request's length in hours and minutes (for example 8h 30m). A pending request shows an estimate marked **est.** — hover it for *Estimated from the agent's scheduled paid time. Connect sets the exact figure when the request is approved.* Shows — when there is no figure; hover it for the reason: *Schedule not published for these dates, so no estimate is available.* (pending) or *Connect has not published hours for this request.* |
| **Status** | **Pending**, **Approved**, **Denied**, or **Cancelled**. |
| **Submitted** | When the request was made. |
| **Supervisor** | The supervisors of the agent's staffing group, one per line. Shows — when the agent has no staffing group or the group has no supervisor. Appears when requests carry staffing groups. |
| **Decided** | When the request reached its current decision. Shows — while the request is pending or when Connect does not have the time. Appears only when the table has room for it. |
| **Last changed** | When the request last changed in Connect. Appears only when the table has room for it. |
| **Staffing group** | The agent's staffing group. Appears when requests carry staffing groups and the table has the most room. |

Click a column heading to sort by it, and click it again to reverse the order. Requests with no value in the sorted column, such as no time or no published duration, are listed last whichever way the column is sorted. To return to the default order, click **Default order** above the table.

### Exporting Time Off

In the page header:

- Click **Export CSV** to download every request under the current filters, in the table's order. A request without published hours has an empty duration cell; a pending request's estimate is in its own **estimated_duration_minutes** column. Each row also carries the agent's **staffing_group** and **supervisors** (separated by semicolons).
- Click **Export PDF** to download the tiles, table, and **Forecast and coverage** section as a PDF; every group and the forecast section are opened for the capture. The first page lists the date range (on **All**, *All pending; decided <from> – <to>*) or the decided-on day, time zone, request count, grouping (*Grouped by: Staffing group*), and active filters.

See [Exporting Workforce Management Data](wfm-reference.md#exporting-workforce-management-data).

## Troubleshooting

| Message | What it means |
| --- | --- |
| *Time off could not be loaded. Check your connection and try again.* | The request for the page's data failed. Click **Retry**. |
| *No pending requests.* | Nothing is waiting on a decision in the default Pending view. Click **Show all statuses** to list approved, denied, and cancelled requests. |
| *No time off requests for this range.* | No requests fall in the selected range. Try a longer date range. |
| *No requests match the active filters.* | Your filters exclude every request. Widen the selection or click **Clear all filters**. |
| *No requests were decided on this day.* | Nothing was decided on the chosen **Decided on** day. |
| *Headroom could not be loaded.* | The headroom request failed. Click **Retry**. |
| *Headroom covers a year at most. Pick a shorter range to see it.* | The selected range is longer than a year. |
| *No forecast reaches these dates, so headroom cannot be shown.* | The forecast reaches about a week ahead; pick nearer dates. |
