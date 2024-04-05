---
title: Roles & Permissions
description: Configure the permission system which is based on user roles 
toc: true
---

Kimai provides a flexible permission system, which is based on **user roles** and **permissions**, 
which can be turned on and off for these roles. You need the `role_permissions` permission to access the `Roles` screen.

This permission system limits access to the functionality of Kimai. 

{% capture teamLink %}
If you are looking for a way to limit access to timesheets, activities, projects and customers read about [Team permissions]({% link _documentation/teams.md %}).
{% endcapture %}
{% assign teamLink = teamLink|markdownify %}
{% include alert.html type="info" alert=teamLink %}

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

{% capture roleUserAssignment %}
Every user is automatically member of the ROLE_USER, this behaviour cannot be changed. 

That means, that every role and user owns all permissions from the `ROLE_USER`. 
{% endcapture %}

{% include alert.html type="danger" alert=roleUserAssignment %}

### Creating roles

If the pre-defined roles are not sufficient for your use-case and you need more roles, you can create new ones.

Every user with the permission `role_permissions` can create new user roles. 
There is a button that will open a new modal, to enter a role name. This new role will show up in the table after saving.

{% include alert.html type="warning" alert="Allowed character are: `A-Z` and `_`. If you use different character, you might experience strange bugs." %}

Custom role names must start with `ROLE_` and need to be written in uppercase letters, so instead of using `Manager` you have to create `ROLE_MANAGER`. 
This is required if you want to test for role permissions programmatically.

## Permissions 

By turning permissions `on` and `off` for specific roles, you widen or limit the access to certain features.
Clicking the `Yes` and `No` labels in the table toggles the selected permission (row title) for the respective role (column title).

If a user has multiple roles, then access is granted as soon as one of these roles own the permission.

### Existing permissions

This is the full list of existing permissions with short descriptions:

| Permission name               | Description                                                                                                                                    |
|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| **Activity (Admin)**          |                                                                                                                                                |
| budget_activity               | Allows to see the budget (monetary) reports for activities of assigned projects/customers                                                      |
| time_activity                 | Allows to see the budget (time) reports for activities of assigned projects/customers                                                          |
| create_activity               | Create a new activity                                                                                                                          |
| delete_activity               | Delete activities                                                                                                                              |
| edit_activity                 | Edit existing activities                                                                                                                       |
| permissions_activity          | Allows to edit the teams for assigned activities                                                                                               |
| view_activity                 | Allows access to the activity administration                                                                                                   |
| **Activity (Team member)**    |                                                                                                                                                |
| budget_team_activity          | Allows team-members to see the budget (money) reports for activities of assigned projects/customers                                            |
| time_team_activity            | Allows team-members to see the budget (time) reports for activities of assigned projects/customers                                             |
| edit_team_activity            | Allows team-members to edit activities of assigned projects/customers                                                                          |
| view_team_activity            | Allows team-members to access activity administration                                                                                          |
| **Activity (Teamlead)**       |                                                                                                                                                |
| budget_teamlead_activity      | Allow team leaders to see the budget (money) reports for activities of assigned projects/customers                                             |
| time_teamlead_activity        | Allow team leaders to see the budget (time) reports for activities of assigned projects/customers                                              |
| edit_teamlead_activity        | Allow team leaders to edit activities for assigned projects/customers                                                                          |
| permissions_teamlead_activity | Allow team leaders to edit the teams for assigned activities                                                                                   |
| view_teamlead_activity        | Allow team leaders to access activity administration                                                                                           |
| **Customer (Admin)**          |                                                                                                                                                |
| budget_customer               | Allows to see the budget (money) reports for the customer                                                                                      |
| time_customer                 | Allows to see the budget (time) reports for the customer                                                                                       |
| comments_customer             | Allows to see the comment section for customers                                                                                                |
| create_customer               | Create new customers                                                                                                                           |
| delete_customer               | Delete existing customers                                                                                                                      |
| details_customer              | View customer details (account number, vat, rates, meta-fields, assigned teams & users)                                                        |
| edit_customer                 | Edit existing customers                                                                                                                        |
| permissions_customer          | Allows to edit the teams for assigned customers                                                                                                |
| view_customer                 | Allows access to the customer administration                                                                                                   |
| **Customer (Team member)**    |                                                                                                                                                |
| budget_team_customer          | Allows team-members to see the budget (money) reports for assigned customers                                                                   |
| time_team_customer            | Allows team-members to see the budget (time) reports for assigned customers                                                                    |
| comments_team_customer        | Allows team-members to see the comment section for customers                                                                                   |
| details_team_customer         | Allows team-members to see customer details                                                                                                    |
| edit_team_customer            | Allows team-members to edit assigned customers                                                                                                 |
| view_team_customer            | Allows team-members to access project administration                                                                                           |
| **Customer (Teamlead)**       |                                                                                                                                                |
| budget_teamlead_customer      | Allow team leaders to see the budget (money) reports for assigned customers                                                                    |
| time_teamlead_customer        | Allow team leaders to see the budget (time) reports for assigned customers                                                                     |
| comments_teamlead_customer    | Allow team leaders to see the comment section for customers                                                                                    |
| details_teamlead_customer     | Allow team leaders to see customer detail                                                                                                      |
| edit_teamlead_customer        | Allow team leaders to edit assigned customers                                                                                                  |
| permissions_teamlead_customer | Allow team leaders to edit the teams for assigned customers                                                                                    |
| view_teamlead_customer        | Allow team leaders to access project administration                                                                                            |
| **Export**                    |                                                                                                                                                |
| create_export                 | See [export]({% link _documentation/export.md %}) screen and create export documents from the selected timesheet data                          |
| **Invoice**                   |                                                                                                                                                |
| create_invoice                | Create a new invoice                                                                                                                           |
| delete_invoice                | Allows to delete invoices, please [read docs why you shouldn't]({% link _documentation/invoices.md %})                                         |
| manage_invoice_template       | Administrate invoice templates                                                                                                                 |
| upload_invoice_template       | Allows to upload custom invoice templates                                                                                                      |
| view_invoice                  | Gives access to the [list of all invoices]({% link _documentation/invoices.md %}) and allows to download existing invoices                     |
| **Project (Admin)**           |                                                                                                                                                |
| budget_project                | Allows to see the budget (money) reports for projects                                                                                          |
| time_project                  | Allows to see the budget (time) reports for projects                                                                                           |
| comments_project              | Allows to see the comment section for projects                                                                                                 |
| create_project                | Create a new project                                                                                                                           |
| delete_project                | Delete existing projects                                                                                                                       |
| details_project               | View project details (Order number & date, start and end date, rates, assigned teams & users)                                                  |
| edit_project                  | Edit existing projects                                                                                                                         |
| permissions_project           | Allows to edit the teams for assigned projects                                                                                                 |
| view_project                  | Allows access to the project administration                                                                                                    |
| **Project (Team member)**     |                                                                                                                                                |
| budget_team_project           | Allows team-members to see the budget (money) reports for assigned projects or projects of assigned customers                                  |
| time_team_project             | Allows team-members to see the budget (time) reports for assigned projects or projects of assigned customers                                   |
| comments_team_project         | Allows team-members to see the comment section for project                                                                                     |
| details_team_project          | Allows team-members to see project details                                                                                                     |
| edit_team_project             | Allows team-members to edit assigned projects or projects for assigned customers                                                               |
| view_team_project             | Allows team-members to access projects administration                                                                                          |
| **Project (Teamlead)**        |                                                                                                                                                |
| budget_teamlead_project       | Allow team leaders to see the budget (money) reports for assigned projects or projects of assigned customers                                   |
| time_teamlead_project         | Allow team leaders to see the budget (time) reports for assigned projects or projects of assigned customers                                    |
| comments_teamlead_project     | Allow team leaders to see the comment section for project                                                                                      |
| details_teamlead_project      | Allow team leaders to see project details                                                                                                      |
| edit_teamlead_project         | Allow team leaders to edit assigned projects or projects for assigned customers                                                                |
| permissions_teamlead_project  | Allow team leaders to edit the teams for assigned projects or projects of assigned customers                                                   |
| view_teamlead_project         | Allow team leaders to access projects administration                                                                                           |
| **Reporting**                 |                                                                                                                                                |
| view_other_reporting          | Gives access to the reports of other users                                                                                                     |
| view_reporting                | Gives access to the [reporting]({% link _documentation/reporting.md %}) screen                                                                 |
| **Tags**                      |                                                                                                                                                |
| delete_tag                    | Delete existing tags                                                                                                                           |
| manage_tag                    | Edit existing and create new tags in the administration                                                                                        |
| view_tag                      | Gives access to the [tags]({% link _documentation/tags.md %}) administration                                                                   |
| **Teams**                     |                                                                                                                                                |
| create_team                   | Create new teams                                                                                                                               |
| delete_team                   | Delete existing teams                                                                                                                          |
| edit_team                     | Edit team assignments                                                                                                                          |
| view_team                     | See [teams]({% link _documentation/teams.md %}) administration                                                                                 |
| view_team_member              | View the teamleads and members for the teams of the current user                                                                               |
| **Timesheet**                 |                                                                                                                                                |
| edit_exported_timesheet       | Edit and delete timesheet records which were exported                                                                                          |
| lockdown_grace_timesheet      | All records in the last lockdown period can be edited, even after the grace period ended                                                       |
| lockdown_override_timesheet   | None of the lockdown rules apply                                                                                                               |
| **Timesheet (other)**         |                                                                                                                                                |
| create_other_timesheet        | Create a new timesheet record in the name of another user                                                                                      |
| delete_other_timesheet        | Delete timesheets of other users                                                                                                               |
| edit_export_other_timesheet   | Set the export state for other users timesheet records                                                                                         |
| edit_billable_other_timesheet | Set the billable state for other users timesheet record (since 1.18.3)                                                                         |
| edit_other_timesheet          | Edit existing records of other users                                                                                                           |
| edit_rate_other_timesheet     | Edit the rates for other users timesheet records (fixed, hourly and total)                                                                     |
| export_other_timesheet        | Export timesheet in the timesheet admin panel                                                                                                  |
| start_other_timesheet         | Start _running_ timesheet records for other users                                                                                              |
| stop_other_timesheet          | Stop _running_ timesheet records of other users                                                                                                |
| view_other_timesheet          | Allows access to the timesheet admin panel, listing records for all users                                                                      |
| view_rate_other_timesheet     | View the rates for other users timesheet records (fixed, hourly and total)                                                                     |
| **Timesheet (own)**           |                                                                                                                                                |
| create_own_timesheet          | Create a new timesheet record with the dialog                                                                                                  |
| delete_own_timesheet          | Delete own timesheet records                                                                                                                   |
| edit_export_own_timesheet     | Set the export state for your own timesheet record                                                                                             |
| edit_billable_own_timesheet   | Set the billable state for your own timesheet record (since 1.18.3)                                                                            |
| edit_own_timesheet            | Edit own timesheet records                                                                                                                     |
| edit_rate_own_timesheet       | Edit the rates for own timesheet records (fixed, hourly and total)                                                                             |
| export_own_timesheet          | Export your own timesheet in the timesheet panel                                                                                               |
| start_own_timesheet           | Create a running timesheet record (restart and create)                                                                                         |
| stop_own_timesheet            | Stop the own running timesheets records                                                                                                        |
| view_own_timesheet            | Allows access to the own timesheet views                                                                                                       |
| view_rate_own_timesheet       | View the rates for own timesheet records (fixed, hourly and total)                                                                             |
| weekly_own_timesheet          | Gives access to the [weekly working hours]({% link _documentation/weekly-times.md %}) screen                                                   |
| **User**                      |                                                                                                                                                |
| create_user                   | Create new users                                                                                                                               |
| delete_user                   | **SECURITY ALERT**: Delete existing users                                                                                                      |
| view_user                     | Access the User administration and see the list of all users - `System-Admins` will always own that permission                                 |
| **User profile (other)**      |                                                                                                                                                |
| api-token_other_profile       | Change the API token for other users                                                                                                           |
| edit_other_profile            | **SECURITY ALERT**: edit the profile for another user                                                                                          |
| hourly-rate_other_profile     | Edit other (users specific) hourly rate                                                                                                        |
| password_other_profile        | Change the password for another user                                                                                                           |
| preferences_other_profile     | Change the preferences for another user                                                                                                        |
| roles_other_profile           | **SECURITY ALERT**: change roles for other users                                                                                               |
| supervisor_other_profile      | Change the supervisor for the selected profile                                                                                                 |
| teams_other_profile           | Edit team assignments in other user profile                                                                                                    |
| view_other_profile            | View other user profiles                                                                                                                       |
| **User profile (own)**        |                                                                                                                                                |
| api-token_own_profile         | Change the own API token                                                                                                                       |
| edit_own_profile              | Edit own user profile/account                                                                                                                  |
| hourly-rate_own_profile       | Edit the own (user specific) hourly rate                                                                                                       |
| password_own_profile          | Change own password (should be deactivated when [LDAP]({% link _documentation/ldap.md %}) is used)                                             |
| preferences_own_profile       | Allows a user to edit the own preferences                                                                                                      |
| roles_own_profile             | **SECURITY ALERT**: change the own user roles                                                                                                  |
| supervisor_own_profile        | Change the supervisor for the own profile                                                                                                      |
| teams_own_profile             | Edit team assignments in own user profile                                                                                                      |
| view_own_profile              | View own user profile and statistics                                                                                                           |
| **Other**                     |                                                                                                                                                |
| plugins                       | Access the plugin administration                                                                                                               |
| role_permissions              | **SECURITY ALERT**: view and change permissions for user roles, create and delete user roles - `System-Admins` will always own that permission |
| system_configuration          | Configure global Kimai settings                                                                                                                |
| system_information            | Enter the system-information (about) screen                                                                                                    |
| view_all_data                 | **SECURITY ALERT**: Allows to see all data (disables team permissions) - `System-Admins` will always own that permission                       |
{: .table }

**Be aware**
There are other business rules which might limit access to certain functions, so these permissions are not the only checks in place.
For example timesheet records which were exported cannot be edited any longer, even if a user has the `edit_own_timesheet` 
or `edit_other_timesheet` permission. 
