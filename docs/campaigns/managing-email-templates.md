# Managing Email Templates

## Before You Begin

- You must have admin or campaign management permissions.
- At least one campaign group must exist.

## Overview

The Email Templates page lets you manage reusable, versioned email templates used in campaigns. Navigate to **Campaigns > Email Templates** to access this page.

The page displays a table of all email templates with the following columns:

- **Template Name** (sortable) — The name of the template
- **Group** — The campaign group the template is scoped to
- **Version** — The current published version (e.g., v2)
- **Status** (sortable) — The template status (e.g., Published)
- **Last Edit** (sortable) — The date the template was last modified

You can search templates using the search bar (by template name) and use the **Show Filters** button for additional filtering.

## Step-by-Step Instructions

### Creating a New Email Template

1. Navigate to **Campaigns > Email Templates**.
2. Click **Add New Template**.
3. In the template editor, configure the following required fields:
   - **Campaign Group** — Select the campaign group this template belongs to
   - **Template Name** — Enter a descriptive name for the template
   - **Subject** — Enter the email subject line (e.g., "Welcome to our service")
4. Use the **HTML SOURCE** tab to write or paste the HTML email content. The editor supports Connect-style variable placeholders for dynamic personalization. The page header states: "Reusable email templates scoped to a campaign group — each template supports versioning and Connect-style variable placeholders."
5. Switch to the **PREVIEW** tab to see how the email will render for recipients.
6. Click **View Variables** to see the available template variables you can use in your HTML source. Additionally, you can use custom variables by prefixing your variable name with `Attributes.Customer.Attributes.{var_name}`. For example, if you want to have a variable named "MiddleInitial", enter `{{Attributes.Customer.Attributes.MiddleInitial}}`
7. Save your work using one of the following options:
   - **Save Draft** — Saves your changes without publishing. The draft is the only mutable version of a template: you can return to it later, continue editing, or have someone else review it before it goes live. A draft cannot be selected for use in a campaign. **Note:** If you have malformed HTML in your template or don't have default values for variables, you will see a warning message before saving. Variable values will fall back to default values if a recipient's profile doesn't have a value for that variable assigned to them. Default values are scoped to versions of templates.
   - **Publish New Version** — Makes the template available for use in campaigns. Once a version is published, its content cannot be changed. To update a published template, you must create and publish a new version.
8. Use the **Copy to clipboard** button to copy the HTML source. **Note:** There is a system variable named `unsubscribeUrl` included in the boilerplate HTML provided. This is required in email template HTML to maintain consistency and compliance. It's recommended to include the URL in a button, and creating a campaign automatically tracks who clicks the link.

> **Note:** When using a template in a campaign, you can only select a published version — drafts are never available for selection.

## Template Versioning

Email templates support versioning. Each time you publish changes, a new version is created. The version history allows you to track changes over time. Templates have two states:

- **Draft** — The template is being edited and is not yet available for use in campaigns.
- **Published** — The template is live and can be selected when creating campaigns.
