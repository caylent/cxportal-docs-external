# Q in Connect Best Practices

## **Best Practices**

Follow these practices to get the most reliable results from Q in Connect across your Prompts, AI Agents, and Knowledge Bases.

* **Start with well-structured content.** Your responses are only as good as the content behind them. Author Knowledge Base content in Markdown or .txt, remove images, and organize it into folders. Clean, simple content lets the model parse and interpret it accurately, which improves everything downstream.
* **Build from the ground up.** Configure components in dependency order: create and refine your Knowledge Base first, then your Prompts, then the AI Agent that ties them together. Because an AI Agent depends on both its Prompts and its Knowledge Base, having those finalized first reduces rework.
* **Name and describe everything clearly.** Give each Prompt, AI Agent, and Knowledge Base a distinct, descriptive name and a meaningful description. Clear naming makes it easy to identify the right component when you're referencing an AI Agent in a contact flow or associating a Knowledge Base with a Prompt, and it simplifies troubleshooting when something needs attention.
* **Complete the full configuration in one pass.** Have all required information ready before you start — for Prompts, that means the name, description, type, API, and model; for Knowledge Bases, the Source URI and Knowledge Management System Key. Configuring components fully the first time produces more consistent, predictable behavior.
* **Test before you deploy.** Use the AI Agent test feature to validate behavior before referencing an Agent in a live contact flow. Enter representative customer questions, review the responses, and use Show Details to inspect the AI command details. Test each version you intend to use.
* **Manage versions deliberately.** Both Prompts and AI Agents support multiple versions. When you update a Prompt, remember that AI Agents reference a specific Prompt version — confirm your Agent points to the intended version after making changes. Use the Compare feature to review Prompt changes between versions, and keep in mind the 50-version limit per Prompt.
* **Iterate.** Refining Prompts is normal and expected. Monitor how your Agents perform in real interactions, then adjust the underlying Prompts to improve intent detection, response quality, and recommended actions over time.
