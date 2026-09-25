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

Each row has a **View Details** (eye) control. The list header shows **Export Users** and **Add user** buttons and a subtitle with the user count, plus a **Search Users** box and a **Filter by role** dropdown.

***

### Export Columns: Export Users

**Export Users** downloads the rows the table is currently showing as `users-export-<company>-<YYYY-MM-DD>.csv`.

| Column | Description |
| ---------------- | ------------------------------------------------------------------------------------------------ |
| **Name** | The user's name, or an em dash (—) when they have none. |
| **Email** | The user's email address. |
| **Company** | The company the user belongs to. |
| **Login Methods** | One login method per line, each as method · status · invite date — for example `Password · Invite Expired · Aug 12, 2026`. Reads `No login configured` when the user has none. |
| **Role** | The role assigned to the user. |

The file lists the same users as the table, in the same order, and reflects the filters in effect when you export. It is not a fresh read of all users.

[VERIFY: **Export Users** carries no permission gate in this release, unlike **Add user**, which requires a writer role — so anyone who can open the Users page can export it. Confirm this is intended before publishing.]

***

### Status Definitions: Login Methods

Observed login-method status badges:

* **NOT\_CONFIGURED**
* **Invite Expired**
* **Invite Sent**
* **Confirmed**
* **Active** (SSO)

***
