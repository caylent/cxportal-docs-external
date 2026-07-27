# Setting Up Prompts

## Before you Begin

Before you create or edit Prompts, make sure you have the following in place:

* **A Knowledge Base (for certain Prompt types)** — Pre-Processing Prompts can search the Knowledge Base, and Answer Generation Prompts turn Knowledge Base content into customer responses. Confirm the relevant Knowledge Base is set up before configuring Prompts that depend on it.
* **The details each Prompt requires** — Have the Prompt's name, description, type, API, and model ready before you start, so you can complete the configuration in one pass.
* **An understanding of Prompt types** — Decide whether you're building a Pre-Processing Prompt (to collect information, ask follow-up questions, detect intent, or search the Knowledge Base) or an Answer Generation Prompt (to generate customer-facing responses).
* **Familiarity with prompt engineering** — For guidance on writing effective Prompts, review the [Prompt engineering overview](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/overview).

***

## Limits and Constraints

Keep the following in mind when working with Prompts:

* **Version limit** — You can have up to 50 versions of a Prompt at one time.
* **Template dependency** — Creating a Prompt requires selecting a Prompt Template as a starting point, which then populates the Prompt Template box for editing.

***

## Step-by-Step Instructions

### Create a Prompt

1. In the left menu, expand **Q in Connect**.
2. Click **Prompts**.
3. Click **Create Prompt**.
4. Enter the Prompt Name and Description.
5. Choose the Prompt Type, API, and Model.
6. Choose a Prompt Template. The template automatically populates in the Prompt Template box.
7. Edit the Prompt to match the needed functionality.
8. Click **Save Prompt** to apply your changes.

***

### Edit a Prompt

1. In the left menu, expand **Q in Connect**.
2. Click **Prompts**.
3. On the Prompt list, click the **Pencil icon** in the Actions column.
4. Edit the text in the Prompt Template box as needed.
5. Click **Save Prompt** to apply your changes.
6. (Optional) Click **View Versions** to see all versions of the Prompt.
   1. Select two versions and click **Compare** to see inline differences. Lines highlighted in red are removed, and lines highlighted in green are added or modified. **Note:** You can have up to 50 versions of a Prompt at one time.

***

### Delete a Prompt

1. In the left menu, expand **Q in Connect**.
2. Click **Prompts**.
3. On the Prompt list, click the **Trash icon** in the Actions column.
4. Click **Delete Prompt**.
