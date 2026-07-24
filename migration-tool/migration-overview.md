# Migration Overview

## Migration targets

The following table lists each Pinpoint resource type and its corresponding migration target in Amazon Connect.

| Pinpoint Resource           | Migration Target                                                            |
| --------------------------- | --------------------------------------------------------------------------- |
| Endpoints (user attributes) | Amazon Connect Customer Profiles (via S3-based ingestion)                   |
| Email and SMS templates     | Amazon Connect message templates                                            |
| Voice templates             | Recreated as Outbound Whisper Contact Flows with a single Play Prompt block |
| Campaigns                   | Amazon Connect Outbound Campaigns (V2 APIs)                                 |
| Eligible journeys           | Amazon Connect Multi-step Journeys / Contact Flows                          |
| Segments                    | Amazon Connect Customer Profiles (segment definitions)                      |

## How the tool works

The tool follows a sequential workflow. Each command must complete before the next step begins. The phases are described in detail in the sections that follow.

```bash
preflight
```

Validates credentials, permissions, quotas, and service access. Read-only — no resources are created or modified.
```bash
bootstrap
```

Deploys a CloudFormation stack with required infrastructure (S3, IAM, Customer Profiles domain, KMS). Must complete before any export or import command.
```bash
express-setup (optional)
```

Provisions a production-ready Amazon Connect instance with required infrastructure. Use this step if you do not have an existing Connect instance.
```bash
export-endpoints / import-endpoints
```

Exports Pinpoint endpoints to S3 and ingests them into Amazon Connect Customer Profiles.
```bash
export-templates / import-templates
```

Exports email, SMS, and voice templates and recreates them in Amazon Connect.
```bash
export-segments / import-segments
```

Exports Pinpoint segment definitions and recreates them in Customer Profiles.
```bash
export-campaigns / import-campaigns
```

Exports campaigns and recreates them as Amazon Connect Outbound Campaigns.
```bash
export-journeys / import-journeys
```

Exports journeys and imports them as Amazon Connect Contact Flows.
```bash
report
```

Summarizes what was migrated, what was skipped, and what requires manual action.
***

### Execution behavior

* The bootstrap command must complete before any export or import command can run.
* The tool automates migration of supported resources only.
* Unsupported resources are detected and skipped without modification.
* No partial resources are created.
* Execution is deterministic: identical inputs produce identical plans and outcomes.
* The tool is idempotent and resumable. If execution is interrupted, re-run the same command.
* The tool does not delete or overwrite existing resources. New resources are created alongside any existing Connect configuration.

***
