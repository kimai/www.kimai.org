---
title: Users
description: User, roles and the authentication, registration and security system in Kimai
canonical: /documentation/users.html
related:
- user-preferences
---

A user can be part of a [team]({% link _documentation/teams.md %}), which can limit/extend the visibility of data.
Access to certain features within Kimai are handled by the [permission system]({% link _documentation/permissions.md %}), which is configurable through user roles.

## Avatars

There are two types of user avatars:

- `Auto generated avatar` - a circle with colored background and username initials inside
- `Image URL` - a user can configure an avatar URL in their profile (feature needs to be activated in [System → Settings]({% link _documentation/configurations.md %}))

## Deactivated users

If you uncheck the `Active` checkbox when editing the user profile and save:
- the user will be hidden from the user listing => but you can display them again by using the search and selecting `Both` or `no` from the `Active` dropdown
- the user won't be displayed in most dropdowns and reports
- the user cannot log in to Kimai

A user can be re-activated at any time. The logged-in user cannot his own profile.

## Filter and search

The search supports filtering by the fields:
- `role`
- `state` (active, deactivated, all)

Besides these filters, you can query for a free search term, which will be searched in the fields:
- `username`
- `alias`
- `title`
- `email`

{% include snippets/search-custom-field.md %}

## User registration

User registration is disabled by default, as most Kimai installations are available through the public internet.

If your Kimai installation is protected otherwise (e.g. internal network or other authentication mechanism) you can
activate it through [System → Settings]({% link _documentation/configurations.md %}). The self-registration is then available via a link in the login screen.

If someone registers a new account with email, username and password an confirmation email will be sent, including a link that needs to be clicked before the account will be activated.
As this feature requires an email to work, you have to enable [email support]({% link _documentation/emails.md %}) to use it.

## Password reset

The reset password function is enabled by default, you can deactivate it through [System → Settings]({% link _documentation/configurations.md %}).

A user can reach it via a link from the login screen. After entering username or email-address, an email with a confirmation link will be sent.
This link needs to be clicked, afterwards the user can enter a new password.

You can configure two settings to influence the security:

- Token lifetime (in seconds: 3600 = 1 hour) - the allowed time before a link expires
- Retry pause (in seconds: 3600 = 1 hour) - the allowed time between multiple retries

As this feature requires an email to work, you have to enable [email support]({% link _documentation/emails.md %}) to use it.

## Login

User can log in with a username or email.

If you activate the `Remember me` option, you can use the most common functions within the next time without a new login.

### Remember me login

If you have chosen to log in with the `Remember me` option, your login will be extended to [one week]({{ site.kimai_v2_file }}/config/packages/security.yaml).
After coming back and being remembered you have access to all the following features:

- view your own timesheet
- start and stop new records
- edit existing records

If you are an administrator, you will see all your allowed options in the menu, but will be redirected to the login
form when you try to access them. This is a security feature to prevent abuse in case you forgot to logout in public
environments.
