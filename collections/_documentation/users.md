---
title: Users
description: User, roles and the authentication, registration and security system in Kimai
canonical: /documentation/users.html
related:
- user-preferences
---

A user can be part of a [team]({% link _documentation/teams.md %}), which can limit/extend the visibility of data.
Access to certain features within Kimai are handled by the [permission system]({% link _documentation/permissions.md %}), which is configurable through user roles.

## Create users

{% include youtube-video.html id="create_users" %}

## Avatars

There are two types of user avatars:

- `Auto generated avatar` - a circle with colored background and username initials inside
- `Image URL` - a user can configure an avatar URL in their profile (feature needs to be activated in [System → Settings]({% link _documentation/configurations.md %}))

## Deactivated users

If you uncheck the `Active` checkbox when editing the user profile and save:
- the user will be hidden from the user listing => but you can display them again by using the search and selecting `Both` or `no` from the `Active` dropdown
- the user won't be displayed in most dropdowns and reports
- the user cannot log in to Kimai

A user can be re-activated at any time. The logged-in user cannot deactivate his own profile.

If you want to see all deactivated accounts, please switch to the user listing (at System > Users) and choose `Active = No` in the filter dropdown.

{% include youtube-video.html id="deactivated_users" %}

## System accounts

System accounts are users in Kimai, which are hidden in many places. They cannot be chosen from dropdowns, 
will be hidden in reports and more.

This setting is primarily meant to identify:

- your Admin accounts (which should not be used for daily work)
- API sync accounts

If you edit the users profile, there is a checkbox that says `System-Account` (Will be hidden in reports and dropdowns).
Toggle it to either hide (active) or show (inactive) the user. 

## Username / User-ID

The username is a system-wide unique identifier which can be used for logging into the system and it will be included in exports.

It shouldn't be changed without strong reasoning, but if you want to e.g. activate LDAP or SAML and see that you have to, 
then a System-Administrator can do so by editing the user profile (editing your own username is not possible).

The field is hidden by default, you have to double-click the user header to show it.  

{% include youtube-video.html id="change_username" %}

You should have a strong reasoning to change the username, e.g. think about API integrations and App logins.

## Supervisor

The supervisor setting is used notifications, e.g. work-contract related features, approval workflows and such.

## Staff number

The staff/account number appears in Exports and can be used to link users from your HR software to Kimai. 

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

User can log in with a username or email. Administrators can activate different login methods (like LDAP or SAML) as well.

Your login works for at least [one week]({{ site.kimai_v2_file }}/config/packages/security.yaml) in the `Remember me` mode.
After coming back and being remembered you have access to all the following features:

- view your own timesheet
- start and stop new records
- edit existing records

If you are an administrator, you will see all your allowed options in the menu, but will be redirected to a special confirmation/login
form when you try to access them. This is a security feature to prevent abuse in case you forgot to log-out in public environments.

## Two-Factor authentication

Kimai supports 2FA (Two-Factor) authentication via TOTP tokens.

The basic flows looks as this: 
- You scan a QR code in your Kimai user preferences screen with a TOTP supporting app
- Your app will show you a confirmation code, which then needs to be entered in Kimai
- If the code was correct, Kimai will enable 2FA for your account 
- The next time you log-in, you will have to open your app and enter the current confirmation code before entering Kimai 

The 2FA-mode can be enabled per account, settings can be accessed by the user himself or by any Super-Admin.

The two-factor authentication can be enabled by all users, even for SAML accounts. 

## Troubleshooting

### Cannot create user

If you try to create a user and see an error message like `The email is already used` or `The username is already used`
it is very likely, that this account was deactivated in the past. Deactivation does not remove a user from Kimai,
it just hides it from all views and listing.

You can reactivate the account by going to the [User administration]({% link _documentation/users.md %}), open the
search and choose the value `Both` or `No` for the search option `Active`. The resulting list will include all
deactivated users which can be reactivated by editing them and checking the `Active` checkbox.

### Recorded times are wrong

Please read the [user preferences documentation]({% link _documentation/user-preferences.md %}) especially the part about **timezones**.

The timezone is a user-specific setting and every user can have its own timezone setting.
Don't mix this up with the system specific configuration for new customers.

## Permissions

{% include documentation/permissions.md id="user" title=true %}
{% include documentation/permissions.md id="user_own_profile" title=true %}
{% include documentation/permissions.md id="user_other_profile" title=true howto=true %}
