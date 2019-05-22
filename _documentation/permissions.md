---
title: Permissions
description: Configure the permission system which is based on user roles 
toc: true
---

Kimai 2 provides a flexible permissions system, which is based on [user roles]({% link _documentation/users.md %}) and 
can be adapted through your [local.yaml]({% link _documentation/configurations.md %}) config file.

## Understanding permission structure

Before you learn to configure the permission system, you have to understand the three involved config types:

1. `Permission sets` define a re-usable name for a list of "permission names"
2. `Permission maps` will apply a list of "permission sets" to a "user role"
3. `Permissions` apply a list of "permission names" to a "user role" 

An example and its explanation:

```yaml
    permissions:
        sets:
            ACTIVITY: [view_activity,create_activity]
            TIMESHEET: [view_own_timesheet,start_own_timesheet]
        maps:
            ROLE_USER: [TIMESHEET]
            ROLE_ADMIN: [TIMESHEET,ACTIVITY]
        roles:
            ROLE_USER: [my_profile]
            ROLE_ADMIN: [my_profile,start_other_timesheet]
```

In `sets` we define the two `permissions sets` names "ACTIVITY" and "TIMESHEET". In `maps` we now apply the `permission set` 
called "TIMESHEET" to the user-role "ROLE_USER" and the two `permission sets` called "TIMESHEET" and "ACTIVITY" to the user-role "ROLE_ADMIN".

At this step the roles have the following permissions:

- `ROLE_USER` - view_own_timesheet, start_own_timesheet
- `ROLE_ADMIN` - view_own_timesheet, start_own_timesheet, view_activity, create_activity

As last step, a list of `permission names` will be added to the list of calculated permissions.
We added the permission "my_profile" to the user-role "ROLE_USER" and the two permissions "my_profile" and "start_other_timesheet" to the user-role "ROLE_ADMIN".

At the end the system calculated the final list of permissions:  

- `ROLE_USER` - view_own_timesheet, start_own_timesheet, my_profile
- `ROLE_ADMIN` - view_own_timesheet, start_own_timesheet, view_activity, create_activity, my_profile, start_other_timesheet

## Existing permissions

The permission-names were chosen to be self-explanatory. Here is the full list of existing permissions with short descriptions:

| Permission name               | Description |
|---                            |---|
| view_activity                 | allows access to the activity administration  |
| create_activity               | allows to create a new activity  |
| edit_activity                 | allows to edit existing activities  |
| delete_activity               | allows to delete activities  |
| view_project                  | allows access to the project administration  |
| create_project                | allows to create a new project  |
| edit_project                  | allows to edit existing projects  |
| delete_project                | allows to delete existing projects  |
| view_customer                 | allows access to the customer administration  |
| create_customer               | allows to create new customers  |
| edit_customer                 | allows to edit existing customers  |
| delete_customer               | allows to delete existing customers  |
| view_invoice                  | allows access to the invoice section  |
| create_invoice                | allows to create a new invoice  |
| view_invoice_template         | allows access to the invoice and invoice template section  |
| create_invoice_template       | allows to create a new invoice template |
| edit_invoice_template         | allows to edit existing invoice templates |
| delete_invoice_template       | allows to delete existing invoice templates  |
| view_own_timesheet            | allows access to the own timesheet views  |
| start_own_timesheet           | allows to create a running timesheet record (restart and create)  |
| stop_own_timesheet            | allows to stop the own running timesheets records  |
| create_own_timesheet          | allows to create a new timesheet record  |
| edit_own_timesheet            | allows to edit own timesheet records  |
| export_own_timesheet          | export your own timesheet in the timesheet panel  |
| delete_own_timesheet          | delete own timesheet records  |
| view_other_timesheet          | allows access to the timesheet view listing records for all users |
| start_other_timesheet         | start timesheet records for other users  |
| stop_other_timesheet          | stop running timesheet records of other users  |
| create_other_timesheet        | create a new timesheet record in the name of another user  |
| edit_other_timesheet          | edit existing records of other users  |
| export_other_timesheet        | export timesheet in the timesheet admin panel  |
| delete_other_timesheet        | allows to delete timesheets of other users  |
| view_rate_own_timesheet       | view the rates for own timesheet records (fixed, hourly and total)  |
| edit_rate_own_timesheet       | edit the rates for own timesheet records (fixed, hourly and total) |
| view_rate_other_timesheet     | view the rates for other users timesheet records (fixed, hourly and total)  |
| edit_rate_other_timesheet     | edit the rates for other users timesheet records (fixed, hourly and total) |
| view_export                   | allows access to the export module|
| create_export                 | allows to create an export from the selected timesheet data  |
| edit_export_own_timesheet     | set the export state of your own timesheet record  |
| edit_export_other_timesheet   | set the export state of for other users timesheet records  |
| view_own_profile              | _virtual permission, which is always true_ |
| edit_own_profile              | _virtual permission, which is always true_  |
| password_own_profile          | _virtual permission, which is always true_  |
| preferences_own_profile       | _virtual permission, which is always true_  |
| roles_own_profile             | SECURITY ALERT: grants access to the own roles  |
| api-token_own_profile         | grants access to change the own API token  |
| view_other_profile            | allows to view the other users profile  |
| edit_other_profile            | SECURITY ALERT: allows to edit the profile for another user  |
| password_other_profile        | allows to change the password for another user  |
| roles_other_profile           | SECURITY ALERT: allows to change roles for other users |
| preferences_other_profile     | allows to change the preferences for another user  |
| api-token_other_profile       | allows to set the API login token for other users  |
| hourly-rate_own_profile       | allows to edit the own user specific hourly rate  |
| hourly-rate_other_profile     | allows to edit other users specific hourly rate  |
| view_user                     | allows to access the User administration and see the list of all users  |
| create_user                   | allows to create new users  |
| delete_user                   | allows to delete existing users  |
| system_information            | allows to enter the system-information (about) screen (since 0.9) |
| system_actions                | allows to execute system relevant actions in the about screen (since 0.9)  |
| system_configuration          | Configure global Kimai settings (since 0.9) |
| plugins                       | see all installed plugins (since 0.9)  |
| view_tag                      | use tag administration (since 1.0)  |
| delete_tag                    | delete existing tags (since 1.0)  |
| edit_exported_timesheet       | allows to edit and delete records which were exported (since 1.0)  |

**Be aware**
There are other business rules which might limit access to certain functionalities, so these permissions are not the only checks in place.
For example timesheet records which were exported cannot be edited any longer, even if a user has the "edit_own_timesheet" or "edit_other_timesheet" permission. 

## Configure permissions

Knowing that many companies need a different combination of allowed permissions than the default ones, you might also 
want to change the pre-configured permission.

You can do that in your [local.yaml]({% link _documentation/configurations.md %}). Define the permissions like we did in the above mentioned example, 
you might start by copying the default permissions from `kimai.yaml`.

Be aware: if you configure your own permission definition, you have to overwrite the complete 
node (`sets`, `maps` or`roles`) that you edited and define all SETS and/or ROLES.
