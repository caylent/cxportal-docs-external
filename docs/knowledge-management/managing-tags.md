# Managing Tags

## Before you Begin

**Tags** set filters on your articles. Tags allow the AI agent in Connect Agents to easily find the correct information when searching for a question in an article. Tags should be detailed to help retrieve relevant information for different questions.

### Tag Keys and Values <a href="#tag-keys-and-values" id="tag-keys-and-values"></a>

Tag keys and tag values are components of a metadata labeling system used to organize, track, and control content in a knowledge base. A tag is the category or attribute name. It defines what aspect of the resource you're describing. The tag value is the specific information or label assigned to that key. It defines the specific instance of that category.

**Examples:**

* Key: Environment, Value: Production
* Key: Owner, Value: Engineering
* Key: Audience, Value: Internal

***

## Limitations and Constraints <a href="#tag-restrictions" id="tag-restrictions"></a>

See the following restrictions for tags assigned to a resource:

* Maximum number of tags that you can assign to a resource is 50
* Maximum tag key length is 128 Unicode characters
* Maximum tag value length is 256 Unicode characters
* Valid characters for tag key and value include a-z, A-Z, 0-9, space, and the following characters: \_ . : / = + - and @
* Tag keys and values are case sensitive.
* Don't use aws: as a prefix for tag keys. It is reserved for AWS use.

***

## Step-by-Step Instructions

### Add Tags <a href="#add-tags" id="add-tags"></a>

Use the following steps to add tags to an individual article or bulk add tags to multiple articles at once:

1. Open **CxPortal**.
2. On the left menu, expand **Knowledge Management** and then click **Articles**.
3. The articles list page shows all your articles and their associated Knowledge Base. Select the checkbox next to the article(s) you want to add tags to.
4. In the Bulk Actions pop up, click **Add Tags**.
5. Choose an existing tag or add a new tag.
   1. To add an existing tag, select the checkbox of the tag(s) and click **Apply**.
   2. To add a new tag, click **Add New** and enter the **Tag Name** and **Value**.
      1.  Click **Add Tag**.
      2. Choose the new tag from the dropdown and click **Apply**.

***

### Remove Tags <a href="#delete-tags" id="delete-tags"></a>

Use the following steps to remove tags on an individual article or bulk remove tags on multiple articles at once:

1. Open **CxPortal**.
2. On the left menu, expand **Knowledge Management** and then click **Articles**.
3. The articles list page shows all your articles and their associated Knowledge Base. Select the checkbox next to the article(s) you want to remove tags from.
4. In the Bulk Actions pop up, click **Remove Tags**.
5. Choose the tag(s) you want to remove.
6.  Click **Apply**.
