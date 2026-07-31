# ACGR Multi-Region Resiliency

## Overview

CxPortal is hosted in AWS across two regions. The primary region handles normal operations. A secondary region provides backup capacity for the components that support failover.

If the primary region becomes unavailable, traffic for multi-region components automatically routes to the secondary region. No manual intervention is required at the infrastructure level. Users with active sessions will need to sign out and sign back in to reach the secondary region.

!!! info ""
    **Important:** This page describes the resiliency of CxPortal itself. It does not describe multi-region resiliency for your Amazon Connect instance. For information on managing failover for your Connect contact center, see the [ACGR module documentation](https://docs.caylent.com/cxportal/amazon-connect-global-resiliency-acgr/getting-started-with-acgr/).


***

### Scope of Resiliency

Not all CxPortal components run in multiple regions. During a regional outage, only the components listed as multi-region remain available. Other portal modules will be unavailable until the primary region recovers.

| Component                      | Multi-Region | Available During a Regional Outage |
| ------------------------------- | ------------ | ------------------------------------ |
| **CxPortal web application**   | Yes          | Yes                                 |
| **Login Service**              | Yes          | Yes                                 |
| **ACGR module**                | Yes          | Yes                                 |
| **All other CxPortal modules** | No           | No                                  |

***

### Login Availability

CxPortal supports two login methods. Their availability during a regional outage differs.

| Login Method                 | Normal Operation | During a Regional Outage |
| ----------------------------- | ----------------- | -------------------------- |
| **SSO via Entra (Azure AD)** | Available        | Available                 |
| **Username and password**    | Available        | Not available              |

SSO remains available during a regional outage because the login service runs in both regions. Username and password authentication runs only in the primary region.

Entra (Azure AD) is currently the only supported SSO identity provider. Any future identity providers added to CxPortal will also be deployed multi-region.

!!! danger ""
    **Warning:** If your organization uses username and password to log in to CxPortal, you will not be able to access CxPortal during a regional outage. To maintain access during a regional outage, SSO must be enabled. Contact your CxPortal administrator.


***

## What Happens During a Regional Outage

When the primary region is unavailable:

* The CxPortal web application remains accessible through the secondary region.
* Users can sign in only through SSO (Entra).
* The ACGR module remains available, allowing operations teams to manage Amazon Connect Global Resiliency failover.
* All other CxPortal modules are unavailable until the primary region recovers.

***

### In-Flight Sessions

Users who were signed in to CxPortal before the outage will not be able to make API requests. To resume work, they must sign out and sign back in. The new session will connect to the secondary region.

***

### When the Primary Region Recovers

Once the primary region is available again, new requests automatically route back to it. Users signed in to the secondary region during the outage must sign out and sign back in to reconnect to the primary region.

***

### Outage Communication

When a regional outage is detected, Caylent may display a banner on the CxPortal login page with status information.

!!! info ""
    **Note:** Banner notifications are provided on a best-effort basis and should not be relied on as the sole indicator of system status. Customers should maintain their own monitoring and incident response procedures.


***

## Preparing for a Regional Outage

To maintain access to CxPortal during a regional outage:

1. Confirm SSO via Entra is configured for your organization. Contact your CxPortal administrator if it is not.
2. Confirm the CxPortal modules your team relies on for incident response (for example, ACGR) are listed as multi-region in the Scope of Resiliency table.
3. For workflows that depend on CxPortal modules that are not multi-region, document a manual fallback procedure.

***

### Out of Scope

This resiliency model covers CxPortal availability only. It does not cover:

* Amazon Connect instance failover
* Customer contact routing during an Amazon Connect outage
* Agent availability in an Amazon Connect region

To manage failover for your Amazon Connect contact center across regions, use the ACGR module in CxPortal. See the [Getting Started with ACGR](https://docs.caylent.com/cxportal/amazon-connect-global-resiliency-acgr/getting-started-with-acgr/) for details.

***
