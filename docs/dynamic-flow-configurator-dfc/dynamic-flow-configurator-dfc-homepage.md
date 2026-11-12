# Dynamic Flow Configurator (DFC)

## Overview

**Dynamic Flow Configurator (DFC)** gives you a centralized interface for managing the data that drives Amazon Connect contact flows. You can create, update, and maintain values — such as prompts, hours of operation, routing rules, and callback behavior — without editing contact flows or writing code. This reduces bottlenecks, lowers risk, and helps keep customer experiences consistent across all your contact flows.

DFC separates two things:

* **Flow logic:** The flow design and decision paths, managed by technical teams
* **Flow data:** The values the flow looks up while running, managed by businesses and operational teams

Technical teams define the structure and rules once. Business and operations teams manage the values that change day to day.

[Watch video](https://www.youtube.com/watch?index=2&list=PLpgcSwyApvJBEYmlf0pjnS2XvFjvR8X1Y&v=Y0Pnro-0_bo)

!!! warning ""
DFC is designed for teams responsible for managing customer interaction behavior. DFC is not intended for agents and does not require deep technical expertise to use. Common uses:

* Prompt content: update prompt text or message variants in one place and reuse them across flows
* Hours of operation: store schedules centrally so routing and messaging follow the latest business hours
* Allow and block lists: store lists such as blocked caller IDs or blocked destinations that flows check while running
* Transfer routing: define transfer points that send contacts to queues or external destinations, so flows query data at runtime instead of relying on hard-coded routing logic


***

## Benefits at a Glance

* **Instant updates** — Update operational values without redeploying flows.
* **Less rework** — Reduce repeated changes across multiple flows.
* **Centralized control** — Keep behavior consistent by managing data in one place.
* **Built-in safeguards** — Limit risk through role-based access and schema guardrails.

<img width="2000" height="1414" alt="dfc" src="https://github.com/user-attachments/assets/a8c5c81c-f71b-400b-9ae4-4a3c3323dd8d" />


***

## How It Works

DFC works by defining structured data once and reusing it everywhere. When you update a value, the change is immediately available to any flow that references it. Role-based access and schema guardrails keep updates controlled while letting the right teams move quickly. 

### The building blocks

| Term | What it is |
| --- | --- |
| Entity | A top-level container for one category of data, such as Prompts or Schedules. Has a name, a description, a schema, items, and optionally sub-entities. |
| Schema | The structure of an entity: which fields exist, the type of each, and which field is the primary key. |
| Item | One record that follows the schema and holds the values a flow reads. Approved item changes take effect immediately for any flow that reads them. |
| Sub-entity | A child grouping that automatically inherits its parent's schema. |
| Default | The value an entity returns when a flow queries it without naming a specific item. Gives flows a safe fallback. |
| Reference | A field that links to an item in another entity, so data is linked instead of copied. |

Everything in DFC is addressed by path. A path ending in a slash addresses an entity; a path without one addresses an item.

| Path | Returns |
| --- | --- |
| `/` | All root-level entities |
| `/prompts/en-us/` | The entity at that path, its child entities, its items, and its resolved default values |
| `/prompts/en-us/welcome-message` | That one item and its values |

### Two kinds of links

Fields can point at other things in two ways. Choosing the right one is the most common schema decision.

| | Reference | Amazon Connect Resource |
| --- | --- | --- |
| **Points to** | An item in another DFC entity | A live Amazon Connect resource: Queue, Contact Flow, Contact Flow Module, Prompt, Phone Number, or Lex Bot |
| **Owned by** | DFC | Amazon Connect |
| **Use it for** | Things you manage inside DFC and reuse, such as a schedule shared by many destinations | Things Connect owns, such as the queue a destination sends contacts to |
| **What DFC stores** | A link to the item; the item's primary key shows inline | Which resource to use; the resource itself is created and managed in Connect |
| **Example** | A routing destination's `schedule` points to a Schedule item | A routing destination's `queue` points to a Connect queue |

A routing destination shows both at once: its queue lives in Connect, and its hours live in DFC.

### What happens when a target changes

- **Editing a referenced item:** changes flow through to everything that references it. Change a schedule once and every destination linked to it uses the new hours.
- **Deleting an entity:** only possible once it has no items and no sub-entities. Deleting is permanent.
- **Deleting items that other items reference:** a bulk delete is blocked entirely if any selected item still has inbound references, and the error names the blocking items by primary key. Nothing is deleted until you remove those references or take the items out of the selection.
- **Moving between environments:** the same Connect queue has a different ID in each instance. On import, DFC rebuilds each Connect resource ARN from the resource's name in the target environment. Keep resource names consistent across environments. An import that references DFC records missing from the target is rejected as unresolved.
- **Connect resources that are deleted or renamed in Amazon Connect:** DFC stores which resource an item uses; the resource itself is managed in Connect. A value stored in an older format shows a warning triangle with the message "Legacy format - re-save to update"; open the item and save it again to update it.
- **Agentic CX Application IDs** are checked for format only. A wrong ID sends contacts down the Agentic CX flow block's Error branch.

### Hierarchy and inheritance

Sub-entities inherit their parent's schema, so you define a structure once and reuse it. Inherited fields cannot be changed at the sub-entity level, but you can add more fields to a sub-entity. A field marked Overridable lets items or sub-entities override its default value.

### Worked example: prompts by language

Prompts vary along one axis, language, so they are a natural fit for hierarchy. The prompt set is the unit: its fields are the prompts.

```text
prompts/                    schema defined here: name (primary key),
                            welcome, firstQuestion, outOfHours (all Prompt)
  en-us/                    language sub-entity, inherits the schema
    main                    item: a filled-in prompt set
    support
  es-mx/                    language sub-entity, inherits the schema
    main
```

| Level | What lives there | Who changes it |
| --- | --- | --- |
| Root (`prompts/`) | The schema: one Prompt field per message slot | Technical team, through a change request |
| Language folder | A grouping that inherits the schema | Technical team, when a language is added |
| Item (leaf) | The actual prompt text for one set in one language | Business team |

What this gives you:

- **Add a message** by adding one Prompt field at the root. Language folders inherit it.
- **Add a language** by creating a sub-entity and adding a row to your Language entity. No schema change.
- **Reuse names across languages.** An item's primary key only needs to be unique within its folder, so `main` can exist under `en-us/` and `es-mx/`. The path keeps them distinct.
- **Keep language details in one place.** The flow reads the language code from the path and looks up voice and locale from the Language entity, rather than copying them into every prompt item.
- **Keep it shallow.** Favor more root-level entities with fewer layers. Limit sub-entities to five levels, which keeps structure clear and queries fast.

### How changes take effect

Changes to schemas and items are submitted as change requests and take effect once approved.

| Change | How it is handled |
| --- | --- |
| Schema edits | Accumulate as a draft on the entity's settings page and are submitted together as one change request. New fields show as pending until approved. |
| Item create, edit, delete | Submitted as a change request. Each request carries a description, a criticality (Normal or Urgent), and an optional scheduled time. |
| Bulk edit or delete | Up to 500 items in one change request. Approvers act on the whole batch or on individual records. |
| Import | Applied immediately and auto-approved. Recorded as a single Import entry in the Audit Log. Imports cannot be reverted. |

Approved changes are recorded in the Audit Log, and approved bulk actions can be reverted from the audit record.


***

## Who Uses This

* **Business Admins / Operations Teams** — Manage flow data: update operational values such as prompts, hours of operation, allow/block lists, and transfer routing without editing contact flows or writing code.
* **Developers / Technical Teams** — Define entity schemas and references, and integrate DFC data into Amazon Connect contact flows and Lambda functions using the [DFC Node.js Client.](developer-reference-node.js-client.md)

!!! info ""
    DFC is not intended for agents and does not require deep technical or development expertise.


***

## Key Concepts

DFC works by defining structured data once and reusing it everywhere. You need to understand these terms before following the task pages.

| Term           | Definition                                                                                                                                                                                              |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Entity**     | A top-level container for a category of data (for example, *Prompts* or *HoursOfOperation*). Each entity has a name and description, a defined schema, one or more items, and can include sub-entities. |
| **Schema**     | The structure of an entity — which fields exist, what type of data each stores, and which field acts as the primary key.                                                                                |
| **Item**       | A single record inside an entity that follows the entity's schema and stores the actual values contact flows use. Item changes take effect immediately.                                                 |
| **Sub-entity** | A child grouping under an entity that automatically inherits the parent entity's schema, letting you organize data hierarchically without redefining fields.                                            |
| **Default**    | A value an entity returns when a flow queries it without specifying an item, so flows can fall back to safe, known values when no specific match is found.                                              |
| **Reference**  | A field that links to an item in another entity, so data is linked instead of duplicated. Updates to the referenced entity flow through automatically.                                                  |

***

## Permissions

Before you begin:

* You must have an admin permission or tag based permission assigned to your account in CxCentral before you can access DFC.
* Creating or deleting top-level entities and modifying schemas requires a higher permission level (**Entity Editor** or **Admin**). If certain actions are not visible in the UI, your role may not include those permissions.

See [Managing DFC Permissions](managing-dfc-permissions.md) for the full setup.

***

## What You Can Do

* Access the DFC Browser and navigate entities → [Getting Started with DFC](getting-started-with-dfc.md)
* Search across items and entities → [Searching DFC](searching-dfc.md)
* Set up entities, sub-entities, schemas, and items → [Setting Up Entities and Schemas](setting-up-entities-and-schemas.md)
* Edit SSML voice content in a Prompt field → [Editing Prompt Fields](editing-prompt-fields.md)
* Import and export data between environments → [Importing and Exporting Data](importing-and-exporting-data.md)
* Manage roles and entity-level access → [Managing DFC Permissions](managing-dfc-permissions.md)
* Look up field types, limits, and the Node.js client → [DFC Reference](developer-reference-node.js-client.md)

***

## Common Use Cases

The following scenarios highlight when DFC is commonly used.

??? note "Manage prompt content"

    Update prompt text or message variants in one place, then reuse them across multiple flows.

??? note "Manage hours of operation"

    Store schedules centrally so routing and messaging follow the latest business hours.

??? note "Manage allow/block lists"

    Store lists such as blocked caller IDs or blocked destinations that flows check during execution.

??? note "Manage transfer routing"

    Define transfer points that control how contacts route to queues or external destinations. Contact flows query transfer data at runtime instead of relying on hard-coded routing logic.

***

## Related Modules

* **CxCentral** — Create and manage the roles and user assignments that DFC permissions build on. DFC permission levels are configured against a role in CxCentral before entity tags are assigned in DFC. See [Managing DFC permissions.](managing-dfc-permissions.md)

***
