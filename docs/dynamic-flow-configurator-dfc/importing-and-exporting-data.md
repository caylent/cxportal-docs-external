---
description: >-
  Export entity and item data from one environment and import it into another.
  This supports workflows such as promoting configuration from a development or
  staging environment to production.
---

# Importing and Exporting Data

## Before You Begin

* Use import and export to promote configuration between environments.
* Changes from an import apply immediately. The DFC Browser refreshes automatically after import
  &#x20;completes.
* Import does not place records into the entity you have selected. Every record goes to the entity ID recorded in the file. Selecting a different entity before importing changes nothing about where the data lands.
* Imports are always auto-approved — they don't route through the change-request approval flow. Imports are always auto-approved — they don't route through the change-request approval flow.

  ???+ note "Key behaviors"

    * Exported files preserve entity IDs and item IDs exactly as they exist in the source environment.
    * When imported into a second environment, those IDs are retained. This differs from manual
      entity creation, which generates a new unique ID.
    * Consistent IDs make it easier to reference entities and items in Amazon Connect contact flows,
      Lambda functions, or other integrations.
    * Items are imported into the entity whose ID they carry in the file, not into the entity you have
      open. If that entity does not exist in the target environment, the items are written but have no
      entity to appear under.
    * Import cannot copy items from one entity to another. Because IDs are preserved, importing an
      entity's export back into the same instance rewrites that same entity — it does not duplicate it
      elsewhere. There is currently no supported way to copy items between entities or sub-entities.
    * Exported data uses the JSON Lines (JSONL) format. Each line in the file is a self-contained JSON
      object representing either an entity or an item record.

***

## Step-by-Step Instructions

### Accessing Import/Export

Import and export live in the DFC sub-header. Export offers two formats: **JSON** Lines for moving configuration between environments, and **CSV** for a spreadsheet of a single entity’s items. CSV is export-only — the import dialog accepts JSON Lines files.

1. Open the **DFC Browser**.
2. In the sub-header, click **Export** or **Import**. Hover the icons to see their tooltips.


!!! note

    The Export and Import buttons appear only if you have edit permission.

***

### From a Specific Entity

Import and export always act on wherever you are in the DFC Browser. The icons sit in the sub-header, to the right of the Search DFC bar, and do not move.

1. In the left panel, navigate to the entity you want to export.
2. Click the export or import icon in the sub-header.

At the root, export covers every entity in the instance. Inside an entity, it covers that entity, all of its child entities, and the items in every one of them.
***

### Exporting Data &#x20;

1\. In the sub-header, click **Export**.

2\. In the **Export** dialog, click **Start export.**

!!! note

     The dialog's description tells you the scope of the export. At the root, it explains that every entity in this instance, along with their children and all associated items, will be exported. From a specific entity, it scopes the same description to that entity, its children, and all associated items.

3\. DFC prepares the JSON Lines file and downloads it to your computer automatically.

4. Review the summary showing the number of entities and items exported. Click **Restart** to run another export.

!!! danger

    Do not manually edit the exported JSONL file. Manual edits can cause import errors or
    data corruption. If edits are required, use programmatic tools and validate the file structure before
    importing.

***

### Importing Data  &#x20;

1\. Navigate to the target environment in DFC.&#x20;

2\. In the sub-header, click **Import**.

3\. In the import dialog, click **Select File** and choose the exported JSONL file.&#x20;

4\. Click **Start Import**.**&#x20;

5\. DFC processes the file and displays a summary with the number of lines processed, entities imported, and items imported.&#x20;

6\. The **DFC Browser** refreshes automatically after import completes.&#x20;

!!! success

    Allow the import process to complete fully. Do not navigate away while the loading indicator is active. Import time depends on file size — a 1 MB file typically completes in
    approximately two minutes. If an error occurs, the loading indicator stops and an error message is
    displayed. If no error is shown, the import is still processing.

!!! note "Amazon Connect resources"

    Amazon Connect resource(s) have their ARNs updated
    automatically using the name of the resource. For example, a queue called "Basic Queue" has an ID
    of 1111-11111-1111 in instance A but 2222-22222-2222 in instance B. When you import an item that
    references this queue, DFC automatically reconstructs the ARN using the resource name in the target
    environment.

***

### Import Validation

DFC validates the import file at submission time. If validation fails, nothing is written and no change request is raised.

`IMPORT_UNRESOLVED_REFERENCES` — the file references records that don't exist in the target environment.
`IMPORT_DUPLICATE_RECORDS` — the file contains duplicate entity or item keys.
`IMPORT_PATH_CONFLICTS` — one or more entities in the file collide on path with an existing entity in the target environment, or with another entity in the same file. The rejection lists each colliding path and its cause: "already exists in this environment" or "appears more than once in this file."
`IMPORT_DUPLICATE_PRIMARY_KEYS` — two or more items in the file share a primary key within the same entity. Unlike the other validation errors, the dialog shows only a message and does not list the offending items. Check the file for repeated primary-key values inside a single entity, remove the duplicates, and resubmit.

Fix the file and submit the import again. You don't need to reopen the dialog to do this — selecting a new file from the same **Import** dialog clears the previous error and lets you retry immediately.


***

### Import Audit Logging

An import is recorded as a single bulk entry in the Audit Log, labelled **Import**, showing the number of records affected. Open the entry and select **View Individual Records** to page through every entity and item the import wrote, with before and after state for each.

!!! danger "Known limitation"

    An import is modelled as a bulk create. If an import reuses an ID that already exists in the target environment, the import overwrites that record — logged as a create with no prior snapshot. Imports cannot be reverted. Because an import overwrites rather than updates, reverting it would delete records that existed beforehand instead of restoring them. The **Revert Bulk** action is disabled on import entries.
***


## Troubleshooting

<table><thead><tr><th width="289">Problem</th><th>Cause</th><th>Solution</th></tr></thead><tbody><tr><td><strong>Imported items do not appear</strong></td><td>The target environment has no
 matching entity at the same
 path / entity ID</td><td>Verify the target environment
<br>contains an entity with the same
 entity ID at the same location
 before importing.</td></tr><tr><td><strong>Records went to the entity they came from, not the one I selected</strong></td><td>Import places records by the entity ID recorded in the file. The entity you have open is not a destination.</td><td>Expected behaviour. To promote configuration, import into an environment where the matching entity exists. Copying items between entities is not supported.</td></tr><tr><td><strong>The loading indicator never</strong>
<br><strong>stops and no summary appears</strong></td><td>The import is still processing, or
 the file is large</td><td>Wait for completion (a 1 MB file
 takes about two minutes) and
 do not navigate away. If an error
 message appears, the import
 failed.</td></tr><tr><td><strong>Import errors or data corruption</strong></td><td>The exported JSONL file was
<br>manually edited</td><td>Re-export the data and avoid
<br>manual edits. If edits are
<br>required, use programmatic tools and validate the file
<br>structure before importing.</td></tr><tr><td><strong>Import rejected with</strong> <code>IMPORT_UNRESOLVED_REFERENCES</code></td><td>The file references records that don't exist in the target environment</td><td>Ensure the referenced records exist in the target (or import them first), then resubmit.</td></tr><tr><td><strong>Import rejected with</strong> <code>IMPORT_DUPLICATE_RECORDS</code></td><td>The file contains duplicate entity or item keys</td><td>Remove the duplicates from the file and resubmit.</td></tr><tr><td><strong>Import rejected with</strong> <code>IMPORT_PATH_CONFLICTS</code></td><td>One or more entities in the file collide on path with an existing entity in the target environment, or with another entity in the same file</td><td>Review the listed colliding paths, fix the file, then select it again in the same dialog to retry.</td></tr><tr><td><strong>Import rejected with</strong> <code>IMPORT_DUPLICATE_PRIMARY_KEYS</code></td><td>Two or more items in the file share a primary key within the same entity</td><td>The dialog does not list the offending items. Check the file for repeated primary-key values inside a single entity, remove the duplicates, and resubmit.</td></tr></tbody></table>

***
