---
title: Permissions
description: Configure the permission system which is based on user roles 
toc: true
---

Kimai provides a flexible permission system, which is based on **user roles** and **permissions**, 
which can be turned on and off for these roles. You need the `role_permissions` permission to access it.

This permission system limits access to the functionality of Kimai. If you are looking for a way to limit access to  
timesheets, activities, projects and customers read the [Team permission documentation]({% link _documentation/teams.md %}). 

## Roles

Access to features within Kimai are handled by the [permission system]({% link _documentation/permissions.md %}), which is configurable through user roles.

There are four pre-defined roles in Kimai, which define the ACLs/permissions.

| Role name         | Description                                                                                                                   |
|---                |---                                                                                                                            |
| ROLE_USER         | Normal user can track their working times, see basic reports and change their own preferences                                 |
| ROLE_TEAMLEAD     | Manages [teams]({% link _documentation/teams.md %}) with permissions for invoices and access to all **team** timesheets       |
| ROLE_ADMIN        | Can manage all content and timesheet related data, but lack user administration and system privileges                         |
| ROLE_SUPER_ADMIN  | Has permissions to manage everything in Kimai, from content to timesheets to users, plugins and system configurations         |

{% include alert.html type="success" alert="Every user is automatically member of the ROLE_USER, this behaviour cannot be changed." %}

### Creating new roles

If the pre-defined roles are not sufficient for your use-case and you need more roles, you can create new ones.

Every user with the permission `role_permissions` can create new user roles. 
There is a button that will open a new modal, to enter a role name. This new role will show up in the table after saving.

{% include alert.html type="warning" alert="Allowed character are: `A-Z` and `_`. If you use different character, you might experience strange bugs." %}

## Permission assignment

You can assign permissions to the existing user roles and change which features are available to whom.

By clicking the `Yes` and `No` labels in the table, you toggle the respective permission (row) for the respective role (column) combination.

## Existing permissions

This is the full list of existing permissions with short descriptions:

| Permission name               | Description |
|---                            |---|
| view_activity                 | Allows access to the activity administration  |
| create_activity               | Create a new activity  |
| edit_activity                 | Edit existing activities  |
| delete_activity               | Delete activities  |
| view_project                  | Allows access to the project administration  |
| create_project                | Create a new project  |
| edit_project                  | Edit existing projects  |
| delete_project                | Delete existing projects  |
| view_customer                 | Allows access to the customer administration  |
| create_customer               | Create new customers  |
| edit_customer                 | Edit existing customers  |
| delete_customer               | Delete existing customers  |
| view_invoice                  | Allows access to the invoice section  |
| create_invoice                | Create a new invoice  |
| manage_invoice_template       | Administrate invoice templates |
| view_own_timesheet            | Allows access to the own timesheet views  |
| start_own_timesheet           | Create a _running_ timesheet record (restart and create)  |
| stop_own_timesheet            | Stop the own _running_ timesheets records  |
| create_own_timesheet          | Create a new timesheet record with the dialog |
| edit_own_timesheet            | Edit own timesheet records  |
| export_own_timesheet          | Export your own timesheet in the timesheet panel  |
| delete_own_timesheet          | Delete own timesheet records  |
| view_other_timesheet          | Allows access to the timesheet admin panel, listing records for all users |
| start_other_timesheet         | Start _running_ timesheet records for other users  |
| stop_other_timesheet          | Stop _running_ timesheet records of other users  |
| create_other_timesheet        | Create a new timesheet record in the name of another user  |
| edit_other_timesheet          | Edit existing records of other users  |
| export_other_timesheet        | Export timesheet in the timesheet admin panel  |
| delete_other_timesheet        | Delete timesheets of other users  |
| view_rate_own_timesheet       | View the rates for own timesheet records (fixed, hourly and total)  |
| edit_rate_own_timesheet       | Edit the rates for own timesheet records (fixed, hourly and total) |
| view_rate_other_timesheet     | View the rates for other users timesheet records (fixed, hourly and total)  |
| edit_rate_other_timesheet     | Edit the rates for other users timesheet records (fixed, hourly and total) |
| view_export                   | Allows access to the export module|
| create_export                 | Create an export from the selected timesheet data  |
| edit_export_own_timesheet     | Set the export state of your own timesheet record  |
| edit_export_other_timesheet   | Set the export state of for other users timesheet records  |
| view_own_profile              | View own user profile and statistics |
| edit_own_profile              | Edit own user profile/account  |
| preferences_own_profile       | Allows a user to edit the own preferences  |
| password_own_profile          | Change own password (should be deactivated when [LDAP]({% link _documentation/ldap.md %}) is used)  |
| roles_own_profile             | SECURITY ALERT: change the own user roles  |
| api-token_own_profile         | Change the own API token  |
| view_other_profile            | View other user profiles  |
| edit_other_profile            | SECURITY ALERT: edit the profile for another user  |
| password_other_profile        | Change the password for another user  |
| roles_other_profile           | SECURITY ALERT: change roles for other users |
| preferences_other_profile     | Change the preferences for another user  |
| api-token_other_profile       | Change the API token for other users  |
| hourly-rate_own_profile       | Edit the own (user specific) hourly rate  |
| hourly-rate_other_profile     | Edit other (users specific) hourly rate  |
| teams_own_profile             | Edit team assignments in own user profile (since 1.2)  |
| teams_other_profile           | Edit team assignments in other user profile (since 1.2)  |
| view_user                     | Access the User administration and see the list of all users  |
| create_user                   | Create new users  |
| delete_user                   | SECURITY ALERT: Delete existing users  |
| system_information            | Enter the system-information (about) screen  |
| system_configuration          | Configure global Kimai settings |
| plugins                       | Access the plugin administration  |
| view_tag                      | Access the tag administration  |
| manage_tag                    | Edit existing and create new tags in the administration  |
| delete_tag                    | Delete existing tags  |
| edit_exported_timesheet       | Edit and delete timesheet records which were exported  |
| role_permissions              | SECURITY ALERT: view and change permissions for user roles, create and delete user roles  |
| edit_teamlead_activity        | Allows teamleads to edit activities for assigned projects/customers (since 1.2)  |
| budget_teamlead_activity      | Allows teamleads to see the budget reports for activities of assigned projects/customers (since 1.2)  |
| delete_teamlead_activity      | Allows teamleads to delete activities of assigned projects/customers (since 1.2)  |
| edit_team_activity            | Allows team-members to edit activities of assigned projects/customers (since 1.2)  |
| budget_team_activity          | Allows team-members to see the budget reports for activities of assigned projects/customers (since 1.2)  |
| permissions_project           | Allows to edit the teams for assigned projects or projects of assigned customers (since 1.2)  |
| view_teamlead_project         | Allows teamleads to access projects administration (since 1.2)  |
| edit_teamlead_project         | Allows teamleads to edit assigned projects or projects for assigned customers (since 1.2)  |
| budget_teamlead_project       | Allows teamleads to see the budget reports for assigned projects or projects of assigned customers (since 1.2)  |
| permissions_teamlead_project  | Allows teamleads to edit the teams for assigned projects or projects of assigned customers (since 1.2)  |
| delete_teamlead_project       | Allows teamleads to delete assigned projects or projects for assigned customers (since 1.2)  |
| view_team_project             | Allows team-members to access projects administration (since 1.2)  |
| edit_team_project             | Allows team-members to edit assigned projects or projects for assigned customers (since 1.2)  |
| budget_team_project           | Allows team-members to see the budget reports for assigned projects or projects of assigned customers (since 1.2)  |
| permissions_customer          | Allows to edit the teams for assigned customers (since 1.2)  |
| view_teamlead_customer        | Allows teamleads to access project administration (since 1.2)  |
| edit_teamlead_customer        | Allows teamleads to edit assigned customers (since 1.2)  |
| budget_teamlead_customer      | Allows teamleads to see the budget reports for assigned customers (since 1.2)  |
| permissions_teamlead_customer | Allows teamleads to edit the teams for assigned customers (since 1.2)  |
| delete_teamlead_customer      | Allows teamleads to delete assigned customers (since 1.2)  |
| view_team_customer            | Allows team-members to access project administration (since 1.2)  |
| edit_team_customer            | Allows team-members to edit assigned customers (since 1.2)  |
| budget_team_customer          | Allows team-members to see the budget reports for assigned customers (since 1.2)  |
| view_team                     | See team management (since 1.2)  |
| edit_team                     | Edit team assignments (since 1.2)  |
| create_team                   | Create new teams (since 1.2)  |
| delete_team                   | Delete existing teams (since 1.2)  |
| view_team_member              | View the teamlead and members for the teams of the current user (since 1.4)  |
| details_customer              | View customer details (account number, vat, rates, meta-fields, assigned teams & users) (since 1.7)  |
| comments_customer             | Show posted comments for customers. For adding/changing comments you need the `edit_customer` permission (since 1.7)  |
| details_project               | View project details (Order number & date, start and end date, rates, assigned teams & users) (since 1.7)  |
| comments_project              | Show posted comments for projects. For adding/changing comments you need the `edit_project` permission (since 1.7)  |
| lockdown_grace_timesheet      | All records in the last lockdown period can be edited, even after the grace period ended (since 1.10)  |
| lockdown_override_timesheet   | None of the lockdown rules apply (since 1.10)  |
| view_all_data                 | SECURITY ALERT: Allows to see all data (overwrites team permissions) - SUPER_ADMINS will always own that permission (since 1.10)  |
| view_teamlead_activity        | Allows teamleads to access activity administration (since 1.10)  |
| view_team_activity            | Allows team-members to access activity administration (since 1.10)  |
| permissions_teamlead_activity | Allows teamleads to edit the teams for assigned activities (since 1.10)  |
| permissions_activity          | Allows to edit the teams for assigned activities (since 1.10)  |
| view_reporting                | Gives access to the reporting screen (since 1.10)  |

**Be aware**
There are other business rules which might limit access to certain functions, so these permissions are not the only checks in place.
For example timesheet records which were exported cannot be edited any longer, even if a user has the `edit_own_timesheet` 
or `edit_other_timesheet` permission. 
