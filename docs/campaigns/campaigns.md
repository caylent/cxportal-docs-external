# Campaigns

### Overview <a href="#overview" id="overview"></a>

**Campaigns** lets you create, manage, and track outbound email campaigns to your contacts. Use this module to build targeted email campaigns by defining sender identities, uploading recipient lists, designing email templates, and scheduling campaign delivery. Campaigns centralize your outbound communication workflows so you can monitor performance and optimize engagement across your contact center operations.

[Watch video](https://www.youtube.com/watch?index=5&list=PLpgcSwyApvJBEYmlf0pjnS2XvFjvR8X1Y&v=KoF-f8uwW84)

***

## Benefits at a Glance  <a href="#key-terms" id="key-terms"></a>

* **Multi-Channel Outreach** — Reach contacts via Voice and SMS campaigns
* **Interactive Surveys** — Collect feedback with up to 5 questions
* **Flexible Timing** — Launch now or schedule with quiet hours
* **Performance Dashboard** — Track metrics and delivery rates in real time

<img width="2000" height="1414" alt="12" src="https://github.com/user-attachments/assets/92d3f7e8-5ca3-461c-91ee-47b3e1587b4d" />


***

## How it Works

Getting a campaign up and running takes just a few steps. You begin by creating a Campaign Group, which acts like a department to organize your campaigns and control who can see them.

From there, you build your campaign by choosing a type—Voice Survey, Voice Notification, SMS Survey, or SMS Notification—and adding your content, whether that's survey questions or message text, with options for multiple languages and fine-tuned voice playback.

Next, you decide when the campaign starts, set quiet hours and retry rules, and upload your contact list as a CSV.

Finally, you review your messages, schedule, and contacts, and launch. Once the campaign is live, you can track its performance on the Campaigns Dashboard in real time.

***

## Who Uses This <a href="#key-terms" id="key-terms"></a>

* **Business Admins** — Configure campaign groups, manage sender identities, and oversee campaign performance
* **Operations Teams** — Monitor delivery rates, track campaign statuses, and manage recipient lists
* **Developers** — Integrate campaign data with external systems and manage email template HTML
* **Sales Reps** — Review campaign performance metrics and delivery outcomes

***

## Key Concepts  <a href="#key-terms" id="key-terms"></a>

Campaigns is powerful outreach tool that lets your team engage contacts at scale across voice and SMS channels. You need to understand these terms before following the task pages.

| Term                   | Definition                                                                                                                                                             |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Campaign**           | An outbound email notification sent to a defined set of contacts using a specific template, sender identity, and schedule.                                             |
| **Campaign Group**     | An organizational unit that groups related campaigns, recipient lists, templates, and topics together. Campaign groups are typically aligned to business units or agencies.            |
| **Topic**       | A subcategory within a campaign group that further organizes campaigns. Topics have a default template and track subscriber counts.  |
| **Sender Identity** | A verified email address used as the “from” address when sending campaign emails. Only verified domains can be used to send emails. |
| **Recipient List**         | A CSV-based contact list uploaded to CxPortal that defines the email addresses and attributes of campaign recipients.    |
| **Email Template**   | A reusable, versioned HTML email layout scoped to a campaign group. Templates support Connect-style variable placeholders for personalization.                                                    |
| **Account**       | The top-level organizational container that holds campaign groups. Use Account Management to distribute target users across multiple campaign groups and topics.                                  |

***

## Prerequisites and Permissions

* You must have the appropriate admin or campaign management role assigned to your account.
* At least one Amazon Connect instance must be configured in CxPortal.
* To send campaigns, you must have at least one verified sender identity configured.
* A recipient list must be uploaded before you can create a campaign.
* At least one published email template must exist before you can create a campaign.
* AWS SES service must be put into production mode prior to using Campaigns.
* You must have a registered domain in SES in order to create sender identities. 

Campaigns are subject to role-based access. You must have a specific role designated by your organization to create campaigns. 

An Admin role can perform all functions in Campaigns.  
A User role can use campaigns but can’t manage users, enable or disable accounts, create accounts, or delete campaign groups.


***

## What You Can Do

* Access the campaigns browser → [Getting Started with Campaigns](getting-started-with-campaigns.md)
* Create voice survey campaigns→ [Voice Survey Campaigns ](voice-survey-campaigns.md)
* Create voice notification campaigns→ [Voice Notification Campaigns](voice-notification-campaigns.md)
* Create SMS survey campaigns→ [SMS Survey Campaigns](sms-survey-campaigns.md)
* Create SMS notification campaigns→ [SMS Notification Campaigns](voice-notification-campaigns.md)
* Manage campaign groups → [Manage Campaign Groups](manage-campaign-groups.md)
* Review the campaigns dashboard→ [Campaigns Dashboard](campaigns-dashboard.md)
* Review best practices → [Campaigns Best Practices](campaigns-best-practices.md)

***

## Common Use Cases

The following scenarios highlight when Campaigns is commonly used.

<details>

<summary><strong>Manage outreach</strong></summary>

Campaign Groups can organize campaigns by department or function, ensuring each team only sees and manages the campaigns relevant to them. The Dashboard's filtering tools make it easy to monitor performance across groups from one central view.

</details>

<details>

<summary><strong>Collect feedback</strong></summary>

Use a Voice Survey or SMS Survey campaign to gather structured responses from contacts through a series of up to 5 questions. Results are tracked automatically on the Dashboard, giving your team clear insight into response and delivery rates without manual follow-up.

</details>

<details>

<summary><strong>Customize outbound notifications</strong></summary>

Customize Voice Notification or SMS Notification campaign to send important updates, reminders, or announcements to a large list of contacts at once. Messages can be scheduled in advance or launched immediately, making it easy to reach your audience at the right time.

</details>

***

## Related Modules

* **CxPortal** — CxPortal is a web-based portal built by Caylent that simplifies the management and configuration of your Amazon Connect contact center. CxPortal sits on top of your Amazon Connect environment and is accessed through CxCentral, your unified Caylent workspace. Together they give your organization a single place to manage your contact center and get support.
* **CxCentral** — Your unified Caylent workspace — the hub you land on when you first log in, giving you access to CxPortal and all other Caylent products, support, and resources.

<br>
