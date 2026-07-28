# Security & Data Access

CxPortal connects to your AWS account to manage and display your Amazon Connect environment. This page explains what CxPortal can access, where your data lives, and how Caylent access to your instance is controlled. Use it to answer security and compliance questions about your CxPortal deployment.

## Who Uses This

!!! info ""
    **Who uses this:**

    **Security & Compliance Teams** – Review CxPortal's access scope and data handling model

    **IT Administrators** – Understand and audit the IAM role created during setup

    **Business Admins** – Manage which companies and roles can access your instance


***

## AWS Account Access and IAM Scope

CxPortal accesses your AWS account through an IAM role created by the CloudFormation template you install during setup. The role follows a least-privilege model: it is scoped only to the resources CxPortal needs to operate, not to your full AWS account.

Because the role is defined in the CloudFormation template, you can review every permission it grants before and after installation.

!!! success ""
    You are welcome to review the IAM role and raise any permissions you consider too broad with your Caylent team.


***

## Data Persistence

CxPortal does not store your customer or operational data in Caylent's AWS account.

All information displayed in CxPortal — including logs and operational data — is retrieved from your AWS environment in real time, using cross-account access, at the moment a user loads a page. When the page closes, no copy of that data remains outside your account.

***

## Access to Consumer Data and PII

CxPortal can access whatever data the IAM role permits. The role is the single control that governs data access — CxPortal has no access path outside of it.

Data currently accessible through CxPortal includes:

* **Logs** – Operational log entries from your environment
* **Contact-related information** – Details about contacts handled in your Amazon Connect instance

Call recordings are not currently accessible through CxPortal.

!!! warning ""
    Logs and contact-related information may contain personally identifiable information (PII). Review the IAM role's scope as part of your data protection assessment, and restrict CxPortal role access accordingly.


***

## Caylent Access Model

When Caylent sets up your CxPortal instance, two companies are configured with access:

* **Your company** – Your users, managed through the roles you create
* **Caylent** – The Caylent Professional Services (PS) team, which uses CxPortal to build and manage your Amazon Connect setup

Caylent access is controlled through the same role-based mechanism you use for your own users. Caylent assigns access to the specific roles that need it — there is no separate or elevated access path.

***

### AI/ML Usage

CxPortal does not use any AI/ML models or AI-powered services within the customer's AWS environment by default.

An automated flow testing tool that uses AI exists but requires a separate customer-approved CloudFormation deployment — it cannot be activated without explicit customer action.

***

### Removing Caylent Access

You can request that Caylent remove its access to your instance at any time.

!!! warning ""
    Removing Caylent access prevents the PS team from using CxPortal to develop and support your system. Factor this into the timing of any access change, particularly during active implementation work.


***

### Time-Limited Access

CxPortal does not currently support granting access on demand for a limited period (for example, approving a specific role for the duration of a support activity and removing it automatically afterward). Today, access changes are made by adding or removing role access as described above.

***

### CxPortal as a Go-Live Dependency

CxPortal's primary function in go-live scenarios is dynamic configuration management — flow configuration values, ARN references, and similar settings stored in DynamoDB. Manual DynamoDB management is technically possible, making CxPortal an operational convenience rather than a hard technical dependency.

However, manual management significantly increases effort and introduces timeline risk. Teams should factor this in when assessing whether CxPortal needs to be in place from Day 1.

***
