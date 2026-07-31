---
icon: up-to-line
cover: ../.gitbook/assets/confluence header (1) (1).png
coverY: 0
---

# Releases & Updates

## How Updates are Delivered

When Pronetx ships an update to CxPortal, what happens next depends on what changed. Some updates are live the moment they're deployed. Others require your deployment team to apply a change to your AWS account before the feature works.

This page explains the three types of updates, what each one means for your team, and what action (if any) you need to take.

A new permission can be added as part of a Type 2 or Type 3 release — never Type 1, which by definition requires no new permission. If a new permission is added, it needs to be assigned to a role through user management before users can access the new feature. Further details are covered here: [Enabling New Features with Permissions →](https://docs.caylent.com/cxportal/enabling-new-features-with-permissions/)

***

## The Three Update Types

**A release is labeled by the highest action it requires of your team** — not by whether the underlying work was frontend, backend, or infrastructure:

* **Type 1** requires no action from your team — the release is live automatically.
* **Type 2** requires an admin to assign a new permission before users can access the feature.
* **Type 3** requires your deployment team to apply an infrastructure update to your AWS account.

### Type 1 — No Customer Action

A release that goes live automatically with nothing for your team to do: no new permission to assign, no infrastructure to update.

**Pronetx handles everything.** The update goes live across all instances the moment it's deployed.

**What you need to do**

* Nothing. The feature is available automatically to anyone with access to the area it's in.

> **Example**
>
> New schedule and closure fields ship for DFC, requiring backend validation updates and interface changes. No changes to your AWS account — Pronetx deploys it and it's live immediately.

***

### Type 2 — Permission Assignment Required

A release where an admin must assign a new permission to the appropriate roles before users can access the feature. The underlying change goes live automatically — the permission assignment is what actually turns the feature on for your team.

**Pronetx handles everything technically**, including any database migrations and the accompanying interface changes. The update goes live across all instances the moment it's deployed; only the permission assignment is on you.

**What you need to do**

* An admin needs to assign the new permission to the required roles in user management before users can see or use the feature.

> **Example**\
> A new Change Tracking dashboard page ships with its own permission. Pronetx deploys it; your admin grants access to the relevant roles.

***

### Type 3 — Infrastructure Updates

A change that requires modifications inside your AWS account: extending an IAM role, adding a DynamoDB table or index, adding an S3 bucket, or similar. These features also require the accompanying frontend and backend changes that depend on that new infrastructure.

**Pronetx builds the frontend and backend changes and provides the infrastructure update.** Your deployment team applies it to each instance.

**What you need to do**

* **Deployment team:** Apply the infrastructure update to each instance. The feature only works in an instance once this is done. You control the pace: apply it to dev first, verify, then promote to production on your own cadence.
* **Admin:** If a new permission ships alongside, assign it to the relevant roles in user management. This is independent of the deployment team work.

{% hint style="info" %}
Pronetx provides updated CloudFormation templates and deployment instructions. For customers who allow it, Pronetx can act as the deployment team and apply the templates directly.
{% endhint %}

> **Example**
>
> An update to Global Change Management adds new DynamoDB tables and IAM role permissions. Your deployment team applies the CloudFormation update per instance before the feature becomes available there.

***

## Release Types at a Glance

| Update Type            | What It Means                                                             | Pronetx Handles | Your Action                                                                          |
| ---------------------- | -------------------------------------------------------------------------------------------------- | --------------- | ---------------------------------------- |
| **1 — No Action**      | Live automatically — no new permission, no infrastructure change         | Entirely        | None                                                                                 |
| **2 — Permission**     | Live automatically, gated behind a new permission                        | Entirely        | Assign the new permission to the required roles                                     |
| **3 — Infrastructure** | Requires an infrastructure update in your AWS account                    | Partially       | Apply the infrastructure update per instance (and assign the permission, if one ships alongside) |

***

## Next Steps

* **Admins:** [Enabling New Features with Permissions →](https://docs.caylent.com/cxportal/enabling-new-features-with-permissions/)
* **Deployment teams:** [Applying an Infrastructure Update →](https://docs.caylent.com/cxportal/applying-an-infrastructure-update/)

***
