---
description: >-
  Select multiple items in an entity and edit or delete them through a single
  change request.
---

# Bulk Editing and Deleting Items

Bulk actions let you change or remove many items at once instead of submitting a separate change request per record. You select items in an entity's items view, apply a shared edit or a delete, and the whole batch is submitted as one change request. An approver can then approve or reject the batch in one action, or act on individual items inside it.

***

## Key Terms

| Term                    | Definition                                                                                                                               |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| **Bulk edit**           | A single edit applied to every selected item. Only the fields you set are changed; untouched fields keep their existing per-item values. |
| **Bulk delete**         | A single action that removes every selected item, behind its own confirmation.                                                           |
| **Bulk change request** | The single change request that bundles every item in the batch through the standard approval flow.                                       |
| **Inbound reference**   | A link from another item to one of your selected items. Items with inbound references block a bulk delete.                               |
| **Criticality**         | The priority you assign to the change request at submission: **Normal** (default) or **Urgent**.                                         |

***

### Permissions

Before you can bulk edit or bulk delete:

* Your role must have the **Bulk editing** capability enabled in DFC Permissions. Without it, the row checkboxes and bulk controls are not shown and any bulk attempt is refused. See [Managing DFC Permissions.](https://pronetx.gitbook.io/cxportal-1/M6apoD9LCAkiMWFcxuXH/cx-portal-all-content/dynamic-flow-configurator-dfc/managing-dfc-permissions)
* Roles with the **Admin** permission level always have bulk editing — it's enabled automatically and can't be turned off.
* You also need the item edit rights (for bulk edit) or delete rights (for bulk delete) on the entity. The bulk-editing capability doesn't add access beyond your existing item permissions.

{% hint style="info" %}
**Note:** Roles that existed before this feature default to bulk editing off. An administrator must turn it on per role.
{% endhint %}

***

### Limits and Constraints

* **500-item maximum.** A single bulk edit or bulk delete can cover up to 500 items. Larger submissions are rejected.
* **Three fields can't be bulk edited.** The item's primary field, the schedule (hours of operation) field, and the closure field are shown read-only in the **Bulk Edit** modal with a note that they must be edited on individual items. All other fields, including references and Amazon Connect resources, can be bulk edited.
* **Selection follows the filter.** The header select-all checkbox selects every item currently shown. If the active filter matches more items than are shown, a banner lets you select all matching items.
* **Bulk delete is all-or-nothing on references.** If any selected item still has inbound references, the whole submission is blocked before a change request is created — including the items that aren't referenced.
* **Changes apply after approval.** Bulk edits and deletes route through the standard DFC change-request flow. Nothing changes until the request (or an item within it) is approved.

***

## Step-by-Step Instructions

### **Select Items**

Start every bulk action by selecting items in the entity's items view.

1. In the **DFC Browser**, select the entity and open its items view.
2. Tick the checkbox on each row you want to include, or tick the header checkbox to select all items currently shown.
3. If your filter matches more items than are shown, a banner appears offering **Select all \[N] items matching the filter**. Click it to include every matching item.
4. A bulk-action toolbar appears above the table showing the selection count — **Bulk Edit: \[N]** — with **Bulk Edit**, **Delete**, and **Clear** actions.

**Note:** Click **Clear** to deselect everything and hide the toolbar.

***

### **Bulk Edit Items**

Apply the same field values to every selected item in one action.

1. In the bulk-action toolbar, click **Bulk Edit**.
2. The **Bulk Edit** modal opens. It lists the selected items — click the **x** next to any item to remove it from the batch — and shows every field blank.
3. Set a value on each field you want to change. Any field you set is applied to every selected item; fields you leave untouched are unchanged on each item.
4. Click **Review changes**.
5. The confirmation step lists the change for each selected item. Enter an optional **Description**, set the **Criticality** (**Normal** or **Urgent**), and optionally set **Schedule For** to schedule the change.
6. Click **Yes, Submit Changes**.

The batch is submitted as a single change request and appears in the approval queue.

{% hint style="info" %}
**Note:** The primary field, schedule (hours of operation) field, and closure field appear read-only with a short note — edit these on individual items instead. Reference fields in the confirmation summary display the referenced item's key name.
{% endhint %}

***

### **Bulk Delete Items**

Remove every selected item in one action, behind its own confirmation.

1. In the bulk-action toolbar, click **Delete**.
2. The **Delete \[N] items** modal opens with a destructive-action warning. It lists the items to delete — click the **x** next to any item to remove it from the batch.
3. Expand **Change Request Details** to add a description, criticality, and optional schedule.
4. Click **Delete \[N] items**.

The deletion is submitted as a single change request. Items are permanently removed only after approval.

{% hint style="warning" %}
**Warning:** Bulk delete is a destructive action. If any selected item is still referenced by other items, the whole submission is blocked and nothing is deleted. The error message names the blocking items by their primary key so you can remove them from the selection and retry.
{% endhint %}

***

### **Approve or Reject a Bulk Change Request**

Approvers review the whole batch as one request and can act on it at either level.

1. Go to **Change Management** > **Change Requests**.
2. Open the bulk change request. The details show the change type (for example, **Bulk Delete Items**), requester, criticality, and a **Change Summary** with the number of records affected and the list of affected records.
3. Choose one of the following:
   * **Approve Bulk** — approves every item in the batch.
   * **Reject Bulk** — rejects every item in the batch. No items are changed.
   * **View Individual Records** — steps through each record in the batch. Approve or reject each one, and use **Back to Bulk View** to return to the batch.

Only approved items are changed or deleted. Rejected items keep their previous values.

{% hint style="info" %}
**Note:** For bulk deletes, the individual record view shows the **Before State** of each item so you can review exactly what will be removed.
{% endhint %}

***

### **Review Bulk Actions in the Audit Log**

Every item in an actioned batch is recorded in the audit history.

* The audit record shows the requester, approver, approval date, description, criticality, that the request was a bulk request, and a **Change Summary** listing the affected records.
* Use **View Individual Records** on the audit record to see the per-item outcomes.
* An approved bulk action can be reverted from the audit record with **Revert Bulk**.

***

### Common Use Cases

The following scenarios highlight when bulk actions are commonly used.

<details>

<summary><strong>Update a shared value across similar records</strong></summary>

Set the same queue, flag, or routing value on a whole set of items — for example regional holidays or agent skills — in one submission instead of editing each record.

</details>

<details>

<summary><strong>Clean up an obsolete set of items</strong></summary>

Select and delete a group of records that are no longer needed, with reference safety preventing you from removing anything that's still in use.

</details>

<details>

<summary><strong>Keep records consistent across an entity</strong></summary>

Correct a value that has drifted across many items so every record matches, reviewed by an approver as a single change.

</details>

***

### Troubleshooting

| Problem                                                                             | Cause                                                                                             | Solution                                                                                                                |
| ----------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| **Row checkboxes and bulk controls don't appear**                                   | Your role doesn't have the **Bulk editing** capability, or lacks edit/delete rights on the entity | Ask an administrator to enable **Bulk editing** for your role in DFC Permissions.                                       |
| **Bulk delete fails with "Cannot delete: item(s) still referenced by other items"** | One or more selected items have inbound references                                                | The error names the blocking items by primary key. Remove them from the selection (or remove the references) and retry. |
| **A field in the Bulk Edit modal is read-only**                                     | Primary, schedule (hours of operation), and closure fields can't be bulk edited                   | Edit these fields on individual items.                                                                                  |
| **Submission is rejected for batch size**                                           | The selection exceeds 500 items                                                                   | Split the work into batches of 500 items or fewer.                                                                      |

***
