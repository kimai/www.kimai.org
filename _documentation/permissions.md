---
title: Permissions
description: Configure the permission system which is based on user roles 
toc: true
---

Kimai provides a flexible permissions system, which is based on [user roles]({% link _documentation/users.md %}) and permissions, 
which can be turned on and off for these roles. You need the `role_permissions` permission to access it.

This permission system limits access to the functionality of Kimai. If you are looking for a way to limit access to  
timesheets, activities, projects and customers read the [Team permission documentation]({% link _documentation/teams.md %}). 

{% include alert.html icon="fas fa-exclamation" type="warning" alert="You can change the permissions with the administration screens in the Roles admin page." %}

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

## Plugin permissions

Developer can add/change permissions through plugins, see [Developers documentation]({% link _documentation/developers.md %}).

## Permission configuration in local.yaml

Since Kimai 1.6 there is generally no reason for changing the default permission through the [local.yaml]({% link _documentation/configurations.md %}).
It can be considered bad practice, as it can lead to problems with future updates.

### Understanding permission structure

Before you learn to configure the permission system, you have to understand the three involved config types:

1. `Permission sets` - a re-usable mapping of a free choosable name (e.g. `TEST`) to a list of: 
  - one or more "permission names" (e.g. `test`)
  - one or more "permission sets" (linking other sets can be achieved by prepending an `@`, e.g. `@TEST`)
  - one or more "negated permission names" (prepend an `!` to negate a permission, e.g. `!test`)
2. `Permission maps` - a mapping of a role name to a list of "permission sets" (no `@` required here, e.g. `TEST`)
3. `Permissions` - a mapping of a role name to a list of:
  - one or more "permission names" (e.g. `test`)
  - one or more "negated permission names" (e.g. `!test`)

An example and its explanation:

```yaml
    permissions:
        sets:
            ACTIVITY: ['view_activity', 'create_activity']
            TIMESHEET: ['view_own_timesheet', 'start_own_timesheet']
            PROFILE: ['my_profile', 'show_roles', 'other_profiles']
            EXAMPLE: ['@PROFILE', '@ACTIVITY']
            EXAMPLE_USER: ['@PROFILE', '!show_roles']
        maps:
            ROLE_USER: ['TIMESHEET', 'EXAMPLE_USER']
            ROLE_ADMIN: ['TIMESHEET', 'EXAMPLE']
        roles:
            ROLE_USER: ['!other_profiles']
            ROLE_ADMIN: ['delete_activity']
```

- In `sets` we define the `permissions sets` names "ACTIVITY", "TIMESHEET", "PROFILE" and "EXAMPLE".
- The `set` called "EXAMPLE" inherits the other `sets` called "PROFILE" and "ACTIVITY", so its contains 
the permissions: my_profile, show_roles, other_profiles, view_activity , create_activity.
- The `set` called "EXAMPLE_USER" inherits the `set` called "PROFILE" and removes the permission "show_roles", so its contains 
the permissions: my_profile, other_profiles.
 
In `maps` we now apply the `permission set` called "TIMESHEET" and "EXAMPLE_USER" to the user-role "ROLE_USER" 
and the two `permission sets` called "TIMESHEET" and "EXAMPLE" to the user-role "ROLE_ADMIN".

At this step the roles have the following permissions:

- `ROLE_USER` - view_own_timesheet, start_own_timesheet, my_profile, other_profiles
- `ROLE_ADMIN` - view_own_timesheet, start_own_timesheet, my_profile, show_roles, other_profiles, view_activity, create_activity

As last step, the list of `permission names` will be merged with the list of previously calculated permissions.
We removed the permission "other_profiles" from the user-role "ROLE_USER" and added the permission "delete_activity" to the user-role "ROLE_ADMIN".

At the end the system calculated the final list of permissions:  

- `ROLE_USER` - view_own_timesheet, start_own_timesheet, my_profile
- `ROLE_ADMIN` - view_own_timesheet, start_own_timesheet, my_profile, show_roles, other_profiles, view_activity, create_activity, delete_activity

Yes, that could have been easier ;-) but I wanted to demonstrate all possibilities!

### Changing permissions

In most cases you just want to adjust single permissions, like remove from or add single permissions to a user role. 
This can be done by adding something like this to your [local.yaml]({% link _documentation/configurations.md %}):

```yaml
kimai:
    permissions:
        roles:
            ROLE_TEAMLEAD: ['!edit_invoice_template', 'delete_invoice_template']
```
This example removes `edit_invoice_template` and adds `delete_invoice_template` for the user role `ROLE_TEAMLEAD`.

If you want to go further and want to re-adjust which `sets` are applied to a user role, you have to overwrite the 
complete map for that role. Lets assume you want to redefine user permissions and allow full access to tags, 
then you edit your `local.yaml` like this:

```yaml
kimai:
    permissions:
        maps:
            ROLE_USER: ['ROLE_USER', 'TAGS']
```
As you overwrite the default map `ROLE_USER` by defining it, you have to apply the default set `ROLE_USER` and append the set `TAGS` (see below in "Existing maps").

Customizing sets is generally not recommended, as you should be able to achieve everything with `maps` and `permissions`. 
See below in "Existing sets". 

### Existing sets

Existing sets can be seen in `kimai.yaml`, their customization is generally not necessary. 
You cannot extend existing sets, if you define them, they will be overwritten with your config.
Therefor it is **not** recommended to overwrite any existing `set` but create new ones (start their name with a prefix like 'CUSTOM_'):
```yaml
kimai:
    permissions:
        sets:
            CUSTOM_ROLE_USER: ['@ROLE_USER', '@TAGS']
        maps:
            ROLE_USER: ['CUSTOM_ROLE_USER']
```

### Existing maps

By default each role owns only one set, which is called like the user role itself:

```yaml
kimai:
    permissions:
        maps:
            ROLE_USER: ['ROLE_USER']
            ROLE_TEAMLEAD: ['ROLE_TEAMLEAD']
            ROLE_ADMIN: ['ROLE_ADMIN']
            ROLE_SUPER_ADMIN: ['ROLE_SUPER_ADMIN']
```
