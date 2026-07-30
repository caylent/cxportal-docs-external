# Requirements

Before running the migration tool, verify that your AWS environment meets all requirements in this page.

<details open>

<summary><mark style="color:$primary;"><strong>AWS Account</strong></mark></summary>

* Migration operates within a single AWS account. Cross-account migration is not supported.
* The Pinpoint application and Amazon Connect instance must be in the same AWS account and region.
* The region must be supported by Amazon Connect. See [Amazon Connect supported regions](https://docs.aws.amazon.com/connect/latest/adminguide/regions.html).
* For voice campaigns, outbound calling is restricted by the region of the Amazon Connect instance. Not all phone number destinations are reachable from all regions. Verify regional calling coverage before migration. For details, see the [Amazon Connect Telecoms Country Coverage Guide](https://docs.aws.amazon.com/connect/latest/adminguide/phone-number-requirements.html).

</details>

<details open>

<summary><mark style="color:$primary;"><strong>Amazon Connect</strong></mark></summary>

* An Amazon Connect instance must be available, or use the `express-setup` command to create one.
* [Outbound campaigns](https://docs.aws.amazon.com/connect/latest/adminguide/enable-outbound-campaigns-customer-profiles.html) must be enabled on the Connect instance. When outbound campaigns are enabled on a new instance, a Customer Profiles domain and a Q Connect knowledge base with type MESSAGE\_TEMPLATES are created automatically. If these resources already exist, the tool uses them.
* The Connect instance must have a [Q\_MESSAGE\_TEMPLATES knowledge base integration](https://docs.aws.amazon.com/connect/latest/adminguide/enable-outbound-campaigns-customer-profiles.html) configured before running template import.
* Channels must be configured: phone numbers assigned and email aliases set up.
* Data streaming (Kinesis) must be enabled and configured.
* [Amazon Connect service quotas](https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html) must meet or exceed the corresponding Pinpoint quotas.

!!! warning ""
    Mass notification pre-authorization

    If you plan to use migrated campaigns for event-driven mass notifications (for example, emergency alerts or utility disruptions affecting large customer volumes), you must obtain pre-authorization from AWS before running those campaigns.

    [Submit an AWS Support ticket](https://console.aws.amazon.com/support/home) with a description of your use case before proceeding.


</details>

<details open>

<summary><mark style="color:$primary;"><strong>Amazon Pinpoint</strong></mark></summary>

* The Pinpoint application must be accessible via the IAM role or profile used.
* Journeys to be migrated must be within the supported activity limit (up to 10 activities).

</details>

<details open>

<summary><mark style="color:$primary;"><strong>IAM permissions</strong></mark></summary>

* The IAM role or profile used to execute the tool requires specific permissions for each command. The tool validates all permissions during the preflight check and emits a missing-permissions report if any are absent.
* A minimum-privilege IAM policy and a setup guide are included in the next page.

</details>

***
