# Dynamic Flow Configurator (DFC)

## Overview

**Dynamic Flow Configurator (DFC)** gives you a centralized interface for managing the data that drives Amazon Connect contact flows. You can create, update, and maintain values — such as prompts, hours of operation, routing rules, and callback behavior — without editing contact flows or writing code. This reduces bottlenecks, lowers risk, and helps keep customer experiences consistent across all your contact flows.

DFC separates two things:

* **Flow logic:** The flow design and decision paths, managed by technical teams
* **Flow data:** The values the flow looks up while running, managed by businesses and operational teams

Technical teams define the structure and rules once. Business and operations teams manage the values that change day to day.

[Watch video](https://www.youtube.com/watch?index=2&list=PLpgcSwyApvJBEYmlf0pjnS2XvFjvR8X1Y&v=Y0Pnro-0_bo)

!!! warning ""
    Info: DFC is designed for teams responsible for managing customer interaction behavior. It is not intended for agents and does not require deep technical or development expertise.


***

## Benefits at a Glance

* **Instant updates** — Update operational values without redeploying flows.
* **Less rework** — Reduce repeated changes across multiple flows.
* **Centralized control** — Keep behavior consistent by managing data in one place.
* **Built-in safeguards** — Limit risk through role-based access and schema guardrails.

![](../assets/images/8JtL9y2x04osT06hZq4F.png)

***

## How It Works

DFC works by defining structured data once and reusing it everywhere. When you update a value, the change is immediately available to any flow that references it. Role-based access and schema guardrails keep updates controlled while letting the right teams move quickly.

***

## Who Uses This

* **Business Admins / Operations Teams** — Manage flow data: update operational values such as prompts, hours of operation, allow/block lists, and transfer routing without editing contact flows or writing code.
* **Developers / Technical Teams** — Define entity schemas and references, and integrate DFC data into Amazon Connect contact flows and Lambda functions using the [DFC Node.js Client.](dynamic-flow-configurator-dfc/developer-reference-node.js-client.md)

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

* You must have a role with a DFC permission level (**Admin** or **User**) assigned to your account in CxCentral before you can access DFC.
* With the **User** level, you also need entity tags assigned in DFC before you can view any entities. Without tags, you can see the DFC module but cannot view any entities.
* Creating or deleting top-level entities and modifying schemas requires a higher permission level (**Entity Editor** or **Admin**). If certain actions are not visible in the UI, your role may not include those permissions.

See [Managing DFC Permissions](dynamic-flow-configurator-dfc/managing-dfc-permissions.md) for the full setup.

***

## What You Can Do

* Access the DFC Browser and navigate entities → [Getting Started with DFC](dynamic-flow-configurator-dfc/getting-started-with-dfc.md)
* Set up entities, sub-entities, schemas, and items → [Setting Up Entities and Schemas](dynamic-flow-configurator-dfc/setting-up-entities-and-schemas.md)
* Import and export data between environments → [Importing and Exporting Data](dynamic-flow-configurator-dfc/importing-and-exporting-data.md)
* Manage roles and entity-level access → [Managing DFC Permissions](dynamic-flow-configurator-dfc/managing-dfc-permissions.md)
* Look up field types, limits, and the Node.js client → [DFC Reference](dynamic-flow-configurator-dfc/developer-reference-node.js-client.md)

***

## Common Use Cases

The following scenarios highlight when DFC is commonly used.

<details>

<summary><strong>Manage prompt content</strong>  </summary>

Update prompt text or message variants in one place, then reuse them across multiple flows.

</details>

<details>

<summary><strong>Manage hours of operation</strong> </summary>

Store schedules centrally so routing and messaging follow the latest business hours.

</details>

<details>

<summary><strong>Manage allow/block lists</strong> </summary>

Store lists such as blocked caller IDs or blocked destinations that flows check during execution.

</details>

<details>

<summary><strong>Manage transfer routing</strong>  </summary>

Define transfer points that control how contacts route to queues or external destinations. Contact flows query transfer data at runtime instead of relying on hard-coded routing logic.

</details>

***

## Related Modules

* **CxCentral** — Create and manage the roles and user assignments that DFC permissions build on. DFC permission levels are configured against a role in CxCentral before entity tags are assigned in DFC. See [Managing DFC permissions.](dynamic-flow-configurator-dfc/managing-dfc-permissions.md)

***
