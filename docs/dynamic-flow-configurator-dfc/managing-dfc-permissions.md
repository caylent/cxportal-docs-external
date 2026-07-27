# Managing DFC Permissions

DFC Permissions gives admins granular control over what each role can do inside DFC. Instead of a single all-or-nothing DFC Admin permission, you assign a permission level to a role and then specify which entities that role can access, and at what capability level.

***

## Before You Begin

* Only users with the **Admin** DFC permission level can access the **Permissions** page. Users below\
  Admin do not see this option in the navigation.
* Roles are created and managed in **CxCentral**. DFC admins cannot create roles from within DFC.
* Setting up DFC permissions requires two steps: configure the role in CxCentral, then assign entity\
  tags in DFC.

***

### How DFC permissions work

Access is controlled through two layers that work together:

* **Permission level** — Sets the maximum action a role can perform anywhere in DFC.
* **Entity tags** — Define which specific entities a role can access on a given instance, and at what action level.

!!! info ""
    **Note:** A role must have a permission level assigned before it can access DFC. Without entity tags, the role can see the DFC module but cannot view any entities.


***

### Permission Levels

Each role is assigned one hierarchical permission level. This level defines the maximum action that role can perform anywhere in DFC, regardless of entity tags.

| Permission Level  | Description                  | Cumulative Capabilities                                                                                                              |
| ----------------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| **Item Viewer**   | Read-only access             | Browse and read entities and items. No modification capability.                                                                      |
| **Item Editor**   | Modify existing items        | All Item Viewer capabilities, plus: update existing item field values.                                                               |
| **Item Creator**  | Create new items             | All Item Editor capabilities, plus: create new items and duplicate existing items.                                                   |
| **Entity Editor** | Modify schemas and structure | All Item Creator capabilities, plus: modify entity schemas, add fields, create sub-entities.                                         |
| **Admin**         | Full DFC access              | All Entity Editor capabilities, plus: create and delete top-level entities, manage all schema configuration, access DFC Permissions. |

!!! info ""
    **Note:** Each level includes all capabilities of the levels below it. A role with **Admin** can do everything. A role with **Item Viewer** can only read.


***

#### Permission Ceiling

The permission level acts as a ceiling on entity tag action levels. If a tag grants more access than the permission level allows, the permission level wins. Action levels that exceed the ceiling are disabled in the Permissions UI.

Examples:

* A role with **Item Editor** permission and an **Admin** tag on Transfers can only edit items in Transfers. The **Admin** tag does not elevate access beyond Item Editor.
* A role with **Admin** permission and a **View** tag on Prompts can only view items in Prompts. The tag restricts access even though the permission level is higher.

***

#### Approve Permission

Approve is a separate boolean permission, independent of the five permission levels. It grants the ability to approve change requests for entities the role has tag access to.

* Can be assigned to any role, with or without a permission level.
* Does not grant view, edit, or create capability on its own.
* A role with **Approve** but no action level tag on an entity can approve change requests for that entity but cannot view or modify items.
* Not subject to the permission ceiling.

***

#### **Bulk Editing Capability**

Bulk editing is a separate capability, independent of the five permission levels. It controls whether a role can bulk edit and bulk delete items on an entity's items view.

* Enable it with the **Bulk editing** checkbox in the **Permission** section of the role's configuration page.
* When it's off, the role can't bulk edit or bulk delete — the bulk controls are hidden and any bulk attempt is refused, even if the role can edit or delete individual items.
* When it's on, the role can bulk edit and bulk delete, still subject to its existing item permissions and entity tags.
* Roles with the **Admin** permission level always have bulk editing. The checkbox is selected automatically and can't be turned off.
* The checkbox is disabled when **Item Viewer** is selected, since a read-only role can't edit items.
* Roles that existed before this capability was introduced default to bulk editing off until an administrator turns it on.
* Bulk import and export are not affected by this setting.

***

## Step-by-Step Instructions

#### Step 1: Create or Configure a Role in CxCentral

**To create a new role:**

1. From **CxCentral**, navigate to **Admin** in the left navigation.
2. Under **Access Management**, select **Roles**.
3. Click **Create Role** in the top right.
4. Enter a role name and description.
5. Click **Create Role.**

***

#### **To configure the DFC permission level for the role:**

1. The **Permissions** page for the newly created role should open automatically. If it does not, locate the role in the **Roles** list, click the actions menu (hamburger icon), and select **Edit Permissions**.
2. On the **Permissions** page, select the instance from the left panel.
3. Scroll to locate the **Dynamic Flow Configurator** section.
4. Select a DFC access level:

* **Admin** — Full DFC access. The role bypasses entity-level configuration.
* **User** — Grants access to the DFC module. Entity-level access must be configured separately in DFC Permissions. The role cannot view any entities until tags are assigned.
* **None** — No DFC access.

5. Click **Save Changes** at the top.

The role now appears on the DFC Permissions page and is ready for entity tag configuration.

***

**To assign a user to a role:**

1. From **CxCentral**, go to **Admin** > **Access Management** > **Users**.
2. Click the actions menu (hamburger icon) next to the user.
3. Select **View Details.**
4. Under **Role and Instance Access**, click **Change Role**.
5. Select the role and click **Change Role** to save.

***

#### Step 2: Assign Entity Tags in DFC

Once a role exists in CxCentral with a DFC permission level, assign entity-level access from within DFC.

!!! info ""
    **Note:** Only users with the DFC **Admin** permission level can access the Permissions page. Users below Admin do not see this option in the navigation.


**To open DFC Permissions:**

1. Go to **CxPortal** from the left navigation on CxCentral, or use the Quick Links on the CxCentral homepage.
2. Select **DFC** in the left navigation.
3. Click **Permissions.**

The Permissions page lists all roles that have a DFC permission level assigned. Roles without a DFC permission level do not appear here.

***

**To configure entity tags for a role:**

1. Locate the role. Use the search bar or filters if needed.
2. Click the role to open its configuration page.
3. In the **Permission** section, select the top-level permission level for this role: **Admin**, **Entity Editor**, **Item Creator**, **Item Editor**, or **Item Viewer**. This sets the permission ceiling. Action levels above the ceiling are disabled in the entity tag list below.
4. To allow the role to bulk edit and bulk delete items, tick the **Bulk editing** checkbox below the permission levels. **Note:** The checkbox is preselected and locked for **Admin** and disabled for **Item Viewer**.
5. In the **Entity Tags** section, each top-level entity on the current instance is listed.
6. For each entity you want to grant access to, select an action level: **View**, **Edit**, **Create**, or **Admin**. Selecting no action level means the role has no access to that entity, regardless of the permission level.
7. To grant or remove Approve access on an entity, enable or disable the **Approver** toggle for that row. Approve can be set independently of the action level.
8. Review the **Preview** panel on the right. It shows the entity tree as the selected role would see it, with access-level badges per entity. Only entities with an active tag appear in the preview.
9. Click **Save** at the top.

A confirmation message appears after a successful save. Changes take effect on the user's next request. No session restart is required.

***

#### Removing a role

If a role is no longer needed:

1. Reassign any users currently on that role to a different role first.
2. From **CxCentral**, go to **Admin** > **Access Management** > **Roles**.
3. Click the actions menu next to the role.
4. Select **Delete**.

Deleting a role removes all entity tag assignments associated with it.

!!! warning ""
    **Warning:** Do not delete a role while users are still assigned to it. Reassign users first to avoid\
    access disruption.


***

## Reference: Understanding the Permissions Page

#### Role List

The Permissions page displays all roles with a DFC permission level. Use the search bar to filter by role name or description. The filter buttons (**Admin**, **Entity Editor**, **Creator**, **Editor**, **Viewer**) filter the list by permission level.

Each row shows the role name, its permission level, and the number of entity tags assigned.

***

#### Setting Permissions for a Role

When you click a role, the configuration page opens. It has two panels:

**Left Panel**

* **Permission** section at the top: displays the permission level selector and the **Bulk editing** checkbox for the role.
* **Entity Tags** section below: lists all top-level entities with action level selectors (**View**, **Edit**, **Create**, **Admin**) and an **Approver** toggle per row.
  **Right Panel (Preview)**

* Displays the entity tree as that role would see it.
* Shows color-coded access badges per entity.
* Updates in real time as you change action levels.
* The **Current Configuration** summary at the bottom shows the active permission level, number of tagged entities, and Approver access count.
  ***

### Instance Scoping

Entity tags are scoped per instance. A role can have different tag configurations across instances. For example, the same role might have **Edit** access to Transfers on a Dev instance and **View** access on Production.

When configuring permissions, the current instance name is shown at the top of the page. Changes apply only to that instance. To configure a different instance, switch to it before opening DFC Permissions.

***

### Best Practices for DFC Permissions

<details open>

<summary><strong>Create roles based on business function, not individual users.</strong></summary>

Name roles to reflect what they do, such as "Transfers Viewer" or "Prompts Editor." This makes it easier to manage access as teams change.

</details>

<details open>

<summary><strong>Avoid creating too many roles.</strong></summary>

A large number of overlapping roles is difficult to maintain. Keep the role structure close to what the business actually requires.

</details>

<details open>

<summary><strong>Use the permission ceiling intentionally.</strong></summary>

Set the permission level to the minimum needed for the role's function. A role that only needs to view items should have Item Viewer, not Admin, even if only a few entity tags are assigned.

</details>

<details open>

<summary><strong>Configure and verify in a lower environment first.</strong></summary>

Set up role and tag configuration in Dev or a test instance before applying the same setup in production.

</details>

<details open>

<summary><strong>Review the Preview panel before saving.</strong></summary>

The entity browser on the right reflects exactly what the role will see. Use it to confirm that the intended entities are visible and that no unintended access has been granted.

</details>

***
