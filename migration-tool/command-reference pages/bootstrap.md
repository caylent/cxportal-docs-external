# bootstrap

Deploys the CloudFormation stack with infrastructure required by all other migration commands. Run this command before any export or import step.

## Command syntax

```bash title="Command"
node ./pinpoint-migration-tool.mjs bootstrap -r <region> [-p <profile>] [-d <domain>] [-k <kms-arn>]
```

!!! info ""
    Note: This command must be run from the directory where the zip archive was extracted.


### Options

| **Option**      | **Required** | **Description**                                                    |
| --------------- | ------------ | ------------------------------------------------------------------ |
| `-r, --region`  | Yes          | AWS region                                                         |
| `-p, --profile` | No           | AWS credentials profile                                            |
| `-d, --domain`  | No           | Customer Profiles domain name (prompted if omitted)                |
| `-k, --kms-arn` | No           | KMS key ARN for Customer Profiles encryption (prompted if omitted) |

### Resources created

The command deploys a CloudFormation stack named pinpoint-migration-bootstrap containing:

* S3 bucket for storing exported data
* IAM role for Pinpoint export jobs
* Customer Profiles domain
* AppFlow integration resources

!!! info ""
    Note: Running bootstrap again updates the existing stack if there are changes.


### Errors

| **Error**                       | **Cause**                                                                  | **Resolution**                                                                |
| ------------------------------- | -------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| `StackNotFoundError`            | A migration command ran before bootstrap completed.                        | Run bootstrap first.                                                          |
| `MissingStackOutputsError`      | The stack exists but is missing required outputs.                          | Re-run bootstrap to recreate the stack.                                       |
| `BucketAlreadyExistsError`      | The S3 bucket name is in use in another AWS account.                       | Choose a different bucket name and re-run.                                    |
| `MigrationStateValidationError` | The migration state file in S3 was manually edited into an invalid format. | Fix or delete `s3://<bucket>/instances/<instance-id>/state.json` aand re-run. |
