# Workforce Management

## Overview

Workforce Management gives supervisors real-time and historical visibility into agent activity, schedule adherence, and team performance across your Amazon Connect contact centers. Use this module to monitor what each agent is doing right now, compare actual activity against scheduled shifts, and identify adherence issues before they affect service levels. Workforce Management is engineered for enterprise scale with sub-minute status updates and minute-by-minute adherence history.

## Benefits at a Glance

- **See your floor in real time** — Live agent status, contacts in progress, and time-in-status for every agent, with sub-minute updates instead of waiting on interval reports.
- **Catch adherence issues as they happen** — Minute-by-minute scheduled-vs-actual ribbons and out-of-adherence flags surface who's off schedule before service levels slip.
- **Go from team to agent in one click** — Drill from a team-wide view into an agent's scorecard or Agent 360 profile, with shifts, activities, and time off in one place.
- **Staff to the forecast, not a guess** — Compare forecasted demand against the actual roster and spot understaffed windows before they hit the queue.
- **Manage the whole program on one page** — Program-wide adherence and conformance tracked against target, broken down by LOB, team, region, or routing profile.

## How It Works

- **Live events stream in from Amazon Connect** — Every agent status change (login, Available, handling a contact, Offline) streams from your Connect instance through Kinesis and lands in CxPortal within seconds. This feeds the Agent Status page, so status, time-in-status, and contacts in progress are genuinely real time.
- **Schedules arrive from Connect FCS** — Scheduled shifts and activities (Work, Break, Lunch) come from the Amazon Connect Forecasting, Capacity Planning & Scheduling add-on via Athena queries, refreshing roughly every 15 minutes. A just-published schedule change can briefly lag; the stream-health indicator on each page tells you how fresh the data is.
- **Adherence is computed minute by minute** — CxPortal lines up each agent's scheduled activity against their actual activity for every minute of the day, applying a ±5-minute grace tolerance so a slightly early break doesn't count against the agent. Those per-minute verdicts roll up into everything you see.
- **Everything is scoped to your instance** — All pages read from the Amazon Connect instance selected in the **Instance** selector, and history is retained at minute granularity for 90 days for scorecard ranges and trend charts.

## Who Uses This

- **Operations Teams** — Monitor real-time agent status, review team adherence, and drill into individual agent scorecards.
- **Workforce Management Leads** — Analyze adherence trends, compare teams, and identify scheduling gaps across lines of business.

## Key Concepts

| Term | Definition |
| --- | --- |
| **Schedule Adherence** | A measure of how closely an agent follows their assigned schedule. Expressed as a percentage comparing planned activity to actual activity over a time period. |
| **Adherence Ribbon** | A minute-by-minute visual timeline that shows an agent's scheduled activity on one lane and actual activity on another, highlighting divergences. |
| **Agent Event** | A real-time status change streamed from Amazon Connect via Kinesis (e.g., agent logs in, changes to Available, begins handling a contact). Delivered within seconds. |
| **AUX Code** | An auxiliary status code in Amazon Connect representing non-call agent activity (e.g., Break, Training, Lunch). |
| **FCS Data** | Forecasting, Capacity, and Scheduling data from the Amazon Connect Analytics Data Lake. Refreshed approximately every 15 minutes via Athena queries. |
| **Agent Population** | A filtered set of agents defined by LOB, team (hierarchy), region, team (tag), routing profile, staffing group, or forecast group. |

## Prerequisites and Permissions

Before you begin:

- **Permissions** — Your CxPortal account must have the **Workforce Management permission** assigned to your role.
- **Amazon Connect Instance** — At least one Amazon Connect instance must be configured in CxPortal with the Workforce Management add-on (Forecasting, Capacity Planning & Scheduling) licensed.
- **Data Pipeline** — The Kinesis agent event stream and all tables must be provisioned and connected to CxPortal for your instance.

## What You Can Do

Use Workforce Management to:

- Monitor live agent status and distribution → [Monitoring Live Agent Status](wfm-monitor-agent-status.md)
- Compare scheduled vs. actual adherence for all agents on a timeline → [Reviewing Team Scorecards](wfm-team-scorecard.md)
- Review a single agent's adherence and activity KPIs, and export the detail to CSV → [Reviewing Agent Scorecards](wfm-agent-scorecards.md)
- Check today's demand forecast against the roster → [Checking Forecast, Capacity, and Scheduling](wfm-forcasting.md)
- Monitor program-wide adherence and conformance → [Monitoring the Program Dashboard](wfm-program-dashboard.md)
- Review Workforce Management reference materials → [Workforce Management Reference](wfm-reference.md)
- Review Workforce Management best practices → [Workforce Management Best Practices](wfm-best-practices.md)

## Common Use Cases

- **Intraday floor monitoring** — A supervisor keeps Agent Status open through the shift to watch who's available, offline, or sitting long in a status. When the at-a-glance donut shifts or an agent shows heavy time out of adherence, they filter to that team or routing profile and step in — moving coverage or nudging an agent back on schedule before queues build.
- **Adherence coaching with evidence** — A workforce management lead reviews the Team Scorecard at end of day to spot agents repeatedly out of adherence, then opens each agent's scorecard for the 7- or 30-day view: adherence percentage and trend, exception counts and types, day-by-day detail. They export the table to CSV and bring concrete examples — not impressions — into the coaching conversation.
- **Staffing to tomorrow's demand** — An operations manager compares the forecast against the actual roster. Understaffed windows are flagged with the exact time ranges and shortfall, so they can adjust schedules, approve overtime, or shift agents between queues.

## Related Modules

- **CxPortal** — CxPortal is a web-based portal built by Caylent that simplifies the management and configuration of your Amazon Connect contact center. CxPortal sits on top of your Amazon Connect environment and is accessed through CxCentral, your unified Caylent workspace. Together they give your organization a single place to manage your contact center and get support.
- **Access Management** — Assign the Workforce Management permission to user roles so they can access Workforce Management views.
