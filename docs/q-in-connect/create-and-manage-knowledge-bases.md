# Create and Manage Knowledge Bases

## **Before You Begin**

Before you create or edit a Knowledge Base, make sure you have the following in place:

* **Properly formatted content** — Prepare your content in Markdown or .txt format for the most accurate results. Remove all images and organize content into folders within the Knowledge Base.
* **Connection details** — Have the Source URI and Knowledge Management System Key ready before you start, so you can complete the configuration in one pass.
* **Naming convention** — Give each Knowledge Base a clear name and description so it's easy to identify when associating it with Prompts and AI Agents.

***

## **Limits and Constraints**

Keep the following in mind when working with Knowledge Bases:

* **Content format affects accuracy** — Unsupported content (formats with complex or mixed structure, or embedded images) can lead to inaccurate interpretation by the model. Markdown and .txt are recommended.
* **Association ID is system-generated** — Each Knowledge Base has an association ID shown on the Knowledge Bases page, used to link it to Q in Connect.
* **Name and description length** — Each must be 255 characters or fewer and must start with a letter, number, space, or one of `_ . , -`. The description is optional.
* **Source URI must be an S3 URI** — Enter the source as `s3://my-bucket`, optionally followed by a path. An S3 ARN is rejected with "Must be an S3 URI, such as s3://my-bucket".
* **Customer managed KMS key** — The KMS key must be a customer managed key in the same region as the bucket. AWS managed keys are not supported.

***

## Step-by-Step Instructions

### Create Knowledge Base

1. In the left menu, expand **Q in Connect**.
2. Click **Knowledge Bases**.
3. Click **Create Knowledge Base**.
4. Complete the form:
   * **Name** (required) — 255 characters or fewer, starting with a letter, number, space, or one of `_ . , -`.
   * **Description** (optional) — Same length and starting-character rules as the name.
   * **Source URI** (required) — The S3 bucket holding the knowledge base content, as an S3 URI, for example `s3://my-bucket`.
   * **KMS Key** (required) — A customer managed KMS key in the same region as the bucket, for example `arn:aws:kms:region:account-id:key/key-id`.
5. Click **Create**.

**Note**: Values that break the rules above are flagged under the field and **Create** does nothing until they are fixed. If the service itself rejects the knowledge base, the error notification shows the reason it returned rather than a generic failure message.

***

### Edit Knowledge Base

1. In the left menu, expand **Q in Connect**.
2. Click **Knowledge Bases**.
3. On the Knowledge Bases list, click the **Pencil icon** in the Actions column.
4. Edit the information for the Knowledge Base.
5. Click **Save Knowledge Base** to apply your changes.
