---
title: OIDC
description: How to use OIDC authentication with Kimai
canonical: /documentation/oidc.html
---

Kimai supports authentication via an OIDC provider of your choice. OIDC users will be imported during the first login with their attributes and groups.

## Installation

In order to use the OIDC authentication, you have to add the following configuration to your
[local.yaml]({% link _documentation/local-yaml.md %})
and [reload the cache]({% link _documentation/cache.md %}) afterwards:

```yaml
kimai:
    oidc:
        activate: true
        title: Login with OIDC
        provider_url: https://auth.example.com
        client_id: example-client-id
        client_secret: example-client-secret
        # Optionally provide mapping between groups in your OIDC provider and Kimai roles (ROLE_USER is added automatically)
        # If you do not provide this then new users will only have ROLE_USER and existing users will not change their Kimai role
        roles:
            resetOnLogin: true
            mapping:
                - { oidc: Admin, kimai: ROLE_SUPER_ADMIN }
                - { oidc: Manager, kimai: ROLE_ADMIN }
                - { oidc: Teamlead, kimai: ROLE_TEAMLEAD }
```  

## Configuration details

A brief description of the available fields:
- `activate` (bool) activates the OIDC authentication flow
- `title` (string) the name of the Login button in the authentication screen
- `provider_url` (string) the URL of the OIDC provider. This will just be the base URL of the provider, sometimes referred to as the "issuer url"
- `client_id` (string) the client ID setting from your OIDC provider
- `client_secret` (string) the client secret setting from your OIDC provider
- `roles` (array) optional settings related to the user roles syncing
    - `resetOnLogin` (bool) if `true` all user roles will be reset upon login and synced with the OIDC roles, if `false` you can configure user roles in Kimai and only the mapped ones will be forced when the user logs-in (other roles will stick with the user)
    - `mapping` (array) an array of role name mappings. The `oidc` key is your OIDC role name (here `Admin` and `Manager`) and the key `kimai` (here `ROLE_ADMIN` and `ROLE_TEAMLEAD`) is the role name in Kimai. Unmapped roles from the OIDC message will be IGNORED even if they are existing in Kimai.

{% alert %}User data and roles are synchronized during each login.{% endalert %}
{% alert %}Every user automatically owns the ROLE_USER role, you don't have to create a mapping for it.{% endalert %}

## Known limitations

A manually registered user can log in via OIDC, but his account is then migrated to **OIDC only**,
so he can't log in via password any longer.
Additionally, all configured OIDC attributes will be applied.
To change such an account back to "password login", you need to update the `auth` column in the `kimai2_users` table and set the value from `oidc` to `kimai`.

## Using OIDC only

If OIDC is activated, you can turn off the login form entirely by unchecking the `Login form` configuration under `Authentication` at [System → Settings]({% link _documentation/configurations.md %}).

## Troubleshooting

### API access does not work after changing to OIDC

If you previously used local accounts and then switched to OIDC. 
Your user account might be migrated to a new username, which is used during the API authentication.

Please check the username in your user profile and use it for API authentication.
