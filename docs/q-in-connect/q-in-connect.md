# Q in Connect

## Overview

Q in Connect offers a generative AI-powered assistant for customer service that delivers information and actions to solve issues in real time. With Q in Connect, you can customize [Prompts](setting-up-prompts.md), [AI Agents](configure-ai-agents.md), and [Knowledge Bases](create-and-manage-knowledge-bases.md) to refine detect customer issues and provide personalized responses and recommended actions.

***

## Benefits at a Glance

* **AI Assistant** — AI-powered assistant for real-time customer service
* **Custom Prompts** — Instruct AI how to reply and structure responses
* **AI Agents** — Handle multi-step problems without human intervention
* **Knowledge Bases** — Manage content sources for AI responses

<img width="2000" height="1414" alt="Q in connect" src="https://github.com/user-attachments/assets/1eceac1b-4384-4dba-93bb-b4d750ca1d53" />


***

## How it Works

When a customer contacts your center, Q in Connect uses Pre-Processing Prompts to gather initial details, identify the customer's intent, and search the associated Knowledge Base. It then uses Answer Generation Prompts to turn the retrieved information into a clear, personalized response. For more complex issues, AI Agents chain multiple Prompts together to work through multi-step problems automatically. AI Agents are referenced within your contact flows, so the assistant can be invoked at the right point in the customer journey.

***

## Who Uses This

* **Administrators —** A user who configures and maintains Prompts, AI Agents, and Knowledge Bases in CxPortal, and reference AI Agents within contact flows.
* **Contact center agents** — A user who benefits from real-time recommendations and answers surfaced during live interactions.
* **Customers** — A user who receives faster, more accurate self-service and assisted responses.

***

## Key Concepts

Q in Connect works by using AI-powered assistants that deliver information and actions to solve issues in real time. You need to understand these terms before following the task pages.

| Term                                           | Definition                                                                                                                                                                                                                                                                                                                    |
| ---------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <p></p><p><strong>Prompts</strong> </p><p></p> | Instructions that tell the AI how to reply and structure its responses. There are two types: Pre-Processing Prompts, which gather information, ask follow-up questions, detect intent, and search the Knowledge Base; and Answer Generation Prompts, which convert Knowledge Base information into customer-facing responses. |
| **AI Agents**                                  | Configurations made up of multiple Prompts that can handle multi-step problems without human intervention. AI Agents are referenced in contact flows and can be versioned and tested.                                                                                                                                         |
| **Knowledge Base**                             | A collection of articles that Connect Agents reference to provide accurate responses to customer questions during contact flows. Each organization can have up to 10 Knowledge Bases with a maximum size of 5 GB each.                                                                                                        |
| <p><strong>Prompt Template</strong></p><p></p> | A pre-built starting point for a Prompt that automatically populates the Prompt Template box when selected. You edit the template to match your needed functionality rather than writing a Prompt from scratch.                                                                                                               |
| **Prompt Type**                                | The classification that determines a Prompt's role in the flow, either Pre-Processing or Answer Generation. Type is set at creation along with the API and Model.                                                                                                                                                             |
| **Association ID**                             | The identifier shown on the Knowledge Bases page that links a Knowledge Base to Q in Connect.                                                                                                                                                                                                                                 |

***

## Permissions

To work with Q in Connect, users need permissions to view and manage Prompts, AI Agents, and Knowledge Bases within CxPortal.

***

## What You Can Do

* Access the Q in Connect browser ​→ [Getting Started with Q in Connect](getting-started-with-q-in-connect.md)
* Set up prompts→ [Setting Up Prompts​](setting-up-prompts.md)
* Manage AI Agents → ​[Configure AI Agents](configure-ai-agents.md)
* Add Knowledge Bases →​ [Create and Manage Knowledge Bases​](create-and-manage-knowledge-bases.md)
* Review best practices and troubleshooting tips→ [Q in Connect Best Practices](q-in-connect-best-practices.md)

***

## Common Use Cases

The following scenarios highlight when Q in Connect is commonly used.

<details>

<summary><strong>Automated issue resolution</strong></summary>

Deploy an AI Agent to fully resolve common multi-step requests, such as account updates or order status inquiries.

</details>

<details>

<summary><strong>Intent detection and routing</strong></summary>

Use Pre-Processing Prompts to identify customer intent and search the Knowledge Base before generating a response.

</details>

<details>

<summary><strong>Agent assistance and self-service knowledge delivery</strong></summary>

Surface real-time answers and recommended actions to live agents during customer interactions and turn Knowledge Base content into accurate, conversational responses for customers.

</details>

***

## Related Modules

* **CxCentral** — Your unified Caylent workspace — the hub you land on when you first log in, giving you access to CxPortal and all other Caylent products, support, and resources.
* **CxPortal** — CxPortal is a web-based portal built by Caylent that simplifies the management and configuration of your Amazon Connect contact center. CxPortal sits on top of your Amazon Connect environment and is accessed through CxCentral, your unified Caylent workspace. Together they give your organization a single place to manage your contact center and get support.
* **Knowledge Management** — Knowledge Management lets you easily manage your documentation and sync with Connect Agents directly in CxPortal. You can manage knowledge bases, articles, and compare versions to refine your Connect Agents AI to detect customer issues and provide personalized responses and recommended actions. For more information, see [Knowledge Management](knowledge-management.md).
