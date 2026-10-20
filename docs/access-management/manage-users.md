# Manage Users

The Users page lets you manage your users and their assigned roles within your organization. From this page, you can see each user's name, email, login method, login status and role. Additionally, you can add new users, edit or disable existing users, or export user data.

## Before You Begin

- User Management is subject to role-based access. You must have a specific role designated by your organization.
- Know the difference between deactivating and deleting a user. Deactivating prevents the user from logging into the system but retains their data, with the option to reactivate. Deleting removes the user's data from the system and is irreversible.

## Step-by-Step Instructions

### Adding a User

1. Open CxPortal.
2. Click the **Admin gear** on the bottom left side of the screen.
3. Expand **Access management**, and then click **Users**.
4. In the top right corner of the screen, click **Add New User**.
5. Enter an Email Address, Full Name, User ID, and Login Method.
6. Choose a Role from the Role dropdown.
7. Click **Save New User**.

> **Note:** Users added with the **SSO login method** receive an invitation email, just as password users do. SSO login users follow the link in that email directly to their identity provider to sign in, rather than to the CxPortal login page.

### Export the Users List

1. Open CxPortal.
2. Click the **Admin gear** on the bottom left side of the screen.
3. Expand **Access management**, and then click **Users**.
4. Narrow the list first if you only want part of it — the export contains exactly the rows the table is showing, including any Search Users or Filters you have applied.
5. In the top right corner of the screen, click **Export Users**.
6. The file downloads as a .csv file named: *users-export-&lt;company&gt;-&lt;YYYY-MM-DD&gt;.csv*

> **Note:** The Export Users option doesn't appear if no users match the current filters.

### View User Details

1. Open CxPortal.
2. Click the **Admin gear** on the bottom left side of the screen.
3. Expand **Access management**, and then click **Users**.
4. Use the search bar at the top of the page to search for a user by Name, Email, Role, or Login Method. Additionally, you can use the **Login Method** and **Role** filters on the left side of the screen to filter search results.
5. On the Users table, click a **User's Name** to view their details or click the **three-dot action menu** on the right side of the row and then **View Details**.

The user detail page shows:

- **User Details** — the user's Email and Login Method (for example, "Password: Confirmed"), with the actions Change Role, Edit Profile, Reset Password, Deactivate User, and Delete User.
- **Instances** — The Instances table shows a list of instances the user can access. Use the search bar on the right side of the Instances table to search for a specific instance.

### Change a Role

1. Open CxPortal.
2. Click the **Admin gear** on the bottom left side of the screen.
3. Expand **Access management**, and then click **Users**.
4. On the Users table, click a **User's Name** to view their details or click the **three-dot action menu** on the right side of the row and then **View Details**.
5. On the top right side of the screen, click **Change Role**.
6. Choose a new Role from the role dropdown menu.
7. Click **Save Changes**.

### Edit a User Profile

1. Open CxPortal.
2. Click the **Admin gear** on the bottom left side of the screen.
3. Expand **Access management**, and then click **Users**.
4. On the Users table, click a **User's Name** to view their details or click the **three-dot action menu** on the right side of the row and then **View Details**.
5. On the top right side of the screen, click the **Edit Profile icon**.
6. Update the user's Email Address and Full Name.
7. Click **Update Profile**.

> **Note:** The Edit Profile option is not shown for a user whose only login method is SSO and has never signed in. Their Login Method reads: "Single Sign-On (SSO): Not logged in yet". Since their name is supplied by the identity provider the first time they signed in, there's no profile to edit yet. The Edit Profile option will appear once the user has signed in with SSO. Every other action is unaffected.

### Reset a Password

1. Open CxPortal.
2. Click the **Admin gear** on the bottom left side of the screen.
3. Expand **Access management**, and then click **Users**.
4. On the Users table, click a **User's Name** to view their details or click the **three-dot action menu** on the right side of the row and then **View Details**.
5. On the top right side of the screen, click the **Reset Password icon**.
6. Review the confirmation message and click **Reset Password**.
7. The user will get an email with instructions to set a new password.

### Deactivate a User

Deactivating a user prevents them from logging into the system but retains their data, with the option to reactivate.

1. Open CxPortal.
2. Click the **Admin gear** on the bottom left side of the screen.
3. Expand **Access management**, and then click **Users**.
4. On the Users table, click a **User's Name** to view their details or click the **three-dot action menu** on the right side of the row and then **View Details**.
5. On the top right side of the screen, click the **Deactivate User icon**.
6. Review the confirmation message and click **Deactivate**.
7. The user will lose access until the account is reactivated.

### Reactivate a Deactivated User

You can reactivate a user that has been previously deactivated.

1. Open CxPortal.
2. Click the **Admin gear** on the bottom left side of the screen.
3. Expand **Access management**, and then click **Users**.
4. On the Users table, click a **User's Name** to view their details or click the **three-dot action menu** on the right side of the row and then **View Details**.
5. On the top right side of the screen, click the **Activate icon**.
6. Review the confirmation message and click **Activate**.

### Delete a User

Deleting a user removes their data and access to the system. **This is irreversible.**

1. Open CxPortal.
2. Click the **Admin gear** on the bottom left side of the screen.
3. Expand **Access management**, and then click **Users**.
4. On the Users table, click a **User's Name** to view their details or click the **three-dot action menu** on the right side of the row and then **View Details**.
5. On the top right side of the screen, click the **Delete User icon**.
6. **Review the confirmation message. This permanently removes access, and this action cannot be reversed.**
7. Click **Delete**.

### Troubleshooting

| Problem | Cause | Solution |
| --- | --- | --- |
| A User Detail page shows: "The user has an account, but their information has not been migrated." There's a Migrate User Data button instead of full details. | The user's information has not been migrated. | Click **Migrate User Data**. |
| The user list briefly shows "0 users". | The User list is still loading. | Allow the list to finish loading before assuming the page is empty. If you still need help, click the Support Request icon in the top right corner of the screen. |
