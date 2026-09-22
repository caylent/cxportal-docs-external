# Reviewing Team Scorecards

The **Team Scorecard** page shows scheduled vs. actual adherence for all agents on a single timeline, one ribbon row per agent.

## Before You Begin

- An Amazon Connect instance must be selected in the **Instance** selector
- Adherence appears only for agents with scheduled activities for the selected day

## Limits and Constraints

- Ribbon rows appear only for agents with scheduled activities on the selected day
- Schedule data refreshes from Connect FCS roughly every 15 minutes, so a just-published shift change may lag; check the stream-health indicator for freshness
- The ±5m grace tolerance is fixed and cannot be changed in the UI
- Gaps in the event stream render as No data (gap) rather than as adherence verdicts
- Historical days are limited by the 90-day event-history retention

## Step-by-Step Instructions

### Reading the Team Scorecard Page

**Team KPIs** across the top:

- **Team Adherence Today** — The team-wide adherence percentage for the selected day (labeled Team Adherence for Range when viewing a past day)
- **On Schedule Now** — How many agents are currently on schedule, as a fraction (for example 7 / 12)
- **Out of Adherence** — Number of agents currently out of adherence
- **Time Off** — Number of agents on time off
- **Events Today** — Count of adherence events for the day (labeled Events for Range when viewing a past day)

**Stream health** — Above the KPIs, a stream health indicator reports how fresh the underlying data is along with how many agents are reporting recently and how many have intervals in the selected range. The header also shows a freshness label — Live, Stream stale, or Historical — with Updated n ago · ±5m grace. A banner appears when the stream is minutes or hours behind. A range with no agent events at all is not flagged on the page: off-hours and unstaffed windows are routinely empty, which says nothing about the health of the pipeline.

**The ribbon** — Each agent row stacks three tracks, top to bottom: **Adherence/min**, **Scheduled**, and **Actual**. The time axis runs across the day (12A–11P) with a **NOW** marker at the current time. Each row ends with the agent's Today Adh percentage (Range Adh when viewing a past day) and, where present, an event count. The row header shows the agent's current status and time in status.

The legend defines the ribbon colors: **Productive**, **Offline**, **Non-Productive**, **Not scheduled / Time Off**, **No data (gap)**, and **Out of adherence / min**.

### Choosing the Day and Zoom Level

1. In the Filters panel under **Range**, click **Today** to view the current day, or click **Pick a day** and select a date from the calendar. Use the previous/next day arrows to step through days.
2. In the Filters panel's zoom dropdown, choose **Full range**, **1 hour**, **2 hours**, **4 hours**, **8 hours**, or **Custom (drag)**.

### Filtering the Ribbon

1. In the Filters panel, use the **Show** chips to limit which rows appear: **All**, **Scheduled**, **Out of adh.**, or **Time off**.
2. In the Filters panel, click **+ Filter** under **Group Filters** and choose a dimension (for example LOB, Team (hierarchy), Region, Team (tag), or Routing Profile). Values show how many agents match them when the instance reports counts (for example L1_KY (13)), and a dimension the instance reports no values for opens to **No values**. Selected values appear as chips below **+ Filter**, each with an **✕** remove button; **Clear Filters** at the top of the panel clears them all.
3. In the search box, type an agent name to find a specific row.

### Changing View Options

1. In the Filters panel's **Sort** dropdown, choose **Lowest adherence first**, **Name**, or **Most events**.
2. In the Filters panel's **Timezone** dropdown, choose **Pacific (PT)**, **Mountain (MT)**, **Central (CT)**, **Eastern (ET)**, or **UTC**. The time axis displays in the selected timezone.

!!! note

    The ribbon header shows the grace tolerance applied to adherence: ±5m grace.

### Opening an Agent's Profile or Scorecard

Click an agent's name to open their Agent 360 profile. To open a scorecard, use the **Search agent** box on the Agent Scorecard page. See [Viewing an Agent's Profile (Agent 360)](#viewing-an-agents-profile-agent-360) and [Reviewing Agent Scorecards](wfm-agent-scorecards.md).

## Viewing an Agent's Profile (Agent 360)

The Agent 360 page shows a single agent's profile, shift details, and time off for a chosen day. Open it by clicking an agent's name on Agent Status or Team Scorecard.

### Reading the Page

- **Shift Information** — Choose the day with **Today** or **Pick a day**, or step through days with the previous/next arrows. The chosen day is kept in the page address, so a link to the profile reopens on the same day.
- **Staff Shifts** — The agent's shift for the day, with Start, End, Last Update, and Overtime.
- **Scheduled Shift Activities** — One row per scheduled activity (for example Work, Break, Lunch) with Status (In Progress, Scheduled), Start, and End.
- **Actual Activities** — The agent's recorded activity for the day, one row per stretch with **Activity**, **Start**, **Duration**, and an **Adherence** chip — **Adherent** (✓), **Non-adherent** (✗), or **Unscheduled** (no glyph). Shows *No recorded activity for this day.* when nothing has been recorded.
- **Now divider** — On today, both activity tables show a **Now** row where the current time falls, so the day reads as done above and still to come below.
- **Activity summary** — Above the tables, two panels summarize the day. **Time by activity** totals the day's actual activity per status as ranked bars, each with its duration and share of observed time (for example 2h 30m (31%)). **Adherence stats** lists **Adherence**, **Conformance**, **Worked**, and **Scheduled**, plus **Out of adherence** and **Unscheduled** when there is any. Unscheduled is time with nothing scheduled over it and is excluded from the adherence score, and Conformance can read over 100% when the agent worked more than was rostered. While the day is still running, both panel labels end in **· intraday** (for example Adherence stats · intraday) because they score only the part of the day that has happened; a finished day carries no marker.
- **Timeline** — Three stacked tracks for the day, mirroring the Team Scorecard ribbon: an **Adherence per minute** band that marks only out-of-adherence stretches in red, a **Scheduled** lane, and an **Actual** lane. Hovering a segment shows which track it belongs to, what it was, and its time range, and highlights the matching segment in the other lane. On today, a blue **NOW** rule marks the current time and the remainder of the Actual lane is dashed to show it has not happened yet. The axis is trimmed to the day's activity plus two hours either side rather than always spanning 12A–11P. Shows *Nothing to visualize for this day.* when both lanes are empty.
- **Time Off** — PTO Balance as of the current date and Staff Time Off requests. A notice warns that time-off balance data may not reflect current accruals; verify in your HR system for payroll decisions.
