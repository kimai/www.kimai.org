---
title: Users
description: User, roles and the authentication, registration and security system in Kimai
toc: true
---

## Permissions

The permission system is configurable through a configuration file. You can find further information in the [permissions]({% link _documentation/permissions.md %}) chapter.

## Teams 

A user can be part of a team, which can limit/extend the visibility of data where timesheets can be recorded for. See the [team documentation]({% link _documentation/teams.md %}) to find out more. 

## Roles

There are multiple pre-defined roles in Kimai, which define the ACLs/permissions.

| Role name         | Description |
|---                |---|
| ROLE_USER         | Normal user can track their working times, see basic reports and change their own preferences |
| ROLE_TEAMLEAD     | Manages [teams of users]({% link _documentation/teams.md %}) and has further permissions on invoices and access to all timesheets |
| ROLE_ADMIN        | Can manage all content and timesheet related data, but lack user administration and system privileges |
| ROLE_SUPER_ADMIN  | Has permissions to manage everything in Kimai, from content to timesheets to users, plugins and system configurations |

The applied permissions of your Kimai installation can be seen via the user administration, 
e.g. [https://demo.kimai.org/en/admin/user/permissions](https://demo.kimai.org/en/admin/user/permissions).

### Creating new roles

If the pre-defined roles are not sufficient for your use-case and you need more roles, you can create them by changing two files:
- in `config/packages/security.yaml` at `security.role_hierarchy`
- in `config/packages/local.yaml` at `kimai.permissions`

Lets create the new role `ROLE_SALES`:

```yaml
# config/packages/security.yaml
security:
    role_hierarchy:
        ROLE_SALES:       ~
        ROLE_TEAMLEAD:    ROLE_USER
        ROLE_ADMIN:       ROLE_TEAMLEAD
        ROLE_SUPER_ADMIN: ROLE_ADMIN
```
and:
```yaml
# config/packages/local.yaml
kimai:
    permissions:
        sets:
            ROLE_SALES: ['@ROLE_USER', '@TAGS']
        maps:
            ROLE_SALES: ['ROLE_SALES']
```

## Login

- User can login with username or email
- If you activate the `Remember me` option, you can use use the most common functions within the next days without a new login

Kimai uses the FOSUserBundle for security related tasks like user management. 
Its configuration can be found in [fos_user.yaml]({{ site.kimai_v2_file }}/config/packages/fos_user.yaml).

### Remember me login

If you have chosen to login with the `Remember me` option, your login will be extended to one week (default value).
After coming back and being remembered you have access to all the following features:
 
- view your own timesheet
- start and stop new records
- edit existing records

If you are an administrator, you will see all your allowed options in the menu, but will be redirected to the login 
form when you try to access them. This is a security feature to prevent abuse in case you forgot to logout in public 
environments.

The default period for the `Remember me` option can be changed in the config file [security.yaml]({{ site.kimai_v2_file }}/config/packages/security.yaml). 

### Session lifetime

If you want to change the session lifetime, you have to configure the framework configuration in 
`config/packages/framework.yaml` and add the key `framework.session.cookie_lifetime`.

So something along the lines:
```yaml
framework:
    session:
        handler_id:  session.handler.native_file
        save_path:   "%kernel.project_dir%/var/sessions/%kernel.environment%"
        cookie_lifetime: 60
```

See also: [Symfony documentation](https://symfony.com/doc/current/reference/configuration/framework.html#cookie-lifetime)

## User registration

User registration with instant approval is activated by default, so users can register and will be able to login and start time-tracking instantly.

If you want to disable the registration or enable email verification, read on ...

### Email activation

If you want your new users to use [email]({% link _documentation/emails.md %}) based activation add this to your `local.yaml`:

```yaml
fos_user:
    registration:
        confirmation:
            enabled: true
```

### Disable user registration 

If you want to disable the user registration, add this your `local.yaml`: 
```yaml
kimai:
    user:
        registration: false
```

If you only want to hide the link from the login form but keep the functionality, add this your `local.yaml`: 
```yaml
admin_lte:
    routes:
        adminlte_registration: ~
```

## Password reset

The reset password function is enabled by default, but you need to activate [email]({% link _documentation/emails.md %}) support if you want to use it.

If you want to deactivate this feature you have to change the following configs:

- in `config/packages/admin_lte.yaml` remove the route alias `admin_lte.routes.adminlte_password_reset` (this will remove the link from the login form)
- in `config/routes.yaml` remove the block `fos_user_resetting` (this will deactivate the functionality)

If you want to configure the behaviour (like the allowed time between multiple retries) then configure the settings:

- in `config/packages/fos_user.yaml` the key below `fos_user.registration.resetting` (see [documentation](https://symfony.com/doc/current/bundles/FOSUserBundle/configuration_reference.html))
- the values `retry_ttl` and `token_ttl` are configured in seconds (7220 = 2 hours) 

### Disable password reset 

If you want to disable the password reset, add this your `local.yaml`: 
```yaml
kimai:
    user:
        password_reset: false
```

If you only want to hide the link from the login form but keep the functionality, add this your `local.yaml`: 
```yaml
admin_lte:
    routes:
        adminlte_password_reset: ~
```


## Filter and search 

The search drop-down supports filtering by the fields:
- `role`
- `state` (active, deactivated, all)

Besides these filters, you can query for a free search term, which will be searched in the fields:
- `username`
- `alias`
- `title`
- `email`

Additionally you can filter for [user preferences]({% link _documentation/user-preferences.md %}) by using a search phrase like `location:homeoffice`.
This would find all users with the custom field `location` matching the term `homeoffice`.

The search terms will be found within the full value, so searching for `office` would find:
- `I love working in my office`
- `Office` 
- `This office is beautiful`
- `Our offices are very noisy`

You can mix the search term and use multiple meta-field queries:
- `location:homeoffice hello world` - find all users matching the search term `hello world` with the user-preference `location` matching the term `homeoffice` 
- `location:homeoffice contract:foo foo` - find all users matching the search term `foo` with the user-preference combination: `location` matching the term `homeoffice` and `contract` matching the term `foo` 
- `location:homeoffice contract:foo` - find all users with the user-preference combination: `location` matching the term `homeoffice` and `contract` matching the term `foo`
