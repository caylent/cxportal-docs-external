# export-templates

Exports all email, SMS, voice, and PUSH templates from Pinpoint to S3. Run this command before import-templates.

## Prerequisites

`bootstrap`

***

### Command syntax

```bash
node ./pinpoint-migration-tool.mjs export-templates -r <region> [-p <profile>] [-b <bucket>] [-t <types>]
```

![](../../assets/images/yOkx3ixFOpE2aJQOjKhH.png)

| **Option**      | **Required** | **Description**                                                                                                                   |
| --------------- | ------------ | --------------------------------------------------------------------------------------------------------------------------------- |
| `-r, --region`  | Yes          | AWS region                                                                                                                        |
| `-p, --profile` | No           | AWS credentials profile (uses default profile if omitted)                                                                         |
| `-b, --bucket`  | No           | S3 bucket name. Defaults to the bootstrap bucket                                                                                  |
| `--t, -- types` | No           | Comma-separated list of template types to export: **email**, **sms**, **voice**,\*\* push\*\*. Prompted interactively if omitted. |

***

### Supported template types

| **Type** | **Exported** | **Importable**                           |
| -------- | ------------ | ----------------------------------------- |
| EMAIL    | Yes          | Yes                                      |
| SMS      | Yes          | Yes                                      |
| VOICE    | Yes          | Yes (as Outbound Whisper Contact Flow)   |
| PUSH     | Yes          | Yes (as Q Connect PUSH message template) |

### What this command does

1. Lists all Pinpoint templates of the selected types.
2. Exports every version of each template to S3.

### Export location

```
s3://<bucket>/global/message-templates/<type>/<name>/<version>.json
```

### Errors

| **Error**                            | **Cause**                                                    | **Resolution**                               |
| ------------------------------------ | ------------------------------------------------------------ | -------------------------------------------- |
| `UnsupportedExportTemplateTypeError` | A specified template type is not EMAIL, SMS, VOICE, or PUSH. | Use only supported types with the `-t` flag. |
| `StackNotFoundError`                 | The bootstrap CloudFormation stack does not exist.           | Run bootstrap before running this command.   |

***
