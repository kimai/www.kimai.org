---
title: Users
description: User, roles and the authentication, registration and security system in Kimai
toc: true
canonical: /documentation/users.html
related:
  - user-preferences
---

A user can be part of a [team]({% link _documentation/teams.md %}), which can limit/extend the visibility of data.
Access to features within Kimai are handled by the [permission system]({% link _documentation/permissions.md %}), which is configurable through user roles.

## Avatars

There are two types of user avatars:

- `Auto generated avatar` - a circle with colored background and username initials inside
- `Image URL` - a user can configure an avatar URL in their profile (feature needs to be activated in [System > Settings]({% link _documentation/configurations.md %}))

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
activate it through [System > Settings]({% link _documentation/configurations.md %}). It is then available via a link in the login screen.

If a user enters his data (email, username and password) he will receive an email, with a confirmation link to activate the account.

You need to enable [email support]({% link _documentation/emails.md %}) to actually use this feature.

## Password reset

The reset password function is enabled by default, you can deactivate it through [System > Settings]({% link _documentation/configurations.md %}).

A user can reach it via a link from the login screen. After entering username or email-address, an email with a confirmation link will be sent.
This link needs to be clicked, afterwards the user can enter a new password.

You can configure two settings to influence the security:

- Token lifetime (in seconds: 3600 = 1 hour) - the allowed time before a link expires
- Retry pause (in seconds: 3600 = 1 hour) - the allowed time between multiple retries

You need to enable [email support]({% link _documentation/emails.md %}) to actually use this feature.

## Login

User can log-in with a username or email.

If you activate the `Remember me` option, you can use the most common functions within the next time without a new login.

### Remember me login

If you have chosen to log-in with the `Remember me` option, your login will be extended to one week ([default value configured in security.yaml]({{ site.kimai_v2_file }}/config/packages/security.yaml)).
After coming back and being remembered you have access to all the following features:

- view your own timesheet
- start and stop new records
- edit existing records

If you are an administrator, you will see all your allowed options in the menu, but will be redirected to the login
form when you try to access them. This is a security feature to prevent abuse in case you forgot to logout in public
environments.

### Admin password forgotten

If you lost your admin password and don't have another admin account to reset it and deactivated the "forgot password" function,
you can use the following console command:

```bash
bin/console kimai:user:password
```
