# Managing Recipient Lists

## Before You Begin

- You must have admin or campaign management permissions.
- You need a CSV file containing contact email addresses and any optional attributes (e.g., Language).

## Overview

The Recipient Lists page lets you manage CSV-based contact lists used in campaigns.

The page displays a table of all recipient lists with the following columns:

- **List Name** (sortable) — The name of the recipient list
- **Campaign Group** (sortable) — The campaign group the list belongs to
- **Channel** — The communication channel (e.g., Email)
- **Recipients** — The total number of contacts in the list
- **Topics** — The number of topics associated with the list
- **Status** (sortable) — The current status (e.g., Ready)

You can search lists using the search bar (by list name) and use the **Refresh recipient lists** button to update the table.

## Step-by-Step Instructions

### Adding a New Recipient List

1. Navigate to **Campaigns > Recipient Lists**.
2. Click **Add new list**.
3. Upload a CSV file. The file must include one column of email addresses, with a value present in every row — no email address may be missing. All other columns are optional. Values in those optional columns are added to each recipient's Customer Profile, where they can be referenced in email templates or in internal reports.
4. Complete the mapping step. After the file uploads, you are prompted to map each column label in your CSV to a recognized or custom field in Customer Profiles. For email campaigns, the primary field is always mapped to `email_address`.
5. Configure the list settings, including the list name and campaign group association.
6. Submit the form to create the recipient list.

### Viewing Recipient List Details

1. In the Recipient Lists table, click the name of the list you want to view.
2. The detail page opens, displaying:
   1. **List name and status** — Shown at the top of the page
   2. **Description** — Optional description of the list
   3. **Performance Summary** — Metrics including Topics, Recipients, Active Campaigns, and Open Rate, with a configurable date range
   4. **Recipients Table** — A searchable list of all email addresses and their attributes. Column headers are dynamic and reflect the field mappings defined during the Recipient List upload. The table is searchable by `email_address` only. Click **Load more** to view additional recipients.
   5. **Associated Topics** — Topics linked to this recipient list. A recipient list cannot be used in a campaign unless it is associated with the topic the campaign is being created in. A single recipient list can be associated with multiple topics within a Campaign Group. Click **Associate Topic** to link a new topic.
3. **Campaigns Using This Recipient List** — Shows which campaigns reference this list
4. To update the contact list, click **Reupload File** to upload a new CSV. Reuploading does not affect any campaigns currently using this recipient list.
5. Click **More options** for additional actions.
6. Click **Back** to return to the Recipient Lists table.
