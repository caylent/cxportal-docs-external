# Reference: Bulk Edit Agents

### Field Reference Table

#### Editable agent fields (the three bulk-change fields)

| Field Name            | Type                                                  | Required                  | Description                                                                                                                                                      |
| --------------------- | ----------------------------------------------------- | -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Routing Profile**   | Single-select dropdown (**Select a Routing Profile**) | Yes (to apply the change) | The Amazon Connect routing profile assigned to the agent. Defines which queues an agent can receive contacts from and the priority/delay rules for those queues. |
| **Auto Accept Calls** | Single-select (**Yes** / **No**)                      | Yes (to apply the change) | Whether incoming contacts are automatically connected to the agent (**Yes**) or the agent must manually accept each one (**No**).                                |
| **ACW Time Limit**    | Single-select dropdown of preset values               | Yes (to apply the change) | The After Call Work duration — time given to complete wrap-up tasks after a contact ends. See the unit note below.                                               |

***

#### Change Request fields (shown when you submit a bulk change)

| Field Name        | Type                                    | Required | Description                                                                                    |
| ----------------- | --------------------------------------- | -------- | ---------------------------------------------------------------------------------------------- |
| **Description**   | Text                                    | No       | Optional description of the change.                                                            |
| **Criticality**   | Single-select (**Normal** / **Urgent**) | Yes      | **Normal**: no immediate business impact. **Urgent**: critical business need or active outage. |
| **Date and Time** | Date/time picker                        | No       | Optional schedule for when the change should take effect.                                      |

***

#### Filters

| Filter                | Input                                                                      |
| --------------------- | -------------------------------------------------------------------------- |
| **Agent Names**       | Search, select, or paste a comma-separated list of names                   |
| **Agent IDs**         | Search, select, or paste a comma-separated list of login emails            |
| **Routing Profiles**  | Select or paste one or more profiles                                       |
| **Proficiencies**     | Select or paste skill/proficiency assignments                              |
| **Auto Accept Calls** | **Yes** or **No**                                                          |
| **ACW Time Limits**   | Specific ACW durations (0–1,200 seconds per the source doc; see unit note) |

***

#### Table columns

**Select all rows** checkbox, per-row **Select row** checkbox, **Agent Name**, **Agent ID**, **Routing Profile**, **Proficiencies** (a count that expands to show each proficiency and its level), **Auto Accept Calls**, **ACW Time Limit**. **Agent Name** and **Routing Profile** headers are sortable.

***

### Status Definitions

These statuses apply to a submitted bulk change when Change Management is enabled:

| Status      | Meaning                                                                |
| ----------- | ---------------------------------------------------------------------- |
| **Pending** | The change has been submitted and is awaiting approval and processing. |
| **Failed**  | The change could not be processed; a Failed notification appears.      |

***

### Limits and Constraints

* **ACW Time Limit filter range:** 0 to 1,200 seconds. *
* **Processing time (when no approval is required):** Base time of approximately 5–10 seconds, plus roughly 1 second per additional agent. A progress indicator in the upper-right corner of the page shows the status of all active bulk changes.
* **Select all scope:** **Select all rows** selects the full set reported by the **Bulk Actions** count, not only the rows visible on screen.

***

