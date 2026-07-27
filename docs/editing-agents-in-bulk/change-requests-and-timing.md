# Change Requests and Timing

## How Changes Work in This Module

Whether a bulk change requires approval before it's applied depends on your organization's configuration.

***

### When Change Management is Enabled

If your organization has Change Management enabled for bulk changes, submissions go through an approval workflow in CxPortal before they're applied:

1. You select agents and apply a change (Routing Profile, Auto Accept Calls, or ACW Time Limit). See Making Bulk Changes.
2. In the **Change Request Details** window, you fill in the optional **Description**, set the **Criticality** (**Normal** or **Urgent**), optionally set a **Date and Time**, and click **Submit**.
3. The change shows a status of **Pending** until it's approved and processed.
4. If the change can't be processed, a **Failed** notification appears.

!!! warning ""
     **Info:** If you're seeing a **Pending** status and didn't expect it, contact your CxPortal administrator to confirm whether Change Management is required for your role or instance.


***

### When Change Management is Not Required

If no approval is required, changes are applied automatically. Processing time scales with the number of agents being updated: a base time of approximately 5–10 seconds, plus roughly 1 second per additional agent. A progress indicator in the upper-right corner of the page shows the status of all active bulk changes.

***

### Scheduling Changes

To schedule a bulk change for the future instead of applying it immediately, set a **Date and Time** in the **Change Request Details** window before you click **Submit**. If you leave it unset, the change is submitted for immediate processing (subject to approval where required).

***

### Required Roles

* Access to the **Bulk Edit** section requires the appropriate administrative role in CxPortal.
* Submitting a bulk change may require Change Management approval, depending on your organization's role and instance configuration.

***
