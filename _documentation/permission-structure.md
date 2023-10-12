---
title: Permission structure
description: Configure the permission system which is based on user roles 
---

Kimai provides a flexible [permissions system]({% link _documentation/permissions.md %}), which is based on user roles.  

There is **no reason** for changing the default permission through your [local.yaml]({% link _documentation/local-yaml.md %}).
It can be considered bad practice, as it can lead to problems with future updates.

**You can change the permissions with the administration screens in the System > Roles page.**

## Plugin permissions

Developer can add/change permissions through plugins, see [Developers documentation]({% link _documentation/developers.md %}).

## How the config works

The Kimai configuration contains the entire permission configuration, which consists of the three types:

1. Permission `sets` - a re-usable mapping of a name (e.g. `FOO`) to an array of "permission names" (e.g. `bar`)
2. Permission `maps` - mappings of role names to an array of "permission sets" (e.g. `FOO`)
3. Permission `roles` - mappings of role names to an array of "permission names" (e.g. `bar`)

An example and with explanations:

```yaml
    permissions:
        sets:
            TIMESHEET: ['view_own_timesheet', 'start_own_timesheet']
            ACTIVITY: ['view_activity', 'create_activity']
            PROFILE: ['my_profile', 'show_roles', 'other_profiles']
        maps:
            ROLE_USER: ['TIMESHEET', 'ACTIVITY']
            ROLE_ADMIN: ['TIMESHEET', 'ACTIVITY', 'PROFILE']
        roles:
            ROLE_USER: ['my_profile']
            ROLE_ADMIN: ['delete_activity']
```

In `sets` we define the "permissions sets" names `ACTIVITY`, `TIMESHEET` and `PROFILE`
 
In `maps` we now apply the "permission set" called `TIMESHEET` and `ACTIVITY` to the user-role `ROLE_USER` 
and the three "permission sets" called `TIMESHEET` and `ACTIVITY` and `PROFILE` to the user-role `ROLE_ADMIN`.

At this step the roles have the following permissions:

- `ROLE_USER` - view_own_timesheet, start_own_timesheet, view_activity, create_activity
- `ROLE_ADMIN` - view_own_timesheet, start_own_timesheet, view_activity, create_activity, my_profile, show_roles, other_profiles

As last step, the list of "permission names" in the `roles` section will be merged with the list of previously calculated permissions.

At the end the system calculated the final list of permissions:  

- `ROLE_USER` - view_own_timesheet, start_own_timesheet, view_activity, create_activity, my_profile
- `ROLE_ADMIN` - view_own_timesheet, start_own_timesheet, view_activity, create_activity, my_profile, show_roles, other_profiles, delete_activity

## Existing sets

Existing sets can be seen in `kimai.yaml`, their customization is generally not necessary. 
You cannot extend existing sets, if you define them, they will be overwritten with your config.

Therefor it is **not** recommended to overwrite any existing `set` but create new ones (start their name with a prefix like 'CUSTOM_').
