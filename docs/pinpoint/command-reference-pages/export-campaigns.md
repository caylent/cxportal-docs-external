# export-campaigns

Exports all eligible campaigns from Pinpoint to S3. Only Email and SMS campaigns are included. Campaigns using voice, push, in-app, or custom channels are skipped.

## Command syntax

```bash title="Command"
node ./pinpoint-migration-tool.mjs export-campaigns -r <region> -p <profile> -a <application-id>
```

![](../../assets/images/SlgbmQj3ijcPM9cz3y5N.png)

| **Option**             | **Required** | **Description**         |
| ---------------------- | ------------ | ----------------------- |
| `-r, --region`         | Yes          | AWS region              |
| `-p, --profile`        | Yes          | AWS credentials profile |
| `-a, --application-id` | Yes          | Pinpoint Application ID |

***
