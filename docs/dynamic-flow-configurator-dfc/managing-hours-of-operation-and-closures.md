---
description: >-
  Set weekly hours and closure periods on items with Hours of Operation and
  Closure fields.
---

# Managing Schedules and Closures

Entities can include **Schedules** and **Closure** fields in their schema. You set their values per item from the item's editing tray: hours as weekly open/closed rules with time ranges, and _closures_ as dated periods — such as holidays — when normal hours don't apply.

* Each field's heading in the editing tray shows its field name (for example, "Chat hours" or "Holiday closures"), so entities with more than one Schedule or Closure field are distinguishable at a glance. 
* A field with no name falls back to a generic heading: "Schedule" or a count-based heading such as "2 Closures."

***

## Before You Begin

* You need item edit permission on the entity. See Managing DFC Permissions.
* The entity's schema must include a Schedule or Closure field. See Setting Up Entities and Schemas.
* Changes are submitted as a change request and take effect once approved.
* Times are entered and displayed in UTC.

***

## Editing an Item's Schedule

The editing tray opens fully editable — there's no separate edit mode. The footer keeps **Cancel** and **Save** visible while you scroll, and **Save** enables as soon as you make a change.

1. Open the item from the items table.
2. Toggle a day on to set its hours. Editable start and end times appear.
3. Toggle a day off to mark it **Closed**.
4. (Optional) Add more time ranges to a day: a. Click the **+** next to the day. The **Edit Hours of Operation** modal opens with a weekly calendar view. b. Add or adjust ranges in the calendar. c. Save the modal. Additional ranges appear nested under their day, where you can edit them directly.
5. Click **Save** and review your changes (see Reviewing and Submitting Your Changes below).


!!! info ""
      **Note:** To make a day open all day, set its end time to **00:00** (midnight). It's automatically stored and displayed as **23:59**, since the system has no 24:00 end-of-day value. A pinging dot over the End time field, with a "Full day — 12:00 AM to 11:59 PM" tooltip, marks a range set this way.


***

## Adding or Deleting Closures

1. Open the item from the items table.
2. Click **+ Closure**.
3. Enter the closure's title, start, and end, and an optional description.
4. To remove an existing closure, click its delete button.
5. Click **Save** and review your changes (see Reviewing and Submitting Your Changes below).


!!! info ""
      **Note:** When the list has more than three closures, a second + Closure button appears at the bottom of the list so you don't have to scroll back to the top.



***

## Reviewing and Submitting Your Changes

1. Click **Save**. The **Are you sure?** dialog lists every pending change, such as "Set Hours → 7 rules (UTC)."
2. (Optional) Enter a **Change Request Description**.
3. Set the **Change Request Criticality**. The default is **Normal**.
4. (Optional) Set **Schedule For Later** to schedule the change.
5. Click **Yes, Submit Changes**.

A change request is created and routed through the standard DFC approval flow. Your changes apply once it's approved.

!!! info ""
      **Note:** An item with no hours and no closures opens with every day showing Closed and a single blank closure card ready to fill in.

***
## Setup Examples
**DFC is highly customizable, so your setup may differ from the following examples.**

## Routing Destinations ##

**Routing destinations** are the places contact flows send callers, most often Amazon Connect queues. In DFC, a routing destination entity maps a friendly name to the actual Amazon Connect resource, alongside related operational data such as the schedule that governs when the destination is open. Contact flows resolve the destination at runtime, so changing where contacts go means editing an item, not editing a flow.

A typical routing destination item includes:

| **Field** | **What it stores** |
| --- | --- |
| **Name** (primary) | The identifier flows use to look the destination up. |
| **Queue reference** | An Amazon Connect Resource field pointing at a queue on the connected Amazon Connect instance. |
| **Schedule reference** | A Reference field linking the destination to a schedule item in another entity, so hours are managed once and reused. |

Your instance's exact entity name and fields are set by its schema.

### Before You Begin ###

- You need item edit permission on the entity. See [Managing DFC Permissions](managing-dfc-permissions.md).
- Adding new destinations requires at least the **Item Creator** permission level.
- Changes are submitted as a change request and take effect once approved.
- The Amazon Connect resources you point at (queues, flows, prompts, phone numbers) are created and managed in Amazon Connect, not in DFC. DFC stores which resource a destination uses.

### Step-by-Step Instructions ###

### Reviewing Your Routing Destinations ###

1. In the DFC Browser, select the routing destination entity in the left panel.
2. Review the table of items and their details.
3. A linked **Reference** value shows as a chip with a link icon. The referenced item's primary key (for example, the schedule's name) is displayed inline.

**Warning:** A warning triangle next to an Amazon Connect Resource value means the stored value is in a legacy format. Hovering it shows "Legacy format - re-save to update." Open the item and re-save it to store the value in the current format.

### Changing Where a Destination Points ###

1. Open the item from the items table. The editing tray opens and is fully editable.
2. Click the **Queue dropdown**. The dropdown lists the instance's queues by name, with the current selection marked.
3. Select the new queue.
4. Click **Save** and review your changes.

### Linking a Destination to Its Schedule ###

1. Open the item from the items table.
2. Click the **Schedule dropdown** to select an item.
3. To review the chosen schedule, click the open icon next to the field. It takes you to the referenced item.
4. Click **Save** and review your changes.

**Note:** To change the hours themselves, edit the schedule item instead. Because the data is linked, every destination that references the schedule picks up the update automatically. 

### Adding a Routing Destination ###

1. In the entity view, click **+ Item**.
2. Fill in the fields according to the schema: at minimum the primary key, the queue, and any required references.
3. Click **Save**.

### Verifying a Destination ###

Use **Path Tester** in the DFC Browser sub-header to preview exactly what a contact flow receives when it queries the destination.

## Transfers ##

**Transfers** define where a transfer sends a contact. Each transfer item maps a transfer identifier to a destination, typically pointing at a routing destination or queue item, plus the message played when the transfer happens. Contact flows query the transfer data at runtime instead of relying on hard-coded routing logic, so retargeting a transfer is a data change, not a flow change.

A typical transfer item includes:

| **Field** | **What it stores** |
| --- | --- |
| **ID** (primary) | The identifier flows use to look the transfer up. |
| **Routing destination** | A required **Reference** field linking to the item the contact is transferred to (for example, a queue item). |
| **Transfer Message** | The message associated with the transfer. |

Your instance's exact entity name and fields are set by its schema.

### Before You Begin

- You need item edit permission on the entity. See [Managing DFC Permissions](managing-dfc-permissions.md).
- Adding new transfers requires at least the **Item Creator** permission level.
- Changes are submitted as a change request and take effect once approved.
- The destinations a transfer can point at must already exist as items in the entity. 

### Step-by-Step Instructions

### Reviewing Your Transfers

1. In the DFC Browser, select the transfer entity in the left panel.
2. Review the table of items and their details.
3. The **Defaults** panel above the table holds the entity's default property values and the fallback a flow receives when it queries the entity without naming a specific transfer.

### Changing a Transfer's Destination

1. Open the item from the items table. The editing tray opens and is fully editable.
2. Click the **routing destination dropdown** and select an item from the entity.
3. To review what the transfer currently points at, click the open icon next to the field. It takes you to the referenced item.
4. Click **Save** and review your changes.

### Editing the Transfer Message

1. Open the item from the items table.
2. Edit the transfer message field. If the field is a **Prompt** field, the SSML editor opens.
3. Click **Save** and review your changes.

### Adding a Transfer

1. In the entity view, click **+ Item**.
2. Fill in the fields according to the schema: at minimum the primary key and the required routing destination.
3. Click **Save**.

### Verifying a Transfer

Use **Path Tester** in the DFC Browser sub-header to preview exactly what a contact flow receives when it queries the transfer.

## Conditionals ##
Conditionals let a contact flow change where a call goes, or what the caller hears, when a workgroup is in a condition such as closed, holiday, emergency, meeting, or unstaffed. The condition rules are stored as DFC data, so changing them is an item edit, not a flow edit.

### Before You Begin

- You need item edit permission on the entity. See [Managing DFC Permissions](managing-dfc-permissions.md).
- Adding new prompt variants requires at least the **Item Creator** permission level.
- Changes are submitted as a change request and take effect once approved.

### Step-by-Step Instructions

### Reviewing Your Conditionals

1. In the DFC Browser, select the conditionals entity in the left panel.
2. Click the conditionals sub-entities to view their items.
3. Review the item table and click an item to see details.

### Editing a Conditional

1. Open the item from the items table. The editing tray opens and is fully editable.
2. Review and edit the conditionals options using the dropdowns. Use the open icon to view selection details.
3. Click **Save** and review your changes.

### Adding a Conditional

1. In the entity view, click **+ Item**.
2. Set the condition key (the primary field) and fill in the conditional content.
3. Click **Save**.

### Verifying What a Flow Receives

Use **Path Tester** in the DFC Browser sub-header to query the entity and preview exactly what the contact flow receives. Query the entity path with a trailing slash to check the default values.

## Prompts ##
Prompts are fields that store the SSML text Amazon Connect speaks to callers. You edit it in a rich text editor that adds pauses, emphasis and pronunciation, or in Code View for raw SSML.

### Before You Begin
- You need item edit permission on the entity. See [Managing DFC Permissions](managing-dfc-permissions.md). 
- Adding new prompt variants requires at least the **Item Creator** permission level.
- Changes are submitted as a change request and take effect once approved.
- Prompt fields are edited with DFC's SSML editor. For the full editor reference, including the formatting toolbar, Code View, validation, and audio preview, see [Editing Prompt Fields](editing-prompt-fields).

### Step-by-Step Instructions

### Reviewing your Prompts

1. In the DFC Browser, select prompts in the left panel.
2. Click the prompts sub-entities to view their items.
3. Review the item table and click an item to see details.

### Adding a Prompt

1. In the entity view, click **+ Item**.
2. Enter the item’s name, description, and prompt type.
3. Click **Save** and review your changes.

### Editing a Prompt

1. Open the item from the items table. The editing tray opens and is fully editable.
2. Edit the prompt details.
3. If a field is a Prompt field, it opens the SSML editor. Use the **SSML Formatting** toolbar to insert pauses or control rate, volume, pitch, pronunciation, and language. The root <speak> tag is applied automatically. Click **Switch to Code View** to edit the raw SSML directly. For more information, see [Editing Prompt Fields](editing-prompt-fields).
4. Click **Save Changes**.

### Verifying What a Flow Receives

Use **Path Tester** in the DFC Browser sub-header to query the entity and preview exactly what the contact flow receives. Query the entity path with a trailing slash to check the default values.

***
## Reviewing and Submitting Your Changes

1. Click **Save**. The **Are you sure?** dialog lists every pending change, such as "Set Hours → 7 rules (UTC)."
2. (Optional) Enter a **Change Request Description**.
3. Set the **Change Request Criticality**. The default is **Normal**.
4. (Optional) Set **Schedule For Later** to schedule the change.
5. Click **Yes, Submit Changes**.

A change request is created and routed through the standard DFC approval flow. Your changes apply once it's approved.

!!! info ""
      **Note:** An item with no hours and no closures opens with every day showing Closed and a single blank closure card ready to fill in.

***

## Support

If you run into issues not covered here, contact the support team through the [**Support**](https://docs.caylent.com/cxportal/submitting-a-support-request/) page.

***
