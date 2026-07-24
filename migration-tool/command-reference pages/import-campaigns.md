# import-campaigns

Imports exported campaigns into Amazon Connect Outbound Campaigns using the V2 APIs.

Template and segment ARNs are resolved from migration state. Imported campaigns are created in Initialized state and are not automatically started.

## Prerequisites

* `bootstrap`
* `import-templates`
* `import-segments`

### Command syntax

```bash
node ./pinpoint-migration-tool.mjs import-campaigns -r <region> -p <profile> -i <instance-id> -a <application-id>
```

![](../../assets/images/FI4OzaRmeU53BDHMe3mI.png)

| **Option**             | **Required** | **Description**            |
| ---------------------- | ------------ | -------------------------- |
| `-r, --region`         | Yes          | AWS region                 |
| `-p, --profile`        | Yes          | AWS credentials profile    |
| `-i, --instance-id`    | Yes          | Amazon Connect instance ID |
| `-a, --application-id` | Yes          | Pinpoint Application ID    |

***
