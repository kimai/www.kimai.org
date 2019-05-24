---
title: Permissions
description: Configure the permission system which is based on user roles 
toc: true
---

Kimai 2 provides a flexible permissions system, which is based on [user roles]({% link _documentation/users.md %}) and 
can be adapted through your [local.yaml]({% link _documentation/configurations.md %}) config file.

## Understanding permission structure

Before you learn to configure the permission system, you have to understand the three involved config types:

1. `Permission sets` - a re-usable mapping of a free choosable name (e.g. "TEST") to a list of: 
  - one or more "permission names" (e.g. "test")
  - one or more "permission sets" (e.g. "@TEST")
  - one or more "negated permission names" (e.g. "!test")
2. `Permission maps` - a mapping of a role name to a list of "permission sets" (e.g. "TEST)
3. `Permissions` - a mapping of a role name to a list of:
  - one or more "permission names" (e.g. "test")
  - one or more "negated permission names" (e.g. "!test")

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

## Configure permissions

Knowing that many companies need a different combination of allowed permissions than the default ones, 
you might also want to change the pre-configured permission.

### With 1.0 and later

In most cases you just want to adjust single permissions, like remove or add single permissions them to a user role. 
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

You cannot extend existing sets, if you define them, they will be overwritten with your config.
Therefor it is **not** recommended to overwrite any existing `set` but create new ones. 
Please start their name with a prefix like 'CUSTOM_':
```yaml
kimai:
    permissions:
        sets:
            CUSTOM_ROLE_USER: ['ROLE_USER', 'TAGS']
        maps:
            ROLE_USER: ['CUSTOM_ROLE_USER']
```


### Before 1.0

The following applied to Kimai 0.9 and before. You can ignore it if you are using Kimai 1.0 or above!

You can adjust the permissions in your [local.yaml]({% link _documentation/configurations.md %}). 
Define the permissions like we did in the above mentioned example, 
you should start by copying the default permissions from `kimai.yaml`.

Be aware: if you configure your own permission definition, you have to overwrite the complete 
node (`sets`, `maps` or`roles`) that you edited and define all SETS and/or ROLES.

## Existing maps

By default each roles owns only one set, which is called like the user role itself:

```yaml
kimai:
    permissions:
        maps:
            ROLE_USER: ['ROLE_USER']
            ROLE_TEAMLEAD: ['ROLE_TEAMLEAD']
            ROLE_ADMIN: ['ROLE_ADMIN']
            ROLE_SUPER_ADMIN: ['ROLE_SUPER_ADMIN']
```

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
| system_configuration          | Configure global Kimai settings (since 0.9) |
| plugins                       | see all installed plugins (since 0.9)  |
| view_tag                      | use tag administration (since 1.0)  |
| delete_tag                    | delete existing tags (since 1.0)  |
| edit_exported_timesheet       | allows to edit and delete records which were exported (since 1.0)  |
| role_permissions              | view the calculated permissions for user roles (since 1.0)  |

**Be aware**
There are other business rules which might limit access to certain functionalities, so these permissions are not the only checks in place.
For example timesheet records which were exported cannot be edited any longer, even if a user has the "edit_own_timesheet" or "edit_other_timesheet" permission. 
