# express-setup

Creates an Amazon Connect instance with required infrastructure. Use this command if you do not have an existing Amazon Connect instance configured for outbound campaigns.

## Command syntax

```bash
node ./pinpoint-migration-tool.mjs express-setup -r <region> -p <profile>
```

### Required options

| **Option**      | **Description**    |
| --------------- | ------------------ |
| `-r, --region`  | AWS region         |
| `-p, --profile` | AWS profile to use |

### Interactive prompts

* Instance alias — A name for the Connect instance (1–62 characters, alphanumeric and hyphens, must start with a letter).
* Identity management type: Connect Managed (default) or SAML 2.0.
* S3 bucket name — Confirm the default (--) or enter a custom name.

### Resources created

* S3 bucket (for call recordings, chat transcripts, and reports)
* Kinesis Data Stream for Contact Trace Records (CTR)
* Kinesis Data Stream for Agent Events
* Amazon Connect instance with inbound and outbound calls enabled

!!! info ""
    Note: If SAML is selected, the tool displays a link to the SAML configuration guide after setup. All storage configurations are automatically associated with the instance.


### Errors

<details>

<summary><code>InstanceResponseMissingError</code></summary>

**Cause:** The CreateInstance API response is missing the instance ID or ARN.

**Resolution:** Verify Connect is available in your region and retry.

</details>

<details>

<summary><code>InstanceStatusFailedError</code></summary>

**Cause:** The instance entered CREATION\_FAILED status.

**Resolution:** Check the error message for the cause (often a service limit or naming conflict) and retry.

</details>

<details>

<summary><code>InstanceActiveTimeoutError</code></summary>

**Cause:** The instance did not reach ACTIVE status within the polling window.

**Resolution:** Check the Connect console. The instance may still be provisioning. Retry if needed.

</details>

<details>

<summary><code>KinesisStreamTimeoutError</code></summary>

**Cause:** A Kinesis stream did not become ACTIVE in time.

**Resolution:** Check the Kinesis console for stream status and retry.

</details>

<details>

<summary><code>BucketAlreadyExistsError</code></summary>

**Cause:** The S3 bucket name is in use in another AWS account.

**Resolution:** Choose a different bucket name when prompted.

</details>

***
