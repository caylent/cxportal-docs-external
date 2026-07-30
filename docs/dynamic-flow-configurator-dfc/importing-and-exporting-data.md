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
* Imports are always auto-approved — they don't route through the change-request approval flow. Every record an import creates is logged individually in the **Audit Log**.

<details open>

<summary><strong>Key behaviors</strong></summary>

* Exported files preserve entity IDs and item IDs exactly as they exist in the source environment.
* When imported into a second environment, those IDs are retained. This differs from manual
  &#x20;entity creation, which generates a new unique ID.
* Consistent IDs make it easier to reference entities and items in Amazon Connect contact flows,
  &#x20;Lambda functions, or other integrations.
*
  Exported data uses the JSON Lines (JSONL) format. Each line in the file is a self-contained JSON
  &#x20;object representing either an entity or an item record.

</details>

***

## Step-by-Step Instructions

### Accessing Import/Export

Import and export live in the DFC sub-header.

1. Open the **DFC Browser**.
2. In the sub-header, click **Export** or **Import**. Hover the icons to see their tooltips.


{% hint style="info" %}
**Note:** The Export and Import buttons appear only if you have edit permission.
{% endhint %}

***

#### From a Specific Entity:&#x20;

1\. Navigate to the entity in the left panel.&#x20;

2\. Click the three-dot menu **(⋮)** next to the entity name.&#x20;

3\. Select **Export** or **Import.**&#x20;

When exporting from a specific entity, only that entity and the items inside it are included in the exported file.&#x20;

***

### Exporting Data &#x20;

1\. In the sub-header, click **Export**.

2\. In the **Export** dialog, click **Start export.**

{% hint style="info" %}
**Note:** The dialog's description tells you the scope of the export. From the sub-header, it explains that every entity in this instance, along with their children and all associated items, will be exported. From a specific entity's three-dot menu, it scopes the same description to that entity, its children, and all associated items.
{% endhint %}

3\. DFC prepares the JSON Lines file and downloads it to your computer automatically.

4.Review the summary showing the number of entities and items exported. Click **Restart** to run another export.

{% hint style="danger" %}
**Danger:** Do not manually edit the exported JSONL file. Manual edits can cause import errors or
\
data corruption. If edits are required, use programmatic tools and validate the file structure before
\
importing.
{% endhint %}

***

### Importing Data  &#x20;

1\. Navigate to the target environment in DFC.&#x20;

2\. In the sub-header, click **Import**.

3\. In the import dialog, click **Select File** and choose the exported JSONL file.&#x20;

4\. Click **Start Import**<mark style="color:$primary;">**.**</mark>&#x20;

5\. DFC processes the file and displays a summary with the number of lines processed, entities imported, and items imported.&#x20;

6\. The **DFC Browser** refreshes automatically after import completes.&#x20;

{% hint style="success" %}
**Success:** Allow the import process to complete fully. Do not navigate away while the loading indicator is active. Import time depends on file size — a 1 MB file typically completes in
&#x20;approximately two minutes. If an error occurs, the loading indicator stops and an error message is
&#x20;displayed. If no error is shown, the import is still processing.
{% endhint %}

{% hint style="info" %}
**Note (Amazon Connect resources):** Amazon Connect resource(s) have their ARNs updated
\
automatically using the name of the resource. For example, a queue called "Basic Queue" has an ID
\
of 1111-11111-1111 in instance A but 2222-22222-2222 in instance B. When you import an item that
\
references this queue, DFC automatically reconstructs the ARN using the resource name in the target
\
environment.
{% endhint %}

***

### **Import Validation**

DFC validates the import file at submission time. If validation fails, nothing is written and no change request is raised.

* `IMPORT_UNRESOLVED_REFERENCES` — the file references records that don't exist in the target environment.
* `IMPORT_DUPLICATE_RECORDS` — the file contains duplicate entity or item keys.
* `IMPORT_PATH_CONFLICTS` — one or more entities in the file collide on path with an existing entity in the target environment, or with another entity in the same file. The rejection lists each colliding path and its cause: "already exists in this environment" or "appears more than once in this file."

Fix the file and submit the import again. You don't need to reopen the dialog to do this — selecting a new file from the same **Import** dialog clears the previous error and lets you retry immediately.

***

### **Import Audit Logging**

Every record an import creates is logged individually so you can trace any record from creation to current state.

* The **Audit Log** contains a separate entry for every entity and item the import created — not a single "import ran" line.
* Each entry records the actor, the timestamp, the affected entity path or item primary key, the action, and that the change came from an import — visibly distinct from a manual edit, a scheduled change, or a just-in-time change.
* An applied import can be reverted from change tracking. Reverting removes the records the import created, and the revert itself is reflected in change tracking.

{% hint style="danger" %}
**Warning (known limitation):** An import is modelled as a bulk create. If an import reuses an ID that already exists in the target environment, the import overwrites that record — logged as a create with no prior snapshot. Reverting the import deletes the record rather than restoring its previous values.
{% endhint %}

***

### Entity-Level Import &#x20;

When importing a file that was exported from a specific entity, the target environment must contain an entity with the same entity ID at the same location. If the matching entity does not exist in the target environment, the imported items will not be visible. &#x20;

***

## Troubleshooting

<table><thead><tr><th width="289">Problem</th><th>Cause</th><th>Solution</th></tr></thead><tbody><tr><td><strong>Imported items do not appear</strong></td><td>The target environment has no
 matching entity at the same
 path / entity ID</td><td>Verify the target environment
<br>contains an entity with the same
 entity ID at the same location
 before importing.</td></tr><tr><td><strong>The loading indicator never</strong>
<br><strong>stops and no summary appears</strong></td><td>The import is still processing, or
 the file is large</td><td>Wait for completion (a 1 MB file
 takes about two minutes) and
 do not navigate away. If an error
 message appears, the import
 failed.</td></tr><tr><td><strong>Import errors or data corruption</strong></td><td>The exported JSONL file was
<br>manually edited</td><td>Re-export the data and avoid
<br>manual edits. If edits are
<br>required, use programmatic tools and validate the file
<br>structure before importing.</td></tr><tr><td><strong>Import rejected with</strong> <code>IMPORT_UNRESOLVED_REFERENCES</code></td><td>The file references records that don't exist in the target environment</td><td>Ensure the referenced records exist in the target (or import them first), then resubmit.</td></tr><tr><td><strong>Import rejected with</strong> <code>IMPORT_DUPLICATE_RECORDS</code></td><td>The file contains duplicate entity or item keys</td><td>Remove the duplicates from the file and resubmit.</td></tr><tr><td><strong>Import rejected with</strong> <code>IMPORT_PATH_CONFLICTS</code></td><td>One or more entities in the file collide on path with an existing entity in the target environment, or with another entity in the same file</td><td>Review the listed colliding paths, fix the file, then select it again in the same dialog to retry.</td></tr></tbody></table>

***
