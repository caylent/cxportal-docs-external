# preflight

The preflight command validates the AWS environment and Pinpoint configuration before any migration actions are taken.

No resources are created or modified during the preflight scan. If blocking issues are detected, the tool stops processing and reports them.

## Command syntax

```bash
node pinpoint-migration-tool.mjs preflight -r <region> -p <profile> [options]
```

!!! info ""
    Note: This command must be run from the directory where the zip archive was extracted.


![](../../assets/images/7HhyFh7KuCKZ03eDzYH5.png)

### Required options

| **Option**      | **Description**    |
| --------------- | ------------------ |
| `-r, --region`  | AWS region         |
| `-p, --profile` | AWS profile to use |

### Optional parameters

| **Option**                      | **Description**                              |
| -------------------------------- | --------------------------------------------- |
| `-c, --connect-instance-id`     | Amazon Connect instance ID to validate       |
| `-a, --pinpoint-application-id` | Pinpoint application ID to validate          |
| `-j, --journey-id`              | Specific journey ID to analyze (requires -a) |

### Checks performed

The preflight command performs the following checks:

<details open>

<summary><mark style="color:$primary;"><strong>Always performed</strong></mark></summary>

* Region is supported by both Pinpoint and Amazon Connect.
* AWS credentials in the specified profile are valid.
* Connect API is accessible.
* Pinpoint API is accessible.
* Pinpoint and Connect service quota comparison.

</details>

<details open>

<summary><mark style="color:$primary;"><strong>When --connect-instance-id is provided</strong></mark></summary>

* Instance exists and is in ACTIVE status.
* Outbound calls are enabled.
* Outbound campaigns are enabled.
* Email and SMS channels are configured.
* CTR Kinesis streaming is enabled.
* Agent events streaming is enabled.

</details>

<details open>

<summary><mark style="color:$primary;"><strong>When --pinpoint-application-id is provided</strong></mark></summary>

* Application exists and is accessible.
* Journeys are available for the application.

</details>

<details open>

<summary><mark style="color:$primary;"><strong>When --journey-id is provided (requires --pinpoint-application-id)</strong></mark></summary>

* Journey activity types are supported by the tool.
* Journey size is within supported limits.

</details>

***

### Eligibility classification

| Eligible               | The asset can be migrated automatically.                                                                               |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| Eligible-with-Warnings | The asset can be migrated, but semantic differences exist between Pinpoint and Connect behavior. Deltas are disclosed. |
| Not-Eligible           | The asset cannot be migrated automatically. A reason code and remediation path are provided.                           |

### Output

The preflight scan produces a deterministic migration plan artifact in JSON/CSV format. The plan includes:

* A list of migratable assets with classification and any warnings.
* A list of non-migratable assets with reason codes and recommended remediation steps.
* Quota comparison results and guidance for required support tickets.

!!! info ""
    Note: Running the preflight scan with identical inputs produces identical output. This allows teams to review and validate the plan before executing migration.


### Fail-closed behavior

If any validation check fails, no mutation or migration actions are executed. The tool exits with code 1 and reports all detected issues.

!!! warning ""
    Fail-closed: the tool will stop processing and return exit code 1 if any check fails.


### Boundary checks

The tool detects accounts with more than 100 Pinpoint applications (each maps 1:1 with a Customer Profiles domain) and hard-stops. Remediation guidance is provided, such as consolidation or phased migration.

***
