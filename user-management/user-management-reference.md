# User Management Reference

### Field Reference: Add User Dialog

| Field Name        | Type                           | Required | Description                                                                                    |
| ----------------- | ------------------------------ | -------- | ---------------------------------------------------------------------------------------------- |
| **EMAIL ADDRESS** | Text                           | Yes      | The user's email address; also shown as the user's Name in the Users list.                     |
| **NAME**          | Text                           | No       | Labeled "NAME (OPTIONAL)" in the dialog.                                                       |
| **USER ID**       | Text                           | No       | Labeled "USER ID (OPTIONAL)". A unique identifier associated with each user within the system. |
| **LOGIN METHOD**  | Radio (**Password** / **SSO**) | Yes      | How the user authenticates. **Password** is selected by default.                               |
| **ROLE**          | Dropdown ("Select a role")     | —        | The role assigned to the user, which determines their permissions and level of access.         |

***

### Users List Columns

| Column            | Description                                    |
| ----------------- | ---------------------------------------------- |
| **Name**          | The user's email.                              |
| **User ID**       | The user's unique identifier.                  |
| **Login Methods** | Password and/or SSO, each with a status badge. |
| **Role**          | The role assigned to the user.                 |

Each row has a **View Details** (eye) control. The list header shows an **Add user** button and a subtitle with the user count, plus a **Search Users** box and a **Filter by role** dropdown.

***

### Status Definitions: Login Methods

Observed login-method status badges:

* **NOT\_CONFIGURED**
* **Invite Expired**
* **Confirmed**
* **Active** (SSO)

***
