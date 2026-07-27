# Flow Analyzer Reference

### Advanced Filters

Use Advanced Filters to find a contact when you don't have a specific Contact ID.

Click **Advanced** under the search bar, and refine your search using the following categories:

| Filter                 | What it does                                                          | Examples                     |
| ---------------------- | --------------------------------------------------------------------- | ---------------------------- |
| **Timeline**           | Filter by event timestamps and select a date range using the calendar | Initiation, Disconnect       |
| **Agents**             | Filter contacts handled by a specific agent                           | "Alex R."                    |
| **Queues**             | Filter contacts by particular routing queue or skill                  | Escalations, General Support |
| **Channels**           | Filter by communication channel                                       | Voice, Chat, Email           |
| **Initiation Methods** | Filter by how the contact started                                     | API, Callback, Transfer      |
| **Attributes**         | Search by values stored in flows or general customer attributes       | `customerNumber`             |

!!! warning ""
    **Warning:** Don't forget to apply the filters to update the contact list.


***

### Viewing Controls

The Flow Analyzer canvas includes built-in controls to help you navigate complex flows more easily. You can zoom in and out, toggle the mini map to understand your position within the flow, and use **Fit View** to automatically center and scale the entire flow on the canvas.

***

### Details Tab

The **Details** tab displays all available information for the selected contact in a structured, easy-to-scan layout. This information helps you validate data, confirm routing decisions, and understand the full context of the interaction.

The Details tab includes the following sections:

| Section                       | What it shows                                                                                                                        |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| **Basic Information**         | The Contact ID, ARN, communication channel (such as voice or chat), and the contact name or description, if one was set.             |
| **User-Defined Attributes**   | Attributes added by flows or integrations, including customer phone number, survey IDs, prompt text, AI session IDs, and queue ARNs. |
| **Endpoints**                 | The customer endpoint (such as a phone number or address) and the system endpoint used by Amazon Connect during the interaction.     |
| **Segment Attributes & Tags** | System-level attributes and tags applied to the contact or the Connect instance.                                                     |
| **Timestamps & Duration**     | Key timestamps for initiation, connection, disconnection, and the total duration of the interaction.                                 |
| **Queue & Routing**           | Queue assignment details, queue priority, and routing criteria used during the interaction.                                          |
| **Agent & Customer**          | Agent information for routed contacts and available customer details.                                                                |

!!! info ""
    **Tip:** Use the Details tab search bar to quickly locate specific fields or values within the details panel.


***

### Using the Problems Tab

The **Problems** tab highlights issues detected during flow execution, such as slow-running blocks, Lambda failures, and other anomalies identified in the logs.

For each issue, Flow Analyzer points to the affected block, explains what went wrong, and provides guidance on where to investigate next.

This tab is a strong starting point when a call fails, a flow times out, or the root cause is not immediately obvious. From here, you can move directly to the Flow Logs or the canvas to continue your investigation.

***

### Working with Flow Logs

The **Flow Logs** tab shows log data similar to CloudWatch in a searchable, easier-to-navigate view that is directly linked to the Flow Analyzer canvas.

Each log entry includes the contact flow name, block type, and the block identifier when one is configured in Amazon Connect. This makes it easy to connect individual log entries to the exact block in the flow.

!!! info ""
    **Tip:** You can search the logs for keywords such as "Lambda," "error," or specific attribute values, and quickly jump to the related flow block, AWS logs, or metrics when available.


***

#### Lambda Blocks

For Lambda blocks, Flow Analyzer provides direct access to Lambda statistics. You can view invocation counts and performance metrics from the hour before and after the interaction, helping you identify whether an issue was isolated or part of a broader pattern.

!!! info ""
    **Tip:** Flow Logs are particularly useful when reviewing Lambda responses, understanding step-by-step flow decisions, and validating attribute values and routing logic.


***

### Working with Interaction Logs

The **Interaction Logs** tab shows a simplified, text-based timeline of what happened during the interaction.

It shows key events such as:

* Which contact flows were invoked
* Which messages were played
* When transfers occurred
* Other important events along the journey

For flows that use `GetCustomerInput`, Flow Analyzer can also display Q in Connect (QiC) insights. These show how the customer interacted with the menu, including which option was selected, how long the response took, and whether retries or no-input events occurred.

!!! info ""
    **Info:** This tab is useful when you want a quick, high-level understanding of the interaction without reviewing each block on the visual canvas.


***

### Queue Transcript and Assistant Logs

The **Queue Transcript** displays the customer-facing conversation, showing what the customer said and how the AI assistant responded.

**Assistant Logs** provide a deeper, system-level view of the interaction, including internal messages and additional context used by the assistant to generate responses.

!!! info ""
    **Info:** These views are helpful when validating that the assistant interpreted the customer correctly, investigating reports of incorrect or confusing responses, and reviewing how AI logic performs for specific intents or flows.


***
