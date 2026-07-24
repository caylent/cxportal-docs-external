# Create Values

## Before You Begin

Values are the values associated with your predefined attributes. The values page shows a list of your values and their associated predefined attributes. You can add and delete values from this page.

Before working with values, make sure you have the following in place:

* **CxPortal access.** You'll need to sign in to CxPortal using the credentials your organization provides.
* **The required role.** Proficiency-Based Routing is subject to role-based access. You must have the role designated by your organization to manage values.
* **At least one predefined attribute.** Every value must be linked to a predefined attribute, so you'll need to create the relevant predefined attribute before you can add values to it. For example, before adding a value of "Fluent," you'd first need a "Language" predefined attribute to associate it with.
* **A decision on your rating scale.** Each value uses a value type that determines how skill levels are expressed — either the standard 1–5 numeric scale or a custom scale with descriptive labels such as "Beginner" or "Expert." It's worth deciding which approach fits your team before you start, since this controls how ratings appear in CxPortal.

***

## Limits and Constraints

Keep the following limitations in mind when managing values:

* **Values must be linked to a predefined attribute.** Every value has to be associated with a predefined attribute and can't exist on its own.
* **Reserved naming.** You can't create a value that starts with "connect." This terminology is reserved by Amazon Web Services.
* **Amazon Connect uses a 1–5 scale behind the scenes.** Amazon Connect requires a 1–5 rating scale for values. Custom labels you define act as alias values for the 1–5 scale — CxPortal displays your labels, but Amazon Connect still uses the underlying numbers internally.
* **You don't have to define all five levels.** With a custom rating scale, you only need to define the values you actually use; you can customize the scale as needed rather than filling in all five.
* **Values in use can't be deleted.** A value can't be deleted if it's used in an active routing rule. You'll need to remove that dependency first.
* **Deleting values can break inactive rules.** If an inactive routing rule contains a value that was previously deleted, any attempt to reactivate that rule will fail.

***

## Step-by-Step Instructions

### Add Values

1. Open **CxPortal**.
2. On the left menu, expand **Proficiency Routing** and then click **Values**.
3. Select the **predefined attributes** associated with your value.
4. Enter a **value name**. You can’t create a value that starts with “connect”. This terminology is reserved by Amazon Web Services.
5. Select a **value type**. A value type is a rating scale for values. In Amazon Connect you must use a 1-5 rating scale for values, but you can enter custom values in CxPortal to create alias values for the 1-5 rating scale.
   1. For a standard 1-5 rating scale, click **1-5**.
   2. For a custom rating scale, click **Custom**.
      1. Enter the custom text for value 1, 2, 3 ,4 and 5. You don’t need to use all 5 values. You can customize the rating scale as needed.
      2. Click **Confirm**.
6. Click **+Add Value**.

***

### Edit Values

1. Open **CxPortal**.
2. On the left menu, expand **Proficiency Routing** and then click **Values**.
3. Navigate to the values list and click the **pencil icon** next to the one you want to edit.
4. Edit the value content and click **Update** to apply your changes.

***

### Delete Values

1. Open **CxPortal**.
2. On the left menu, expand **Proficiency Routing** and then click **Values**.
3. Navigate to the value list and click the **trash icon** next to the one you want to delete.
4. A deletion confirmation message appears. Review the message and click **Confirm** to delete the value.

!!! info ""
    **Note:** A value can’t be deleted if it’s used in an active routing rule.  If an inactive routing rule contains a value that was previously deleted, a reactivation attempt will fail.

