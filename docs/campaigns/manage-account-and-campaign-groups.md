# Manage Account and Campaign Groups

## Overview

Account Management is the organizational backbone of the Campaigns module. It provides a centralized interface for managing the hierarchy that organizes all campaign assets — campaign groups, topics, recipient lists, templates, and campaigns themselves.

Navigate to **Campaigns > Account Management** in the left sidebar to access this page.

> **Note:** Only Admins can manage users, create or disable accounts, and delete campaign groups.

| Function | What It Does |
|---|---|
| Account overview | View aggregate counts of all campaign assets across your account |
| Campaign group management | Create, view, and organize business units or agencies |
| Topic management | Create subcategories within campaign groups to organize campaigns |
| Recipient list association | View and add recipient lists scoped to a campaign group |
| Campaign creation | Launch new campaigns directly from within a campaign group |
| Account settings | Configure account-level options |

## Understanding the Account Hierarchy

Campaigns uses a three-level organizational hierarchy. Every campaign asset (recipient lists, templates, campaigns) is scoped to a specific level in this tree. Understanding this structure is essential before performing any account management task.

### The Three Levels

| Level | Example | Contains | Purpose |
|---|---|---|---|
| Account | DEFAULT | Campaign Groups | Top-level container. Most instances have a single account. Sender identities are scoped to an account. |
| Campaign Group | Agency Alpha, Region West | Topics, Templates, Recipient Lists, Campaigns | Represents a business unit, agency, or department. All campaign assets are scoped here. |
| Topic | Onboarding, Surveys, Alerts | Campaigns, Subscribers | Subcategory within a group. Associates a default template and tracks subscriber counts. |

> **Note:** A campaign group must exist before you can create topics, upload recipient lists, create templates, or launch campaigns within it. Plan your group structure first.

### How the Sidebar Tree Works

The left sidebar of the Account Management page displays your hierarchy as an expandable tree:

1. The top level shows your account name (e.g., DEFAULT).
2. Click the expand arrow next to the account to reveal all campaign groups.
3. Click the expand arrow next to a campaign group to reveal its topics.
4. Click any item in the tree to load its detail view in the main content area.

> **Note:** The sidebar tree is your primary navigation tool on this page. Use it to jump between accounts, groups, and topics without going back to the top.

## Step-by-Step Instructions

### Navigate to Account Management

1. Log in to CxPortal at your organization's portal URL.
2. In the left sidebar, locate and click **Campaigns** to expand the module.
3. From the expanded menu, click **Account Management**.
4. The Account Management page loads with the sidebar hierarchy on the left and the content area on the right.
5. If you have multiple accounts, select the account you want to manage from the sidebar tree. Most environments use a single account named DEFAULT.

> **Note:** If you do not see Account Management in the sidebar, confirm that you have admin permissions assigned to your user account. This page requires elevated privileges.

### Viewing the Account Overview

The account overview gives you a high-level snapshot of everything within a specific account.

1. In the sidebar tree, click the account name.
2. The main content area displays the Account Overview with aggregate counts:

   | Metric | What It Shows |
   |---|---|
   | Campaign Groups | Total number of campaign groups in this account |
   | Topics | Total number of topics across all campaign groups |
   | Lists | Total number of recipient lists across all groups |
   | Templates | Total number of email templates across all groups |
   | Campaigns | Total number of campaigns across all groups |

3. Below the overview metrics, review the **Campaign Groups** table. This table lists every group with the following columns:

   | Column | Sortable | Description |
   |---|---|---|
   | Group Name | Yes | The name of the campaign group. Click to open the group detail page. |
   | Topics | No | Number of topics in this group |
   | Templates | No | Number of email templates scoped to this group |
   | Lists | No | Number of recipient lists in this group |

4. Use this table to quickly identify which groups have the most assets and which may need additional setup.

### Create an Account

If you have Admin permissions, you can create new accounts from the account management page.

1. Log in to CxPortal at your organization's portal URL.
2. In the left sidebar, locate and click **Campaigns** to expand the module.
3. From the expanded menu, click **Account Management**.
4. Click the **+** on the right side of the account in the side navigation.
5. Enter an account name and click **+ Create Account**.

### Manage Account Users

If you have more than one account, you can manage users at the account level from the account management page.

> **Note:** Only Admins can manage users, create or disable accounts, and delete campaign groups.

1. Log in to CxPortal at your organization's portal URL.
2. In the left sidebar, locate and click **Campaigns** to expand the module.
3. From the expanded menu, click **Account Management**.
4. If you have multiple accounts, select the account you want to manage from the sidebar tree. Most environments use a single account named DEFAULT.
5. Click the 3-dot ellipses next to the account name and then click **Manage Users**.
6. This opens a user list where you can see user email, role, status, and access level.

### Enable or Disable an Account

You can enable or disable an account from the account management page.

1. Log in to CxPortal at your organization's portal URL.
2. In the left sidebar, locate and click **Campaigns** to expand the module.
3. From the expanded menu, click **Account Management**.
4. If you have multiple accounts, select the account you want to manage from the sidebar tree. **Note:** You can't disable or rename the DEFAULT account, only other created accounts.
5. Click the 3-dot ellipses next to the account name and then click **Enable Account** or **Disable Account**. **Note:** If you disable an account, no modifications will be allowed to be made to resources in that account such as templates, contact lists, or creating campaigns. This doesn't affect any already live campaigns. To fully delete an account, contact support.
