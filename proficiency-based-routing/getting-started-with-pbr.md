# Getting Started with PBR

## How to Access PBR

1. Go to [https://portal.pronetx.com](https://portal.pronetx.com/).
2. Sign in with the credentials your organization provides.
3. In the left menu, click **CxPortal**.
4. In the left menu, click **Proficiency Routing**.

***

## Understanding the PBR Layout <a href="#permissions" id="permissions"></a>

Proficiency-Based Routing is organized into a set of dedicated pages under **Proficiency Routing** in the CxPortal left menu. Each page handles one part of the routing workflow, and the pages are designed to be used in sequence — you define the skills you care about, assign values to them, rate your agents, and then build the rules that put those ratings to work. Understanding how these pages relate to one another makes it easier to plan your configuration before you start building. The core pages include:

* **Predefined Attributes** where you define the skill categories that matter to your organization, such as Languages or Healthcare Support. This page lists both the custom predefined attributes you create and the native predefined attributes that come built in from Amazon Connect. Everything else in PBR builds on the attributes you define here.
* **Values** where you set the skill levels associated with each predefined attribute. A predefined attribute describes the *type* of skill (for example, Spanish Language), while a value describes the *level* of that skill (for example, Advanced). On this page you choose how each value is measured — either the standard 1–5 rating scale that Amazon Connect uses internally, or a custom scale that displays descriptive labels such as Beginner or Expert in CxPortal.
* **Agent Assignments** where the skill definitions meet your actual team. This page lists every agent in your Amazon Connect instance alongside their assigned values, and lets you set each agent's rating for a given value. You can filter the list by hierarchy group, proficiency level, and routing profile to find specific agents quickly, and you can enable or disable individual values to control whether a skill is factored into routing decisions.
* **Routing Rules** where everything comes together. This page lets you build the logic that decides which agent receives a contact, using conditions and groups based on the skills and ratings you've configured. Rules can be chained across multiple steps to create more detailed filtering, and you can preview which agents match your criteria before saving.

***

## Your First Task <a href="#access-pbr" id="access-pbr"></a>

**Try it: Create your first Predefined Attribute**

1. Open **CxPortal**.
2. On the left menu, expand **Proficiency Routing** and then click **Predefined Attributes**.
3. Enter a name and description.
4. Click **+Add Predefined attributes**.

!!! info ""
    For the complete workflow, see Add and Customize Predefined Attributes.


***

## What To Do Next

Now that you've created a predefined attribute, here's what to do next:

* Set up values → [Create Values](create-values.md)
* Manage agent assignments → [View Agent Assignments](view-agent-assignments.md)
* Define routing rules → [Add and Manage Routing Rules](add-and-manage-routing-rules.md)
* Capture changes → [PBR Change Management ](pbr-change-management.md)
* Review Best Practices → [PBR Best Practices](pbr-best-practices.md)
