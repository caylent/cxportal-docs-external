# PBR Best Practices

## Best Practices

Proficiency-Based Routing works best when it's planned as a connected system rather than configured page by page. Because predefined attributes, values, agent ratings, and routing rules all build on one another, decisions you make early shape what's possible later. The practices below will help you set up a configuration that's accurate, maintainable, and easy to adjust as your team changes.

### **Plan before you build**

Map out your skill structure before creating anything in CxPortal. Decide which skill categories matter to your organization (your predefined attributes), what levels you want to measure within each (your values), and roughly how your routing logic should behave. Because each layer depends on the one before it, sketching the full picture up front saves rework later — for example, you can't rate an agent on a skill or write a rule against it until the underlying attribute and value exist.

Work in the order the system is designed for: define predefined attributes first, add values to them, rate your agents, and build routing rules last.

### **Use clear, consistent naming**

Choose attribute and value names that are self-explanatory to anyone who manages routing later. When using a custom rating scale, descriptive labels like "Beginner" through "Expert" are easier for your team to interpret than raw numbers, even though Amazon Connect uses the 1–5 scale behind the scenes.

Avoid the reserved prefix: a value can't start with "connect," since that terminology is reserved by Amazon Web Services.

### **Keep ratings current**

Agent ratings are what routing rules use to decide whether an agent matches a contact, so the quality of your routing depends directly on the accuracy of those ratings. Revisit ratings as agents gain experience, change roles, or join new teams. Use the hierarchy group and routing profile filters on the Agent Assignments page to review specific teams efficiently rather than scanning the full list.

When a skill should be set aside temporarily, disable the value rather than deleting it. Disabling removes the skill from routing consideration while preserving the rating, so you can re-enable it later without rebuilding it.

### **Manage dependencies carefully**

PBR enforces dependencies between layers, and understanding them prevents surprises:

* A predefined attribute or value can't be deleted while it's used in an active routing rule or assigned to an agent. Remove those dependencies first.
* Deleting an attribute or value that's referenced by an *inactive* rule will cause that rule's reactivation to fail later. Before deleting anything, check whether inactive rules depend on it, and update those rules if you intend to reuse them.

Where possible, deactivate a rule instead of deleting its underlying components when you only need to pause it.

### **Design routing rules within the limits**

Build rules with the structural constraints in mind so you don't hit them mid-configuration:

* Keep rules to a maximum of five steps.
* AND groups (and groups nested within them) allow up to 8 conditions and only one of each value type.
* OR groups allow up to 4 expressions, can't be nested inside other groups, and can't contain other OR groups.

Use the **Show Agents** option after setting your criteria to confirm that real agents actually match before you save. An empty or unexpectedly small result is an early sign that your logic is too restrictive.

### **Use change management**

Take advantage of the controls PBR shares with other CxPortal modules:

* Use **scheduled changes** to align routing updates with known events — a new hire's start date, a seasonal campaign, or a planned reorganization — rather than applying them manually at the last minute.
* Treat the **Audit Log** as your source of truth for what changed, when, and by whom. If a change causes unexpected behavior, you can revert it directly from the log rather than re-editing the affected entity by hand.
* Remember that changes requiring approval won't take effect — or appear in the Audit Log — until an approver commits them, and no one can approve their own request. Build that review step into your timeline.

### **Verify changes after syncing**

After any create, update, or delete action, wait for the syncing indicator to disappear before confirming the result. Changes pass through a caching service that processes updates at roughly five-second intervals, so a change won't reliably appear in the Audit Log until syncing completes. Verifying too early can make a successful change look like it failed.
