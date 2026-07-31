---
description: Create entities, sub-entities, and schemas, then add items to an entity.
---

# Setting Up Entities and Schemas

## Before You Begin

* You need a DFC permission level that allows creating entities and editing schemas (**Entity Editor** or **Admin**) to create entities, sub-entities, and define schemas. Adding items requires at least **Item Creator**. See [Managing DFC Permissions](managing-dfc-permissions.md).
* Plan your schema before adding items. Once items populate a field with data, the field's name and type are locked and the field can't be deleted.

{% hint style="warning" %}
**Warning:** In most setups, schema changes are owned by admins and technical users. Fields\
cannot be deleted or renamed while sub-entities or items exist inside the entity. Plan fields carefully\
before adding items or sub-entities.
{% endhint %}

### Limits and Constraints

* **Primary key required.** Each schema must define a required primary key. The first field you add to a new schema is always created as the primary key — required and locked to type String. If a schema somehow has fields but no primary key, **Save Changes** shows: "Every Entity needs one Primary field to save. Open a String field and turn on "Primary Key"."
* **No slash in primary key values.** Primary key values must not contain a slash (/). Because DFC\
  resolves paths using the format /path/to/entity/, a slash in a primary key value would be interpreted as an additional path segment, causing the query to fail.
* **Fields lock once items hold data.** When existing items populate a field, the field's name and type are locked and the field can't be deleted. To rename or delete the field, remove the item data first.
* **Schemas are long-lived.** Design them carefully before use.
* **Defaults fall back to null.** If no defaults are configured for an entity, all fields return `null` when the entity is queried with a trailing slash.
* **Sub-entity depth (recommended).** Limit sub-entities to no more than five levels deep to improve\
  clarity, reuse, and query performance. See [DFC Best Practices.](dfc-best-practices.md)
* **Import performance.** A 1 MB import file typically completes in approximately two minutes; import\
  time depends on file size.

***

## Step-by-Step Instructions

### Create an Entity

1. In the left panel, select **Home** (root).
2. Click **+ Entity.**
3. Enter an **entity name** and **entity description.**
4. Click **Create Entity.**

After creation, the entity appears in the left panel. A confirmation message displays: "Entity has been created successfully."

{% hint style="info" %}
**Note:** Entities cannot be deleted until all sub-entities and items under them are removed first. Deleting an entity is permanent.
{% endhint %}

***

### Create a Sub-Entity

1\. Select a parent entity in the left panel.

2\. Click **+ Entity** (displayed next to the parent entity name).

3\. Enter a **entity name** and **entity description.**

4\. Click **Create Sub-Entity.**

The sub-entity inherits the parent entity's schema automatically. Inherited fields cannot be modified at the sub-entity level, but you can add additional fields to the child entity.

***

### Deleting an Entity

Delete an entity from its Entity Settings page once it's empty.

1. Select the entity and click the **Settings** (gear) icon.
2. Click the **More** (ellipsis) menu next to the **Details** header.
3. Select **Delete Entity**.
4. In the **Are you sure?** confirmation, confirm the deletion.

{% hint style="danger" %}
Deleting an entity is permanent. Delete Entity is disabled while the entity still has items or sub-entities — the menu explains why. Remove them first.
{% endhint %}

### Define the Schema

Before adding items, configure the entity's schema. Schema edits accumulate as a draft on the Entity Settings page and are submitted together as one change request.

1. Select the entity and click the **Settings** (gear) icon. The Entity Settings page opens with the DFC breadcrumb at the top, the entity's **Details** on the left, and the **Schema** field list on the right.
2. Click **Add Field** — for the very first field on a new schema, this button instead reads **Add Primary Key**.
3. Enter a **Name**. The **Add** button stays disabled until you do.
4. Select a **Type** from the alphabetical list. For the first field, **Type** is locked to **String** — the popover explains that the primary key must be a required String and can't be changed later.
5. Configure the field settings:

| **Name**        | The field name.                                                                                                                                        |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Type**        | String, Number, Boolean, Reference, Datetime, JSON, YAML, Amazon Connect Resource, Pick List, or Prompt.                                               |
| **Required**    | Whether the field must be set for every item.                                                                                                          |
| **Primary**     | Used as the item's unique identifier (required for at least one field).                                                                                |
| **Overridable** | Whether items or sub-entities can override the default value.                                                                                          |
| **Hidden**      | Show or hide the field in API responses.                                                                                                               |
| **Presentable** | Show or hide the field in the UI as a column.                                                                                                          |
| **Constraints** | <p>Type-specific constraints such as minimum and maximum length for strings.</p><p>Set a minimum length of at least 1 character for string fields.</p> |
| **Conditions**  | Conditional display rules based on pick list values.                                                                                                   |

6. Repeat steps 2–5 for each field. Edits apply to your draft automatically — there's no per-field save.
7. (Optional) Reorder fields:\
   a. Hover over a field row. A drag handle appears at its left end.\
   b. Drag the row to its new position.
8. Click **Save Changes**.
9. Complete the change request modal to submit your schema changes for approval.

Once you make an edit, a "You have unsaved changes" indicator appears with a **Discard Changes** action that reverts every pending edit. After you submit, newly added fields stay visible in the list, marked as pending until the change request is approved.

{% hint style="warning" %}
Save Changes is disabled while a field has a validation error. The field's row flags the error, the affected input is outlined red, and the error message appears directly under that input.
{% endhint %}

***

#### **Configuring a Reference Field**

When you set a field's **Type** to **Reference**, specify the path to the referenced entity. The dropdown shows available items from that entity, and a preview displays the evaluated reference data. Only items (not entities) can be selected in reference fields.

<details>

<summary><strong>Field types list</strong></summary>

Available field types: Amazon Connect Resource, Boolean, Closure, Date Time, Hours of Operation, JSON, Number, Pick List, Prompt, Reference, String, YAML.

For editing a Prompt field's SSML content, see [Editing Prompt Fields](editing-prompt-fields.md).

The **Amazon Connect Resource** type lets you select from the following resource types:

• Queue\
• Contact Flow \\

• Contact Flow Module\
• Prompt\
• Phone Number

</details>

**Setting defaults**: For each field, you can add a default value and mark it **Overridable** if items are allowed to override it.

{% hint style="warning" %}
**Warning**: Fields lock once items hold data. When existing items populate a field, the field's Name and Type are locked (shown with a lock icon and an explanation) and Delete Field is disabled with a tip explaining why.

This locking applies only to fields that were already saved before the current editing session. A field you add in the current session — even on an entity that already has items — stays fully editable, including its Name and Type, until you save. To rename or delete a previously saved field, remove the item data first. Since schemas are long-lived, design them carefully before use. Fields added during the current editing session can always be removed — use the field's Delete Field button, or Discard Changes to revert everything.
{% endhint %}

***

## Add **Items (Records)**

Once the schema is ready:

1. Return to the entity view.
2. Click **+ Item.**
3. Fill in the item fields according to the schema.
4. Click **Create Item.**

Items appear in the table immediately. Opening an item's editing tray shows its Item ID next to the entity name — click it to copy the ID to your clipboard.

{% hint style="warning" %}
**Warning:** Item changes are submitted as change requests and take effect once approved. Avoid creating or deleting items in shared environments unless instructed.
{% endhint %}

***
