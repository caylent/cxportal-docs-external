# export-endpoints

Creates a Pinpoint export job that writes endpoint data to S3. Run import-endpoints after this command completes.

## Command syntax

```bash
node ./pinpoint-migration-tool.mjs export-endpoints -r <region> -p <profile> [options]
```

### Required options

| **Option**      | **Description**         |
| --------------- | ----------------------- |
| `-r, --region`  | AWS region              |
| `-p, --profile` | AWS credentials profile |

### Optional parameters

| **Option**             | **Description**                        |
| ---------------------- | -------------------------------------- |
| `-a, --application-id` | Pinpoint Application ID                |
| `-b, --bucket`         | Existing S3 bucket name                |
| `--role-arn`           | Existing IAM role ARN                  |
| `--job-id`             | Check status of an existing export job |

### Interactive prompts

When optional parameters are not provided, the command prompts for:

* Pinpoint Application ID
* S3 bucket (create new or use existing)
* IAM role (create new or use existing)

!!! info ""
    If you don't provide optional parameters on the command line, the tool will prompt you interactively to supply them or create the necessary resources.


### Resources created (if not using existing)

* S3 bucket with AES-256 encryption
* IAM role with trust policy for **pinpoint.amazonaws.com**
* IAM policy granting S3 write access

***

### Export location

```
s3://<bucket>/raw-exports/<application-id>/
```

### Usage examples

Start a new export:

```bash
node ./pinpoint-migration-tool.mjs export-endpoints --region us-east-1 --profile my-profile
```

Check the status of an existing export job:

```bash
node ./pinpoint-migration-tool.mjs export-endpoints --region us-east-1 --profile my-profile --application-id <app-id> --job-id <job-id>
```

!!! warning ""
    Note: Export jobs for large datasets (10M+ endpoints) can take significant time. The command displays the export job ID immediately. Use --job-id to check status.


### Errors

<details>

<summary><code>ExportJobIdMissingError</code></summary>

**Cause:** The CreateExportJob API response is missing the job ID.

**Resolution:** Verify the Pinpoint API is accessible and retry.

</details>

<details>

<summary><code>ExportJobDataMissingError</code></summary>

**Cause:** The GetExportJob API response is missing job data.

**Resolution:** Verify the export job ID is valid. Retry the export.

</details>

***
