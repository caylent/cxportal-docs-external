# Adding Articles

## Before you Begin

**Articles** are the specific content pieces inside of your Knowledge Base. AI Agents in your contact flows use the information in your articles to answer questions and solve customer issues.

For optimal results, use Markdown written in .txt files for your articles. Markdown is designed to be simple and readable, allowing a Large Language Model (LLM) to easily parse and understand the content. Other content types can contain multiple or complex formats and lead to inaccurate interpretations by the model. In addition to using Markdown, remove all images from your content.

On the articles page you can see all of the articles within your Knowledge Base and the following details:

* **Article Title**: This column displays the title of the article.
* **Knowledge Base**: This column displays the Knowledge Base where the article resides.
* **Association**: This column displays the association of the content with Connect Contact Flows.
* **Last Updated**: This column displays the date the article was last changed.
* **Modified By**: This column displays the user who last updated the article.
* **Tags**: This column displays the tags on the article.
* **Summary:** This column displays the AI summary of the article contents.

***

## Limits and Constraints

* Supported file formats include .txt, .html, .docx, and .pdf. The file size limit is 1 MB per article.
* .md and .doc file types aren’t supported.
* You can have up to 5,000 articles per Knowledge Base.

***

## Step-by-Step Instructions

### Add an Article

Use the following steps to add a single article to a Knowledge Base:

1. Open **CxPortal**.
2. On the left menu, expand **Knowledge Management** and then click **Articles**.
3. In the upper right corner of the screen, click **Actions**.
4. Click **Add New Article.**
5. Select a Knowledge Base to add the article to and click **Continue**.
6. Enter the article name.
7. Enter content into the content box or click **Upload File** to browse and upload a file from your computer.
   1. You can type and edit directly into the content box. As you input content, you can see the markdown text on the left and a preview of the edited text on the right. The content is saved as a .txt file. Additionally, you can select a template and manually fill in the content sections.
   2. You can upload .txt, .html, .docx, and .pdf files directly from your computer. If you upload a .html file, you can edit the code in the content box.
8. Once you add your content, click **Create Document**.

***

### Upload Multiple Articles  <a href="#edit-articles" id="edit-articles"></a>

Use the following steps to add multiple articles to a Knowledge Base:

1. Open **CxPortal**.
2. On the left menu, expand **Knowledge Management** and then click **Articles**.
3. In the upper right corner of the screen, click **Actions**.
4. Click **Upload Multiple Files**.
5. Select a Knowledge Base destination from the dropdown.
6. Drag and drop files into the box or browse files on your computer.
7. Click **Upload Files**.

***

### Edit Articles <a href="#edit-articles" id="edit-articles"></a>

1. Open **CxPortal**.
2. On the left menu, expand **Knowledge Management** and then click **Articles**.
3. The articles list page shows all your articles and their associated Knowledge Base. Select the checkbox next to the article you want to edit
4. Click the **ellipsis** on the right side and then **Edit Article**.
5. Edit the article details, contact flow association, and tags. **Note:** Tags have restrictions. See [Tag Restrictions](bookmark://_Tag_Restrictions) for more information.
   1. If the article is a .txt file, edit the content directly in the content box and click **Save Changes**.
   2. If the article is another file type, upload a new version, and click **Save Changes**.

***

### Sync Articles <a href="#sync-articles" id="sync-articles"></a>

You can sync articles directly from Connect Agents to your Knowledge Bases.

1. Open **CxPortal**.
2. On the left menu, expand **Knowledge Management** and then click **Articles**.
3. In the upper right corner of the screen, click **Actions**.
4. Click **Sync Articles**.
5. Select a Knowledge Base to sync articles and then click **Continue**.
6. A pop-up appears with a confirmation message to sync your articles from Connect Agents. Review the warning and click **Continue & Sync**.

***

### Compare Versions   <a href="#compare-versions" id="compare-versions"></a>

1. Open **CxPortal**.
2. On the left menu, expand **Knowledge Management** and then click **Articles**.
3. The articles list page shows all your articles and their associated Knowledge Base. Select the article title of the content you want to view.
4. On the right side of the screen, select the versions you want to compare.
5. Click **Compare Versions**.
6. Review the side-by-side comparison.


Note: Tracked changes are only visible in **.txt files**, where additions and deletions are highlighted in red and green. For all other file types, tracked changes are not displayed — both versions are shown side by side for manual comparison.


***

### Generate AI Summary

Articles that are new or updated will automatically generate an AI summary. To view the AI summary for existing articles, follow the steps below to regenerate the summary.

1. Open CxPortal.
2. On the left menu, expand **Knowledge Management** and then click **Articles**.
3. On the articles list page, the Summary column shows the AI generated summary for each article.
4. To regenerate the AI summary, select an **article title** and then click **Regenerate Summary** on the article details page.

***

### Delete Articles

You can delete individual articles or multiple articles at once. To delete articles:

1.  Open **CxPortal**.
2. On the left menu, expand **Knowledge Management** and then click **Articles**.
3. The articles list page shows all your articles and their associated Knowledge Base. Select the checkbox next to the article(s) you want to delete.
4. In the Bulk Actions pop up, click **Delete**.
