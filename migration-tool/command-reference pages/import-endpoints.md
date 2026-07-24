# import-endpoints

Reads exported endpoint data from S3, transforms it, and ingests it into Amazon Connect Customer Profiles via an AppFlow integration. Run this command after `export-endpoints` completes. This command must run before `import-templates` and `import-segments`.

## Prerequisites

* `bootstrap`
* `export-endpoints`

***

### Command syntax

```bash title="Command"
node ./pinpoint-migration-tool.mjs import-endpoints -r <region> -i <instance-id> [-p <profile>] [-a <application-id>]
```

![](../../assets/images/df91qjnmkbSrh6LuAHwO.png)

### Options

| **Option**             | **Required** | **Description**                               |
| ---------------------- | ------------ | --------------------------------------------- |
| `-r, --region`         | Yes          | AWS region                                    |
| `-i, --instance-id`    | Yes          | Amazon Connect instance ID                    |
| `-p, --profile`        | No           | AWS credentials profile                       |
| `-a, --application-id` | No           | Pinpoint Application ID (prompted if omitted) |

### What this command does

Resolves the Customer Profiles domain from the Connect instance.
Retrieves the domain encryption key (KMS).
Discovers custom attributes from the transformed endpoint data in S3.
Creates a Customer Profiles ObjectType with the attribute mapping.
Creates an AppFlow integration to ingest the data.
Stores the endpoint attribute mapping in the migration state.
***
