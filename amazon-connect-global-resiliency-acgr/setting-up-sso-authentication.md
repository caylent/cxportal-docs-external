# Setting Up SSO/Authentication

## Overview

CxPortal supports two methods for signing in:

* Username and password (enabled by default for all customers).
* Single sign-on (SSO) via Microsoft Entra ID (Azure AD), available as an opt-in.

!!! info ""
    **Important:** SSO is required to access CxPortal during a regional outage. Username and password authentication is not available when the primary AWS region is unavailable. For details on what is and is not available during an outage, see the [Multi-Region Resiliency](https://pronetx.gitbook.io/cxportal-1/M6apoD9LCAkiMWFcxuXH/cx-portal-all-content/acgr/acgr-multi-region-resiliency) page.


***

## Comparing Login Methods

|                                    | Username and Password | SSO (Entra / Azure AD)                       |
| ---------------------------------- | --------------------- | -------------------------------------------- |
| Enabled by default                 | Yes                   | No (opt-in)                                  |
| Available during normal operation  | Yes                   | Yes                                          |
| Available during a regional outage | No                    | Yes                                          |
| Setup required                     | None                  | Submit a support request and configure Entra |

***

### Username and Password

Username and password is the default authentication method for all CxPortal customers. No setup is required. Users sign in with the credentials issued to them by their CxPortal administrator.

#### Limitations

Username and password authentication runs only in the primary AWS region. If the primary region is unavailable, users cannot sign in to CxPortal using this method. To maintain access during a regional outage, enable SSO.

***

### Single Sign-On (SSO)

CxPortal supports SSO through Microsoft Entra ID (Azure AD). Entra is currently the only supported identity provider. With SSO enabled, users sign in to CxPortal using their existing corporate credentials.

SSO is deployed across both AWS regions, so users with SSO can continue to sign in to CxPortal during a regional outage.

***

## Enabling SSO for Your Organization

Enabling SSO is a five-step process. Some steps are performed by your organization in the Microsoft Entra admin center. Other steps are performed by Pronetx after you submit a support request.

### Before You Begin

You will need:

* Access to your organization's Microsoft Entra admin center
* A user with permission to register applications in Entra
* A secrets vault or password manager to store credentials securely

***

### Step 1: Submit a Support Request to Pronetx

Contact Pronetx to begin SSO onboarding by submitting a support request. Indicate that you want to enable SSO for your organization.

For instructions, see the [Submit a Support Request page](../submitting-a-support-request.md).

!!! info ""
    **Important:** Pronetx will confirm receipt and let you know when you can begin the Entra configuration steps below.


***

### Step 2: Register a New Application in Microsoft Entra ID

Register a new application in the Microsoft Entra admin center. This application is used to federate authentication with CxPortal.

1. In the Microsoft Entra admin center, navigate to **App registrations**.
2. Click **+ New registration**.
3. Enter a display name for the application. For example: CxPortal or \<CompanyName>CxPortal.
4. Select the supported account type appropriate for your organization.
5. Leave the Redirect URI field blank. You will add this in Step 5, after Pronetx provisions your user pool.
6. Click **Register**.

***

### Step 3: Create a Client Secret

Create a client secret that CxPortal will use to authenticate with Entra ID.

7. From the application you just registered, navigate to **Certificates & secrets.**
8. Click **+ New client secret**.
9. Enter a description and select an appropriate expiration period.
10. Click **Add**.
11. Copy the client secret value immediately and store it in a secure location such as a password manager or secrets vault.

!!! danger ""
    **Warning:** The client secret is displayed only once at the time of creation. If you navigate away from the page without copying it, you will need to create a new secret.


***

### Step 4: Collect Application Identifiers and Send to Pronetx

From the application's Overview page in the Entra admin center, collect the following values:

* **Application (client) ID**
* **Directory (tenant) ID**
* **Client secret (copied in Step 3)**

Send these values to Pronetx securely through the support request from Step 1. Pronetx will use these values to provision your CxPortal user pool.

!!! info ""
    **Note:** Pronetx will provision your user pool and then send you a redirect URI to use in the next step. Wait for Pronetx to confirm provisioning is complete before continuing to Step 5.


***

### Step 5: Configure the Redirect URI in Entra ID

Once Pronetx confirms that your user pool has been provisioned, they will send you a redirect URI. Add this redirect URI to your Entra application registration. This allows Entra to redirect users back to CxPortal after authentication.

12.  Return to your application in the Microsoft Entra admin center.
13. Navigate to **Authentication.**
14. Click **+ Add Redirect URI**, then select **Web**.
15. Enter the redirect URI provided by Pronetx. It will follow this format:

`https://<provided-domain>/oauth2/idpresponse`

16. Click **Configure** to save.

***

## Verifying SSO Is Working

Once Step 5 is complete, Pronetx will notify you that SSO is ready to use. To verify:

1. Navigate to the CxPortal login page.
2. Select the **SSO sign-in** option.
3. You will be redirected to your organization's Entra sign-in page.
4. Sign in with your corporate credentials.
5. You should be redirected back to CxPortal and signed in successfully.

If sign-in fails, contact Pronetx support and reference your original support request.

***

## Process Summary

The table below summarizes who is responsible for each step in the SSO setup process.

<table><thead><tr><th width="80">Step</th><th width="442">Action</th><th>Owner</th></tr></thead><tbody><tr><td>1</td><td>Submit a support request to Pronetx</td><td>Customer</td></tr><tr><td>2</td><td>Register application in Entra ID</td><td>Customer</td></tr><tr><td>3</td><td>Create client secret and store securely</td><td>Customer</td></tr><tr><td>4</td><td>Send client ID, tenant ID, and client secret to Pronetx</td><td>Customer</td></tr><tr><td>5</td><td>Provision the CxPortal user pool and send redirect URI</td><td>Pronetx</td></tr><tr><td>6</td><td>Add redirect URI to Entra application</td><td>Customer</td></tr></tbody></table>

***

## Related Pages

* Multi-Region Resiliency — [how CxPortal stays available during a regional outage](https://pronetx.gitbook.io/cxportal-1/M6apoD9LCAkiMWFcxuXH/cx-portal-all-content/acgr/acgr-multi-region-resiliency)
* Submit a Support Request — [how to contact Pronetx for SSO onboarding and other requests](../submitting-a-support-request.md)

***
