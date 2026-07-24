# Configure AI Agents

## **Before You Begin**

Before you create or edit an AI Agent, make sure you have the following in place:

* **The Prompts your Agent will use** — An AI Agent is built from Prompts, so create and finalize the Pre-Processing Prompt and Answer Generation Prompt you plan to use before building the Agent. Note the specific versions you want to reference.
* **A Knowledge Base** — Each AI Agent is configured with a Knowledge Base. Confirm the relevant Knowledge Base is set up before you create the Agent.
* **A naming convention** — Give each AI Agent a distinct name so it's easy to identify and reference the correct Agent within your contact flows.
* **Access to your contact flows** — AI Agents are referenced in contact flows. Confirm you can reach the flows where the Agent will be invoked.

***

## **Limits and Constraints**

Keep the following in mind when working with AI Agents:

* **Agents depend on Prompts and a Knowledge Base** — An AI Agent requires a Pre-Processing Prompt, an Answer Generation Prompt, and a Knowledge Base. Changes to those underlying components can affect Agent behavior.
* **Version selection is explicit** — When configuring an Agent, you select a specific version of each Prompt. Updating a Prompt does not necessarily update the Agent unless you point the Agent to the new version.
* **Testing is version-specific** — When you test an Agent, you test one version at a time using the Version dropdown.

***

## Step-by-Step Instructions

### Create AI Agent

1. In the left menu, expand **Q in Connect**.
2. Click **AI Agent**.
3. Click **Create Agent**.
4. Enter the Agent Name and Description.
5. Choose the Pre-Processing Prompt and Version.
6. Choose the Answer Generation Prompt and Version.
   1. (Optional) Click the **Play button** to view or edit the Prompt text for the selected version.
7. Choose a Knowledge Base.
8. Click **Save Agent** to apply your changes.

***

### Edit AI Agent

1. In the left menu, expand **Q in Connect**.
2. Click **AI Agent**.
3. On the Agents list, click the **Pencil icon** in the Actions column.
4. Edit the Agent description, Prompts, Prompt versions, and Knowledge Base.
   1. (Optional) Click the **Play button** to view or edit the Prompt text for the selected version.
5. Click **Save Agent** to apply your changes.

***

### Test AI Agent

1. In the left menu, expand **Q in Connect**.
2. Click **AI Agent**.
3. On the Agents list, click the **Chat Bubble icon** in the Actions column.
4. Enter your question into the text box and click **Send**.
5. Use the Version dropdown at the top right of the screen to change the Version of the Agent you are testing.
6. Click **Show Details** to view the AI command details during the test.

***

### Delete AI Agent

1. In the left menu, expand **Q in Connect**.
2. Click **AI Agent**.
3. On the Agents list, click the **Trash icon** in the Actions column.
4. Click **Delete Agent**.
