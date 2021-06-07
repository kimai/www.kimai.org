---
title: Users
description: User, roles and the authentication, registration and security system in Kimai
toc: true
canonical: /documentation/users.html
---

## Permissions

The permission system is configurable through user roles. Find further information in the [permissions]({% link _documentation/permissions.md %}) chapter.

## Teams 

A user can be part of a team, which can limit/extend the visibility of data. See the [team documentation]({% link _documentation/teams.md %}) to find out more. 

## Avatars

There are three type of user avatars:

- Self chosen: user configures an avatar URL in its profile (e.g. to Github, Google, Youtube, Dropbox, Gravatar and many other sources. Make sure to explain the privacy implications when using this method.)  
- Auto generated avatar: colored background + username initials (required dependencies: `gd` extension with freetype-support + write permission on avatar directory)
- Fallback avatar: a static icon, which will be used if the user didn't choose a custom icon and the avatar generation failed  

## Roles

There are four pre-defined roles in Kimai, which define the ACLs/permissions.

| Role name         | Description                                                                                                                   |
|---                |---                                                                                                                            |
| ROLE_USER         | Normal user can track their working times, see basic reports and change their own preferences                                 |
| ROLE_TEAMLEAD     | Manages [teams]({% link _documentation/teams.md %}) with permissions for invoices and access to all **team** timesheets       |
| ROLE_ADMIN        | Can manage all content and timesheet related data, but lack user administration and system privileges                         |
| ROLE_SUPER_ADMIN  | Has permissions to manage everything in Kimai, from content to timesheets to users, plugins and system configurations         |

{% include alert.html type="success" alert="Every user is automatically member of the ROLE_USER, this behaviour cannot be changed." %}

{% include alert.html type="warning" alert="ROLE_ADMIN and ROLE_SUPER_ADMIN are special roles and treated different internally: they are not bound to team permissions and can see all content, no matter what their team assignments looks like." %}

The applied permissions of your Kimai installation can be seen via the user administration, 
e.g. [https://demo.kimai.org/en/admin/permissions](https://demo.kimai.org/en/admin/permissions).

### Creating new roles

If the pre-defined roles are not sufficient for your use-case and you need more roles, you can create new ones.

{% include alert.html type="warning" alert="Allowed character are: `A-Z` and `_`. If you use different character, you might experience strange bugs." %}

Every user with the [permission]({% link _documentation/permissions.md %}) `role_permissions` can create new user roles 
through the user administration. Navigate to the user role permission screen and check the pages action. 

There is a button that will open a new modal, to enter a role name. This new role will show up in the table after saving.

By clicking the `Yes` and `No` labels in the table, you can toggle all permissions. 

> This new screen was added with Kimai 1.6. 
> If you created new roles through `local.yaml` before, please remove them and use the admin screen exclusively.

## Filter and search 

The search drop-down supports filtering by the fields:
- `role`
- `state` (active, deactivated, all)

Besides these filters, you can query for a free search term, which will be searched in the fields:
- `username`
- `alias`
- `title`
- `email`

Additionally, you can filter for [user preferences]({% link _documentation/user-preferences.md %}) by using a search phrase like `location:homeoffice`.
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

## User registration

User registration is disabled by default, as most Kimai installations are available through the public internet.

If your Kimai installation is protected otherwise (e.g. internal network or other authentication mechanism) you can 
activate it through the `Settings` screen. It is then available via a link in the login screen.

If a user enters his data (email, username and password) he will receive an email, with a confirmation link to activate the account.  

You need to enable [email support]({% link _documentation/emails.md %}) to actually use this feature.

## Password reset

The reset password function is enabled by default, you can deactivate it through the `Settings` screen.

A user can reach it via a link from the login screen. After entering username or email-address, an email with a confirmation link will be sent.
This link needs to be clicked, afterwards the user can enter a new password.

You can configure two settings to influence the security:

- Token lifetime (in seconds: 3600 = 1 hour) - the allowed time before a link expires
- Retry pause (in seconds: 3600 = 1 hour) - the allowed time between multiple retries
  
You need to enable [email support]({% link _documentation/emails.md %}) to actually use this feature.

## Login

User can log-in with username or email.

If you activate the `Remember me` option, you can use the most common functions within the next time without a new login.

### Remember me login

If you have chosen to log-in with the `Remember me` option, your login will be extended to one week (default value).
After coming back and being remembered you have access to all the following features:
 
- view your own timesheet
- start and stop new records
- edit existing records

If you are an administrator, you will see all your allowed options in the menu, but will be redirected to the login 
form when you try to access them. This is a security feature to prevent abuse in case you forgot to logout in public 
environments.

The default period for the `Remember me` option can be changed in the config file [security.yaml]({{ site.kimai_v2_file }}/config/packages/security.yaml). 

### Session lifetime

By default, Kimai uses the PHP session lifetime configured on your server (normally in `php.ini`).

If you want to change the session lifetime (eg. to prevent automatic logout during the workday or to prevent CSRF errors), 
you can either adjust the settings for PHP directly ([see PHP docs](https://www.php.net/manual/en/session.configuration.php)) 
or you can explicitly set it for Kimai.

You need to add the following settings to your [local.yaml]({% link _documentation/configurations.md %}):

```yaml
framework:
    session:
        gc_maxlifetime: 3600
        cookie_lifetime: 3600
```

The values above (here `3600`) are seconds, the above configuration would be rather strict and automatically logout the user after 1 hour.

Another example would be:

```yaml
framework:
    session:
        gc_maxlifetime: 36000
        cookie_lifetime: ~
```

Explanation: the session should last 10 hours with a session cookie that is deleted upon browser restart (every browser restart forces a new login).

See also: 
- [Symfony documentation](https://symfony.com/doc/current/reference/configuration/framework.html#session)
- [PHP documentation](https://www.php.net/manual/en/session.configuration.php)

### Admin password forgotten

If you lost your admin password and don't have another admin account to reset it and deactivated the "forgot password" function, 
you can use the following console command:

```bash
bin/console kimai:user:password
```
