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

**Stream health** — Above the KPIs, a stream health indicator reports how fresh the underlying data is along with how many agents are reporting recently and how many have intervals in the selected range. The header also shows a freshness label — Live, Stream stale, or Historical — with Updated n ago · ±5m grace (or No stream data when no events have arrived).

**The ribbon** — Each agent row stacks three tracks, top to bottom: **Adherence/min**, **Scheduled**, and **Actual**. The time axis runs across the day (12A–11P) with a **NOW** marker at the current time. Each row ends with the agent's Today Adh percentage (Range Adh when viewing a past day) and, where present, an event count. The row header shows the agent's current status and time in status.

The legend defines the ribbon colors: **Productive**, **Offline**, **Non-Productive**, **Not scheduled / Time Off**, **No data (gap)**, and **Out of adherence / min**.

### Choosing the Day and Zoom Level

1. In the Filters panel under **Range**, click **Today** to view the current day, or click **Pick a day** and select a date from the calendar. Use the previous/next day arrows to step through days.
2. In the Filters panel's zoom dropdown, choose **Full range**, **1 hour**, **2 hours**, **4 hours**, **8 hours**, or **Custom (drag)**.

### Filtering the Ribbon

1. In the Filters panel, use the **Show** chips to limit which rows appear: **All**, **Scheduled**, **Out of adh.**, or **Time off**.
2. In the Filters panel, click **+ Filter** under **Group Filters** and choose a dimension (for example LOB, Team (hierarchy), Region, Team (tag), or Routing Profile).
3. In the search box, type an agent name to find a specific row.

### Changing View Options

1. In the Filters panel's **Sort** dropdown, choose **Lowest adherence first**, **Name**, or **Most events**.
2. In the Filters panel's **Timezone** dropdown, choose **Pacific (PT)**, **Mountain (MT)**, **Central (CT)**, **Eastern (ET)**, or **UTC**. The time axis displays in the selected timezone.

{% hint style="info" %}
The ribbon header shows the grace tolerance applied to adherence: ±5m grace.
{% endhint %}

### Opening an Agent's Profile or Scorecard

Click an agent's name to open their Agent 360 profile. To open a scorecard, use the **Search agent** box on the Agent Scorecard page. See [Viewing an Agent's Profile (Agent 360)](#viewing-an-agents-profile-agent-360) and [Reviewing Agent Scorecards](wfm-agent-scorecards.md).

## Viewing an Agent's Profile (Agent 360)

The Agent 360 page shows a single agent's profile, shift details, and time off for a chosen day. Open it by clicking an agent's name on Agent Status or Team Scorecard.

### Reading the Page

- **Shift Information** — Choose the day with **Today** or **Pick a day**, or step through days with the previous/next arrows.
- **Staff Shifts** — The agent's shift for the day, with Start, End, Last Update, and Overtime.
- **Scheduled Shift Activities** — One row per scheduled activity (for example Work, Break, Lunch) with Status (In Progress, Scheduled), Start, and End.
- **Actual Activities** — The agent's recorded activity for the day. Shows *No recorded activity for this day.* when nothing has been recorded.
- **Timeline** — The day's activities across a 12A–11P axis with a **NOW** marker.
- **Time Off** — PTO Balance as of the current date and Staff Time Off requests. A notice warns that time-off balance data may not reflect current accruals; verify in your HR system for payroll decisions.
