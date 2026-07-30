# Migration Results and Reporting

After migration execution, the tool generates a set of customer-readable reports.

## Per-asset status

Each migrated resource is reported with one of the following statuses.

| **Status**                                              | **Description**                                                                                                                          |
| ------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| <mark style="color:$primary;">**Fully Migrated**</mark> | The resource was migrated to Connect.                                                                                                    |
| <mark style="color:$primary;">**Not Migrated**</mark>   | The resource contains unsupported configurations or failed validation. The report includes the specific reason and remediation guidance. |

***

### Report contents

The tool produces the following report artifacts after migration completes.

| **Artifact**             | **Description**                                                                                                                                                       |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Migration state file     | Stored at `s3://<bucket>/instances/<instance-id>/state.json.` Contains ARN mappings for templates, segments, and endpoint attributes. Do not manually edit this file. |
| Migration summary report | High-level overview of all migrated and skipped resources.                                                                                                            |
| Per-journey status       | Detailed status for each journey, including reason codes for skipped journeys.                                                                                        |
| Eligibility report       | Full inventory of Pinpoint assets with eligibility classification.                                                                                                    |
| Execution summary        | Run ID, timestamps, and per-asset results.                                                                                                                            |
| Audit bundle             | Complete package of all reports and logs for compliance and review.                                                                                                   |
| Recommended next steps   | Guidance for manual remediation of unsupported resources.                                                                                                             |

***

## Observability

* Unique run IDs for each execution.
* Structured logs with per-asset status.
* Progress checkpoints during long-running operations (for example, endpoint export and ingestion).

!!! info ""
    Note: Logs are PII-safe. Personally identifiable information is not written to log output.


***
