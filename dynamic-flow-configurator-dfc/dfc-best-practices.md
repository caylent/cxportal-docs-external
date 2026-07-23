# DFC Best Practices

### Recommended Configurations

<details>

<summary><strong>Design Schemas Before Populating Data.</strong>  </summary>

Plan schemas carefully before adding items. Once items populate a field with data, the field's name and type are locked and the field can't be deleted. Upfront design prevents rework later.

</details>

<details>

<summary><strong>Keep Entities Flat and Reusable.</strong> </summary>

Favor more root-level entities with fewer sub-entity layers. Limit sub-entities to no more than five levels deep. This improves clarity, reuse, and query performance.

</details>

<details>

<summary><strong>Use clear naming.</strong></summary>

Use names that match how teams will search and validate data later, especially for QA and support. Prefer a small number of well-named entities over many overlapping ones.

</details>

<details>

<summary><strong>Separate Structure from Ownership.</strong></summary>

Let technical teams to define schemas and references while business teams manage values. This balance keeps systems flexible without sacrificing control.

</details>

<details>

<summary><strong>Test in non-production first.</strong> </summary>

Validate schema and item structure in a lower environment before applying the same configuration in production.

</details>

***

### Common Pitfalls

<details>

<summary><strong>Avoid</strong> adding items or sub-entities before the schema is finalized.</summary>

**Why:** Once items populate a field with data, the field locks, forcing you to remove that item data just to rename or delete the field.

</details>

<details>

<summary><strong>Avoid</strong> primary key values that contain a slash (/).</summary>

**Why:** DFC interprets the slash as an additional\
path segment, causing the query to fail.

</details>

<details>

<summary><strong>Avoid</strong> manually editing exported JSONL files.</summary>

**Why:** Manual edits can cause import errors or data corruption.

</details>

<details>

<summary><strong>Avoid</strong> creating or deleting items in shared environments unless instructed. </summary>

**Why:** Approved item changes affect any flow that references them.

</details>

<details>

<summary><strong>Avoid</strong> deleting a role while users are still assigned to it.</summary>

**Why:** Deleting a role removes its entity tag\
assignments and disrupts those users' access.

</details>

***

### Performance and Scaling

* Keep entities flat and limit sub-entity depth to no more than five levels to improve query  \
  performance.
* Import time depends on file size — a 1 MB file typically completes in about two minutes. Allow  \
  imports to finish and do not navigate away while the loading indicator is active.

***

### Security and Compliance

DFC limits risk through role-based access and schema guardrails. Apply the following access-control\
practices (these apply to [DFC Permissions](managing-dfc-permissions.md)):

<details>

<summary><strong>Create roles based on business function, not individual users.</strong></summary>

Name roles to reflect what they do, such as "Transfers Viewer" or "Prompts Editor." This makes it easier to manage access as teams change.

</details>

<details>

<summary><strong>Avoid creating too many roles.</strong></summary>

A large number of overlapping roles is difficult to maintain. Keep the role structure close to what the business actually requires.

</details>

<details>

<summary><strong>Use the permission ceiling intentionally.</strong></summary>

Set the permission level to the minimum needed for the role's function. A role that only needs to view items should have Item Viewer, not Admin, even if a few entity tags are assigned.

</details>

<details>

<summary><strong>Configure and verify in a lower environment first.</strong></summary>

Set up role and tag configuration in Dev or a test instance before applying the same setup in production.

</details>

<details>

<summary><strong>Review the Preview panel before saving.</strong></summary>

The entity browser on the right reflects exactly what the role will see. Use it to confirm that the intended entities are visible and that no unintended access has been granted.

</details>

***
