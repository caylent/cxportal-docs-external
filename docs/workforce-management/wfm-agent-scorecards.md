# Reviewing Agent Scorecards

The **Agent Scorecard** page shows per-agent adherence and activity KPIs for a date range you choose, with a scheduled-vs-actual timeline and an exportable day-by-day detail table.

## Before You Begin

- An Amazon Connect instance must be selected in the **Instance** selector
- Until you pick an agent, the page shows *Select an agent to view their scorecard.*

## Limits and Constraints

- The page shows one agent at a time — there is no side-by-side comparison; use Team Scorecard for cross-agent views
- Schedule Conformance shows awaiting data until conformance data is available for the range
- Change indicators apply to Today (vs. last day) and 7d (vs. last week) only
- Custom ranges are bound by the 90-day history retention
- Export CSV downloads the Adherence detail table only, not the KPI cards or timeline

## Step-by-Step Instructions

### Selecting an Agent and Date Range

1. In the **Search agent** box, type the agent's name.
2. Select the agent from the matching results.
3. In the Filters panel under **Range**, choose a date range: **Today**, **7d**, **30d**, or **Custom**. The Filters panel also offers a Routing Profile filter.
   - For **Custom**, click a start date in the calendar, then click an end date.

{% hint style="info" %}
You can also land on this page with an agent pre-selected by following a drill-in link.
{% endhint %}

### Reading the KPI Cards

- **Adherence** — The agent's adherence percentage for the selected range, with a change indicator against the prior period (from last day for **Today**, from last week for **7d**) and the total time in and out of adherence (for example 8h 32m in / 46h out). A per-day chart shows the daily adherence values across the range.
- **Schedule Conformance** — The agent's conformance percentage. Shows **—** with *awaiting data* until conformance data is available.
- **Contacts Handled** — The number of contacts the agent handled in the range, with per-day values.

### Reading the Adherence Timeline

The **Adherence Timeline** shows the range's overall adherence percentage and one column per day (or per hour when viewing **Today**). Each column has two tracks — **Top: Scheduled · Bottom: Actual**:

- The scheduled track shows the planned activities (for example **Work**, **Break**, **Lunch**)
- The actual track shows what the agent actually did (for example **Available**, **Break**, **Lunch**, **Offline**)

The legend defines the colors: **Productive**, **Non-productive**, **Offline**, and **Out of adherence / min**, with a **±5m grace** tolerance applied.

### Reviewing and Exporting Adherence Detail

1. Review the Adherence detail table below the timeline — it lists each day in the range.
2. Review the columns: **Date**, **Scheduled Hours**, **Actual Hours**, **Adherence %**, **Conformance %**, **Exception Count**, and **Exception Types**.
3. Click **Export CSV** to download the table.
