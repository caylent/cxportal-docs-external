# Configure Change Requests

The Change Request Management page lets you configure rules for change requests in your instances. You can configure change request rules for all instances at once or configure specific rules for each individual instance.

## Before You Begin

Change Request Management is subject to role-based access. You must have a specific role designated by your organization.

## Step-by-Step Instructions

### Access the Change Request Management page

1. Open CxPortal.
2. Click the **Admin gear** on the bottom left side of the screen.
3. Expand **Access management**, and then click **Change Requests**.
4. Select the instance you want to configure change request rules for. Choose **All Instances** for a company-wide configuration or use the search bar to search and select a specific instance.

### Review Configurations

Before you choose any change request configurations for your instance, it's important to understand the definition of **Action/Proficiency**.

**What is an Action / Proficiency?**

An **action / proficiency** is an operation that can be performed within a module of the CxPortal.

After selecting an instance, a matrix populates your modules, their actions, and permissions. This controls which actions require a change request before they can be performed.

If you check all the permissions in a row, every user will need to submit a change request for that action. If you check only specific permissions in a row, the requirement applies only to users assigned those permissions. These settings will only apply to the specific instance you are configuring change request rules for.

### Configure Change Request Rules

1. Open CxPortal.
2. Click the **Admin gear** on the bottom left side of the screen.
3. Expand **Access management**, and then click **Change Requests**.
4. Select the instance you want to configure change request rules for. Choose **All Instances** for a company-wide configuration or use the search bar to search and select a specific instance.
5. Use the matrix to choose which actions require a change request per module and permission. To see all the available Modules, scroll down and click the **dropdown arrows** to review the module-specific actions and permissions.
   - To require every user to submit a change request for each action at every permission level, click **Check All** at the top right side of the module name. This checks all the boxes in the Module.
   - To require every user to submit a change request for specific actions, choose **Check All** in the permission rows.
   - To require only specific users to submit a change request for specific actions, click the individual checkboxes for the actions and permissions per module.
6. Review your selections and click **Save Changes**.

> **Note:** Unless you choose **All Instances**, configurations only apply to the specific instance you are setting change request rules for. You need to configure specific instances with different configurations separately.
