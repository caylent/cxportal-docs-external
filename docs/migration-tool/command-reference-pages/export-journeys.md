# export-journeys

Exports Pinpoint journeys to S3 as Contact Flow definitions. Each journey is converted to a Contact Flow definition and stored in S3. Journeys containing unsupported activity types or exceeding the activity limit (10 activities) are skipped and reported.

## Command syntax

```bash
node ./pinpoint-migration-tool.mjs export-journeys -r <region> -p <profile> -a <application-id>
```

![](../../assets/images/mgCe05FOVQZn7ILiJYw8.png)

| **Option**             | **Required** | **Description**               |
| ---------------------- | ------------ | ----------------------------- |
| `-r, --region`         | Yes          | AWS region                    |
| `-p, --profile`        | Yes          | AWS credentials profile       |
| `-a, --application-id` | Yes          | Pinpoint Application ID       |
| `-j, --journey-id`     | No           | Export a single journey by ID |

***

### What this command does

1. Fetches journey definitions from Pinpoint (one or all journeys, depending on whether `--journey-id` is provided).
2. Transforms each journey's activities into an Amazon Connect Contact Flow definition.
3. Captures the journey's entry condition (`SegmentStartCondition` or `EventStartCondition`) and stores it in metadata.
4. Stores the flow content and metadata in S3 at `<appId>/journeys/<journeyId>/flow-content.json` and `metadata.json`.

!!! info ""
    Incompatible journeys are skipped with an error message. The export continues for all remaining journeys.


***

### Activity type mapping

The following table lists how each Pinpoint activity type is converted to an Amazon Connect action.

| Pinpoint activity              | Connect action                                | Notes                                                                  |
| ------------------------------ | --------------------------------------------- | ---------------------------------------------------------------------- |
| EMAIL                          | `SendOutboundEmail`                           | Template ARN is a placeholder                                          |
| SMS                            | `SendSMS`                                     | Phone number ARN is a placeholder                                      |
| PUSH                           | `PutLambdaInvokeRequest`                      | No native Connect push support; requires Lambda bridge                 |
| CUSTOM                         | `PutLambdaInvokeRequest`                      | Lambda ARN taken from `DeliveryUri`                                    |
| Wait                           | `Wait`                                        | Duration converted to seconds; maximum 7 days (604,800s)               |
| ConditionalSplit (event-based) | `GetOutboundCommunicationStatus` + `Compare`  | Two-action pair                                                        |
| ConditionalSplit (non-event)   | `EndFlowExecution`                            | Journey continues but branching is not preserved — see Export warnings |
| MultiCondition (event-based)   | `GetOutboundCommunicationStatus` + `Compare`  | Two-action pair                                                        |
| MultiCondition (segment-based) | N/A                                           | Journey is skipped — see Export errors                                 |
| Holdout                        | `DistributeByPercentage` + `EndFlowExecution` | Holdout percentage routes to flow end                                  |
| RandomSplit                    | `DistributeByPercentage`                      | Uses cumulative percentage thresholds                                  |
| ContactCenter                  | `PutDialRequest`                              | Uses placeholder `SegmentArn` if no `DialCriteria` is defined          |

***

### Placeholder values

The exported Contact Flow contains placeholder ARNs. These placeholders must be replaced with real ARNs before the flow is usable in Amazon Connect.

| Placeholder                        | Replace with                                                |
| ---------------------------------- | ----------------------------------------------------------- |
| `<CONNECT_EMAIL_ADDRESS>`          | Configured outgoing email address in Connect                |
| `<WISDOM_KNOWLEDGE_BASE_ARN>`      | Amazon Q in Connect knowledge base ARN                      |
| `<WISDOM_EMAIL_TEMPLATE_ARN:name>` | Q Connect message template ARN for the named email template |
| `<WISDOM_SMS_TEMPLATE_ARN:name>`   | Q Connect message template ARN for the named SMS template   |
| `<CONNECT_PHONENUMBER_ARN>`        | Connect phone number ARN for SMS                            |
| `<CUSTOMER_PROFILES_SEGMENT_ARN>`  | Customer Profiles segment definition ARN                    |

Template and segment placeholders are resolved automatically during `import-journeys` if the corresponding resources were previously imported.

***

### Export warnings

The following conditions generate warnings during export. The journey is still exported; warnings indicate behavior differences or manual steps required after import.

| Warning                                    | Trigger                                                                                                            |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| PUSH activity                              | No native Connect push channel support. Activity is exported as a Lambda invoke placeholder.                       |
| CUSTOM activity                            | `DeliveryUri` is not a Lambda ARN, or template and message data cannot be passed to the Lambda.                    |
| Wait with `WaitUntil`                      | Absolute wait time is baked in at conversion time and does not adjust at runtime.                                  |
| Wait exceeds 7 days                        | Duration is clamped to 604,800 seconds (7 days).                                                                   |
| ConditionalSplit `EvaluationWaitTime`      | This setting is not expressible in Connect and is not preserved.                                                   |
| RandomSplit percentages do not sum to 100% | Branch percentages do not total 100.                                                                               |
| Event-based entry                          | `EventStartCondition` is mapped to a Connect Campaigns event trigger using the Customer Profiles domain ARN.       |
| Flow exceeds 250 actions                   | Amazon Connect flows are limited to 250 actions. The flow is still exported but must be split manually in Connect. |
| Unknown activity type                      | An unrecognized Pinpoint activity was encountered.                                                                 |

***

### Export errors

The following conditions cause a journey to be skipped entirely. No partial flow is created.

| **Error**                                         | **Cause**                                                                                                                                                 | **Resolution**                                                           |
| ------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `JourneyCompatibilityError` (segment branches)    | Journey contains a MultiCondition (Multivariate Split) activity with segment-based branches. Connect campaign flows cannot evaluate segment conditions.   | Remove or replace the MultiCondition activity in Pinpoint and re-export. |
| `JourneyCompatibilityError` (too many conditions) | A MultiCondition or ConditionalSplit activity maps to more than 5 Compare conditions. Amazon Connect allows a maximum of 5 conditions per Compare action. | Reduce the number of event branches in the activity and re-export.       |

***
