# Proficiency Based Routing

## Overview <a href="#overview" id="overview"></a>

**Proficiency Based Routing (PBR)** in CxPortal allows you to intelligently match incoming contacts with the right agents based on their skills and experience levels. Using a combination of predefined attributes, values, and routing rules, administrators can define what skills matter, rate agents on those skills, and build logic that automatically directs contacts to the most qualified available agent. The Agent Assignments page ties it all together, giving administrators a clear view of each agent's skill profile and making it easy to manage and adjust ratings as your team evolves.

***

## Benefits at a Glance <a href="#key-terms" id="key-terms"></a>

* **Skill matching**— Match contacts to the most qualified agents
* **Custom skills** — Define skill groups with custom rating scales
* **Agent profiles** — View and manage agent skill ratings
* **Routing rules** — Build logic to route contacts automatically
* **Change management** — Track, approve, and schedule routing changes

![](../assets/images/cLOJwAXkQFsKz6ZTBmeY.png)

***

## How it Works <a href="#key-terms" id="key-terms"></a>

Proficiency-Based Routing works by building a skill profile for each of your agents and then using rules to match every incoming contact to the agents best equipped to handle it. Four building blocks work together to make this happen: predefined attributes, values, agent assignments, and routing rules.

First, you define the skills that matter to your organization, then you set the levels agents can be rated at, rate each agent, and finally build the routing logic that puts those ratings to use:

* **Predefined attributes** define the categories of skill you care about, such as a language or a product area. They are the foundation everything else is built on.
* **Values** set the rating scale for each predefined attribute, either the standard 1–5 scale or custom labels such as Beginner through Expert. They describe how proficient an agent is in a given skill.
* **Agent Assignments** is where you rate each agent on the values that apply to them and enable or disable individual skills. This turns your skill model into a profile of who can do what, and how well.
* **Routing Rules** combine those ratings into conditions and groups that an agent must satisfy to receive a contact. Rules are organized into steps, letting you progressively widen the pool of eligible agents.

When a contact arrives, Amazon Connect evaluates your active routing rules against each agent's enabled values and matches the contact to an available agent who meets the rule's criteria, so the most qualified person handles each interaction. As your team's skills change, you can update ratings on the Agent Assignments page and adjust your rules at any time. Those updates move through the same syncing, audit, and approval processes described later in this guide before they take effect.

***

## Who Uses This

* **Contact Center Administrators** responsible for creating predefined attributes, defining values and rating scales, building routing rules, and managing agent skill assignments. They care most about routing accuracy, configuration flexibility, and maintaining a well-organized skill framework.
* **Workforce Managers** overseeing overall routing performance and team effectiveness. They rely on PBR to ensure contacts are being matched to the right agents and use skill assignment data to identify training needs or staffing gaps across teams.
* **Operational Leads** focused on agent capacity and skill coverage. They use the Agent Assignments page to monitor skill profiles across the agent population, adjust ratings as agents develop, and ensure the right mix of skills is available at any given time.

!!! info ""
    Any team responsible for skill management and routing strategies in Amazon Connect environments will find this useful.


***

## Key Concepts  <a href="#key-terms" id="key-terms"></a>

​Proficiency-Based Routing works by building a skill profile for each of your agents and then using rules to match every incoming contact to the agents best equipped to handle it. You need to understand these terms before following the task pages.

| Term                                                  | Definition                                                                                                                                                                                                                                                                                                                                                                                                      |
| ----------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Predefined attributes**                             | Skill groups organize related agent capabilities into logical, predefined attributes. For example, 'Languages' is a skill group containing individual languages (Spanish, French, Mandarin) where agents can be rated on value from 1 to 5. Similarly, Healthcare Support' might include specific healthcare disciplines (cardiology, pediatrics, emergency care) where agents are rated from novice to expert. |
| **Custom predefined attributes**                      | Predefined attributes that you create to fit your organization's specific needs. For example, you might create a predefined attribute called "Product Knowledge" that isn't available by default                                                                                                                                                                                                                |
| **Native Amazon Connect predefined attributes**       | Predefined attributes that come built-in from Amazon Connect. These are ready to use without any setup.                                                                                                                                                                                                                                                                                                         |
| **Values**                                            | Skills and values assigned to agents that influence call routing decisions. Calls are directed to agents based on their value level in the required skill                                                                                                                                                                                                                                                       |
| **Level**                                             | The value rating assigned to an agent for a specific skill, typically measured on a numeric scale (1-5) or descriptive scale (novice, intermediate, advanced, expert).                                                                                                                                                                                                                                          |
| **Value Type**                                        | The rating scale you choose to measure a value. It determines how skill levels are expressed — either as plain numbers or as custom labels that are easier to understand.                                                                                                                                                                                                                                       |
| **1-5 Rating Scale (Standard)**                       | The default numeric scale used by Amazon Connect, where 1 is the lowest skill level and 5 is the highest.                                                                                                                                                                                                                                                                                                       |
| **Custom Rating Scale**                               | A way to replace the 1–5 numbers with descriptive text labels that make more sense for your team. For example, instead of "1, 2, 3, 4, 5" you might use "Beginner, Novice, Intermediate, Advanced, Expert." You don't have to use all 5 values — only define the ones you need.                                                                                                                                 |
| **Alias Value**                                       | The custom text labels you create represent the 1–5 scale behind the scenes. Amazon Connect still uses the numbers internally, but CxPortal displays your custom labels instead, making things more readable.                                                                                                                                                                                                   |
| **Associated Predefined attributes**                  | The predefined attributes that a value belongs to. Every value must be linked to a predefined attribute. For example, a value of "Fluent" would be associated with a "Language" predefined attribute.                                                                                                                                                                                                           |
| <p></p><p><strong>Agent Assignments</strong></p>      | A central page where you can see all your agents and the values assigned to them.                                                                                                                                                                                                                                                                                                                               |
| **Hierarchy Groups**                                  | A way to organize agents by team structure — for example, by department, location, or management tier. Filtering by hierarchy group helps you quickly narrow down a large agent list to a specific team or unit.                                                                                                                                                                                                |
| **Routing Profiles**                                  | A grouping that defines what types of contacts an agent is set up to handle. Filtering by routing profile helps you find agents assigned to a specific channel or queue.                                                                                                                                                                                                                                        |
| **Value Rating**                                      | The skill level score assigned to an agent for a specific value. This rating is what routing rules use to decide if an agent is a match for a contact.                                                                                                                                                                                                                                                          |
| **Enabled Value**                                     | A value that is active for an agent, meaning it will be factored into routing decisions. If an agent has a value enabled, the system can use it when matching them to contacts.                                                                                                                                                                                                                                 |
| **Disabled Value**                                    | A value that exists on an agent's profile but has been turned off. It won't be used in routing decisions until it's reactivated. Useful for temporarily removing a skill from consideration without deleting it entirely.                                                                                                                                                                                       |
| <p></p><p><strong>Routing Rules</strong></p>          | Filters that decide which agent gets a contact (call, chat, etc.). You set rules based on agent skills, and the system uses those rules to send the right contact to the right person.                                                                                                                                                                                                                          |
| **Proficiency Routing**                               | Matching contacts to agents based on skill levels. For example, routing a complex technical call only to agents who meet a certain expertise level.                                                                                                                                                                                                                                                             |
| **Condition**                                         | A single yes/no check. Example: Does this agent speak Spanish? If the answer meets your requirements, the agent is eligible. A condition is like one rule on a checklist.                                                                                                                                                                                                                                       |
| **Group**                                             | A bundle of multiple conditions that all get checked together before deciding if an agent qualifies. Example: Agent must speak Spanish AND have a customer service rating of 4 or higher. Groups let you get more specific than a single condition alone.                                                                                                                                                       |
| **Step**                                              | A stage in your routing rule. You can chain up to 5 steps, each with their own groups or conditions, to build a more detailed filtering process.                                                                                                                                                                                                                                                                |
| **AND Group**                                         | All conditions inside must be true for the rule to apply. Example: Agent must have Skill A AND Skill B. AND groups are limited to 8 conditions and can't have more than one of the same skill type.                                                                                                                                                                                                             |
| **OR Group**                                          | Only one of the conditions needs to be true. Example: Agent has Skill A OR Skill B. This is more flexible but limited to 4 expressions and can't be nested inside other groups.                                                                                                                                                                                                                                 |
| **Comparison Operators (GreaterThanOrEqualTo/Range)** | These define how a skill level is measured. When using GreaterThanOrEqualTo, the agent's skill must be at or above a set level. Example: rating of 3 or higher. When using Range, the agent's skill must fall between two values. Example: rating between 2 and 4.                                                                                                                                              |

***

## Permissions <a href="#use-cases" id="use-cases"></a>

PBR is subject to role-based access. You must have a specific role designated by your organization to manage and use PBR.

***

## What You Can Do

* Access the PBR browser → [Getting Started with PBR](proficiency-based-routing/getting-started-with-pbr.md)
* Create predefined attributes → [Add and Customize Predefined Attributes](proficiency-based-routing/add-and-customize-predefined-attributes.md)
* Set up values → [Create Values](proficiency-based-routing/create-values.md)
* Manage agent assignments → [View Agent Assignments](proficiency-based-routing/view-agent-assignments.md)
* Define routing rules → [Add and Manage Routing Rules](proficiency-based-routing/add-and-manage-routing-rules.md)
* Capture changes → [PBR Change Management ](proficiency-based-routing/pbr-change-management.md)
* Review Best Practices → [PBR Best Practices](proficiency-based-routing/pbr-best-practices.md)

***

## Common Use Cases <a href="#use-cases" id="use-cases"></a>

The following scenarios highlight when PBR is commonly used.

<details>

<summary><strong>Intelligent Contact Routing</strong></summary>

Automatically match incoming contacts to the most qualified available agent based on defined skills and proficiency levels, ensuring customers reach the right person without manual intervention.

</details>

<details>

<summary><strong>Workforce and Skill Management</strong></summary>

Build and maintain detailed agent skill profiles, adjust ratings as agents develop, and enable or disable skills on the fly to reflect your team's evolving capabilities.

</details>

<details>

<summary><strong>Change Control</strong></summary>

Track all routing configuration changes through audit logs, enforce approval workflows for sensitive updates, and schedule or roll back changes to maintain a controlled and compliant contact center environment.

</details>

***

## Related Modules

* **CxPortal** — CxPortal is a web-based portal built by Caylent that simplifies the management and configuration of your Amazon Connect contact center. CxPortal sits on top of your Amazon Connect environment and is accessed through [CxCentral](cxcentral.md), your unified Caylent workspace. Together they give your organization a single place to manage your contact center and get support.
* **CxCentral** — Your unified Caylent workspace — the hub you land on when you first log in, giving you access to CxPortal and all other Caylent products, support, and resources.
