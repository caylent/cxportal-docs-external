# Best Practices and Troubleshooting

## Best Practices

Use the following best practices to optimize using Knowledge Management

* It’s recommended to use markdown as the file format for your articles. For more information, see [Articles](adding-articles.md).
* Add tags on your articles or Knowledge Bases to set filters for better search results. For more information, see [Tags](bookmark://_Tags).

***

## Troubleshooting

This section provides guidance for common issues you may encounter when working with Knowledge Management. If the steps below do not resolve your issue, [contact Pronetx support](../submitting-a-support-request.md)

<details>

<summary><strong>Article upload issues</strong></summary>

An upload may fail if the file exceeds the 1 MB size limit, uses an unsupported format, or if the Knowledge Base has reached its 5 GB capacity.

* Verify the file is under 1 MB.
* Confirm the file format is one of the supported types: .txt, .html, .docx, or .pdf. Note that .md and .doc file types are not supported.
* Check that the Knowledge Base has not reached its 5 GB maximum size.
* If uploading multiple files, ensure each individual file meets the size and format requirements.

</details>

<details>

<summary><strong>Knowledge Base creation issues</strong></summary>

Each organization is limited to 10 Knowledge Bases. If you have reached this limit, you cannot create additional ones.

* Review your existing Knowledge Bases and determine whether any can be consolidated or removed.
* Delete unused Knowledge Bases to free up a slot before creating a new one.

</details>

<details>

<summary><strong>Knowledge Base addition issues</strong></summary>

Each Knowledge Base supports a maximum of 5,000 articles.

* Review the Knowledge Base for outdated or duplicate articles that can be removed.
* Consider distributing articles across multiple Knowledge Bases if you are approaching the limit.

</details>

<details>

<summary><strong>Syncing issues</strong></summary>

Both the “Sync Knowledge Bases” and “Sync Articles” operations import content from Connect Agents. Issues may arise if the source content in Connect Agents has changed or if there is a connectivity issue.

* Review the confirmation warning that appears before syncing. The sync may overwrite existing content in CxPortal.
* Ensure you are selecting the correct sync operation for your intended scope. Use “Sync Knowledge Bases” to sync all Knowledge Bases, or “Sync Articles” to sync articles for a specific Knowledge Base.
* If the issue persists, [contact Pronetx support](../submitting-a-support-request.md).

</details>

<details>

<summary><strong>Tagging issues</strong> </summary>

If tags are not saving or displaying correctly, check the tag formatting. Tags have specific formatting and character restrictions that must be followed.

* Ensure tag keys do not exceed 128 Unicode characters and tag values do not exceed 256 Unicode characters.
* Use only valid characters: a-z, A-Z, 0-9, space, and the following: \_ . : / = + - and @
* Remember that tag keys and values are case sensitive. “Audience” and “audience” are treated as different tags.
* Do not use “aws:” as a prefix for tag keys — this prefix is reserved for AWS use.
* Confirm you have not exceeded the maximum of 50 tags per resource.

</details>

***

### Quick Reference: System Limits

<table><thead><tr><th width="363">Resource</th><th>Limit</th></tr></thead><tbody><tr><td>Knowledge Bases per organization</td><td>10</td></tr><tr><td>Maximum size per Knowledge Base</td><td>5 GB</td></tr><tr><td>Articles per Knowledge Base</td><td>5,000</td></tr><tr><td>Maximum file size per article</td><td>1 MB</td></tr><tr><td>Supported article formats</td><td>.txt, .html, .docx, .pdf</td></tr><tr><td>Unsupported article formats</td><td>.md, .doc</td></tr><tr><td>Tags per resource </td><td>50</td></tr><tr><td>Tag key maximum length </td><td>128 Unicode characters</td></tr><tr><td>Tag value maximum length </td><td>256 Unicode characters</td></tr><tr><td>Valid tag characters </td><td>a-z, A-Z, 0-9, space, _ . : / = + - @</td></tr></tbody></table>
