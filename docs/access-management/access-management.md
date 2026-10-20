# Access Management

## Overview

**Access Management** lets users manage both user and change request permissions. Authorized team members can manage user information, create roles, assign permissions, or restrict access per instance. 

***

## Benefits at a Glance

* **Role creation** — Create and customize roles with tailored permissions
* **User control** — Invite and manage users with role-based access
* **Permissions** — Set global and instance-level access controls
* **Access control** — Restrict access at instance and module levels

<img width="2000" height="1414" alt="access management" src="https://github.com/user-attachments/assets/7166a568-b2ff-4953-a41f-5d7a8296ffcc" />


***

## How it Works

Access Management controls what users can see and do in CxPortal through a system of roles and permissions.

You start by creating a role and giving it a name and description. A role is a configurable set of permissions that you assign to users; it determines which features, modules, and products those users can access. Once the role exists, you assign it two kinds of permissions. Global permissions control actions that aren't tied to a specific Amazon Connect instance, such as Access Management and Case Support. Instance permissions control what the role can access, edit, or approve within a particular instance — and because they're set per instance, the same role can have different permission levels across different instances.

***

## Who Uses This

* **System Administrator / IT Admin** responsible for creating and maintaining roles, assigning permissions, and ensuring the overall access structure reflects the organization's needs. They care most about control, accuracy, and minimizing security risk.
* **Contact Center Operations Manager** overseeing how teams are structured and what tools they need access to. They work closely with administrators to ensure roles are aligned with team functions and that agents, supervisors, and specialists have the right level of access to do their jobs effectively.
* **Compliance / Security Officer** focused on ensuring the organization meets internal governance standards and regulatory requirements. They care about auditability, access restrictions, and having clear visibility into who has access to what and why.

***

## Key Concepts

Access Management controls what users can see and do in CxPortal through a system of roles and permissions. You need to understand these terms before following the task pages.

| Term                     | Definition                                                                                                                                                                              |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Access Management**    | A feature that lets authorized users control roles and permissions across instances, including setting global and instance-level permissions.                                           |
| **Role**                 | A configurable set of permissions assigned to users that controls their access to features and products. Roles can be created, edited, and deleted.                                     |
| **Permissions**          | Settings that control what actions a user can perform on CxPortal, defining who can access something, what they can do, and under what conditions.                                      |
| **Global Permissions**   | Controls a user's ability to make changes not tied to a specific instance. Options are Access Management permissions and Case Support permissions.                                      |
| **Instance Permissions** | Controls a user's ability to access, edit, or approve changes on specific modules within a particular instance. A user can have different permission levels across different instances. |

***

## Permissions

Access Management is subject to role-based access control. To make changes in Access Management, your role must include the **Access Management Admin** permission.

The **Access Management Viewer** permission allows you to view roles and users but not make changes.

You must have one of these permissions for the Admin menu to appear in CxPortal.

***

## What You Can Do

* Access the Access Management Browser → [Getting Started with Access Management](getting-started-with-access-management.md)
* Create roles → ​[Create and Manage Roles](create-and-manage-roles.md)
* View instance permissions and restrict access → ​[Review Instance Permissions and Restrict Access ​](review-instance-permissions-and-restrict-access.md)
* Manage user email addresses and roles → [Manage Users](manage-users.md)
* Configure change request rules → [Configure Change Requests](configure-change-requests.md)
* Review best practices → [Access Management Best Practices​](access-management-best-practices.md)

***

## **Common Use Cases**

??? note "Create and Manage Roles"

    Organizations can use Access Management to create roles and set permissions to control who has access to specific modules and features.

??? note "Create and Manage Users"

    Organizations can use Access Management to invite users to access CxPortal, assign, and update their roles to control what information they can view.

??? note "Managing Existing Roles and Users"

    Administrators can use Access Management to update or modify existing roles and their permissions at any time. This keeps access levels accurate and ensures they reflect the current needs of the organization.

***

## Related Modules

* **CxPortal** — CxPortal is a web-based portal built by Caylent that simplifies the management and configuration of your Amazon Connect contact center.

<br>
