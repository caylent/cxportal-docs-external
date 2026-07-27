# View Agent Assignments

## Before You Begin

The agent assignments page shows a list of your agents in your Amazon Connect instance with their assigned values. You can filter by hierarchy groups and routing profiles to quickly find specific agents, view their values, and assign their rating.

Before working with agent assignments, make sure you have the following in place:

* **CxPortal access.** You'll need to sign in to CxPortal using the credentials your organization provides.
* **The required role.** Proficiency-Based Routing is subject to role-based access. You must have the role designated by your organization to manage agent assignments.
* **Predefined attributes and values already configured.** Agent assignments build on the values you've defined, so you'll need your predefined attributes and their values in place before you can rate agents on them.
* **Agents in your Amazon Connect instance.** The Agent Assignments page lists the agents in your Amazon Connect instance. Agents need to exist in Amazon Connect to appear here and be available for rating.

***

## Limits and Constraints

Keep the following in mind when managing agent assignments:

* **Ratings drive routing decisions.** The value rating you assign to an agent is what routing rules use to decide whether that agent is a match for a contact, so ratings should reflect each agent's actual skill level.
* **Only enabled values are used in routing.** A value must be enabled on an agent's profile to be factored into routing decisions. A disabled value still exists on the profile but won't be used for matching until it's reactivated.
* **Disabling is a temporary alternative to deleting.** Disabling a value lets you remove a skill from routing consideration without deleting it from the agent's profile, which is useful when you want to restore it later.
* **Changes must be saved.** Rating selections and enable/disable changes aren't applied until you click Save.

***

## Step-by-Step Instructions

### Search for Agents

1. Open **CxPortal**.
2. On the left menu, expand **Proficiency Routing** and then click **Agent Assignments**.
3. Enter the Agent name in the search box or use the Hierarchy Groups, Proficiency Level, and Routing Profiles filters to quickly find a specific agent.

***

### View Agent Values and Assign Ratings

1. On the Agent Assignments page, click the **Agent name**.
2. A list of the Agent’s values appears on the right side of the page. Use the dropdown at the top of the page view all values, enabled values and disabled values for the agent.
3. Click the **arrow next to the value title** to select the rating for that specific value.
4. Click the **on/off toggle** to activate or deactivate the specific value.
5. Click **Save** to apply your changes.
