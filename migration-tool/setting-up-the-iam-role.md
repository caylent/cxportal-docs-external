# Setting up the IAM Role

Follow the steps below to create a dedicated IAM role and configure your AWS CLI profile to use it.

## Prerequisites

* AWS CLI v2 installed and configured with an IAM user or role that has permission to create IAM roles and policies.
* The AWS account ID where the migration will run.

***

### Create the IAM policy

Save the following as `pinpoint-migration-policy.json` in your working directory.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "STS",
      "Effect": "Allow",
      "Action": "sts:GetCallerIdentity",
      "Resource": "*"
    },
    {
      "Sid": "Pinpoint",
      "Effect": "Allow",
      "Action": [
        "mobiletargeting:GetApps",
        "mobiletargeting:GetApp",
        "mobiletargeting:GetCampaigns",
        "mobiletargeting:GetCampaign",
        "mobiletargeting:GetSegments",
        "mobiletargeting:GetJourney",
        "mobiletargeting:ListJourneys",
        "mobiletargeting:ListTemplates",
        "mobiletargeting:ListTemplateVersions",
        "mobiletargeting:GetEmailTemplate",
        "mobiletargeting:GetSmsTemplate",
        "mobiletargeting:GetVoiceTemplate",
        "mobiletargeting:GetPushTemplate",
        "mobiletargeting:CreateExportJob",
        "mobiletargeting:GetExportJob"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Connect",
      "Effect": "Allow",
      "Action": [
        "connect:CreateInstance",
        "connect:DescribeInstance",
        "connect:ListInstances",
        "connect:ListPhoneNumbersV2",
        "connect:AssociateInstanceStorageConfig",
        "connect:ListInstanceStorageConfigs",
        "connect:CreateContactFlow",
        "connect:UpdateContactFlowContent",
        "connect:SearchContactFlows",
        "connect:DescribeContactFlow",
        "connect:ListIntegrationAssociations"
      ],
      "Resource": "*"
    },
    {
      "Sid": "ConnectCampaigns",
      "Effect": "Allow",
      "Action": [
        "connect-campaigns:CreateCampaign",
        "connect-campaigns:GetConnectInstanceConfig",
        "connect-campaigns:ListConnectInstanceIntegrations"
      ],
      "Resource": "*"
    },
    {
      "Sid": "S3Global",
      "Effect": "Allow",
      "Action": "s3:ListAllMyBuckets",
      "Resource": "*"
    },
    {
      "Sid": "S3",
      "Effect": "Allow",
      "Action": [
        "s3:CreateBucket",
        "s3:PutEncryptionConfiguration",
        "s3:PutBucketNotification",
        "s3:GetBucketLocation",
        "s3:GetBucketPolicy",
        "s3:ListBucket",
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Resource": [
        "arn:aws:s3:::pinpoint-migration-tool-*",
        "arn:aws:s3:::pinpoint-migration-tool-*/*"
      ]
    },
    {
      "Sid": "CloudFormation",
      "Effect": "Allow",
      "Action": [
        "cloudformation:CreateChangeSet",
        "cloudformation:DescribeChangeSet",
        "cloudformation:ExecuteChangeSet",
        "cloudformation:DeleteChangeSet",
        "cloudformation:DescribeStacks",
        "cloudformation:DeleteStack"
      ],
      "Resource": "arn:aws:cloudformation:*:*:stack/pinpoint-migration-tool/*"
    },
    {
      "Sid": "IAMForCloudFormation",
      "Effect": "Allow",
      "Action": [
        "iam:CreateRole",
        "iam:DeleteRole",
        "iam:GetRole",
        "iam:PutRolePolicy",
        "iam:DeleteRolePolicy",
        "iam:GetRolePolicy",
        "iam:AttachRolePolicy",
        "iam:DetachRolePolicy",
        "iam:PassRole"
      ],
      "Resource": [
        "arn:aws:iam::*:role/pinpoint-migration-tool-*"
      ]
    },
    {
      "Sid": "LambdaForCloudFormation",
      "Effect": "Allow",
      "Action": [
        "lambda:CreateFunction",
        "lambda:DeleteFunction",
        "lambda:GetFunction",
        "lambda:GetFunctionConfiguration",
        "lambda:UpdateFunctionCode",
        "lambda:UpdateFunctionConfiguration",
        "lambda:AddPermission",
        "lambda:RemovePermission"
      ],
      "Resource": "arn:aws:lambda:*:*:function:pinpoint-migration-tool-*"
    },
    {
      "Sid": "EventBridgeForCloudFormation",
      "Effect": "Allow",
      "Action": [
        "events:PutRule",
        "events:DeleteRule",
        "events:DescribeRule",
        "events:PutTargets",
        "events:RemoveTargets"
      ],
      "Resource": "arn:aws:events:*:*:rule/pinpoint-migration-tool-*"
    },
    {
      "Sid": "Kinesis",
      "Effect": "Allow",
      "Action": [
        "kinesis:CreateStream",
        "kinesis:DescribeStream"
      ],
      "Resource": "*"
    },
    {
      "Sid": "ServiceQuotas",
      "Effect": "Allow",
      "Action": [
        "servicequotas:GetServiceQuota",
        "servicequotas:GetAWSDefaultServiceQuota"
      ],
      "Resource": "*"
    },
    {
      "Sid": "CustomerProfiles",
      "Effect": "Allow",
      "Action": [
        "profile:GetDomain",
        "profile:PutProfileObjectType",
        "profile:DeleteProfileObjectType",
        "profile:PutIntegration",
        "profile:DeleteIntegration",
        "profile:CreateSegmentDefinition",
        "profile:DeleteSegmentDefinition"
      ],
      "Resource": "*"
    },
    {
      "Sid": "KMSForCustomerProfiles",
      "Effect": "Allow",
      "Action": [
        "kms:GenerateDataKey",
        "kms:Decrypt",
        "kms:DescribeKey",
        "kms:ListKeys",
        "kms:ListAliases",
        "kms:CreateGrant",
        "kms:ListGrants"
      ],
      "Resource": "*"
    },
    {
      "Sid": "AppFlowForCustomerProfiles",
      "Effect": "Allow",
      "Action": [
        "appflow:CreateFlow",
        "appflow:DeleteFlow",
        "appflow:DescribeFlow",
        "appflow:StartFlow",
        "appflow:StopFlow",
        "appflow:TagResource",
        "appflow:UntagResource"
      ],
      "Resource": "*"
    },
    {
      "Sid": "QConnect",
      "Effect": "Allow",
      "Action": [
        "wisdom:ListMessageTemplates",
        "wisdom:CreateMessageTemplate",
        "wisdom:UpdateMessageTemplate",
        "wisdom:CreateMessageTemplateVersion",
        "wisdom:ActivateMessageTemplate"
      ],
      "Resource": "*"
    },
    {
      "Sid": "DirectoryServiceForConnectInstance",
      "Effect": "Allow",
      "Action": [
        "ds:CreateAlias",
        "ds:CreateDirectory",
        "ds:CreateIdentityPoolDirectory",
        "ds:AuthorizeApplication",
        "ds:UnauthorizeApplication",
        "ds:CheckAlias",
        "ds:DescribeDirectories"
      ],
      "Resource": "*"
    },
    {
      "Sid": "ServiceLinkedRoleForConnect",
      "Effect": "Allow",
      "Action": "iam:CreateServiceLinkedRole",
      "Resource": "arn:aws:iam::*:role/aws-service-role/connect.amazonaws.com/*",
      "Condition": {
        "StringEquals": {
          "iam:AWSServiceName": "connect.amazonaws.com"
        }
      }
    }
  ]
}

```

!!! info ""
    Note: The `DirectoryServiceForConnectInstance` and `ServiceLinkedRoleForConnect` statements are only required if you use the express-setup command to create a new Amazon Connect instance. If you already have an existing Connect instance, you can remove those statements from the policy.

### Create the IAM role

Replace `<ACCOUNT_ID>`with your AWS account ID.

```bash
# Create the trust policy that allows your account to assume the role
cat > trust-policy.json << 'EOF'
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::<ACCOUNT_ID>:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

# Create the role
aws iam create-role \
  --role-name PinpointMigrationToolRole \
  --assume-role-policy-document file://trust-policy.json \
  --description "Role for the Pinpoint Migration Tool CLI"

# Attach the policy inline
aws iam put-role-policy \
  --role-name PinpointMigrationToolRole \
  --policy-name PinpointMigrationToolAccess \
  --policy-document file://pinpoint-migration-policy.json
```

### Configure your AWS CLI profile

Add the following to \~/.aws/config. Replace \<ACCOUNT\_ID> with your AWS account ID, default with the source profile that has permission to assume the role, and us-east-1 with your target region.

```ini
[profile pinpoint-migration]
role_arn = arn:aws:iam::<ACCOUNT_ID>:role/PinpointMigrationToolRole
source_profile = default
region = us-east-1
```

### Verify the role

```bash
aws sts get-caller-identity --profile pinpoint-migration
```

Expected output:

```json
{
  "UserId": "AROA...:botocore-session-...",
  "Account": "<ACCOUNT_ID>",
  "Arn": "arn:aws:sts::<ACCOUNT_ID>:assumed-role/PinpointMigrationToolRole/botocore-session-..."
}
```

### Use the profile with migration commands

Pass the profile to any command using the --profile flag:

```bash
node pinpoint-migration-tool.mjs preflight \
--region us-east-1 \
--profile pinpoint-migration \
--connect-instance-id <INSTANCE_ID> \
--pinpoint-application-id <APP_ID>
```

The AWS SDK automatically assumes the role when a profile is configured with role\_arn.
### Cleanup

After migration is complete, remove the role if it is no longer needed:

```bash
aws iam delete-role-policy \
--role-name PinpointMigrationToolRole \
--policy-name PinpointMigrationToolAccess

aws iam delete-role \
--role-name PinpointMigrationToolRole
```

***

#### Permissions by Command

| Command            | AWS Services Used                                             |
| ------------------ | --------------------------------------------------------------- |
| `preflight`        | STS, Pinpoint, Connect, Connect Campaigns, Service Quotas     |
| `express-setup`    | STS, Connect, S3, Kinesis, Directory Service, IAM             |
| `bootstrap`        | STS, CloudFormation, IAM, Lambda, EventBridge, S3             |
| `export-campaigns` | STS, Pinpoint, S3, CloudFormation                             |
| `export-endpoints` | STS, Pinpoint, S3, CloudFormation                             |
| `export-journeys`  | STS, Pinpoint, S3, CloudFormation                             |
| `export-segments`  | STS, Pinpoint, S3, CloudFormation                             |
| `export-templates` | STS, Pinpoint, S3, CloudFormation                             |
| `import-campaigns` | STS, S3, Connect Campaigns, CloudFormation                    |
| `import-endpoints` | STS, S3, Customer Profiles, Connect Campaigns, CloudFormation |
| `import-journeys`  | STS, S3, Connect, CloudFormation                              |
| `import-segments`  | STS, S3, Customer Profiles, Connect Campaigns, CloudFormation |
| `import-templates` | STS, S3, Connect, Q Connect, CloudFormation                   |
| `migrate`          | All of the above                                              |

***
