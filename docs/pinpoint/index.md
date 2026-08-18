# Introduction

## Overview

The **Caylent Migration Tool for Amazon Pinpoint** is a CLI-based automation tool that migrates supported Amazon Pinpoint configurations to Amazon Connect.

Amazon Pinpoint reaches End of Support (EOS) on October 30, 2026. After that date, customers must use supported AWS services for campaign and messaging workflows. This tool provides a structured migration path for eligible Pinpoint resources.

!!! info ""
    The tool is distributed through [AWS Marketplace](https://aws.amazon.com/marketplace/pp/prodview-zzpgnprbmmnj6?sr=0-7\&ref_=beagle\&applicationId=AWSMPContessa) and executes locally using the customer's own AWS credentials. Caylent does not require direct access to customer AWS accounts.


### Effect on Your Existing Pinpoint Environment

The migration tool operates in read-only mode when scanning your Pinpoint environment. It does not modify, delete, or alter any resources in your existing Pinpoint account at any stage of the migration process, including during the preflight check, scan, and migration execution steps.

Your Pinpoint environment remains fully operational while you run the tool. You can continue using Pinpoint as normal until October 30, 2026. We recommend completing your migration and validating your Amazon Connect environment well before the end of support date to avoid disruption to active campaigns and journeys. No action is required on your part to decommission Pinpoint. AWS manages the service retirement.

!!! success ""
    SMS, voice, mobile push, OTP, and phone number validation APIs are not affected by the Pinpoint end of support. These capabilities are available through AWS End User Messaging.


***

### What the tool does

<details>

<summary>**Deploy bootstrap infrastructure**</summary>

Deploys a bootstrap stack that provisions the S3 bucket, IAM export role, Customer Profiles domain, and KMS key required by all subsequent commands.

</details>

<details>

<summary><strong>Scan and inventory Pinpoint resources</strong></summary>

Scans a specified Pinpoint application and inventories endpoints, templates, campaigns, segments, journeys, and channel configurations.

</details>

<details>

<summary><strong>Evaluate migration eligibility</strong></summary>

Evaluates each resource for migration eligibility and classifies it as Eligible, Eligible-with-Warnings, or Not-Eligible.

</details>

<details>

<summary><strong>Migrate supported resources</strong></summary>

Migrates supported resources to Amazon Connect Outbound Campaigns, Amazon Connect Customer Profiles, and Amazon Connect message templates.

</details>

<details>

<summary><strong>Generate migration reports</strong></summary>

Generates detailed reports summarizing migration outcomes and required manual actions.

</details>

***

### Who the tool is for

* Customer engineers performing self-service migration.
* AWS Technical Account Managers (TAMs) and Solutions Architects (SAs) validating eligibility and guiding remediation.
* Partner delivery teams executing migrations repeatedly at scale.

***
