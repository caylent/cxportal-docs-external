# DFC Design and Integration 

This guide explains how to design a DFC schema and how to use DFC data in your Amazon Connect contact flows. It builds on [Setting Up Entities and Schemas](../setting-up-entities-and-schemas/), [Developer Reference: Node.js Client](../developer-reference-node.js-client/), and [Importing and Exporting Data](../importing-and-exporting-data/), and links to them for step-by-step instructions.

## Design Your Schema

Schemas are long-lived. Once items fill a field, its name and type are locked, so the cheapest time to get the shape right is before you add data.

### Start from the hub-and-spoke model

Most contact center deployments can start from a common model rather than a blank DFC. A **Contact Source** (where a contact came in) points to an **Experience Config** (how to behave on that contact). The Experience Config is the hub. Schedules, prompts, routing, and AI settings are reusable building blocks that it references.

| Entity | What it is | Primary key | Links to |
|---|---|---|---|
| Contact Source | A channel entry point: phone number, chat widget, or email address | address | Experience Config |
| Experience Config | The reusable bundle of behavior for a contact | name | Language, Prompts, Schedule, Holidays, Closure, Routing Destination, AI Agent Config |
| Routing Destination | Where a contact is sent: queue, external number, voicemail, contact flow, or disconnect | name | Connect queue and flow; optionally Schedule and Closure |
| Schedule | Weekly operating hours | name | None |
| Holidays | Closures known in advance | name | None |
| Closure | Ad-hoc or emergency closures | name | None |
| Language | A supported language with its locale and voice | code | None |
| Prompts | Prompt sets, organized by language | name (within a language folder) | None |
| AI Agent Config | Self-service and AI settings | name | Knowledge Base |
| Knowledge Base | A knowledge base pointer (ID and region) | name | None |

Many Contact Sources can share one Experience Config. For routing-heavy deployments, you can add lookup entities such as Line of Business, Audience, or Intent and reference them from routing entities. For how to create entities and fields, see [Setting Up Entities and Schemas](../setting-up-entities-and-schemas/).

### Design principles

#### Decide whether it is a field or an entity

Make it a field when it only ever lives inside its parent and is not reused. Make it a referenced entity when it is reused across records. A schedule shared by many Experience Configs is an entity, and a description is a field.

#### Make dimensions entities, not pick lists

If something varies by customer, market, or language, make it a row in a lookup entity rather than a field name or a pick list option. A new row needs no schema change and no change to locked fields. A lookup entity can also carry metadata in one place, for example a Language row holding its locale and voice. 

| Poor shape: hardcoded dimensions | Good shape: dimensions as entities |
|---|---|
| Five fields, `lang1Prompts` through `lang5Prompts` | A Language entity with `code` (primary key), `name`, `locale`, `pollyVoiceId`, and `enabled` |
| Twenty-one separate per-language queue fields | One routing destination item per queue, each with an Amazon Connect Resource (Queue) field |
| A brand pick list whose only option is one brand name | No brand field until a second brand exists |
| Adding a sixth language means editing the schema, submitting a schema change request, and working around locked fields | Adding a sixth language means adding a Language row and a language folder under `prompts/` |

#### Choose a primary key flows can look up by

The primary key should be the natural, stable identifier a flow will use to find the item: `address` for a Contact Source, `code` for a Language, and `name` for a Schedule. It is always a required String and cannot contain a slash. Choose a value that will not need to change.

#### Model sets, not single rows

Do not create one prompt per row. Model a prompt set whose fields are the prompts, for example `welcome`, `firstQuestion`, and `outOfHoursMessage`. Start with a small generic set and extend it as needed, rather than building a large set up front. Add a message by adding a Prompt field.

#### Extend, don't fork

When two things differ slightly, add a field, add a row, or add a sub-entity that extends the parent schema, rather than creating parallel entities.

| Poor shape: forked entities | Good shape: one entity, extended |
|---|---|
| `VoiceInbound` and `ChatInbound` entities with mostly the same fields | One Contact Source entity with a channel pick list (voice, chat, email, sms, task) |
| Every change made twice | A sub-entity that extends Contact Source, only if one channel truly needs extra fields |

#### Keep it shallow, name it consistently, and design first

Prefer a small number of well-named root entities, keep sub-entities to five levels, and apply one naming style to entities, fields, and items. Finish the schema before adding items or sub-entities, validate it in a non-production environment, and promote it with export and import. See [DFC Best Practices](../dfc-best-practices/) for the full list.

---

## Use DFC in Your Connect Instance

### How a flow reads DFC

DFC stores configuration, and your contact flow consumes it. A flow gets DFC data by invoking a Lambda function that queries DFC by path. You have two options:

**Option 1: Use the default DFC lookup Lambda (recommended for simple lookups)**

Caylent provides a default DFC lookup Lambda. Invoke it from your flow, passing the path and your Connect instance ID, and it returns the record. Use this option when all you need is to look up a value and branch on it.

1. The contact flow invokes the DFC lookup Lambda and passes it the path to look up and the Connect instance ID.
2. The Lambda function returns the entity or item. Use the `evaluated` field, which holds the final merged values with entity defaults resolved.
3. The flow branches on the values and plays prompts, transfers, or applies hours.

**Option 2: Write your own Lambda with the DFC Node.js client**

Use the Node.js package when you want to run other logic in the Lambda before returning to the flow, such as combining several lookups, transforming values, or calling another system.

1. The contact flow invokes your Lambda function and passes it the paths to look up.
2. Your Lambda function calls `queryByPath` (or `queryByPathBatch` for several paths at once) with your Connect instance ID.
3. DFC returns the entity or item. Use the `evaluated` field, which holds the final merged values with entity defaults resolved.
4. Your Lambda applies any additional logic and returns the result to the flow, which branches on the values and plays prompts, transfers, or applies hours.

For installation, the code sample, configuration options, and error handling for the Node.js client, see Developer Reference: Node.js Client.

**Before you build:**

- Check a path in Path Tester first. It shows exactly what the Lambda function will receive
- Entity and item IDs are preserved when you promote configuration by import, so references in your flows and Lambda functions stay valid across environments
- For installation, the code sample, configuration options, and error handling, see [Developer Reference: Node.js Client](../developer-reference-node.js-client/)

### Pattern: resolve the caller's language

Language selection uses two Experience Config fields plus the flow. DFC holds the data, and the flow does the asking.

1. An inbound contact is matched to its Contact Source, then its Experience Config.
2. If `enableLanguageSelection` is false, the flow uses `defaultLanguage`.
3. If it is true, the flow asks the caller which language they want and stores the answer in a contact attribute.
4. The flow takes the Experience Config's prompt set name and reads `prompts/{selectedLanguage}/{name}`.

The prompt set name stays the same across languages, and only the language folder changes. Single-language numbers skip step 3. For the structure behind this, see the prompts-by-language worked example on the [Overview](../dynamic-flow-configurator-dfc-homepage/).

### Pattern: "Are we open?"

Being open takes three checks, not one, which is why Schedule, Holidays, and Closure are separate.

| Check | Entity | Closed when |
|---|---|---|
| In hours | Schedule | The current time falls outside the weekly hours |
| Not a holiday | Holidays | The date matches a closure known in advance |
| Not closed | Closure | An active ad-hoc or emergency closure covers now |

Open = in Schedule hours AND not a Holidays date AND not under an active Closure. If any check fails, treat the contact center as closed.

Keeping them separate matches how they change. A Schedule changes rarely. Holidays are entered ahead of time. A Closure is created or switched on at short notice.

To implement it:

1. Read the Experience Config for the contact, then follow its schedule, holidays, and closure references.
2. Evaluate the current time against each. Schedule times are stored in UTC, so compare in UTC.
3. Combine the results so that all three must pass.
4. If you route to a destination with its own Schedule and Closure, repeat the check for the destination, because a destination can be closed even when the front door is open.
5. Play the out-of-hours prompt from the contact's prompt set when closed.

To set hours and closures on an item, see [Managing Schedules and Closures](../managing-hours-of-operation-and-closures/).

### Optional flow kit

A kit of reference flows, modules, and Lambda functions can consume this data for you:

- **Inbound lookup flow:** resolves the dialed number or chat to its Contact Source and Experience Config and sets contact attributes
- **Language selection module:** reads `enableLanguageSelection`, asks the caller if needed, and loads the matching prompt set
- **Is-open module:** returns open or closed by checking Schedule, Holidays, and Closure in one step

Using the kit is optional. You can build your own flows against the same data.

### Promote configuration between environments

Use export and import to move configuration from Dev to Production. Export from the root covers every entity and item, and export from an entity covers that entity, its children, and their items. Entity and item IDs are retained, so references in your flows and Lambda functions stay valid, and Connect resource ARNs are rebuilt from resource names in the target. Imports apply immediately, bypass change request approval, overwrite any record with a matching ID, and cannot be reverted. Do not edit the exported file by hand. For validation errors and troubleshooting, see [Importing and Exporting Data](../importing-and-exporting-data/).

---

## Behavior to Plan For

| Topic | What to expect |
|---|---|
| Schema changes over time | Fields lock once items hold data: the name and type cannot change, and the field cannot be deleted until the item data is removed. Fields also cannot be deleted or renamed while sub-entities or items exist. Schema edits go through a change request and show as pending until approved. See [Setting Up Entities and Schemas](../setting-up-entities-and-schemas/). |
| Links and deletions | An entity can be deleted only when it is empty. Bulk delete is blocked when any selected item has inbound references. Imports are rejected when they reference records missing in the target. Connect resource ARNs are rebuilt by name on import. See "What happens when a target changes" on the [Overview](../dynamic-flow-configurator-dfc-homepage/). |
| Change requests and audit | Schema changes, item create, edit, and delete, and bulk actions go through change requests with approval and are recorded in the Audit Log. Approved bulk actions can be reverted. Imports apply immediately, are recorded as one Import entry, and cannot be reverted. See [Bulk Editing and Deleting Items](../bulk-editing-and-deleting-items/) and [Importing and Exporting Data](../importing-and-exporting-data/). |
| Permissions | Roles are created in CxCentral. Entity tags and approver access are set in DFC Permissions. Schema authoring needs Entity Editor or Admin. Editing items needs Item Editor, and creating items needs Item Creator. Only Admin can create or delete top-level entities and manage permissions. Access is per instance. See [Managing DFC Permissions](../managing-dfc-permissions/). |
