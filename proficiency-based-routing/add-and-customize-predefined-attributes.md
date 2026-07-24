# Add and Customize Predefined Attributes

## Before You Begin

Predefined attributes help manage your values. The Predefined attributes page shows a list of your current custom predefined attributes, as well as native Amazon Connect predefined attributes. You can add and delete predefined attributes from this page.

!!! info ""
    **Note:** Predefined attributes are only visible in Amazon Connect after values are assigned.


 Before working with predefined attributes, make sure you have the following in place:

* **CxPortal access.** You'll need to sign in to CxPortal using the credentials your organization provides.
* **The required role.** Proficiency-Based Routing is subject to role-based access. You must have the role designated by your organization to manage predefined attributes.
* **A plan for your skill structure.** Predefined attributes are the foundation of PBR — values, agent ratings, and routing rules all build on the attributes you define here. It's worth deciding which skill categories matter to your organization (for example, Languages or Product Knowledge) before you start creating them.
* **An understanding of how attributes surface in Amazon Connect.** Creating a predefined attribute alone won't make it appear in Amazon Connect. A predefined attribute becomes visible in Amazon Connect only after values are assigned to it.

***

## Limits and Constraints

Keep the following limitations in mind when managing predefined attributes:

* **Visibility depends on values.** Predefined attributes are only visible in Amazon Connect after values are assigned to them.
* **Attributes in use can't be deleted.** A predefined attribute can't be deleted if it's currently used in an active routing rule or assigned to an agent. You'll need to remove those dependencies first.
* **Deleting attributes can break inactive rules.** If an inactive routing rule contains predefined attributes that were previously deleted, any attempt to reactivate that rule will fail.

***

## Step-by-Step Instructions

### Add Predefined Attributes

1. Open **CxPortal**.
2. On the left menu, expand **Proficiency Routing** and then click **Predefined Attributes**.
3. Enter a name and description.
4. Click **+Add Predefined attributes**.

***

### Edit Predefined Attributes

1. Open **CxPortal**.
2. On the left menu, expand **Proficiency Routing** and then click **Predefined Attributes**.
3. Navigate to the predefined attributes list and click the **pencil icon** next to the one you want to edit.
4. Edit the predefined attributes content and click **Update** to apply your changes.

***

### Delete Predefined Attributes

1. Open **CxPortal**.
2. On the left menu, expand **Proficiency Routing** and then click **Predefined Attributes**.
3. Navigate to the predefined attributes list and click the **trash icon** next to the one you want to delete.
4. A deletion confirmation message appears. Review the message and click **Confirm** to delete the predefined attributes.

!!! info ""
    **Note:** A predefined attribute can’t be deleted if it’s used in an active routing rule or assigned to an agent. If an inactive routing rule contains predefined attributes that were previously deleted, a reactivation attempt will fail.

