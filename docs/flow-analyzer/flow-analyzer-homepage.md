# Flow Analyzer

Flow Analyzer is a troubleshooting tool in CxPortal that lets you see the full journey of a customer contact through Amazon Connect. It brings diagnostic data, flow paths, logs, and AI transcripts into a single interface, so you can understand what happened during an interaction, identify flow failures, and jump directly to the relevant blocks.

[Watch video](https://www.youtube.com/watch?list=PLpgcSwyApvJBEYmlf0pjnS2XvFjvR8X1Y&v=PrFhSYGlbDM)

***

### Benefits at a Glance

Flow Analyzer helps teams resolve issues faster, reduces the need to search across multiple AWS consoles, and lowers reliance on senior engineers. It makes flow debugging accessible across the contact center.

<img width="2000" height="1414" alt="flow analyzer" src="https://github.com/user-attachments/assets/5c13a0cd-219b-497f-8762-f62e3a32a7bd" />


***

### Key Concepts

| Term                | Definition                                                                                                                                                                              |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Contact**         | Any customer interaction in CxPortal, including calls, chats, emails, and tasks. Longer interactions may be split into multiple segments or related contacts.                           |
| **Contact ID**      | A unique identifier for each contact, used in logs, tickets, and reports, and the primary way to locate an interaction in Flow Analyzer.                                                |
| **Contact Flow**    | The CxPortal workflow that manages how a contact is handled, including prompts, routing, Lambda calls, transfers, and queues. Flow Analyzer displays the exact path a contact followed. |
| **Lambda Function** | A serverless function used within contact flows for custom logic such as lookups, data retrieval, or routing decisions. Slow or failed functions are highlighted in Flow Analyzer.      |

***

### What You Can Do

* Find a contact by Contact ID or Advanced Filters → [Investigating a Contact](investigating-a-contact.md)
* Review the contact journey in Flow View or Interaction View → [Investigating a Contact](investigating-a-contact.md)
* Check detected issues in the **Problems** tab → [Flow Analyzer Reference](flow-analyzer-reference.md?fallback=true)
* Investigate Flow Logs, Interaction Logs, and the Details panel → [Flow Analyzer Reference](flow-analyzer-reference.md?fallback=true)
* Review AI conversations with the Queue Transcript and Assistant Logs → [Flow Analyzer Reference](flow-analyzer-reference.md?fallback=true)
* Jump from a flagged block straight to the Amazon Connect flow editor with **Open in Connect** →  [Investigating a Contact](investigating-a-contact.md)

***

### Use Cases

The following use cases highlight common scenarios where Flow Analyzer helps teams investigate issues, validate changes, and understand customer interactions.

<details>

<summary><strong>Troubleshooting Flow Failures</strong>  </summary>

Customers experience long wait times, call drops, or unexpected behavior at a specific point in a contact flow.

</details>

<details>

<summary><strong>Analyze Flow Performance</strong> </summary>

The contact center is scaling and you need to reduce latency or improve customer experience.

</details>

<details>

<summary><strong>Validating &#x26; Testing Flow Changes</strong></summary>

New routing logic, integrations, or flow updates need to be verified before or after deployment.

</details>

<details>

<summary><strong>Reviewing Customer Interactions</strong> </summary>

A customer reports transfer loops, long waits, or being routed to the wrong agent or queue.

</details>

<details>

<summary><strong>Verifying Compliance Steps</strong> </summary>

You need to confirm that required steps, such as disclosures or recording settings, were followed during an interaction.

</details>

***

### Related Modules

* [**Q in Connect**](q-in-connect.md) — For flows that use `GetCustomerInput`, Flow Analyzer's Interaction Logs display Q in Connect (QiC) insights showing how the customer interacted with the menu.

***
