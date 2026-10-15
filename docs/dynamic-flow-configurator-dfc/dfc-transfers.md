# Setup Example: Transfers

**Transfers** define where a transfer sends a contact. Each transfer item maps a transfer identifier to a destination, typically pointing at a routing destination or queue item, plus the message played when the transfer happens. Contact flows query the transfer data at runtime instead of relying on hard-coded routing logic, so retargeting a transfer is a data change, not a flow change.

A typical transfer item includes:

| **Field** | **What it stores** |
| --- | --- |
| **ID** (primary) | The identifier flows use to look the transfer up. |
| **Routing destination** | A required **Reference** field linking to the item the contact is transferred to (for example, a queue item). |
| **Transfer Message** | The message associated with the transfer. |

Your instance's exact entity name and fields are set by its schema.

## Before You Begin

- You need item edit permission on the entity. See [Managing DFC Permissions](managing-dfc-permissions.md).
- Adding new transfers requires at least the **Item Creator** permission level.
- Changes are submitted as a change request and take effect once approved.
- The destinations a transfer can point at must already exist as items in the entity. 

## Step-by-Step Instructions

### Reviewing Your Transfers

- In the DFC Browser, select the transfer entity in the left panel.
- Review the table of items and their details.
- The **Defaults** panel above the table holds the entity's default property values and the fallback a flow receives when it queries the entity without naming a specific transfer.

### Changing a Transfer's Destination

- Open the item from the items table. The editing tray opens and is fully editable.
- Click the **routing destination dropdown** and select an item from the entity.
- To review what the transfer currently points at, click the open icon next to the field. It takes you to the referenced item.
- Click **Save** and review your changes.

### Editing the Transfer Message

- Open the item from the items table.
- Edit the transfer message field. If the field is a **Prompt** field, the SSML editor opens.
- Click **Save** and review your changes.

### Adding a Transfer

- In the entity view, click **+ Item**.
- Fill in the fields according to the schema: at minimum the primary key and the required routing destination.
- Click **Save**.

### Verifying a Transfer

Use **Path Tester** in the DFC Browser sub-header to preview exactly what a contact flow receives when it queries the transfer.

### Reviewing and Submitting Your Changes

- Click **Save**. The **Are you sure?** dialog lists every pending change.
- (Optional) Enter a **Change Request Description**.
- Set the **Change Request Criticality**. The default is **Normal**.
- (Optional) Set **Schedule For Later** to schedule the change.
- Click **Yes, Submit Changes**.

A change request is created and routed through the standard DFC approval flow. Your changes apply once they are approved.
