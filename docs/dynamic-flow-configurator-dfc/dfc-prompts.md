# Setup Example: Prompts

**DFC is highly customizable, so your setup may differ from this example. The steps below show how to configure prompts.**

Prompts are fields that store the SSML text Amazon Connect speaks to callers. You edit it in a rich text editor that adds pauses, emphasis and pronunciation, or in Code View for raw SSML.

## Before You Begin

- You need item edit permission on the entity. See [Managing DFC Permissions](managing-dfc-permissions.md). 
- Adding new prompt variants requires at least the **Item Creator** permission level.
- Changes are submitted as a change request and take effect once approved.
- Prompt fields are edited with DFC's SSML editor. For the full editor reference, including the formatting toolbar, Code View, validation, and audio preview, see [Editing Prompt Fields](editing-prompt-fields).

## Step-by-Step Instructions

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

### Reviewing and Submitting Your Changes

1. Click **Save**. The **Are you sure?** dialog lists every pending change.
2. (Optional) Enter a **Change Request Description**.
3. Set the **Change Request Criticality**. The default is **Normal**.
4. (Optional) Set **Schedule For Later** to schedule the change.
5. Click **Yes, Submit Changes**.

A change request is created and routed through the standard DFC approval flow. Your changes apply once they are approved.
