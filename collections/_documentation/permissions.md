---
title: Roles & Permissions
description: Configure the permission system which is based on user roles 
---

Kimai provides a flexible permission system, which is based on **user roles** and **permissions**, 
which can be turned on and off for these roles. You need the `role_permissions` permission to access the `Roles` screen.

This permission system limits access to the functionality of Kimai. 

{% alert %}
If you are looking for a way to limit access to timesheets, activities, projects and customers read about [Team permissions]({% link _documentation/teams.md %}).
{% endalert %}

## Roles

Access to functions is handled by the [permission system]({% link _documentation/permissions.md %}), which is configurable through user roles.
There are four pre-defined roles in Kimai, which have a customizable set of ACLs/permissions.

| Role name      | Description                                                                                                                                               |
|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| User           | Normal user can track their working times, see basic reports and change their own preferences. Technical name: `ROLE_USER`                                |
| Teamlead       | Manages [teams]({% link _documentation/teams.md %}) with permissions for invoices and access to all **team** timesheets. Technical name: `ROLE_TEAMLEAD`  |
| Administrator  | Can manage all content and timesheet related data, but lack user administration and system privileges. Technical name: `ROLE_ADMIN`                       |
| System-Admin   | Has permissions to manage everything in Kimai, from content to timesheets to users, plugins and system configurations. Technical name: `ROLE_SUPER_ADMIN` |
{: .table }

{% alert danger %}
Every user is automatically member of the ROLE_USER, this behaviour cannot be changed. 

That means, that every role and user owns all permissions from the `ROLE_USER`. 
{% endalert %}

### Creating roles

If the pre-defined roles are not sufficient for your use-case and you need more roles, you can create new ones.

Every user with the permission `role_permissions` can create new user roles. 
There is a button that will open a new modal, to enter a role name. This new role will show up in the table after saving.

{% alert warning %}Allowed character are: `A-Z` and `_`. If you use different character, you might experience strange bugs.{% endalert %}

Custom role names must start with `ROLE_` and need to be written in uppercase letters, so instead of using `Manager` you have to create `ROLE_MANAGER`. 
This is required if you want to test for role permissions programmatically.

## Permissions 

By turning permissions `on` and `off` for specific roles, you widen or limit the access to certain features.
Clicking the `Yes` and `No` labels in the table toggles the selected permission (row title) for the respective role (column title).

If a user has multiple roles, then access is granted as soon as one of these roles own the permission.

**Be aware**
There are other business rules which might limit access to certain functions, so permissions are not the only checks in place.
For example: exported timesheet records cannot be edited, even if a user has the `edit_own_timesheet` or `edit_other_timesheet` permission.
 
### Activity

{% include documentation/permissions-activity.md %}

### Customer

{% include documentation/permissions-customer.md %}

### Project

{% include documentation/permissions-project.md %}

### Timesheet

{% include documentation/permissions-timesheet.md %}

### User

{% include documentation/permissions-user.md %}

### Invoice

{% include documentation/permissions-invoice.md %}

### Absences

{% include documentation/permissions-absence.md %}

### Working times

{% include documentation/permissions-contract.md %}
 
### Others

| Permission name          | Description                                                                                                                                    |
|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| **Export**               |                                                                                                                                                |
| create_export            | See [export]({% link _documentation/export.md %}) screen and create export documents from the selected timesheet data                          |
| create_export_template   | Create, edit and delete CSV and Excel [export templates]({% link _documentation/export.md %})                                                  |
| **Reporting**            |                                                                                                                                                |
| view_other_reporting     | Gives access to the reports of other users                                                                                                     |
| view_reporting           | Gives access to the [reporting]({% link _documentation/reporting.md %}) screen                                                                 |
| **Tags**                 |                                                                                                                                                |
| delete_tag               | Delete existing tags                                                                                                                           |
| manage_tag               | Edit existing and create new tags in the administration                                                                                        |
| view_tag                 | Gives access to the [tags]({% link _documentation/tags.md %}) administration                                                                   |
| **Teams**                |                                                                                                                                                |
| create_team              | Create new teams                                                                                                                               |
| delete_team              | Delete existing teams                                                                                                                          |
| edit_team                | Edit team assignments                                                                                                                          |
| view_team                | See [teams]({% link _documentation/teams.md %}) administration                                                                                 |
| view_team_member         | View the teamleads and members for the teams of the current user                                                                               |
| **Other**                |                                                                                                                                                |
| plugins                  | Access the plugin administration                                                                                                               |
| role_permissions         | **SECURITY ALERT**: view and change permissions for user roles, create and delete user roles - `System-Admins` will always own that permission |
| system_configuration     | Configure global Kimai settings                                                                                                                |
| system_information       | Enter the system-information (about) screen                                                                                                    |
| view_all_data            | **SECURITY ALERT**: Allows to see all data (disables team permissions) - `System-Admins` will always own that permission                       |
{: .table .permissions }
