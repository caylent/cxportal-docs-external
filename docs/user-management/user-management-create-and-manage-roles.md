# Create and Manage Roles

## Before You Begin

Before you create or edit a role, make sure you have the following in place:

* **Required permissions** — Your role must include the Access Management Admin permission to create or edit roles. The Access Management Viewer permission lets you view roles but not change them. You must have one of these permissions for the Admin menu to appear.
* **A role plan** — Decide on the role's name and description before you start. It's recommended to align roles with your existing teams (for example, a Linguistics team or a Connect Engineer team) so each role carries the permissions that team needs.
* **Knowledge of the permissions to assign** — After creating a role, you set its global permissions and instance-level permissions. Know which global permissions (Access Management, Case Support) and which instance-level module permissions the role should have before you configure it.
* **Knowledge of your connected instances** — Because instance permissions are set per Amazon Connect instance, know which instances the role should access and at what level.

***

## **Limits and Constraints**

Keep the following in mind when working with roles:

* **Admin permission required to make changes** — Only users with the Access Management Admin permission can create or edit roles. Viewer permission is read-only.
* **Permissions are set after creation** — Global and instance-level permissions are assigned once the role exists, not during initial creation. Creating a role and setting its permissions are separate steps.
* **Instance permissions are per-instance** — A role can hold different permission levels across different instances, so permissions must be configured for each instance individually rather than once globally.
* **Changes apply to all assigned users** — Editing a role's permissions affects every user assigned to that role.

***

## Step-by-Step Instructions

### Create a role

You can create new roles and customize access and permissions for each feature. To create a role:

1. Open CxCentral and click **Admin**.
2. Under Roles, click **Create Role**.
3. Enter a role name and description.
4. Click **Create Role**.

Once your role is created, you can set global permissions and instance level permissions.

***

### Edit a role

You can edit existing roles to change permissions at any time. To edit a role:

1. Open CxCentral and click **Admin**.
2. Click on the **Actions menu** on the right of the role you want to edit.
3. Click **Edit permissions** and choose permission settings as needed.
4. Click **Save Changes**.
