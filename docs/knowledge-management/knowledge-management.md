# Knowledge Management

## Overview

**Knowledge Management** lets you easily manage your documentation and sync with Connect Agents directly in CxPortal. You can manage knowledge bases, articles, and compare versions to refine your Connect Agents AI to detect customer issues and provide personalized responses and recommended actions.

[Watch video](https://www.youtube.com/watch?v=b6Quzehojhg)

***

## Benefits at a Glance  <a href="#key-terms" id="key-terms"></a>

* **Centralized documentation** — Manage support articles and knowledge bases in one place.
* **Powerful Connect Agents** — Empower Connect Agents to accurately answer questions.
* **Discoverability** — Use tags to help Connect Agents locate information and improve response accuracy.
* **Syncing** — Sync updates directly to Connect Agents without manual intervention.

<img width="2000" height="1414" alt="knowledge management" src="https://github.com/user-attachments/assets/fac6137e-4a54-42da-b4d4-25da7373de2b" />


***

## How it Works <a href="#use-cases" id="use-cases"></a>

An organization maintains a set of Knowledge Bases (up to 10), and each Knowledge Base contains a collection of Articles representing discrete content units in supported formats. Tags can be applied to both Articles and Knowledge Bases to enrich retrieval, providing structured filtering and lookup beyond full-text matching. When a Knowledge Base is synced to Connect, Connect Agents reference it during contact flows, using the indexed and tagged content to classify incoming issues and generate context-aware responses.

<img width="2000" height="1414" alt="km arch" src="https://github.com/user-attachments/assets/a50cbeb1-44fb-4f9f-b6c1-7c3f6aba874a" />


***

## Who Uses This <a href="#use-cases" id="use-cases"></a>

* **Business /** **Contact Center Admins** — A user responsible for creating and managing knowledge bases, uploading articles, managing tags, and syncing content to AI agents.
* **Knowledge/Content Manager** — A user responsible for maintaining the quality and accuracy of documentation. They would use features like version comparison, article editing, and tagging to ensure the right information is available to AI agents. They care about content structure and best practices like using Markdown.
* **Contact Center Operations Manager** — A user who oversees the overall performance of the contact center. They benefit from the system indirectly — better knowledge management means better AI agent performance, fewer escalations, and improved customer satisfaction metrics.
* **Content Reviewer** — A user who needs visibility into knowledge bases and articles but doesn't manage them directly. This could be a compliance officer, quality assurance reviewer, or a team lead who monitors content without editing it. 

***

## Key Concepts

Knowledge Management works by optimizing documentation for customer support directly through CxPortal. You need to understand these terms before following the task pages.

| Term               | Definition                                                                                                                                                                                                                                                  |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Knowledge Base** | A collection of articles that Connect Agents reference to provide accurate responses to customer questions during contact flows. Each organization can have up to 10 Knowledge Bases with a maximum size of 5 GB each.                                      |
| **Article**        | A specific content piece inside a Knowledge Base that AI Agents use to answer questions and resolve customer issues. Supported formats are .txt, .html, .docx, and .pdf, with a maximum file size of 1 MB.                                                  |
| **Connect Agents** | AI agents that reference Knowledge Bases during contact flows to classify incoming issues and generate context-aware responses for customers.                                                                                                               |
| **Tags**           | Metadata labels applied to articles or Knowledge Bases to help AI agents retrieve the most relevant content for specific customer queries.                                                                                                                  |
| **Tag Key**        | The category or attribute name of a tag that defines what aspect of a resource is being described (e.g., "Audience"). Maximum length is 128 Unicode characters.                                                                                             |
| **Tag Value**      | The specific information assigned to a tag key that defines the instance of that category (e.g., "Internal"). Maximum length is 256 Unicode characters.                                                                                                     |
| **Sync**           | <p>The process of connecting Knowledge Bases or articles with Connect Agents. There are two sync operations:</p><p>Sync Knowledge Bases — Syncs all Knowledge Bases at once.<br>Sync Articles — Syncs articles within a single selected Knowledge Base.</p> |

***

## Permissions  <a href="#use-cases" id="use-cases"></a>

Knowledge Management is subject to role-based access. You must have a specific role designated by your organization to manage Knowledge Bases.

**Reader permissions** allow you to view your Knowledge Bases and Articles.

**Admin permissions** allow you to create and manage Knowledge Bases and Articles.

***

## What You Can Do <a href="#use-cases" id="use-cases"></a>

* Access the Knowledge Management Browser → [Getting Started with Knowledge Management](getting-started.md)
* Set up Knowledge Bases → [Setting Up Knowledge Bases](setting-up-knowledge-bases.md)
* Add articles to Knowledge Bases→ [Adding Articles](adding-articles.md)
* Manage tags and metadata → [Managing Tags](managing-tags.md)
* Capture changes made in Knowledge Management→ [Change Management](change-management.md)
* Review best practices and troubleshooting tips→ [Best Practices and Troubleshooting](best-practices-and-troubleshooting.md)

***

## Common Use Cases <a href="#use-cases" id="use-cases"></a>

The following scenarios highlight when Knowledge Management is commonly used.

<details>

<summary><strong>Customer Support</strong></summary>

Equip AI agents with up-to-date troubleshooting guides so they can resolve common customer issues without human escalation.

</details>

<details>

<summary><strong>AI Agent Optimization</strong></summary>

Tag articles with metadata so AI agents retrieve the most relevant content for specific customer queries and ensure responses reflect latest documentation without manual updates.

</details>

<details>

<summary><strong>Documentation Management</strong></summary>

Centralized access-controlled documentation system with version tracking, metadata tagging, and AI sync capabilities to keep organizational content accurate, discoverable, and up to date.

</details>

***

## Related Modules  <a href="#use-cases" id="use-cases"></a>

* **CxCentral** — Your unified Caylent workspace — the hub you land on when you first log in, giving you access to CxPortal and all other Caylent products, support, and resources.
* **CxPortal** — CxPortal is a web-based portal built by Caylent that simplifies the management and configuration of your Amazon Connect contact center. CxPortal sits on top of your Amazon Connect environment and is accessed through CxCentral, your unified Caylent workspace. Together they give your organization a single place to manage your contact center and get support.
