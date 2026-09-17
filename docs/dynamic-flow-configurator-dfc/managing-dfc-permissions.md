# Managing DFC Permissions

DFC Permissions gives admins granular control over what each role can do inside DFC. Instead of a single all-or-nothing DFC Admin permission, you choose an access mode for a role and, in **Tag Level** mode, tag the individual entities that role can reach. DFC then derives the role's permission level from the highest tag you assign.

***

## Before You Begin

* Only users with the **Admin** DFC permission level can access the **Permissions** page. Users below Admin do not see this option in the navigation.
* Roles are created and managed in **CxCentral**. DFC admins cannot create roles from within DFC.
* Setting up DFC permissions requires two steps: configure the role in CxCentral, then assign entity tags in DFC.

***

### How DFC permissions work

Access is controlled through two layers that work together:

* **Access mode** — **None**, **Tag Level**, or **Admin**. This is the setting you choose for the role.
* **Entity tags** — In **Tag Level** mode, tags define which specific entities a role can access on a given instance, and at what action level. The role's permission level is derived from the highest tag assigned.

!!! info ""
    **Note:** In **Tag Level** mode, a role with no tags has no DFC access at all. Assign at least one entity tag before the role can view anything in DFC.


***

### Permission Levels

A role's permission level defines the maximum action that role can perform anywhere in DFC. You set **Admin** and **None** directly; in **Tag Level** mode DFC derives the level from the entity tags you assign.

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

#### How the Permission Level Is Derived

In **Tag Level** mode, DFC takes the highest action level tagged on any entity and maps it to a permission level:

| Highest entity tag | Derived permission level |
| ------------------ | ------------------------ |
| **View**           | Item Viewer              |
| **Edit**           | Item Editor              |
| **Create**         | Item Creator             |
| **Admin**          | Entity Editor            |

* The **Admin** access mode gives the role the **Admin** permission level and ignores entity tags entirely.
* The **None** access mode — or **Tag Level** with no tags assigned — leaves the role with no DFC access. Its permission reads **None**.

The derived level appears as **Derived permission** at the top of the role's configuration page, and in the **Permissions** column of the role list.

!!! info ""
    **Note:** Action levels are never disabled by a separately selected ceiling — every action level stays selectable on every entity row. Raise or lower the tags to change the role's permission level.

***

#### Approver Permission

Approver is a separate toggle, independent of the permission levels. It grants the ability to approve change requests for the entities the role is tagged on.

* Does not grant view, edit, or create capability on its own.
* Set it per entity with the **Approver** toggle on that entity's row, or for every listed entity at once from the **Set all Entities** row.
* The **Approver** toggle stays disabled until the entity carries an action level tag, so Approver is always granted alongside a tag.
* Clearing an entity's tag also clears its **Approver** toggle.
* Approver access does not raise the role's derived permission level.

***

#### **Bulk Editing Capability**

Bulk editing is a separate capability, independent of the permission levels. It controls whether a role can bulk edit and bulk delete items on an entity's items view.

* Enable it with the **Bulk Editing** toggle in the **Permission Level** section of the role's configuration page.
* When it's off, the role can't bulk edit or bulk delete — the bulk controls are hidden and any bulk attempt is refused, even if the role can edit or delete individual items.
* When it's on, the role can bulk edit and bulk delete, still subject to its existing item permissions and entity tags.
* Roles in the **Admin** access mode always have bulk editing. The toggle is on automatically and can't be turned off.
* The toggle is locked off when the role's derived level is **Item Viewer**, since a read-only role can't edit items.
* The toggle is also locked off while the role has no access at all — in **None** mode, or in **Tag Level** mode before any tag is assigned. Its description then reads **Grant this role access to configure bulk editing**.
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
4. Select **Admin** or **None**:

* **Admin** — Full DFC access. The role bypasses entity-level configuration.
* **None** — No DFC access.

5. Click **Save Changes** at the top.

Only **Admin** and **None** are selectable here. The levels in between are shown for reference only — DFC derives them from the entity tags configured in DFC Permissions — and hovering one explains where to change it. The section's helper text reads: *Set **Admin** or **None** here. The in-between levels are derived from the entity tags configured in Dynamic Flow Configurator Permissions.*

To give a role a level between **None** and **Admin**, assign that role's entity tags in DFC Permissions instead of setting a level here.


***

**To assign a user to a role:**

1. From **CxCentral**, go to **Admin** > **Access Management** > **Users**.
2. Click the actions menu (hamburger icon) next to the user.
3. Select **View Details.**
4. Under **Role and Instance Access**, click **Change Role**.
5. Select the role and click **Change Role** to save.

***

#### Step 2: Assign Entity Tags in DFC

Once a role exists in CxCentral, assign entity-level access from within DFC. Any role that isn't set to **Admin** or **None** in CxCentral gets its permission level from the entity tags you assign here.

!!! info ""
    **Note:** Only users with the DFC **Admin** permission level can access the Permissions page. Users below Admin do not see this option in the navigation.


**To open DFC Permissions:**

1. Go to **CxPortal** from the left navigation on CxCentral, or use the Quick Links on the CxCentral homepage.
2. Select **DFC** in the left navigation.
3. Click **Permissions.**

The Permissions page lists the roles available for DFC configuration, each with its derived permission and its number of active tags. A role with no DFC access shows a **None** permission.


***

**To configure entity tags for a role:**

1. Locate the role. Use **Search Roles by name or description**, or the **Filters** panel on the left, if needed.
2. Click the role to open its configuration page.
3. In the **Permission Level** section, select the access mode:
    * **None** — No access to the module. Selecting **None** clears every tag on the role.
    * **Tag Level** — Access is set by the **Entity Tags** below.
    * **Admin** — Full access to every Entity and Item.
4. To allow the role to bulk edit and bulk delete items, turn on the **Bulk Editing** toggle below the access modes. It's locked on for **Admin**, and locked off for **None**, for **Item Viewer**, and while the role has no tags yet.
5. With **Tag Level** selected, the **Entity Tags** section lists every top-level entity on the current instance. Each row shows the entity's name, its item count, and its sub-entity count. Click an entity name to open that entity in a new tab.
6. For each entity you want to grant access to, select an action level: **None**, **View**, **Edit**, **Create**, or **Admin**. **None** means the role has no access to that entity.
7. To apply one action level to every listed entity at once, use the **Set all Entities** row above the list.
8. To grant or remove Approver access on an entity, turn that row's **Approver** toggle on or off. The toggle becomes available once the entity carries an action level tag.
9. To narrow a long list, type in **Search Entities by name**, or choose an option from **Filter by**: **All Entities**, **No access**, **Viewer**, **Editor**, **Creator**, **Admin**, or **Approver**. A **Showing X of Y** count sits beside the filter.
10. Click **Save Changes**. To abandon your edits instead, click **Discard Changes**.

While edits are pending, a **You have unsaved changes** indicator appears in the **Entity Tags** header. A **Role updated** confirmation appears after a successful save. Changes take effect on the user's next request. No session restart is required.

!!! info ""
    **Note:** Only top-level entities are tagged. Sub-entities inherit their parent entity's tag.


***

#### Check which roles can access an entity

An entity's own settings page shows which roles are tagged on it.

1. In DFC, select the entity and click the **Settings** (gear) icon.
2. In the **Details** panel, find the **Roles** section. Each row names a role, with a badge showing the tag that role applies to this entity — **View**, **Edit**, **Create**, or **Admin**.
3. Click a role name to open its DFC Permissions configuration page in a new tab.
4. If more than three roles are tagged, click **Show All** to list them all, then **Show Less** to collapse the list again.

The **Roles** section lists only the roles tagged directly on this entity, and it doesn't appear when no role is tagged on it.

***

#### Export and import a role's permissions

You can copy a role's permission configuration between environments from the DFC sub-header.

1. Open the role's configuration page in DFC **Permissions**.
2. Save or discard any pending edits. Both controls are disabled while the role has unsaved changes, and hovering one explains why.
3. In the sub-header, click the export icon (**Export permissions**) or the import icon (**Import permissions**). Hover an icon to see its tooltip.

An imported file is applied to the editor for review — click **Save Changes** to persist it. If any tag in the file can't be applied, the notification names the entities that were skipped, for example because the entity is missing in this environment or its level is above the imported permission.

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

The page heading reads **Permission Roles (N)**, where N is the number of roles. Use **Search Roles by name or description** to filter by name or description, and the **Filters** panel on the left to filter by permission: **Admin**, **Entity Editor**, **Item Creator**, **Item Editor**, **Item Viewer**, or **None**. The filters are checkboxes, so you can combine several — the panel's toggle carries a count of applied filters, and **Clear Filters** removes them all.

The table has three columns:

| Column          | Shows                                                                                                                  |
| --------------- | ---------------------------------------------------------------------------------------------------------------------- |
| **Role**        | The role name, as a link to its configuration page, with the role description beneath it.                               |
| **Permissions** | The role's permission — **Admin**, **Entity Editor**, **Item Creator**, **Item Editor**, **Item Viewer**, or **None**.  |
| **Tags**        | The number of active entity tags. Reads `-` for roles in the **Admin** access mode, where tags don't apply.             |

When nothing matches, the table shows **No roles match your search**. On an instance with no roles yet, it shows **No roles created yet**.

***

#### Setting Permissions for a Role

When you click a role, its configuration page opens. A breadcrumb at the top links back to **Permissions**, and beside the role name a summary strip shows:

* **Derived permission** — the permission level DFC derives from the role's entity tags.
* **Active Tags** — how many entities carry a tag.
* **Approver access** — how many entities the role can approve change requests for.

**Active Tags** and **Approver access** both read `—` in the **Admin** access mode, where tags don't apply.

Below the strip:

* **Permission Level** section: the **None**, **Tag Level**, and **Admin** access modes, plus the **Bulk Editing** toggle.
* **Entity Tags** section: one row per top-level entity, each with an action level selector (**None**, **View**, **Edit**, **Create**, **Admin**) and an **Approver** toggle. Only the rows scroll — the section heading, search box, **Filter by** list, and **Set all Entities** row stay in place. When a filter excludes everything, the list reads **No entities match the current filter**.

In the **Admin** and **None** modes the entity rows are replaced by a message explaining that tags don't apply. Switching from **Admin** back to **Tag Level** keeps the tags the role already had; switching to **None** clears them.

On the **Permissions** page the DFC sub-header carries the permission export and import icons in place of the entity search bar, **Local Speech Settings**, and **Path Tester**, which apply to entities rather than roles.

***

### Instance Scoping

Entity tags are scoped per instance. A role can have different tag configurations across instances. For example, the same role might have **Edit** access to Transfers on a Dev instance and **View** access on Production.

When configuring permissions, the current instance name is shown at the top of the page. Changes apply only to that instance. To configure a different instance, switch to it before opening DFC Permissions.

***

### Best Practices for DFC Permissions

???+ note "Create roles based on business function, not individual users."

    Name roles to reflect what they do, such as "Transfers Viewer" or "Prompts Editor." This makes it easier to manage access as teams change.

???+ note "Avoid creating too many roles."

    A large number of overlapping roles is difficult to maintain. Keep the role structure close to what the business actually requires.

???+ note "Tag for the minimum access the role needs."

    The permission level is derived from the role's highest tag, so a role that only needs to read items should carry **View** tags, not **Admin** tags. Reserve the **Admin** access mode for roles that genuinely need every entity and item.

???+ note "Configure and verify in a lower environment first."

    Set up role and tag configuration in Dev or a test instance before applying the same setup in production.

???+ note "Check the summary strip before saving."

    **Derived permission**, **Active Tags**, and **Approver access** at the top of the page reflect the tags you've set. Confirm they match the access you intend before you click **Save Changes**.

***
