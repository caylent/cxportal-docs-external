# Manage Campaign Groups

## Before You Begin

The Campaign Groups page allows administrators and authorized users to organize campaigns into logical groups, which function as departments within the platform. These groups help segment campaign activity and can be assigned to users who will only see the campaigns relevant to their group. Each group tracks the percentage of SMS and Voice campaign activity associated with it.

Before working with the Campaign Groups page, make sure you have the following in place:

* **Access to CxPortal** — The Campaign Groups page lives inside CxPortal, so you'll need the sign-in credentials your organization provides. From there, navigate via the left menu to Campaigns, then Campaign Groups.
* **The right permissions** — Campaign Groups are managed by administrators and authorized users, so you'll need the appropriate role to create or delete groups.
* **A naming plan** — Decide on a clear group name before you create one, since the name will be visible to all users assigned to that group.

***

## Limits and Constraints

Keep the following in mind when working with the Campaign Groups page:

* **Groups are required for campaigns** — Every campaign must belong to a group, so at least one group needs to exist before any campaigns can be created.
* **Group-based visibility** — Groups function like departments. Users assigned to a group only see the campaigns relevant to that group, so naming and organization affect what each user can view.
* **Visible group names** — The name you assign is shown to all users in that group, so it should be meaningful and appropriate.
* **Activity tracking per group** — Each group displays the percentage of SMS and Voice campaign activity associated with it, along with its creation date.
* **Deletion is permanent** — Deleting a group cannot be undone. Once you confirm, the group is permanently removed from the system.
* **Post-campaign retention** — After a campaign ends, it remains visible for two months before its associated resources are removed from Amazon Connect, though campaign metrics are retained.

***

## Step-by-Step Instructions

### Access the Campaign Groups page

1. Log in to CxPortal.
2. In the left-hand navigation, click **Campaigns**.
3. Click **Campaign Groups**.

***

### Campaign Groups Page

The Campaign Groups page displays all existing campaign groups and includes the following columns:

* **Department Name** — The name assigned to the campaign group. This is the name visible to all users assigned to this group.
* **SMS Percent** — Shows the percentage of SMS-type campaigns associated with this group.
* **Voice Percent** — Shows the percentage of Voice-type campaigns associated with this group.
* **Created** — The date the campaign group was created.
* **Delete (Trash Icon)** — A delete button used to remove the group.

***

### Create a Campaign Group

1. Open CxPortal.
2. Click **Campaigns** and then **Campaign Groups**.
3. Click the **+ Create Campaign Group**.
4. Enter the Campaign Group Name in the popup window. The name will be visible to all users assigned to this group.
5. Once you have entered the name, click the **+ Create button** to confirm and create the group.
6. After successful creation, the new group will appear as a new row in the Campaign Groups table.

***

### Delete a Campaign Group

<mark style="background-color:$warning;">**Warning: Deleting a campaign group is a permanent action and cannot be undone.**</mark>

1. Locate the campaign group you wish to delete in the table.
2. Click the **trash can (delete) icon** on the far right of that group's row.
3. A confirmation message appears. If you wish to proceed, click **Delete**. The group will be permanently removed from the system.

After a campaign ends, it will appear on the dashboard for 2 months. After 2 months, all associated resources for the campaign are deleted inside of Amazon Connect. However, the campaign metrics will remain.


