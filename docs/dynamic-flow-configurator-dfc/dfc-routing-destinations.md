# Setup Example: Routing Destinations

**DFC is highly customizable, so your setup may differ from this example. The steps below show how to configure routing destinations.**

**Routing destinations** are the places contact flows send callers, most often Amazon Connect queues. In DFC, a routing destination entity maps a friendly name to the actual Amazon Connect resource, alongside related operational data such as the schedule that governs when the destination is open. Contact flows resolve the destination at runtime, so changing where contacts go means editing an item, not editing a flow.

A typical routing destination item includes:

| **Field** | **What it stores** |
| --- | --- |
| **Name** (primary) | The identifier flows use to look the destination up. |
| **Queue reference** | An Amazon Connect Resource field pointing at a queue on the connected Amazon Connect instance. |
| **Schedule reference** | A Reference field linking the destination to a schedule item in another entity, so hours are managed once and reused. |

Your instance's exact entity name and fields are set by its schema.

## Before You Begin

- You need item edit permission on the entity. See Managing DFC Permissions.
- Adding new destinations requires at least the **Item Creator** permission level.
- Changes are submitted as a change request and take effect once approved.
- The Amazon Connect resources you point at (queues, flows, prompts, phone numbers) are created and managed in Amazon Connect, not in DFC. DFC stores which resource a destination uses.

## Step-by-Step Instructions

### Reviewing Your Routing Destinations

1. In the DFC Browser, select the routing destination entity in the left panel.
2. Review the table of items and their details.
3. A linked **Reference** value shows as a chip with a link icon. The referenced item's primary key (for example, the schedule's name) is displayed inline.

**Warning:** A warning triangle next to an Amazon Connect Resource value means the stored value is in a legacy format. Hovering it shows "Legacy format - re-save to update." Open the item and re-save it to store the value in the current format.

### Changing Where a Destination Points

1. Open the item from the items table. The editing tray opens and is fully editable.
2. Click the **Queue dropdown**. The dropdown lists the instance's queues by name, with the current selection marked.
3. Select the new queue.
4. Click **Save** and review your changes.

### Linking a Destination to Its Schedule

1. Open the item from the items table.
2. Click the **Schedule dropdown** to select an item.
3. To review the chosen schedule, click the open icon next to the field. It takes you to the referenced item.
4. Click **Save** and review your changes.

**Note:** To change the hours themselves, edit the schedule item instead. Because the data is linked, every destination that references the schedule picks up the update automatically. See Managing Schedules and Closures for more information.

### Adding a Routing Destination

1. In the entity view, click **+ Item**.
2. Fill in the fields according to the schema: at minimum the primary key, the queue, and any required references.
3. Click **Save**.

### Verifying a Destination

Use **Path Tester** in the DFC Browser sub-header to preview exactly what a contact flow receives when it queries the destination.

### Reviewing and Submitting Your Changes

1. Click **Save**. The **Are you sure?** dialog lists every pending change.
2. (Optional) Enter a **Change Request Description**.
3. Set the **Change Request Criticality**. The default is **Normal**.
4. (Optional) Set **Schedule For Later** to schedule the change.
5. Click **Yes, Submit Changes**.

A change request is created and routed through the standard DFC approval flow. Your changes apply once they are approved.
