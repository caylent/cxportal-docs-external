# Setup Example: Conditionals

**DFC is highly customizable, so your setup may differ from this example. The steps below show how to configure conditionals.**

Conditionals let a contact flow change where a call goes, or what the caller hears, when a workgroup is in a condition such as closed, holiday, emergency, meeting, or unstaffed. The condition rules are stored as DFC data, so changing them is an item edit, not a flow edit.

## Before You Begin

- You need item edit permission on the entity. See Managing DFC Permissions.
- Adding new prompt variants requires at least the **Item Creator** permission level.
- Changes are submitted as a change request and take effect once approved.

## Step-by-Step Instructions

### Reviewing Your Conditionals

- In the DFC Browser, select the conditionals entity in the left panel.
- Click the conditionals sub-entities to view their items.
- Review the item table and click an item to see details.

### Editing a Conditional

- Open the item from the items table. The editing tray opens and is fully editable.
- Review and edit the conditionals options using the dropdowns. Use the open icon to view selection details.
- Click **Save** and review your changes.

### Adding a Conditional

- In the entity view, click **+ Item**.
- Set the condition key (the primary field) and fill in the conditional content.
- Click **Save**.

### Verifying What a Flow Receives

Use **Path Tester** in the DFC Browser sub-header to query the entity and preview exactly what the contact flow receives. Query the entity path with a trailing slash to check the default values.

### Reviewing and Submitting Your Changes

- Click **Save**. The **Are you sure?** dialog lists every pending change.
- (Optional) Enter a **Change Request Description**.
- Set the **Change Request Criticality**. The default is **Normal**.
- (Optional) Set **Schedule For Later** to schedule the change.
- Click **Yes, Submit Changes**.

A change request is created and routed through the standard DFC approval flow. Your changes apply once they are approved.
