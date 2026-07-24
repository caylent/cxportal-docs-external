# Applying an Infrastructure Update

When Pronetx ships a Type 3 update, your deployment team needs to apply an infrastructure change to each instance before the new feature works there. This page explains what that involves and how to handle it.

## What Pronetx Provides

For every Type 3 release, Pronetx provides:

* **Updated CloudFormation templates** — the infrastructure changes packaged and ready to deploy
* **Deployment instructions** — what to apply, in what order, and any instance-specific considerations

You'll receive this alongside the release notification.

***

## What Your Deployment Team Does

Apply the infrastructure update to each instance separately. The feature only becomes available in an instance once the update has been applied there.

**Recommended approach**

1. Apply the update to your **dev** instance first.
2. Verify the feature works as expected.
3. Promote to **staging** (if applicable), verify again.
4. Apply to **production** when ready.

!!! info ""
    There's no fixed deadline for promoting from one environment to the next, you move at your own cadence. Until the update is applied to an instance, that instance simply doesn't have the new functionality yet; nothing breaks.


***

## If Pronetx Deploys on Your Behalf

For customers who allow it, Pronetx can act as the deployment team and apply the CloudFormation templates directly to your AWS account. If you'd like to set this up or have questions about it, contact your Pronetx account team or submit a support request.

***

## Permissions Are Separate

Infrastructure updates and permission assignments are independent steps. If the release also includes a new permission, an admin handles that separately in CxPortal user management; it doesn't require deployment team involvement.

See [Enabling New Features with Permissions →](broken://pages/bdab411806fac8f691a46a8a417088407a485cf6)

***

## Things to Keep in Mind

* The feature will not work in an instance until the infrastructure update has been applied to that instance. This is expected, and other instances are unaffected.
* CloudFormation templates are provided per release. Do not reuse templates from a previous release.
* If you run into issues during deployment, submit a support request with the instance name and a description of the error.

***

**Need help?** Click **Support** in the top navigation of CxPortal to submit a request.

***
