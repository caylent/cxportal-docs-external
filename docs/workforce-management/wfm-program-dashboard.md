# Monitoring the Program Dashboard

The **Program Dashboard** page shows program-wide adherence and conformance for a chosen date range.

## Before You Begin

- An Amazon Connect instance must be selected in the **Instance** selector
- Agents must have scheduled activities for the selected range — adherence and conformance are only measured against schedules
- Conformance tiles and columns show as unavailable until conformance data exists for the range

## Limits and Constraints

- The adherence and conformance target (92%) and the Adherence status thresholds (On Target ≥ 92% · At Risk 80–92% · Below Target < 80%) are fixed and cannot be configured in the UI
- Group Performance rolls up by one Group by dimension at a time
- Schedule Conformance tiles and columns show as unavailable until conformance data exists for the range
- Date ranges are bounded by the 90-day history retention

## Step-by-Step Instructions

### Reading the Page

- **KPI tiles** — Total Agents Active, Scheduled Adherence (with the count of agents in adherence), Schedule Conformance, and Agents Off Schedule, with status badges such as Below Target and Needs Attention.
- **Trends** — Schedule Adherence Trend and Schedule Conformance Trend charts, each plotted against the target line (Target 92%).
- **Group Performance** — A table grouped by the Group by dimension (LOB, Team (hierarchy), Region, Team (tag), or Routing Profile) with columns Group Name, Agents, Adherence %, In Adherence, Conformance %, In Conformance (agent-days), and Adherence status. The legend names the metric the bands apply to: Adherence: On Target ≥ 92% · At Risk 80–92% · Below Target < 80%. Adherence status is classified from Adherence % alone, so a row can read Below Target beside a high Conformance %. Each row's Actions menu offers **View in Forecast, Capacity, and Scheduling** and **View agents**.
- **Filters** — **+ Filter**, **Date Range** (Today, 7d, 30d, Custom), and a **Timezone** dropdown. Selected filter values appear as chips below **+ Filter**, each with an **✕** remove button.

### Choosing a Date Range

1. In the Filters panel under **Date Range**, click **Today**, **7d**, or **30d**.
2. For a custom range, click **Custom** and pick the start and end dates.
3. (Optional) Choose a timezone in the **Timezone** dropdown.

### Filtering the Program

Click **+ Filter** in the Filters panel to narrow the dashboard to specific groups. Every dimension the instance reports is offered, including one that currently has no values — that dimension opens to **No values** rather than being hidden. KPI tiles, trend charts, and the Group Performance table all reflect the active filters.

!!! info ""

    A selection whose agents all score zero is still a scored population: the dashboard renders, with zeroes. *No adherence data for this selection yet. Widen the date range or clear the filters.* appears only when nothing in the selection was scored at all.

### Grouping the Performance Table

1. In the Group Performance section, open the **Group by** dropdown.
2. Choose **LOB**, **Team (hierarchy)**, **Region**, **Team (tag)**, or **Routing Profile**.
3. Read each row against the Adherence status thresholds: On Target ≥ 92% · At Risk 80–92% · Below Target < 80%.
