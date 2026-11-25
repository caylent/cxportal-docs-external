# Managing Release Notes Email

You can choose which of your team members receive Release Notes emails. One recipient list applies to your whole company.

For what you can read in release notes, see [Viewing Release Notes](viewing-release-notes.md).

## Before You Begin

- To open the **Notifications** page, you need a release notes subscriptions reader or admin permission [VERIFY: permission display names in Access Management — the code names them `release-notes-subscriptions-reader` and `release-notes-subscriptions-admin`]
- Only users with the admin permission can change the recipient list; with the reader permission, you can view it

## Limits and Constraints

- A recipient list can include at most 100 users
- You can add only active users from your company; deactivated users are not offered
- [GAP: whether users who exist only in your identity provider, and have no CxPortal user record, can be added as recipients — Source needed: SME]
- [GAP: which emails recipients receive and when they are sent — Source needed: SME]

## Step-by-Step Instructions

### Opening the Recipient List

1. Open CxCentral and click **Admin**.
2. In the left menu, click **Notifications**.
3. On the **Release Notes Email** card, click to open the recipient list. The card shows how many users currently receive Release Notes emails.

The recipient list opens in a panel on the right. Its heading shows how many recipients there are, and each row shows the recipient's name and email. To find a recipient, type in **Search Recipients**.

!!! info ""

    A recipient who no longer matches a user in your company reads **Not in your company users**.

### Adding Recipients

1. In the recipient panel, open **Add users**.
2. Type in **Search by name or email**, then select one or more users. The users you select appear above the list until you save.
3. Click **Save Changes**.

### Removing Recipients

1. In the recipient list, select the checkbox beside each recipient you want to remove, or select **Select all**.
2. Click **Remove from list**. Each row you removed reads **Will be removed**; click **Undo** on a row to keep that recipient.
3. Click **Save Changes**.

The footer of the panel counts your pending changes — for example *2 users to be added* and *1 user to be removed*. **Save Changes** is available only when there are changes and the list stays within 100 users. To discard your changes, click **Cancel**.

When the list saves, you see *Release notes recipients saved*.

## Troubleshooting

| Problem | What to do |
| --- | --- |
| The page shows **Could not load release notes subscriptions** | Click **Retry**. |
| The page shows *Could not load company users.* | Reload the page. [VERIFY: recommended action] |
| You see *Failed to save release notes recipients* | Your changes were not saved. Click **Save Changes** again. |
| **Save Changes** stays unavailable | Check that you have made a change, that the list has no more than 100 users, and that you have the admin permission. |
