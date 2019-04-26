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

In `sets` we define the two `permissions sets` names "ACTIVITY" and "TIMESHEET". In `maps` we apply the `permissions set`  
called "TIMESHEET" to the user-role "ROLE_USER" and the two `permissions set` called "TIMESHEET" and "ACTIVITY" to the user-role "ROLE_ADMIN".

At this step the roles have the following permissions:

- `ROLE_USER` - view_own_timesheet, start_own_timesheet
- `ROLE_ADMIN` - view_own_timesheet, start_own_timesheet, view_activity, create_activity

As last step, the list of `permission names` will be added to the list of calculated permissions.
So we add the permission "my_profile" to the user-role "ROLE_USER" and the two permissions "my_profile" and "start_other_timesheet" to the user-role "ROLE_ADMIN".

At the end the system calculated the final list of permissions:  

- `ROLE_USER` - view_own_timesheet, start_own_timesheet, my_profile
- `ROLE_ADMIN` - view_own_timesheet, start_own_timesheet, view_activity, create_activity, my_profile, start_other_timesheet

## Existing permissions

The permission-names were chosen to be self-explanatory. In the hope that it worked, here is the full list of existing permissions:

| Permission name | Set name | Description |
|---|---|---|
| view_activity | ACTIVITIES  | allows access to the activity administration  |
| create_activity | ACTIVITIES  | -  |
| edit_activity | ACTIVITIES  | -  |
| delete_activity | ACTIVITIES  | -  |
| view_project | PROJECTS  | allows access to the project administration  |
| create_project | PROJECTS  | -  |
| edit_project | PROJECTS  | -  |
| delete_project | PROJECTS  | -  |
| view_customer | CUSTOMERS  | allows access to the customer administration  |
| create_customer | CUSTOMERS  | -  |
| edit_customer | CUSTOMERS  | -  |
| delete_customer | CUSTOMERS  | -  |
| view_invoice | INVOICE  | allows access to the invoice section  |
| create_invoice | INVOICE  | -  |
| view_invoice_template | INVOICE_TEMPLATE  | allows access to the invoice and invoice template section  |
| create_invoice_template | INVOICE_TEMPLATE  | -  |
| edit_invoice_template | INVOICE_TEMPLATE  | -  |
| delete_invoice_template | INVOICE_TEMPLATE  | -  |
| view_own_timesheet | TIMESHEET  |  -  |
| start_own_timesheet | TIMESHEET  | allows to create a running timesheet record (e.g. restart or create without end)  |
| stop_own_timesheet | TIMESHEET  | -  |
| create_own_timesheet | TIMESHEET  |  allows to create a new timesheet record  |
| edit_own_timesheet | TIMESHEET  |  -  |
| export_own_timesheet | TIMESHEET  | export your own timesheet in the timesheet panel  |
| delete_own_timesheet | TIMESHEET  | -  |
| view_other_timesheet | TIMESHEET_OTHER  | allows access to the complete timesheet view  |
| start_other_timesheet | TIMESHEET_OTHER  | -  |
| stop_other_timesheet | TIMESHEET_OTHER  | -  |
| create_other_timesheet | TIMESHEET_OTHER  | -  |
| edit_other_timesheet | TIMESHEET_OTHER  |  -  |
| export_other_timesheet | TIMESHEET  | export timesheet in the timesheet admin panel  |
| delete_other_timesheet | TIMESHEET_OTHER  | -  |
| view_rate_own_timesheet | RATE  |  -  |
| edit_rate_own_timesheet | RATE  |  -  |
| view_rate_other_timesheet | RATE_OTHER  |  -  |
| edit_rate_other_timesheet | RATE_OTHER  |  -  |
| view_export | EXPORT  |  allows access to the export module|
| create_export | EXPORT  |  allows to create an export from the selected timesheet data  |
| edit_export_own_timesheet | EXPORT  |  set the export state of your own timesheet record  |
| edit_export_other_timesheet | EXPORT  |  set the export state of for other users timesheet records  |
| view_own_profile | PROFILE  | _virtual permission, which is always true_ |
| edit_own_profile | PROFILE  | _virtual permission, which is always true_  |
| password_own_profile | PROFILE  | _virtual permission, which is always true_  |
| preferences_own_profile | PROFILE  | _virtual permission, which is always true_  |
| roles_own_profile | PROFILE  | SECURITY ALERT: grants access to the own roles  |
| api-token_own_profile | PROFILE  | grants access to change the own API token  |
| view_other_profile | PROFILE_OTHER  | allows to view the other users profile  |
| edit_other_profile | PROFILE_OTHER  | SECURITY ALERT: allows to edit the profile for another user  |
| password_other_profile | PROFILE_OTHER  | allows to change the password for another user  |
| roles_other_profile | PROFILE_OTHER  | SECURITY ALERT: allows to change roles for other users |
| preferences_other_profile | PROFILE_OTHER  | allows to change the preferences for another user  |
| api-token_other_profile | PROFILE_OTHER  | allows to set the API login token for other users  |
| hourly-rate_own_profile | -  |  allows to edit the own user specific hourly rate  |
| hourly-rate_other_profile | -  |  allows to edit other users specific hourly rate  |
| view_user | USER  |  allows to access the User administration and see the list of all users  |
| create_user | USER  | allows to create new users  |
| delete_user | USER  | allows to delete existing users  |
| system_information | -  | allows to enter the system-information (about) screen  |
| system_actions | -  | allows to execute system relevant actions in the system-information (about) screen (depends on system_information)  |
| system_configuration | -  | Configure global Kimai settings  |
| plugins | -  | see all installed plugins  |

## Configure permissions

Knowing that many companies need a different combination of allowed permissions than the default ones, you might also 
want to change the pre-configured permission.

You can do that in your [local.yaml]({% link _documentation/configurations.md %}). Define the permissions like we did in the above mentioned example, 
you might start by copying the default permissions from `kimai.yaml`.

Be aware: if you configure your own permission definition, you have to overwrite the complete 
node (`sets`, `maps` or`roles`) that you edited and define all SETS and/or ROLES.
