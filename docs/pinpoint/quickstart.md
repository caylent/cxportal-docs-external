# Quickstart

This page provides a concise end-to-end walkthrough for running a migration. For detailed command options and behavior, see [Command Reference](command-reference.md).

### **Prerequisites checklist**

Before running any commands, confirm the following:

**Environment**

* [Node.js 22 or later](https://nodejs.org/en/download) is installed: `node --version`
* [AWS CLI is installed](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and [configured:](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html) `aws sts get-caller-identity --profile`
* Single AWS account in an [Amazon Connect-supported region](https://docs.aws.amazon.com/connect/latest/adminguide/regions.html)

**Permissions**

* IAM role or profile has the required permissions. See [setting up the IAM Role](setting-up-the-iam-role.md).

**Amazon Connect**

* An [Amazon Connect instance](https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-instances.html) is available, or use the express-setup command to create one.
* [Outbound campaigns are enabled](https://docs.aws.amazon.com/connect/latest/adminguide/enable-outbound-campaigns.html) on the Connect instance.
* The Amazon Connect instance has a [Q\_MESSAGE\_TEMPLATES knowledge base integration](https://docs.aws.amazon.com/connect/latest/adminguide/enable-q.html) configured (required for template import). This integration is created automatically when outbound campaigns are enabled. If you have not yet enabled outbound campaigns, see [Set up Amazon Connect outbound campaigns.](https://docs.aws.amazon.com/connect/latest/adminguide/enable-outbound-campaigns.html)

***

### **Install the tool**

1. Download the zip archive from the **AWS Marketplace** portal.
2. Extract the zip archive to a local directory.
3. Verify the tool runs:

`node ./pinpoint-migration-tool.mjs --help`

***

### **End-to-end migration steps**

Run commands in the following order. Each step depends on the steps before it completing successfully.

!!! warning ""
    Screenshots in this section are provided for reference only. The exact output displayed may vary depending on your AWS environment, configuration, and tool version.


![](../../assets/images/e90204d41ce9de66ec163b2740e3e713d6699105.png)

***

#### Placeholders

The following placeholders are used in all commands on this page. Replace each one with the value for your environment before running a command.

| Placeholder             | Value                                                       |
| ----------------------- | ----------------------------------------------------------- |
| `<region>`              | Your AWS region, for example `us-east-1`                    |
| `<profile>`             | Your AWS CLI profile name, for example `pinpoint-migration` |
| `<pinpoint-app-id>`     | Your Pinpoint application ID                                |
| `<connect-instance-id>` | Your Amazon Connect instance ID                             |

!!! info ""
    Note: These commands must be run from the directory where the zip archive was extracted.


***

#### **Step 1 — Run the preflight scan**

Validates your AWS environment. No resources are created or modified.

```bash
node ./pinpoint-migration-tool.mjs preflight -r <region> -p <profile> -a <pinpoint-app-id> -c <connect-instance-id>
```

Review the preflight report. Resolve any blocking issues before continuing.

![](../../assets/images/7HhyFh7KuCKZ03eDzYH5.png)

#### **Step 2 — Deploy bootstrap infrastructure**

Deploys the CloudFormation stack with resources required by all subsequent commands.

```bash
node ./pinpoint-migration-tool.mjs bootstrap -r <region> -p <profile>
```

!!! info ""
    Run this command once per migration environment. Re-running updates the existing stack.


#### **Step 3 (optional) — Provision a Connect instance**

Skip this step if you already have an Amazon Connect instance configured for outbound campaigns. If you use express-setup, complete this step before proceeding to Step 4.

```bash
node ./pinpoint-migration-tool.mjs express-setup -r <region> -p <profile>
```

#### **Step 4 — Migrate endpoints**

Export Pinpoint endpoints to S3, then ingest them into Amazon Connect Customer Profiles. Endpoint import must complete before template or segment import.

!!! warning ""
    Endpoint export jobs for large datasets can take significant time. The command displays the export job ID immediately. Use `--job-id` to check status without re-running the full export.


```bash
node ./pinpoint-migration-tool.mjs export-endpoints -r <region> -p <profile> -a <pinpoint-app-id>
```

```bash
node ./pinpoint-migration-tool.mjs import-endpoints -r <region> -p <profile> -i <connect-instance-id> -a <pinpoint-app-id>
```

![](../../assets/images/df91qjnmkbSrh6LuAHwO.png)

#### **Step 5 — Migrate templates**

Export Pinpoint message templates to S3, then recreate them in Amazon Connect.

```bash
node ./pinpoint-migration-tool.mjs export-templates -r <region> -p <profile> -a <pinpoint-app-id>
```

![](../../assets/images/d3f020c2bbb805aafa774df24f1b36b64f484b19.png)

```bash
node ./pinpoint-migration-tool.mjs import-templates -r <region> -p <profile> -i <connect-instance-id> -a <pinpoint-app-id>
```

![](../../assets/images/q2QxiobHVBT2qX817LOs.png)

#### **Step 6 — Migrate segments**

Export Pinpoint segment definitions to S3, then recreate them in Customer Profiles.

```bash
node ./pinpoint-migration-tool.mjs export-segments -r <region> -p <profile> -a <pinpoint-app-id>
```

![](../../assets/images/e58ecbc82d4285233511e1be248e96cf8ea481e5.png)

```bash
node ./pinpoint-migration-tool.mjs import-segments -r <region> -p <profile> -i <connect-instance-id> -a <pinpoint-app-id>
```

![](../../assets/images/AFfI4b5kFLxxyaBQ2mqM.png)

#### **Step 7 — Migrate campaigns**

Export eligible campaigns to S3, then recreate them as Amazon Connect Outbound Campaigns.

```bash
node ./pinpoint-migration-tool.mjs export-campaigns -r <region> -p <profile> -a <pinpoint-app-id>
```

![](../../assets/images/d1da2d6e2bafa70ca1b0bd478034bb950119097c.png)

```bash
node ./pinpoint-migration-tool.mjs import-campaigns -r <region> -p <profile> -i <connect-instance-id> -a <pinpoint-app-id>
```

![](../../assets/images/FI4OzaRmeU53BDHMe3mI.png)

#### **Step 8 — Migrate journeys**

Export Pinpoint journeys to S3 as Contact Flow definitions, then import them into Amazon Connect.

```bash
node ./pinpoint-migration-tool.mjs export-journeys -r <region> -p <profile> -a <pinpoint-app-id>
```

![](../../assets/images/dd2413fc8b132d0198d9b6dfd162bb380af6a097.png)

```bash
node ./pinpoint-migration-tool.mjs import-journeys -r <region> -p <profile> -i <connect-instance-id> -a <pinpoint-app-id>
```

![](../../assets/images/yKIW86IWO72i7O2BCqig.png)

#### **Step 9 — Review the migration report**

After migration completes, review the migration report output and the migration state file in S3. [See Post-Migration Actions.](post-migration-actions.md)

***

### **Costs and Service Quotas**

**Amazon S3**

The tool stages exported Pinpoint data in Amazon S3 during migration. Standard S3 storage charges apply to this data. For most migrations, the staged data is small and costs are typically less than $1.00 USD for the duration of the migration. Actual charges depend on the volume of endpoints being migrated and how long the staged data is retained after the migration completes.

To minimize ongoing charges, delete the S3 bucket or exported files after you have verified the migration results. For current S3 pricing, see [Amazon S3 pricing](https://aws.amazon.com/s3/pricing/).

**Amazon Connect and other AWS services**

No additional charges are incurred by running the migration tool itself. Standard service charges for Amazon Connect, Amazon Q in Connect, and Amazon Connect Customer Profiles apply once migrated resources are active and in use. These charges are based on your usage of those services and are not within the scope of this tool.

**Service quotas**

The tool validates applicable service quotas during the preflight check. If any quotas are insufficient for your migration, the preflight report will indicate which quotas need to be increased and provide guidance on submitting an AWS Support request. The tool will not proceed with migration if required quotas are not met.

***
