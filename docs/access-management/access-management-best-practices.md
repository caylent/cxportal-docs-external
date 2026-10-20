# Access Management Best Practices

## **Best Practices**

Use these recommendations to keep your access structure secure, consistent, and easy to maintain.

**Roles**

* Align roles with teams and job functions. Create roles that match how your organization is structured (for example, a Linguistics team or a Connect Engineer team) rather than building one-off roles for individuals. Each role then carries the permissions that the team needs, and new users are easy to onboard.

* Use clear names and descriptions. Write a Role Name and Description that tells an administrator at a glance who the role is for and what it covers. 

* Plan before you build. Decide the role’s name, global permissions, and per-instance module access before you create it. Permissions are set after the role exists, so having a plan avoids trial and error.

* Review changes before saving. Editing a role’s permissions affects every user assigned to that role. Check who holds the role before you save and use the Permissions Key to confirm what each permission allows.

**Permissions**

* Configure each instance deliberately. Instance permissions are set for each Amazon Connect instance. Review each connected instance and set the level each role should have there.

* Restrict access at the right level. To block an entire instance, remove all module permissions for that role on that instance (“none selected” for every module), and users with that role won’t see it in the instance picker. To limit only part of an instance, remove permissions for the specific modules the role shouldn’t use.

* Manage Dynamic Flow Configurator access in DFC. In Access Management, you can set DFC to Admin or None only. For a level in between, assign the role’s entity tags in DFC Permissions. See Managing DFC Permissions.

**Users**

* Assign roles at invitation. Choose the correct role when you add a user so they have the right access from their first login.

* Know the difference between deactivating and deleting a user. Deactivating prevents the user from logging into the system but retains their data, with the option to reactivate. Deleting removes the user's data from the system and is irreversible.

* Remove access promptly. When someone leaves the organization or no longer needs CxPortal, delete their account right away.

**Change Requests**

* Require change requests for high-impact actions. Use the Change Request Management matrix to require a change request for actions that could affect your contact center’s operations, so they are reviewed before they happen.

* Choose the right scope. Set your configuration for all instances for rules that should apply company-wide, and configure individual instances separately when they need different rules. Rules for a specific instance apply only to that instance.

* Target by permission when appropriate. Check only specific permissions in a row to require change requests from certain users, or check every permission in a row to require them from everyone.

**Ongoing Maintenance**

* Review roles and users regularly. Schedule periodic reviews to confirm that roles still match your team structure and that each user has the right role. Remove or deactivate anything that is no longer needed.

* Use the user export for audits. Export the Users list to a .csv file to review who has access and with which roles. The export contains exactly the rows the table is showing, so apply Search Users or Filters first if you only need part of the list.

* Work with stakeholders. Operations managers know what tools their teams need, and compliance or security officers know what your governance standards require. Involve both when you define or revise roles.


