# DFC Best Practices

### Recommended Configurations

??? note "Design Schemas Before Populating Data."

    Plan schemas carefully before adding items. Once items populate a field with data, the field's name and type are locked and the field can't be deleted. Upfront design prevents rework later.

??? note "Keep Entities Flat and Reusable."

    Favor more root-level entities with fewer sub-entity layers. Limit sub-entities to no more than five levels deep. This improves clarity, reuse, and query performance.

??? note "Use clear naming."

    Use names that match how teams will search and validate data later, especially for QA and support. Prefer a small number of well-named entities over many overlapping ones.

??? note "Separate Structure from Ownership."

    Let technical teams to define schemas and references while business teams manage values. This balance keeps systems flexible without sacrificing control.

??? note "Test in non-production first."

    Validate schema and item structure in a lower environment before applying the same configuration in production.

***

### Common Pitfalls

??? note "Avoid adding items or sub-entities before the schema is finalized."

    **Why:** Once items populate a field with data, the field locks, forcing you to remove that item data just to rename or delete the field.

??? note "Avoid primary key values that contain a slash (/)."

    **Why:** DFC interprets the slash as an additional\
    path segment, causing the query to fail.

??? note "Avoid manually editing exported JSONL files."

    **Why:** Manual edits can cause import errors or data corruption.

??? note "Avoid creating or deleting items in shared environments unless instructed."

    **Why:** Approved item changes affect any flow that references them.

??? note "Avoid deleting a role while users are still assigned to it."

    **Why:** Deleting a role removes its entity tag\
    assignments and disrupts those users' access.

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

??? note "Create roles based on business function, not individual users."

    Name roles to reflect what they do, such as "Transfers Viewer" or "Prompts Editor." This makes it easier to manage access as teams change.

??? note "Avoid creating too many roles."

    A large number of overlapping roles is difficult to maintain. Keep the role structure close to what the business actually requires.

??? note "Tag for the minimum access the role needs."

    The permission level is derived from the role's highest tag, so a role that only needs to read items should carry **View** tags, not **Admin** tags. Reserve the **Admin** access mode for roles that genuinely need every entity and item.

??? note "Configure and verify in a lower environment first."

    Set up role and tag configuration in Dev or a test instance before applying the same setup in production.

??? note "Check the summary strip before saving."

    **Derived permission**, **Active Tags**, and **Approver access** at the top of the role's configuration page reflect the tags you've set. Confirm they match the access you intend before you click **Save Changes**.

***
