# import-journeys

Imports exported Contact Flow definitions into Amazon Connect. Template and segment placeholder ARNs are resolved automatically from migration state during import.

Journeys with unresolved ARNs are imported with placeholder strings that must be replaced manually in Connect.

## Prerequisites

* `bootstrap`
* `import-templates`
* `import-segments`

***

### Command syntax

```bash
node ./pinpoint-migration-tool.mjs import-journeys -r <region> -p <profile> -i <instance-id> -a <application-id>
```

![](../../assets/images/gMeXzSRAzl05WlT25mGz.png)

| **Option**             | **Required** | **Description**            |
| ---------------------- | ------------ | -------------------------- |
| `-r, --region`         | Yes          | AWS region                 |
| `-p, --profile`        | Yes          | AWS credentials profile    |
| `-i, --instance-id`    | Yes          | Amazon Connect instance ID |
| `-a, --application-id` | Yes          | Pinpoint Application ID    |

***

### What this command does

* Loads existing Contact Flows and Journey campaigns in Connect for create-versus-update detection.
* Reads flow content and metadata from S3.
* Resolves template and segment placeholder ARNs using the migration state.
* Creates or updates the Contact Flow in Connect.
* Resolves the journey entry condition from the metadata to a Connect Campaigns source:
  * Segment entry → Customer Profiles segment ARN from migration state
  * Event entry with segment → Customer Profiles segment ARN from migration state
  * Event entry without segment → Customer Profiles domain ARN derived from any imported segment
* Creates or updates the Journey campaign in Connect Campaigns (type `JOURNEY`) linked to the Contact Flow.
* Records the journey mapping (flow ID, flow ARN, campaign ID, campaign ARN) in the migration state.
* Reports any unresolved placeholders.

***

**Placeholder resolution**

During import, placeholder ARNs in the flow content are replaced with real ARNs from the migration state.

* Email and SMS template placeholders (for example, `<WISDOM_EMAIL_TEMPLATE_ARN:name>`) are replaced with the actual Q Connect template ARN if the template was previously imported.
* Segment placeholders are replaced with Customer Profiles segment ARNs if previously imported.

!!! info ""
    Unresolved placeholders; for templates or segments not yet imported are reported as warnings. The flow is still created, but the affected actions will not function until the placeholders are replaced manually in the Amazon Connect console.


***

### Idempotency

If a Contact Flow with the same name already exists, it is updated. Otherwise, a new flow is created. Re-running `import-journeys` is safe and produces the same outcome for unchanged inputs.

***

### Limitations

* <mark style="color:$primary;">**Push notifications**</mark> — Amazon Connect has no native push channel. PUSH activities are imported as `PutLambdaInvokeRequest` actions with a placeholder Lambda ARN. You must implement a Lambda bridge to SNS or Firebase to handle push delivery.
* <mark style="color:$primary;">**Custom actions**</mark> — only the Lambda ARN is passed. Invocation attributes such as template names and message data cannot be included in the flow definition and must be handled within the Lambda function.
* <mark style="color:$primary;">**WaitUntil**</mark> — absolute wait times are converted to a fixed duration at export time. The duration does not adjust at runtime.
* <mark style="color:$primary;">**250 action limit**</mark> — Amazon Connect flows are limited to 250 actions. Large journeys that produce flows exceeding this limit must be split manually in Connect using `TransferToFlow`.
* <mark style="color:$primary;">**5 condition limit**</mark> — Each Compare action in Amazon Connect supports a maximum of 5 conditions. A MultiCondition or ConditionalSplit activity with more than 5 event branches causes the journey to be skipped with a `JourneyCompatibilityError` during export.
* <mark style="color:$primary;">**Segment entry**</mark> — Pinpoint's `SegmentStartCondition` is not encoded in the Contact Flow. Configure the segment source separately in the Connect campaign after import.

***
