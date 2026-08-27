# Campaign Groups

Campaign groups are the primary organizational container for all campaign assets. Create a new group when you need to onboard a new business unit, agency, or department.

## Before You Begin

- You must have admin permissions.
- Decide on a naming convention. Use descriptive names that identify the business unit (e.g., "Agency Alpha", "West Region Support").
- Plan what topics, templates, and recipient lists this group will need.

## Step-by-Step Instructions

1. Navigate to **Campaigns > Account Management**.
2. Select the account from the sidebar tree (e.g., DEFAULT).
3. In the Account Overview area, locate and click **Add new campaign group**.
4. Fill in the required fields for the new campaign group:
   - **Group Name** — A descriptive name that identifies this business unit or agency.
   - **Description** — Optional. A brief description of the group's purpose.
5. Submit the form.
6. The new group appears in the sidebar tree under the account and in the Campaign Groups table.

> **Important:** You cannot create campaigns, upload recipient lists, or create templates until at least one campaign group exists. Always create your groups first.

### What to Do After Creating a Group

A new campaign group starts empty. Complete the following setup steps:

1. Create topics within the group to organize your campaigns by subcategory.
2. Upload recipient lists so you have contacts to send campaigns to.
3. Create email templates scoped to this group for your campaign content.
4. Verify sender identities so the group has verified email addresses to send from.
5. Create your first campaign once all the above are in place.

## Viewing Campaign Group Details

The campaign group detail page is the operational hub for a specific business unit. It shows everything associated with that group and provides quick actions to create new assets.

### Step-by-Step

1. Navigate to **Campaigns > Account Management**.
2. In the sidebar tree, expand the account and click the campaign group name you want to view. Alternatively, click the group name in the Campaign Groups table on the account overview.
3. The breadcrumb trail at the top updates to show your position (e.g., DEFAULT > Agency Alpha).
4. Review the **Overview** section, which displays aggregate counts for this group:

   | Metric | What It Shows |
   |---|---|
   | Members | Number of team members with access to this group |
   | Lists | Number of recipient lists in this group |
   | Topics | Number of topics in this group |
   | Templates | Number of email templates scoped to this group |
   | Campaigns | Total number of campaigns in this group |

5. Scroll down to view the three main sections of the group detail page:

#### Topics Section

Displays a table of all topics within this campaign group.

| Column | Description |
|---|---|
| Topic Name | The name of the topic |
| Default Template | The template automatically selected when creating campaigns in this topic |
| Active Campaigns | Number of currently running campaigns in this topic |
| Subscribers | Number of subscribers associated with this topic |

**Action:** Click **Add new topic** to create a new topic within this group.

#### Recipient Lists Section

Displays a table of all recipient lists associated with this campaign group.

| Column | Description |
|---|---|
| List Name | The name of the recipient list |
| Channel | The communication channel (e.g., Email) |
| Recipients | Total number of contacts in the list |
| Topics | Number of topics the list is associated with |
| Status | Current status (e.g., Ready) |

**Action:** Click **Add new list** to upload a new recipient list to this group.

#### Recent Campaigns Section

Displays a table of campaigns within this campaign group.

| Column | Description |
|---|---|
| Campaign Name | The name of the campaign |
| Topic | The topic this campaign belongs to |
| Type | Campaign type (e.g., Email Notification, Voice Survey) |
| Recipients | Number of contacts targeted |
| Status | Current campaign status (e.g., Running, Failed) |

**Action:** Click **New campaign** to create a campaign directly within this group.

> **Note:** Creating a campaign from within a campaign group detail page pre-selects the group for you, saving a step in the campaign creation workflow. For more details about account management, see the sections above.

## Creating a New Topic

Topics are subcategories within a campaign group. They help organize campaigns and can have a default template assigned, which reduces manual configuration when creating campaigns.

### Before You Begin

- A campaign group must already exist.
- You must have admin or campaign management permissions.
- (Optional) Have an email template ready if you want to set a default template for this topic.

### Steps

1. Navigate to **Campaigns > Account Management**.
2. In the sidebar tree, expand the account and click the campaign group where you want to add the topic.
3. Scroll to the **Topics** section on the group detail page.
4. Click **Add new topic**.
5. Fill in the required fields:
   - **Topic Name** — A descriptive name for this subcategory (e.g., "Onboarding Emails", "Monthly Surveys").
   - **Default Template** — (Optional) Select a published email template to use as the default when creating campaigns in this topic.
6. Submit the form.
7. The new topic appears in the Topics table and in the sidebar tree under its campaign group.

> **Note:** Topics track subscriber counts. When you associate a recipient list with a topic, the subscriber count for that topic updates accordingly.

## Unsubscribes

Unsubscribes are scoped to topics and not any one specific recipient list. Recipient lists won't automatically update when there's a new unsubscriber detected.

Unsubscribes are tracked in 3 ways:

1. Manually adding an unsubscriber by email
2. The email recipient clicking the unsubscribe link in the email
3. The email not being able to be delivered (this can happen when an unrecognized email address is part of a recipient list or a sender gets blocked)

> **Note:** This method of tracking unsubscribers is not live. Every hour the system collects this data, adds unsubscribes, and tracks metrics.

You can download a CSV of unsubscribers to update and reupload a recipient list.

### To View Unsubscribes

1. Log in to CxPortal at your organization's portal URL.
2. In the left sidebar, locate and click **Campaigns** to expand the module.
3. From the expanded menu, click **Account Management**.
4. Choose an account in the Account section on the page.
5. Under **Topics**, click the topic name.
6. On the Topic page, click **Unsubscribes** under Topic Details.
7. Click the **Actions** button to export the list of unsubscribers or add an unsubscriber to the list.

## Adding a Recipient List to a Campaign Group

Recipient lists are scoped to campaign groups. You can add a new list directly from the campaign group detail page.

### Before You Begin

- A campaign group must already exist.
- You need a CSV file containing contact email addresses and any optional attributes (e.g., Language).
- Your CSV file must include properly formatted columns. See the Recipient Lists documentation for CSV format requirements.

### Steps

1. Navigate to **Campaigns > Account Management**.
2. In the sidebar tree, click the campaign group where you want to add the list.
3. Scroll to the **Recipient Lists** section on the group detail page.
4. Click **Add new list**.
5. Upload your CSV file containing contact email addresses and attributes.
6. Configure the list name. The campaign group is pre-selected based on where you initiated the action.
7. Submit the form.
8. Wait for processing to complete. Once the list status shows **Ready**, it is available for campaigns.

> **Tip:** You can also add recipient lists from the **Campaigns > Recipient Lists** page. The difference is that adding from Account Management pre-selects the campaign group for you.

## Creating a Campaign from a Campaign Group

You can launch a new campaign directly from a campaign group's detail page. This pre-selects the group and streamlines the creation process.

### Before You Begin

- The campaign group must have at least one topic.
- At least one recipient list with status **Ready** must exist in the group.
- At least one published email template must be scoped to the group.
- At least one verified sender identity must exist.

### Steps

1. Navigate to **Campaigns > Account Management**.
2. In the sidebar tree, click the campaign group where you want to create the campaign.
3. Scroll to the **Recent Campaigns** section.
4. Click **New campaign**.
5. The campaign creation workflow opens with the campaign group pre-selected.
6. Select the campaign type (e.g., Email Campaign, Voice Survey, Voice Notification, SMS Survey, SMS Notification).
7. Complete the campaign creation workflow:
   - **Content** — Enter the campaign name and configure content settings.
   - **Schedule** — Set start time, expiration, and quiet hours.
   - **Contact List / Recipient List** — Upload or select the contact list.
   - **Review** — Verify all settings and click **Launch**.

> **Note:** For detailed instructions on each campaign type's creation workflow, see the full Create a Campaign documentation.

> **Important:** Account settings affect all campaign groups and campaigns within the account. Review changes carefully before saving.
