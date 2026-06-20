---
title: SAML
description: How to use SAML identity provider with Kimai
canonical: /documentation/saml.html
---

Kimai supports authentication via a SAML provider of your choice (for now it was tested with G Suite and MS Azure accounts).
SAML users will be imported during the first login with their attributes and groups.

## Installation

In order to use the SAML authentication, you have to add configurations changes to your
[local.yaml]({% link _documentation/local-yaml.md %}) (this example is for G Suite accounts):

```yaml
security:
    firewalls:
        secured_area:
            kimai_saml: ~

kimai:
    saml:
        activate: true
        title: Login with Google
        mapping:
            - { saml: $Email, kimai: email }
            - { saml: $FirstName $LastName, kimai: alias }
        roles:
            attribute: Roles
            mapping:
                - { saml: Admins, kimai: ROLE_ADMIN }
                - { saml: Management, kimai: ROLE_TEAMLEAD }
        connection:
            # You SAML provider, here an example for Google
            idp:
                entityId: 'https://accounts.google.com/o/saml2?idpid=your-google-id'
                singleSignOnService:
                    url: 'https://accounts.google.com/o/saml2/idp?idpid=your-google-id'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
                # google does not support single logout, so it needs to be commented
                # the "single logout" feature was not yet tested, if you want to help, please let me know!
                #singleLogoutService:
                #    url: 'https://127.0.0.1:8010/logout'
                #    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
                x509cert: 'ADD YOUR MULTI-LINE CERTIFICATE CONTENT HERE
                           ADD YOUR MULTI-LINE CERTIFICATE CONTENT HERE
                           ADD YOUR MULTI-LINE CERTIFICATE CONTENT HERE
                           ADD YOUR MULTI-LINE CERTIFICATE CONTENT HERE
                           ADD YOUR MULTI-LINE CERTIFICATE CONTENT HERE'
            # Your Kimai instance, replace https://127.0.0.1:8010 with your base URL
            sp:
                entityId: 'https://127.0.0.1:8010/auth/saml/metadata'
                assertionConsumerService:
                    url: 'https://127.0.0.1:8010/auth/saml/acs'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST'
                singleLogoutService:
                    url: 'https://127.0.0.1:8010/auth/saml/logout'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
                #privateKey: ''
            # only set baseurl, if auto-detection doesn't work
            #baseurl: ''
            strict: true
            debug: true
            security:
                nameIdEncrypted:       false
                authnRequestsSigned:   false
                logoutRequestSigned:   false
                logoutResponseSigned:  false
                wantMessagesSigned:    false
                wantAssertionsSigned:  false
                wantNameIdEncrypted:   false
                requestedAuthnContext: true
                signMetadata: false
                wantXMLValidation: true
                signatureAlgorithm: 'http://www.w3.org/2001/04/xmldsig-more#rsa-sha256'
                digestAlgorithm: 'http://www.w3.org/2001/04/xmlenc#sha256'
            contactPerson:
                technical:
                    givenName: 'Kimai Admin'
                    emailAddress: 'kimai-tech@example.com'
                support:
                    givenName: 'Kimai Support'
                    emailAddress: 'kimai-support@example.com'
            organization:
                en:
                    name: 'Acme'
                    displayname: 'Acme'
                    url: 'https://www.example.com'
```  

After changing the configuration you need to [re-build the cache]({% link _documentation/cache.md %}).

## Configuration details

```yaml
kimai:
    saml:
        activate: true
        title: Login with Google
        mapping:
            - { saml: $Email, kimai: email }
            - { saml: $FirstName $LastName, kimai: alias }
        roles:
            attribute: Roles
            mapping:
                - { saml: Admins, kimai: ROLE_ADMIN }
                - { saml: Management, kimai: ROLE_TEAMLEAD }
```

A brief description of the available fields:
- `activate` (bool) activates the SAML authentication flow
- `title` (string) the name of the red Login button in the authentication screen
- `mapping` (array) an array of attributes that will be synced with Kimai. The `kimai` value (`email` and `alias`) are the names in Kimai, the `saml` key (`$Email` and `$FirstName $LastName`) are the attributes from the SAML response. You can assign static values to every user (like `title` = `SAML User`) or you fetch one or more values from the SAML message (`$Email` refers to the SAML attribute `Email` and `$FirstName $LastName` refers to the two SAML attributes `$FirstName` and `$LastName`).
- `roles` (array) settings related to the user roles syncing
    - `attribute` (string) the SAML attribute whose values are used for syncing the groups
    - `mapping` (array) an array of role name mappings. The `saml` key is your SAML role name (here `Admins` and `Management`) and the key `kimai` (here `ROLE_ADMIN` and `ROLE_TEAMLEAD`) is the role name in Kimai. Unmapped roles from the SAML message will be IGNORED(!) even if they are existing in Kimai.

If you have troubles with your certificate you could [try to use this SAML online tool](https://www.samltool.com/format_x509cert.php) to find the correct formatting (whether you trust this tool is up to you!). You could use it with fake data, check the result format and then apply it to your certificate manually.

{% alert %}User data and roles are synchronized during each login.{% endalert %}
{% alert %}Every user automatically owns the ROLE_USER role, you don't have to create a mapping for it.{% endalert %}
{% alert warning %}Every user needs a username and email address, you cannot activate SAML without a mapping for the email. The username cannot be set from SAML attributes, but will always be taken from the SAML request.{% endalert %}

### Connection details

You can find more information about the connection configs in the [onelogin/php-saml](https://github.com/onelogin/php-saml#how-it-works) library that is used for the SAML connections.

### G Suite and roles (or groups)

If you want to sync user-roles as well, you have to know that Google doesn't support that out-of-the-box.
You need to setup additional user attributes and add those to the SAML attributes of your application.

Links:
- [Setup groups in G Suite](https://www.dynatrace.com/support/help/how-to-use-dynatrace/user-management-and-sso/manage-users-and-groups-with-saml/saml-gsuite/#preparing-group-mapping)
- [Creating custom attributes using the user schema](https://support.google.com/cloudidentity/answer/6327792?hl=en&ref_topic=7558947)

### Azure

For Azure, please check the [Azure SAML documentation]({% link _documentation/saml-azure.md %})

### Keycloak

For Keycloak, please check the [Keycloak SAML documentation]({% link _documentation/saml-keycloak.md %})

## Known limitations

A manually registered user can login via SAML, but his account is then migrated to **SAML only**,
so he can't login via password any longer.
Additional all configured SAML attributes will be applied.
To change such an account back to "password login", you need to update the `auth` column in the `kimai2_users` table and set the value from `saml` to `kimai`.

## Using SAML only

Kimai does not support **SAML only** out of the box, but you can disable the normal login flow yb redirecting the URLs to the SAML login.

This is an example for Apache:

```
RewriteEngine On
RewriteRule  /(..)/login /auth/saml/login [L,R=301]
```

## Troubleshooting

### Proxy and http vs https

**Error:**  
The response was received at `http://kimai-test.example.com/auth/saml/acs` instead of `https://kimai-test.example.com/auth/saml/acs`

**Solution:**  
Use the `baseurl` configuration and set it to `https://kimai-test.example.com/auth/saml/` (and flush the cache!)

