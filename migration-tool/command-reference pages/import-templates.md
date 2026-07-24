# import-templates

Imports exported templates into Amazon Connect. Email, SMS, and PUSH templates are created as Amazon Q in Connect message templates. Voice templates are recreated as Outbound Whisper Contact Flows with a single Play Prompt block.

## Prerequisites

* `bootstrap`
* `export-templates`
* `import-endpoints` (required for attribute remapping)

***

### Command syntax

```bash
node ./pinpoint-migration-tool.mjs import-templates -r <region> -i <instance-id> [-p <profile>] [-b <bucket>] [-t <types>
```

![](../../assets/images/q2QxiobHVBT2qX817LOs.png)

### Options

| **Option**          | **Required** | **Description**                                                                                                   |
| ------------------- | ------------ | ----------------------------------------------------------------------------------------------------------------- |
| `-r, --region`      | Yes          | AWS region                                                                                                        |
| `-i, --instance-id` | Yes          | Amazon Connect instance ID                                                                                        |
| `-p, --profile`     | No           | AWS credentials profile (uses default profile if omitted)                                                         |
| `-b, --bucket`      | No           | S3 bucket name. Defaults to the bootstrap bucket.                                                                 |
| `--t, -- types`     | No           | Comma-separated list of template types to import: email, sms, voice, push. Defaults to email,sms,push if omitted. |

!!! info ""
    Note: Voice templates are not included in the default import. To import voice templates, specify -t email,sms,voice,push or -t voice explicitly.


***

### What this command does

Lists exported templates available in S3 and selects the latest version of each template.
(Email, SMS, PUSH only) Resolves the Q Connect knowledge base from the Connect instance.
(Email, SMS, PUSH only) Loads existing Q Connect templates to determine whether each template will be created or updated.
(Voice only) Loads existing Outbound Whisper Contact Flows to determine creates vs. updates.
For each template: reads from S3, remaps Pinpoint attribute variables to Customer Profiles paths, then creates or updates the target resource.
Records email, SMS, and PUSH template mappings in the migration state for use by campaign and journey imports.
***

### Voice template behavior

Voice templates are not supported by Amazon Q in Connect. Each VOICE template is imported as an Outbound Whisper Contact Flow with the following behavior:

* The Contact Flow is named `message-template-` to avoid collisions with other flows.
* The `Body` field of the template becomes the text played via Amazon Polly text-to-speech.
* If the template specifies a `VoiceId` (for example, `Joanna`), an `UpdateContactTextToSpeechVoice` block is prepended to set the voice before the Play Prompt.
* Voice Contact Flows are not recorded in the migration state. They are standalone resources and cannot be referenced by campaign or journey imports.

***

### Push template behavior

PUSH templates are imported as Q Connect PUSH message templates. Platform sub-templates are mapped as follows:

| **Pinpoint platform** | **Q Connect platform**                |
| --------------------- | ------------------------------------- |
| `ADM`                 | `adm`                                 |
| `APNS`                | `apns`                                |
| `Baidu`               | `baidu`                               |
| `GCM`                 | `fcm`                                 |
| `Default`             | (fallback for unconfigured platforms) |

The following fields are mapped per platform:

| **Pinpoint field**  | **Q Connect field**  | **Notes**                                   |
| ------------------- | -------------------- | ------------------------------------------- |
| `Body`              | `body.content`       |                                             |
| `Title`             | `title`              |                                             |
| `Action`            | `action`             | Enum values: `DEEP_LINK`, `OPEN_APP`, `URL` |
| `Sound`             | `sound`              |                                             |
| `Url`               | `url`                |                                             |
| `ImageUrl`          | `imageUrl`           | ADM, Baidu, GCM/FCM only                    |
| `ImageIconUrl`      | `imageIconUrl`       | ADM, Baidu, GCM/FCM only                    |
| `SmallImageIconUrl` | `smallImageIconUrl`  | ADM, Baidu, GCM/FCM only                    |
| `MediaUrl`          | `mediaUrl`           | APNS only                                   |
| `RawContent`        | `rawContent.content` |                                             |

!!! info ""
    Default fallback: If a platform is not explicitly configured in the Pinpoint template but a Default sub-template exists, the Default values are applied to that platform in Q Connect. Platform-specific fields (for example, ImageUrl for Android platforms or MediaUrl for APNS) are not available from the Default sub-template and will not be set.


***

### Attribute remapping

Pinpoint template variables (for example, `{{Attributes.FavoriteTeam}}`) are remapped to Customer Profiles attribute paths using the endpoint attribute mapping built during `import-endpoints`.

Fields remapped per template type:

| **Template type** | **Fields remapped**                             |
| ----------------- | ----------------------------------------------- |
| EMAIL             | Subject, HtmlPart, TextPart                     |
| SMS               | BODY                                            |
| VOICE             | BODY                                            |
| PUSH              | Body, Title (across all platform sub-templates) |

If import-endpoints has not been run, attribute remapping is skipped and variables are left unchanged. Variables that cannot be matched to any endpoint attribute are left as-is and reported as warnings.

Multi-valued attributes are expanded into indexed variables. For example, an attribute `Interests` with three values becomes `{{Attributes.Interests_0}}` `{{Attributes.Interests_1}} {{Attributes.Interests_2}}` in the template.

***

### Versioning

Changes are applied to the `$LATEST` draft.
A numbered version is created from `$LATEST`.
The numbered version is activated.
Email, SMS, and PUSH templates use the above versioning sequence on each import. Re-running `import-templates` updates `$LATEST`, creates a new numbered version, and activates it. Existing versions are not modified.

Voice Contact Flows do not use this versioning model. Each re-import updates the Contact Flow content in place.

***

### Errors

| **Error**                            | **Cause**                                                                                      | **Resolution**                                                                                                     |
| ------------------------------------ | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `KnowledgeBaseNotFoundError`         | No Q\_MESSAGE\_TEMPLATES integration is configured on the Connect instance.                    | Set up the Amazon Q in Connect message templates integration for the Connect instance before running this command. |
| `UnsupportedImportTemplateTypeError` | A specified template type is not EMAIL, SMS, VOICE, or PUSH.                                   | Remove unsupported types from the `-t` flag.                                                                       |
| `TemplateConcurrentCreationError`    | Another process created the same Q Connect template between cache load and the create attempt. | Retry the import. The existing template will be detected and updated.                                              |
| `ImportTemplatesError`               | The generated Contact Flow content was rejected by Connect (voice templates only).             | Review the voice template Body for characters or markup that Connect cannot parse.                                 |

***

### Limitations

* Conditional helpers `({{#if}}`, `{{#unless}}`, and similar) in Pinpoint templates are not remapped. Only simple `{{Path.Field}}` variables are processed.
* Multi-valued attributes are expanded into space-separated indexed variables and are not preserved as lists.
* Voice Contact Flows are not tracked in the migration state and cannot be referenced by campaign or journey imports.
* Push Default fallback does not carry platform-specific fields (for example, `ImageUrl` or `MediaUrl`) when applied to platforms that were not explicitly configured.

***
