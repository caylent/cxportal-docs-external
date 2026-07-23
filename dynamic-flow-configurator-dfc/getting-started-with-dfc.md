# Getting Started with DFC

## How to Access DFC

1. Log in to [CxPortal](https://portal.pronetx.com/portal).
2. In the left navigation panel, select **DFC**.
3. Click **Browser** in the dropdown.

The **DFC Browser** is the main workspace for viewing and managing all configured data.

!!! info ""
    Note: If certain actions are not visible in the UI, your role may not include those permissions.


***

Understanding the DFC Browser Layout

The DFC Browser is split into a sub-header and two panels:

* **Sub-header** — Icon buttons for **Export**, **Import**, **Path Tester**, and **Local Speech Setting**. Hover an icon to see its tooltip. Export and Import appear only if you have edit permission.
* **Left panel** — The entity tree, starting at **Home** (the root). View and navigate top-level entities and sub-entities here.
* **Right panel** — The items table for the selected entity or sub-entity. This displays the records stored within the selected entity. The header shows the item count, for example "12 Items in Prompts."

At the root level (Home), you can view your top-level entities and create new ones with the **+ Entity** button. Inside an entity, the same button reads **+ Sub-Entity**.

Entities with children show a sub-entity count on their row, such as "3 sub-entities."

Selecting an entity adds two controls next to its name:

* **Settings** (gear) — Opens the entity's settings page, where you manage its schema. See Setting Up Entities and Schemas.
* **More** (ellipsis) — Contains **Copy ID** and **Copy Path**, for copying the entity's ID or its query path.

!!! info ""
    **Note:** The Settings gear and More menu don't appear at the Home (root) level.


***

## Sorting the Entity List

The entity list shows the most recently created entities first. To change the order:

1. Click the sort dropdown next to the entity count.
2. Select **Created** (up or down), **Edited** (up or down), or **Title** (A-Z or Z-A).

!!! info ""
    **Note:** Official Order appears in the sort menu but is currently disabled. The sort control is hidden when the list is empty.


***

## Filtering the Items Table

Filter items by column value to narrow long lists. Active filters are always visible, so you can't mistake a filtered list for the full one.

1. Click the filter control on a column header.
2. Enter a value.

A **Filtering:** row appears in the items header. Each active filter shows as a chip with the column name and value, such as "Manager: John Doe." When filters outgrow one line, the chips wrap and the header expands.

To remove a single filter, click the **x** on its chip. To remove every filter, click **Clear All**. The Filtering row disappears when no filters are active.

***

## **Testing a Path with Path Tester**

*Path Tester* previews exactly what a contact flow or Lambda function receives when it queries DFC.

1. In the sub-header, click **Path Tester** (the pencil icon).
2. Enter a path: a. An entity path, to see the entity's items and resolved defaults. b. A sub-entity path. c. A specific item path, such as `/prompts/greetings/welcome-message`.
3. Click **Run**.
4. Review the returned data to confirm the expected item, references, and default values are applied.

!!! info ""
    **Note:** Path Tester is read-only. It returns the exact data a contact flow or Lambda function would receive without modifying anything, which makes it ideal for validating configuration before or alongside call testing.


!!! info ""
    **Tip:** Copy an exact path with **Copy Path** from an entity's **More** menu or an item's three-dot menu, then paste it into Path Tester.


***

## **Previewing Voice and Language with Local Speech Setting**

*Local Speech Setting* plays voice and language pairs in your browser so you can hear how prompt content sounds.

1. In the sub-header, click **Local Speech Setting** (the speaker icon).
2. Select a **Language**.
3. Select a **Voice**.
4. Click the play button to preview the pair.
5. (Optional) Click **Add** to set up another pair.
6. Click **Save**.

!!! info ""
    **Note:** These settings only affect playback in your browser. They don't affect what callers hear — that's managed in Amazon Connect.


***

## Your First Task

**Try it**: **Create your first entity**

1. In the left panel, select **Home** (root).
2. Click **+ Entity**.
3. Enter an **entity name** and an **entity description**.
4. Click **Create Entity**.

Your new entity appears in the left panel, and a confirmation message displays: "Entity has been created successfully."

!!! info ""
    **Note:** **Create Entity** stays disabled until you enter both a name and a description.


!!! info ""
    For the complete workflow, including sub-entities, schemas, and items — see [Setting Up Entities and Schemas.](setting-up-entities-and-schemas.md)


***

## **First-Time and Empty States**

The Browser tells you what to do next whenever a level is empty.

* Root with no entities: the list shows "No Entities Yet" and the main panel reads "Create an Entity on your left to continue."
* Root with entities: the main panel reads "Select an Entity on your left to continue."
* An entity with no sub-entities: the list shows "No Sub-Entities Yet."
* An entity with no fields: the item panel shows a numbered guide starting "You're almost there." and the **Settings** gear shows a pulsing dot until you add fields.
* An entity with fields but no items: the item panel reads "Create a Sub-Entity on your left or add a new Item above to continue."

***

## What to Do Next

Now that you have created an entity, here is what to do next:

• Define the entity's schema and add items → [Setting Up Entities and Schemas](setting-up-entities-and-schemas.md)\
• Move configuration between environments → [Importing and Exporting Data](importing-and-exporting-data.md)\
• Set up roles and entity-level access → [Managing DFC Permissions](managing-dfc-permissions.md)\
• Look up field types, limits, and the developer client → [DFC Reference](developer-reference-node.js-client.md)

***
