# export-segments

Exports all segment definitions from Pinpoint to S3. Both `DIMENSIONAL` (attribute-based) and `IMPORT`-type segments are exported.

## Prerequisites

* bootstrap

### Command syntax

```bash
node ./pinpoint-migration-tool.mjs export-segments -r <region> -p <profile> -a <application-id>
```

![](../../assets/images/PLXiddHGw5WAC5FTS6Fn.png)

| **Option**             | **Required** | **Description**         |
| ---------------------- | ------------ | ----------------------- |
| `-r, --region`         | Yes          | AWS region              |
| `-p, --profile`        | Yes          | AWS credentials profile |
| `-a, --application-id` | Yes          | Pinpoint Application ID |

***

### What this command does

1. Fetches all segment definitions from the Pinpoint application.
2. Stores them as a single JSON file in S3 at `<appId>/segments/segments.json`.

***
