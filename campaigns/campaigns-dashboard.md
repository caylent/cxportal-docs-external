# Campaigns Dashboard

## Before You Begin

The Campaigns Dashboard is your central hub for tracking the performance of your agencies and campaigns. On the Dashboard you can see a comprehensive performance overview, your Campaigns history, and Groups search filters.

Before using the Campaigns Dashboard, make sure you have the following in place:

* **Access to CxPortal** — The Dashboard lives inside CxPortal, so you'll need the sign-in credentials your organization provides. From there, navigate via the left menu to CxPortal, then Campaigns, then Dashboard.
* **The right permissions** — Campaigns use role-based access. Your assigned role and group determine what you're able to see and do on the Dashboard.
* **Existing campaigns or groups** — The Dashboard reflects campaign activity, so if this is your first time using Campaigns, you'll want to create a Campaign Group and at least one campaign before there's performance data to view.

***

## Limits and Constraints

Keep the following in mind when working with the Campaigns Dashboard:

* **Group-based visibility** — You'll only see the campaigns associated with the groups you're assigned to, so your view may differ from other users'.
* **Fixed set of metrics** — The Performance Overview displays five metric cards: Active Campaigns, Send Attempts, Delivery Rate, Survey Responses, and Spam Rate. Each shows its current value alongside the percentage change from the previous equivalent period.
* **Survey response counting** — Survey Responses are only counted when a survey is completed in full; partial responses are not included.
* **Available time ranges** — Metrics can be viewed by last day, last week (the default), last month, or a custom date range, but only one range applies to the overview at a time.
* **Filter options** — The Dashboard can be filtered by Campaign Group, Type, and Status; filters must be applied to update the view and cleared to reset it.
* **Post-campaign retention** — After a campaign ends, it remains visible on the Dashboard for two months. After that, its associated resources are removed from Amazon Connect, though the campaign metrics are retained.

***

## Step-by-Step Instructions

### **Access the Campaigns Dashboard**

1. Open **CxPortal**.
2. In the left menu, click **Campaigns**, and then **Dashboard**.

***

### Use Filters

The filters on the Campaigns Dashboard allow you to narrow down which campaigns appear in the Performance Overview and Campaigns list.

The Selected Groups filter allows you to search for and select one or more Campaign Groups. A search box appears at the top of the dropdown, and you can choose individual groups or select all to include all available groups.

The **Type filter** allows you to filter campaigns by their type. The available campaign types are:

* Voice Survey
* SMS Survey
* Voice Notification
* SMS Notification

The **Status filter** allows you to filter campaigns by their status. The available statuses are:

* Initialized
* Running
* Scheduled
* Completed
* Paused
* Stopped
* Failed
* Processing

Once you've made your filter selections, click **Apply Filters** to update the dashboard. To remove all active filters and reset the view, click **Clear Filters**.

***

## Performance Overview

The Performance Overview section of the Campaigns Dashboard displays high-level metrics for your campaigns. To change the period for the displayed metrics, click the time range dropdown in top-right corner. The time range defaults to Last week, but can be changed to Last day, Last month, or a custom range.

***

### Time Range Options

Clicking the time range button reveals a dropdown with four options:

* **Last day** — Shows metrics from the past 24 hours
* **Last week** — Shows metrics from the past 7 days (default)
* **Last month** — Shows metrics from the past 30 days
* **Custom range** — Opens a two-month calendar date picker so you can select a specific start and end date; click Apply to confirm your selection or Cancel to dismiss it

***

### Metric Cards

The Performance Overview displays five metric cards, each showing the current value and a percentage change compared to the previous equivalent period.

**Metric Definitions**

**Active Campaigns** — The number of campaigns currently running

**Send Attempts** — The total number of outreach attempts made

**Delivery Rate** — The percentage of send attempts that were successfully delivered.

**Survey Responses** — The number of survey responses received. Survey metrics are only counted if the survey is completed in full

**Spam Rate** — The percentage of sends flagged as spam

***

### Campaigns List

The Campaigns list shows the total number of Campaigns. The Campaigns list is displayed in a table with the following columns:

**Campaign Name** — The name assigned to the campaign

**Campaign Group** — The group the campaign belongs to

**Type** — The campaign type (Voice Survey, Voice Notification, SMS Survey, SMS Notification)

**Contacts** — The number of contacts targeted by the campaign

**Response Rate** — The percentage of contacts who responded

**Delivery Rate** — The percentage of contacts successfully reached

**Status** — The status of the campaign

***

### Search for Campaigns

The Search list bar allows you search for Campaigns by name. Type the name of your campaign into the search bar to filter the Campaign list.

***

### Describe Campaigns View

The Describe Campaigns View allows you to view details for a specific campaign to see specific metrics for each campaign type.

For Voice Campaigns you can see metrics such as:

* Delivery Attempts
* Contacts Abandoned (A contact is considered "abandoned" if they hang up the call before the survey or notification is finished)
* Average Dials Per Minute.

If voicemail is enabled for that campaign, you can also see:

* Human Answer Rate
* Voicemail Rate

For SMS campaigns, you can see metrics such as:

* Delivery Attempts
* Send Attempts
* Delivered Rate
* Spam Rate
