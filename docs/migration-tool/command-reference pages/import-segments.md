# import-segments

Imports exported segment definitions into Amazon Connect Customer Profiles. Both `DIMENSIONAL` and `IMPORT`-type segments are imported. Attribute filter names are aligned to Customer Profiles attributes using the mapping established during endpoint import.

## Prerequisites

* `bootstrap`
* `export-segments`
* `import-endpoints`

***

### Command syntax

```bash title="Command"
node ./pinpoint-migration-tool.mjs import-segments -r <region> -p <profile> -i <instance-id> -a <application-id>
```

![](../../assets/images/AFfI4b5kFLxxyaBQ2mqM.png)

| **Option**             | **Required** | **Description**            |
| ---------------------- | ------------ | -------------------------- |
| `-r, --region`         | Yes          | AWS region                 |
| `-p, --profile`        | Yes          | AWS credentials profile    |
| `-i, --instance-id`    | Yes          | Amazon Connect instance ID |
| `-a, --application-id` | Yes          | Pinpoint Application ID    |

***

### What this command does

Resolves the Customer Profiles domain from the Connect instance.
Reads exported segments from S3.
Resolves segment dependencies and topologically sorts `DIMENSIONAL` segments.
Creates each segment definition in Customer Profiles — `IMPORT`-type segments first (as stubs), then `DIMENSIONAL` segments.
Records segment mappings in the migration state for use by `import-campaigns`.
***

### What gets imported

Both segment types are imported:

* `DIMENSIONAL` segments — attribute-based filters are converted directly to Customer Profiles segment definitions.
* `IMPORT`-type segments — created as placeholder stubs filtered on `Attributes.ImportedCampaignID = CHANGE_THIS`. After migration, you must upload the original customer list using the Import from CSV feature in Amazon Connect. See the [Amazon Connect imported segments guide](https://docs.aws.amazon.com/connect/latest/adminguide/customer-segments-imported-files.html).

!!! info ""
    **Note:** `IMPORT` stubs are created before `DIMENSIONAL` segments so that any `DIMENSIONAL` segment referencing an `IMPORT` source can resolve correctly.


***

<details open>

<summary><mark style="color:$primary;"><strong>Segment name sanitization</strong></mark></summary>

Customer Profiles requires segment names to match `^[a-zA-Z0-9_-]+$` with a maximum length of 64 characters. Names are sanitized automatically:

* Whitespace is replaced with hyphens.
* Invalid characters are stripped.
* Names are truncated to 64 characters.
* Naming collisions receive a numeric suffix (for example, `-2`).

A `NAME_SANITIZED` warning is emitted when a name is modified.

</details>

<details open>

<summary><mark style="color:$primary;"><strong>Dependency ordering</strong></mark></summary>

Segments that reference other segments via `SourceSegments` are created after their dependencies using topological sort. If a circular dependency is detected, the original export order is used as a fallback.

</details>

<details open>

<summary><mark style="color:$primary;"><strong>Idempotency</strong></mark></summary>

Re-running the import deletes and recreates existing segment definitions with the same name. The migration state is updated accordingly.

</details>

***

### Attribute name mapping

Segment filters reference Pinpoint attribute paths. These are converted to Customer Profiles attribute names that match the naming conventions established during `import-endpoints`.

| Pinpoint Filter Path        | Customer Profiles Attribute         | Notes                                 |
| --------------------------- | ----------------------------------- | ------------------------------------- |
| `Attributes.X`              | `Attributes.X_0`                    | Only the first array index is checked |
| `UserAttributes.FirstName`  | `ProfileAttributes.FirstName`       | Standard profile field                |
| `UserAttributes.LastName`   | `ProfileAttributes.LastName`        | Standard profile field                |
| `UserAttributes.Gender`     | `ProfileAttributes.GenderString`    | Standard profile field                |
| `UserAttributes.X` (custom) | `Attributes.User_X_0`               | Only the first array index is checked |
| `Location.Country`          | `ProfileAttributes.Address.Country` | Address dimension                     |
| `Demographic.Platform`      | `Attributes.Platform`               | Custom attribute                      |
| `Metrics.X`                 | `Attributes.Metric_X`               | Numeric values are stringified        |

***

### Warnings

| Warning                  | Trigger                                                                                  |
| ------------------------ | ---------------------------------------------------------------------------------------- |
| `IMPORT_PLACEHOLDER`     | Segment is `IMPORT`-type — a stub is created; manual CSV upload required after migration |
| `MULTI_VALUE_ARRAY`      | Array attributes use `_0` indexing — only the first value is checked                     |
| `UNSUPPORTED_FIELD`      | `Behavior`, `Demographic.Channel`, `Demographic.DeviceType`, or `Location.GPSPoint` used |
| `SOURCE_SEGMENT_MISSING` | A source segment ID could not be resolved and was omitted                                |
| `NAME_SANITIZED`         | Segment name was modified during sanitization                                            |
| Circular reference       | Dependency cycle detected; original export order used as fallback                        |

***

### Errors

| **Condition**                    | **Cause**                                                           | **Resolution**                                                                                        |
| -------------------------------- | ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `NAME_SANITIZED` warning         | Segment name contained characters not allowed by Customer Profiles. | The name was modified automatically. Verify the sanitized name in the migration report.               |
| `SOURCE_SEGMENT_MISSING` warning | A referenced source segment could not be resolved.                  | The source segment reference is omitted. Verify segment dependencies in Pinpoint before re-exporting. |

***

### Limitations

* `IMPORT` segment stubs: the `ImportedCampaignID = CHANGE_THIS` filter is a placeholder only. You must upload the original customer list via [Import from CSV](https://docs.aws.amazon.com/connect/latest/adminguide/customer-segments-imported-files.html) in Amazon Connect after migration.
* <mark style="color:$primary;">**Multi-value arrays:**</mark> only the first index (`_0`) is checked. Endpoints with a matching value at a later index are not matched by the segment.
* <mark style="color:$primary;">**Behavior dimensions:**</mark> recency-based segment filters have no Customer Profiles equivalent and are not migrated.
* `Demographic.Channel:` stored as a semicolon-separated string; set-based filtering does not apply.
* `Demographic.DeviceType:` not imported by the endpoint pipeline.
* `Location.GPSPoint:` Customer Profiles equivalent for geofencing.

***
