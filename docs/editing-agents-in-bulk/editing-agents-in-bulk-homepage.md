# Editing Agents in Bulk

## Overview

The **Agent Management** page lets you view, filter, and update agent configurations across your entire agent population without touching each record individually. You can change **Routing Profile**, **Auto Accept Calls**, and **ACW Time Limit** for as many agents as you need in a single workflow.

Amazon Connect requires agent changes one at a time by default, so this gives you a structured, centralized way to manage agent configurations at scale.

***

{% column width="50%" %}
**Who this is for**

**Business Admins** — Contact center administrators responsible for configuring agents in Amazon Connect.

**Operations Teams** — Workforce management teams and operations managers who adjust agent settings during campaigns, peaks, and volume shifts.
{% column width="50%" %}
**Where to find it**

In CxPortal, expand **Bulk Edit** in the left navigation panel, then select **Agents**.
***

## Benefits at a Glance

In large contact centers, or during campaigns, seasonal peaks, or sudden volume shifts, editing agents one at a time becomes slow and error-prone.

Bulk Edit applies the same change to every selected agent in one action.

<img width="2000" height="1414" alt="bulk edit agents" src="https://github.com/user-attachments/assets/b8474f90-9d5b-4621-a078-3bd1f5ed8a65" />


***

## Key Concepts

| Term                      | Definition                                                                                                                      |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **Routing Profile**       | Defines which queues an agent can receive contacts from, and sets the priority and delay rules for those queues.                |
| **ACW (After Call Work)** | The time an agent is given to complete wrap-up tasks after a contact ends. Measured in seconds.                                 |
| **Auto Accept Calls**     | Controls whether incoming contacts are automatically connected to an agent, or whether the agent must manually accept each one. |
| **Agent ID**              | The agent's login email address, used as their unique identifier in Amazon Connect.                                             |
| **Bulk Action**           | A single action that applies the same configuration change to all selected agents at once.                                      |
| **Change Request**        | An approval workflow that may be required before a bulk change is applied, depending on your organization's configuration.      |

***

## Prerequisites / Permissions

**Before you begin:**

* Access to the **Agent Management** page is restricted to users with the appropriate administrative role in CxPortal. If you don't see **Bulk Edit** in the left navigation panel, contact your CxPortal administrator to request access.
* Viewing the agent table does not require any special permissions beyond access to the **Bulk Edit** section.
* Submitting a bulk change may require Change Management approval, depending on your organization's role and instance configuration.

***

## What You Can Do

What you can do in this module:

* **Filter the agent list** to narrow it before taking action → [Filtering Agents](https://docs.caylent.com/cxportal/editing-agents-in-bulk/getting-started-with-bulk-agent-management/#filtering-agents)
* **Select agents and apply a bulk change** to Routing Profile, Auto Accept Calls, or ACW Time Limit → [Making Bulk Changes](making-bulk-changes-to-agents.md)
* **Export the agent list**, either all agents or just your current selection → [Exporting Agent Data](exporting-agent-data.md)

***

## Related Modules

* [**User Management** ](user-management.md)—  Add, edit, deactivate, and organize the people in your organization, and assign each user the roles that apply to them.
* [**Access Management** ](access-management.md)— Define roles and permissions behind them, and control what those roles can see and do across the system.
* [**Proficiency Based Routing (PBR)** ](proficiency-based-routing.md)— Intelligently match incoming contacts with the right agents based on their skills and experience levels.

***
