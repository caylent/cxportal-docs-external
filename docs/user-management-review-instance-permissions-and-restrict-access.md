# Review Instance Permissions and Restrict Access

## **Before You Begin**

Before you configure instance permissions or restrict access, make sure you have the following in place:

* **Required permissions** — Your role must include the Access Management Admin permission to change permissions. The Access Management Viewer permission lets you view but not modify. You must have one of these permissions for the Admin menu to appear in CxPortal.
* **The roles you'll configure** — Instance permissions are defined per role, so create the roles you plan to work with before assigning their instance-level access.
* **Knowledge of your connected instances** — Know which Amazon Connect instances are connected to CxPortal and which modules within each instance each role should be able to use.
* **A plan for the access each role needs** — Decide, per role and per instance, which modules should be accessible and at what level, so you can configure permissions deliberately rather than by trial and error.

***

## **Limits and Constraints**

Keep the following in mind when working with instance permissions and access restriction:

* **Admin permission required to make changes** — Only users with the Access Management Admin permission can change instance permissions. Viewer permission is read-only.
* **Permissions are defined per instance** — Instance permissions are set separately for each connected Amazon Connect instance, so a role can hold different permission levels across different instances. There is no single setting that applies a role's access to all instances at once.
* **Instance-level restriction hides the entire instance** — If a role has no permissions for any module on an instance, users with that role won't see that instance in the instance picker, which blocks access to every module within it. In Access Management, this appears as "none selected" for every module on that instance.
* **Module-level restriction hides individual modules** — If a role has no permissions for a specific module, that module won't appear in CxPortal when the user selects that instance, even if the user can otherwise access the instance.

***

## Step-by-Step Instructions

### Review Instance Permissions

For each instance of Amazon Connect that are connected to CX Portal, you can define which permissions each role should have when interacting with that instance. This allows you to give access to different modules in different instances or simply change the access to functionality within the module.

***

### Restricting Access

CxPortal restricts access at two levels:

**Instance-Level Access:** If a role has no permissions for any module on an instance, users with that role will not see that instance in the instance picker. This prevents access to all modules within that instance. In Access Management, this appears as "none selected" for every available module on that instance.

**Module-Level Access:** If a role has no permissions for a specific module, that module will not appear in CxPortal when the user selects that instance.
