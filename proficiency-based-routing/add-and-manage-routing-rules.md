# Add and Manage Routing Rules

## Before You Begin

Routing rules allow you to define your contact flow routing criteria. The routing rules page shows a table of your existing routing rules. You can add, edit, deactivate, and delete routing rules as needed.

Before working with routing rules, make sure you have the following in place:

* **CxPortal access.** You'll need to sign in to CxPortal using the credentials your organization provides.
* **The required role.** Proficiency-Based Routing is subject to role-based access. You must have the role designated by your organization to manage routing rules.
* **Predefined attributes, values, and agent ratings configured.** Routing rules are built from the values you've defined and rely on agent ratings to determine matches. You'll want your predefined attributes, values, and agent assignments in place before building rules, so there are skills and rated agents for your criteria to act on.
* **A plan for your routing logic.** Rules can chain up to five steps and combine conditions into AND and OR groups. It helps to map out the skills and skill levels a contact should require before you start building, especially if you plan to use multiple steps or grouped conditions.

***

## Limits and Constraints

Keep the following limitations in mind when building routing rules:

* **Limited comparison operators.** The only comparison operators available are GreaterThanOrEqualTo and Range. GreaterThanOrEqualTo matches agents at or above a set level; Range matches agents whose rating falls between two values.
* **Step limit.** A routing rule can chain a maximum of five steps, each with its own groups or conditions.
* **AND group limits.** AND groups — and any groups nested inside them — are limited to a maximum of 8 conditions and can contain only one of each value type.
* **OR group limits.** OR groups are limited to a maximum of 4 expressions. They can't be nested inside other OR or AND groups, and they can't contain other OR groups.
* **Dependencies block deletion.** A predefined attribute or value can't be deleted while it's used in an active routing rule.
* **Deleted dependencies break reactivation.** If an inactive routing rule contains a predefined attribute or value that was previously deleted, any attempt to reactivate that rule will fail.

***

## Step-by-Step Instructions

### Add Routing Rules

1. Open **CxPortal**.
2. On the left menu, expand **Value Routing** and then click **Routing Rules**.
3. Click **Add Rule**.
4. Enter a rule name and description.
5. Enter your rule criteria.
   1. Under Step 1, add a **condition** or **group**. A **group** is a group of logic where multiple pre-defined attributes are checked before routing to an agent. You can set specific conditions for a group that defines value values for that group.  A **condition** is a single piece of logic to check if one specific pre-defined attribute is met before routing to an agent.
   2. Add a group or condition:
      1. Select the value
      2. Choose whether **it is** or **is not** **greater than**, **equal to**, or **between** a value level.
      3. Click **Add Step** to add more groups or conditions as needed. **Note:** You can add up to 5 steps.
      4. To delete a group or condition, click the **ellipsis** on the right side of the step and click **Delete**.
      5. After you set your groups and conditions, click **Show Agents** to see a list of agents that match the set criteria.

***

### Edit Routing Rules

1. Open **CxPortal**.
2. On the left menu, expand **Value Routing** and then click **Routing Rules**.
3. On the right side of your saved rules, click the **hamburger menu** and click **Edit**.
4. Edit the rule criteria.
5. Click **Save** to apply your changes.

***

### Delete Inactive Routing Rules

1. Open **CxPortal**.
2. On the left menu, expand **Value Routing** and then click **Routing Rules**.
3. On the right side of your saved rules, click the **hamburger menu** and click **Delete**.
4. A deletion confirmation message appears. Review the message and click **Confirm** to delete the routing rule.

***

### Deactivate Routing Rules

!!! info ""
    **Note:** A predefined attribute or value can’t be deleted if it’s used in an active routing rule. If an inactive routing rule contains predefined attributes or value that was previously deleted, a reactivation attempt will fail.


1. Open **CxPortal**.
2. On the left menu, expand **Value Routing** and then click **Routing Rules**.
3. On the right side of your saved rules, click the **hamburger menu** and click **Deactivate**.
4. A deactivation confirmation message appears. Review the message and click **Confirm** to deactivate the routing rule.
