# Change Management

The Change Management module captures changes made within Knowledge Management. Knowledge Management changes follow the same audit, change request, and scheduling workflows as other modules. Any update that requires approval will generate a change request, and all committed changes are logged in the Audit Log.

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

***

### Submitting a Change Request

Whether a change requires a request is configurable at the backend, on a per-user or per-change-type basis. For example, a specific user role may be configured so that any agent update they attempt creates a change request instead of applying directly.

!!! info ""
    **Note:** Users can't approve their own change requests. A separate approver with the appropriate permissions is always required.


***

### Approving a Change Request

1. Navigate to **Change Management** and then **Change Requests**.
2. Locate the pending request and review its details.
3. If the change is valid, approve it. The change will then be committed to the system and will appear in the Audit Log.

!!! info ""
    **Note:** Changes submitted with a change request will not appear in the Audit Log until the request has been approved. Pending (unapproved) changes are not reflected anywhere in the live system.


## Scheduled Changes

Scheduled changes allow a user to make a change in the portal and specify a future date and time for it to take effect. Rather than applying immediately, the change is queued and executed automatically at the scheduled time. To schedule changes:

1. Make the desired change in the portal.
2. In the scheduling section, set the desired date and time for the change to take effect.
3. Submit the change. It will appear in the **Scheduled Changes tab**.
4. At the specified date and time, the change will be automatically applied and appear in the Audit Log.

***

### View Scheduled Changes

You can view pending scheduled changes under **Change Management > Scheduled Changes**. Once a scheduled change is deployed, it’s recorded in the Audit Log.

***

### Reverting a Change

Once a change has been committed and appears in the Audit Log, it can be reversed directly from the log. Each entry includes an option to undo the change, allowing admins to roll back unintended updates without manually re-editing the affected entity.

***

### Cancelling a Scheduled Change

A scheduled change can be cancelled before it deploys. To cancel:

1. Navigate to **Change Management** and then **Scheduled Changes**.
2. Locate the entry you want to cancel.
3. Click **Cancel** on the entry. This removes it from the queue, and the change will not be applied.

!!! info ""
    **Note:** Cancelling a scheduled change removes it entirely. It will not appear in the Audit Log since the change was never committed.

