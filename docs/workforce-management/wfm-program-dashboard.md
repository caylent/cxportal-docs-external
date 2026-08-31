# Monitoring the Program Dashboard

The **Program Dashboard** page shows program-wide adherence and conformance for a chosen date range.

## Before You Begin

- An Amazon Connect instance must be selected in the **Instance** selector
- Agents must have scheduled activities for the selected range — adherence and conformance are only measured against schedules
- Conformance tiles and columns show as unavailable until conformance data exists for the range

## Limits and Constraints

- The adherence and conformance target (92%) and the status thresholds (On Target ≥ 92% · At Risk 80–92% · Below Target < 80%) are fixed and cannot be configured in the UI
- Group Performance rolls up by one Group by dimension at a time
- Schedule Conformance tiles and columns show as unavailable until conformance data exists for the range
- Date ranges are bounded by the 90-day history retention

## Step-by-Step Instructions

### Reading the Page

- **KPI tiles** — Total Agents Active, Scheduled Adherence (with the count of agents in adherence), Schedule Conformance, and Agents Off Schedule, with status badges such as Below Target and Needs Attention.
- **Trends** — Schedule Adherence Trend and Schedule Conformance Trend charts, each plotted against the target line (Target 92%).
- **Group Performance** — A table grouped by the Group by dimension (LOB, Team (hierarchy), Region, Team (tag), or Routing Profile) with columns Group Name, Agents, Adherence %, In Adherence, Conformance %, In Conformance (agent-days), and Status. Status thresholds: On Target ≥ 92% · At Risk 80–92% · Below Target < 80%. Each row's Actions menu offers **View in Forecast, Capacity, and Scheduling** and **View agents**.
- **Filters** — **+ Filter**, **Date Range** (Today, 7d, 30d, Custom), and a **Timezone** dropdown.

### Choosing a Date Range

1. In the Filters panel under **Date Range**, click **Today**, **7d**, or **30d**.
2. For a custom range, click **Custom** and pick the start and end dates.
3. (Optional) Choose a timezone in the **Timezone** dropdown.

### Filtering the Program

Click **+ Filter** in the Filters panel to narrow the dashboard to specific groups. KPI tiles, trend charts, and the Group Performance table all reflect the active filters.

### Grouping the Performance Table

1. In the Group Performance section, open the **Group by** dropdown.
2. Choose **LOB**, **Team (hierarchy)**, **Region**, **Team (tag)**, or **Routing Profile**.
3. Read each row against the status thresholds: On Target ≥ 92% · At Risk 80–92% · Below Target < 80%.
