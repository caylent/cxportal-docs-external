# Access Management Best Practices

## **Best Practices**

Follow these practices to keep access in CxPortal accurate, secure, and easy to manage.

* **Structure roles around your teams.** Create roles that align with the existing teams and roles in your organization. If you have a Linguistics team or a Connect Engineer team, create a separate role for each, with the permissions that team needs to do its work. This keeps access intuitive and makes it clear which role applies to whom.
* **Grant only the permissions each role needs.** Give each role the minimum access required for its work — both at the global level and at the instance level. Limiting permissions reduces the risk of accidental changes and keeps each user's view focused on what's relevant to them.
* **Configure instance permissions deliberately.** Because permissions are set per Amazon Connect instance, decide in advance which modules a role should access on each instance. Remember that removing all module permissions on an instance hides the entire instance from that role and removing a single module's permissions hides just that module — use both levels of restriction intentionally to shape what users see.
* **Name and describe roles clearly.** Give each role a descriptive name and a meaningful description so administrators can quickly identify its purpose. Clear naming pays off as your number of roles grows and as different team members manage access over time.
* **Review and update access regularly.** Organizational needs change, so revisit roles and their permissions periodically. Update permissions whenever a team's responsibilities shift and remove access that's no longer needed to keep access levels accurate.
* **Separate viewing from editing.** Assign the Access Management Viewer permission to team members who need visibility into roles and users without the ability to change them and reserve the Access Management Admin permission for those who genuinely manage access. This limits how many people can alter access configurations.
