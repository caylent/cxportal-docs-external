# Managing Existing Users

## Before You Begin

* User Management is subject to role-based access. You must have a specific role designated by your organization.
* Know the difference between deactivating and deleting a user. Deactivating prevents the user from logging into the system but retains their data, with the option to reactivate. Deleting removes the user's data from the system and is irreversible.

***

### Open a User's Detail Page

1. Open CxCentral and click **Admin**.
2. In the left menu, under **Access management**, click **Users**.
3. Find the user with the **Search Users** box or the **Filter by role** dropdown.
4. Click the **View Details** (eye) icon on the right of the user's row. This opens the user detail page.

!!! info ""
    The user detail page shows:

    * **User Details** — the user's **EMAIL** and **LOGIN METHODS** (for example, "Password · Confirmed"), with the actions **Deactivate**, **Edit Profile**, and **Send Forgot Password Reminder**.
    * **Role and Instance Access** — the **ROLE NAME**, a **Change Role** button, and an **Instance Name** table listing the instances the user can access.


***

### Edit a User

You can edit existing user information or roles at any time. To edit a user:

1. Open CxCentral and click **Admin**.
2. In the left menu, click **Users**.
3. Click on the **Actions menu** on the right of the user you want to edit.
4. Click **View Details**. This opens the user detail page where you can choose to edit the user profile, send a forgotten password reminder, change roles, or deactivate the user.
   1. To edit a profile, click **Edit Profile**.
   2. To deactivate a user, click **Deactivate**.
   3. To send a password reminder, click **Send Forgotten Password Reminder**.
   4. To change roles, click **Change Role**.

***

### Deactivate a User

!!! info ""
    Deactivating a user prevents them from logging into the system but retains their data, with the option to reactivate.


You can deactivate a user at any time. To deactivate:

1. Open CxCentral and click **Admin**.
2. In the left menu, click **Users**.
3. Click **View Details** on the right of the user you want to edit.
4. Click **Deactivate**.
5. Review the confirmation message and click **Deactivate**.

***

### Reactivate a Deactivated User

You can reactivate a user that has been previously deactivated:

1. Open CxCentral and click **Admin**.
2. In the left menu, click **Users**.
3. Click **View Details** on the right of the user you want to edit.
4. Click **Activate**.

***

### Delete a User

!!! info ""
    Deleting a user removes their data and access to the system. **This is irreversible**.


You can delete a user at any time. To delete:

1. Open CxCentral and click **Admin**.
2. In the left menu, click **Users**.
3. Click **View Details** on the right of the user you want to edit.
4. Click **Delete**.
5. Review the confirmation message and click **Delete**.

***

### Send a Password Reminder

On the user detail page, click **Send Forgot Password Reminder**. For the detailed workflow, see [Edit a User](https://docs.caylent.com/cxportal/user-management/managing-existing-users/#edit-a-user).

***

### Change a User's Role

1. On the user detail page, under **Role and Instance Access**, click **Change Role**.
2. The Change Role dialog shows the **Email** (read-only), the **Current Role** (read-only), and **Select New Role** with a **Search roles…** box and a scrollable list of roles, each with a name and description.
3. Select the new role.
4. Click **Change Role** to confirm, or **Cancel** to dismiss without changing the role.

***

### Troubleshooting

| Problem                                                                                                                                                        | Cause                                         | Solution                                                            |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------- | ------------------------------------------------------------------- |
| The user detail page shows "The user has an account but their information has not been migrated." with a **Migrate User Data** button instead of full details. | The user's information has not been migrated. | Click **Migrate User Data.**                                        |
| The user list briefly shows "0 users".                                                                                                                         | The list is still loading.                    | Allow the list to finish loading before assuming the page is empty. |

***
