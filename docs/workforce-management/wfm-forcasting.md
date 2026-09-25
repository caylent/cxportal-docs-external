# Checking Forecast, Capacity, and Scheduling

The **Forecast, Capacity, and Scheduling** page shows today's expected demand and whether the roster covers it. It appears for instances with Amazon Connect Forecasting, Capacity Planning & Scheduling (FCS) data, which refreshes via Athena (the footer shows when the forecast was last updated).

## Before You Begin

- An Amazon Connect instance must be selected in the **Instance** selector
- The instance must have the Forecasting, Capacity Planning & Scheduling (FCS) add-on licensed and its data pipeline connected — the page appears in the sidebar only for these instances
- A forecast must exist for your filter selection; sections show *No forecast available for this selection.* until one does

## Limits and Constraints

- The page appears only for instances with the Connect Forecasting, Capacity Planning & Scheduling (FCS) add-on and its data pipeline
- Forecast data refreshes via Athena on a delay — check the "Last updated" footer rather than treating figures as live
- Available Agents and Scheduled vs Available show awaiting time-off data until time-off data is connected
- Charts cover a rolling 12-hour window and the next 5 days; the coverage heat-map requires a forecast for the current filter selection
- The rolling 12-hour volume chart labels only its whole-hour points — the quarter-hour points between them are plotted but not labelled
- The page is read-only — schedule changes are made in Amazon Connect FCS (use the **View in Connect FCS** link)

## Step-by-Step Instructions

### Reading the Page

- **Capacity Planning** — KPI tiles for Forecasted Agents (peak interval demand), Scheduled Agents (rostered for the shift), Forecast vs Scheduled (overstaffed or understaffed), Volume Forecast (projected contacts today), Occupancy, Available Agents, and Scheduled vs Available. The last two show *awaiting time-off data* until time-off data is available. A warning banner lists understaffed windows (for example 9:00 AM–7:15 PM (-30)) with a **View in Connect FCS** link. Each KPI tile label and the **Understaffed windows** banner label carry an information icon; click it to open a popover with the metric's definition, a **How it's calculated** list, and, where applicable, the data **Source**.
- **Volume Forecast** — A rolling 12-hour contact volume chart, labelled at its whole-hour points only with the value printed above each labelled point, and a next 5-day contact volume chart.
- **Agent Forecast** — A rolling 12-hour comparison of Agents Forecasted vs Agents Scheduled, plus a coverage heat-map.
- **Filters** — **+ Filter** (Forecast Group / Queue / Staffing) and a **Timezone** dropdown.

### Scoping the Forecast

1. In the Filters panel, click **+ Filter** under **Forecast Group / Queue / Staffing**.
2. Choose a dimension and select one or more values. Every dimension the instance reports is offered; one it has no values for opens to **No values**. The KPI tiles and charts recalculate for your selection.
3. Selected values appear as chips below **+ Filter**, each with an **✕** remove button for that value.
4. To reset, click **Clear Filters** at the top of the panel.

### Reviewing Understaffed Windows

1. Check the warning banner above the KPI tiles — it lists each understaffed window with its time range and shortfall (for example 9:00 AM–7:15 PM (-30)).
2. To adjust schedules, click **View in Connect FCS**. Scheduling changes are made in Amazon Connect FCS, not in CxPortal.

### Changing the Timezone

In the Filters panel's **Timezone** dropdown, choose a timezone. Charts and time ranges display in the selected timezone.

### Checking Data Freshness

The page footer shows when the forecast was last updated. Treat figures as periodically refreshed, not live.
