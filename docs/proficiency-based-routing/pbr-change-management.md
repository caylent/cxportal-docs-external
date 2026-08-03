# PBR Change Management

The Change Management module captures changes made within the PBR configuration. PBR changes follow the same audit, change request, and scheduling workflows as other modules. Any PBR update that requires approval will generate a change request, and all committed PBR changes are logged in the Audit Log.

***

## Audit Log

The Audit Log module in the CxPortal provides a centralized record of changes made across all modules. It consists of three components:

* **Audit Log** — a real-time log of all changes committed to the system.
* **Change Requests** — a workflow for changes that require approval before being applied.
* **Scheduled Changes** — a mechanism for queuing a change to take effect at a specified future date and time.

The Audit Log records all committed changes made within the CxPortal, across every module. Each entry captures who made the change, what was changed, and relevant details about the affected entity. Each audit log entry includes:

| **Field**       | **Description**                                                                        |
| --------------- | -------------------------------------------------------------------------------------- |
| User            | The user who performed the action.                                                     |
| Action          | The type of change (e.g., Created, Updated, Deleted).                                  |
| Entity / Module | The item or module that was changed.                                                   |
| Details         | Additional context about the change (e.g., entity name, field values, region, bucket). |
| Timestamp       | When the change was committed.                                                         |

***

## Change Requests

Change requests are a controlled change workflow. When a user attempts to make a change that they do not have direct permission to commit, or when a change type is configured to require approval, the change is submitted as a request rather than applied immediately.

A second user with the appropriate permissions must review and approve the request before it is committed to the system.


### Submitting a Change Request

Whether a change requires a request is configurable at the backend, on a per-user or per-change-type basis. For example, a specific user role may be configured so that any agent update they attempt creates a change request instead of applying directly.

**Note:** Users can't approve their own change requests. A separate approver with the appropriate permissions is always required.



### Approving a Change Request

1. Navigate to **Change Management** and then **Change Requests**.
2. Locate the pending request and review its details.
3. If the change is valid, approve it. The change will then be committed to the system and will appear in the Audit Log.

**Note:** Changes submitted with a change request will not appear in the Audit Log until the request has been approved. Pending (unapproved) changes are not reflected anywhere in the live system.


### Approving or Rejecting Multiple Change Requests
You can act on several pending requests in one step instead of opening each individually:

1. In the **Change Requests** list, check the box on each request you want to include. You can only select requests that are still **Pending** and that you did not submit yourself — requests that don't qualify remain viewable, but their checkbox is disabled.
2. A **Bulk Actions** toolbar appears, showing your selection count against the limit, for example **3 / 20**. You can select at most 20 requests at once; the count turns red and the actions disable if you exceed it.
3. Click **Approve Request** or **Reject Request**.
4. A confirmation dialog summarizes the action. Approving explains that the changes will be applied and cannot be undone; rejecting explains that the selected requests will be dismissed without applying changes.
5. Click **Confirm** to proceed. If some requests fail to process, a message appears reporting how many succeeded and failed.

**Note:** Approving a request that impacts a scheduled change refreshes the Scheduled Changes view automatically.

***

## Scheduled Changes

Scheduled changes allow a user to make a change in the portal and specify a future date and time for it to take effect. Rather than applying immediately, the change is queued and executed automatically at the scheduled time. To schedule changes:

1. Make the desired change in the portal.
2. In the scheduling section, set the desired date and time for the change to take effect.
3. Submit the change. It will appear in the **Scheduled Changes tab**.
4. At the specified date and time, the change will be automatically applied and appear in the Audit Log.


### View Scheduled Changes

You can view pending scheduled changes under **Change Management > Scheduled Changes**. Once a scheduled change is deployed, it’s recorded in the Audit Log.



### Reverting a Change

Once a change has been committed and appears in the Audit Log, it can be reversed directly from the log. Each entry includes an option to undo the change, allowing admins to roll back unintended updates without manually re-editing the affected entity.



### Cancelling a Scheduled Change

A scheduled change can be cancelled before it deploys. To cancel:

1. Navigate to **Change Management** and then **Scheduled Changes**.
2. Locate the entry you want to cancel.
3. Click **Cancel** on the entry. This removes it from the queue, and the change will not be applied.

**Note:** Cancelling a scheduled change removes it entirely. It will not appear in the Audit Log since the change was never committed.


***

## Syncing Indicator

The syncing indicator is a UI element that appears after a user makes a change (such as creating, updating, or deleting a predefined attribute, value, agent assignment, or routing rule). It signals that the change has been submitted and is currently being processed by the caching service.

The syncing indicator appears for any change that goes through the caching service. This includes all create, update, and delete actions on the following entity types within PBR:

* Predefined Attributes
* Predefined Attribute Values
* Agent Assignments
* Routing Rules

All these entity types will appear on the Audit Log once syncing is complete.

### Syncing Duration

The syncing process typically completes within a few seconds. The caching service processes queued changes at approximately a 5-second interval. Users should wait for the indicator to disappear before verifying the change in the Audit Log.
