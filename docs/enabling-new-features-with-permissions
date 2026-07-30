---
description: >-
  Any CxPortal update can introduce a new permission to control access to new
  functionality. This page explains how that works and what an admin needs to do
  when it happens.
---

# Enabling New Features with Permissions

## How It Works

When Caylent ships a feature with a new permission, the permission is added to CxPortal automatically as part of the release. However, the feature isn't visible to anyone yet.

An admin must assign the new permission to the appropriate roles in CxPortal user management. Until that happens, the feature is live in the system but not accessible to users.

This gives your organization control over who sees new functionality and when, before rolling it out to your full team.

***

## Controlling Which Environments See It

CxPortal user management is per-instance. That means you can grant a new permission in your dev instance first, verify everything looks right, and then grant it in production when you're ready.

This is the primary way to control environment rollout for Type 2 updates (and for Type 3 updates that also add a permission), since the underlying change otherwise goes live across all instances the moment it's deployed.

***

## Assigning a Permission

1. Open **CxPortal** and go to **User Management**.
2. Select the role you want to update.
3. Find the new permission in the permission list and enable it.
4. **Save** your changes. Users with that role will now see the new functionality.

Repeat for each instance where you want to enable access.

***

## Things to Keep in Mind

* Assigning permissions is an **admin action** in CxPortal, it does not require any changes to your AWS account or deployment team involvement.
* If a Type 3 infrastructure update is also part of the release, the permission assignment and the infrastructure update are independent. You can do them in either order, but the feature won't fully work until both are complete.
* Caylent will note in the release documentation when a new permission is included and what it controls.

***

**Need help?** Click **Support** in the top navigation of CxPortal to submit a request.

***
