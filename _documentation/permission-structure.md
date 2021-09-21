---
title: Permission structure
description: Configure the permission system which is based on user roles 
toc: true
---

Kimai provides a flexible [permissions system]({% link _documentation/permissions.md %}), which is based on user roles.  

{% include alert.html icon="fas fa-exclamation" type="warning" alert="You can change the permissions with the administration screens in the Roles admin page." %}

## Plugin permissions

Developer can add/change permissions through plugins, see [Developers documentation]({% link _documentation/developers.md %}).

## Permission configuration in local.yaml

Since Kimai 1.6 there is generally no reason for changing the default permission through the [local.yaml]({% link _documentation/local-yaml.md %}).
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
This can be done by adding something like this to your [local.yaml]({% link _documentation/local-yaml.md %}):

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
