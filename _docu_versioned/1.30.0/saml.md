---
title: SAML
description: How to use SAML identity provider with Kimai
canonical: /documentation/saml.html
related:
  - saml-authentik
  - saml-azure
  - saml-google
  - saml-keycloak
---

Kimai supports authentication via a SAML provider of your choice (for now it was tested with G Suite and MS Azure accounts).
SAML users will be imported during the first login with their attributes and groups.

## Installation

In order to use the SAML authentication, you have to add the following configuration to your
[local.yaml]({% link _documentation/local-yaml.md %})
and [reload the cache]({% link _documentation/cache.md %}) afterwards:

```yaml
kimai:
    saml:
        activate: true
        title: Login with SAML
        mapping:
            - { saml: $Email, kimai: email }
            - { saml: $FirstName $LastName, kimai: alias }
        roles:
            resetOnLogin: true
            attribute: Groups
            mapping:
                # Insert your role-mapping here (ROLE_USER is added automatically)
                - { saml: Admin, kimai: ROLE_SUPER_ADMIN }
                - { saml: Manager, kimai: ROLE_ADMIN }
                - { saml: Teamlead, kimai: ROLE_TEAMLEAD }
        connection:
            idp:
                entityId: 'https://accounts.google.com/o/saml2?idpid=your-google-id'
                singleSignOnService:
                    url: 'https://accounts.google.com/o/saml2/idp?idpid=your-google-id'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
                #singleLogoutService:
                #    url: 'https://www.example.com/logout'
                #    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
                x509cert: 'ADD YOUR MULTI-LINE CERTIFICATE CONTENT HERE
                           ADD YOUR MULTI-LINE CERTIFICATE CONTENT HERE
                           ADD YOUR MULTI-LINE CERTIFICATE CONTENT HERE
                           ADD YOUR MULTI-LINE CERTIFICATE CONTENT HERE
                           ADD YOUR MULTI-LINE CERTIFICATE CONTENT HERE'
            # Your Kimai: replace https://www.example.com with your base URL
            sp:
                entityId: 'https://www.example.com/auth/saml/metadata'
                assertionConsumerService:
                    url: 'https://www.example.com/auth/saml/acs'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST'
                singleLogoutService:
                    url: 'https://www.example.com/auth/saml/logout'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
                #privateKey: ''
            # only set baseurl, if auto-detection doesn't work
            #baseurl: ''
            strict: true
            debug: true
            security:
                nameIdEncrypted: false
                authnRequestsSigned: false
                logoutRequestSigned: false
                logoutResponseSigned: false
                wantMessagesSigned: false
                wantAssertionsSigned: false
                wantNameIdEncrypted: false
                requestedAuthnContext: true
                signMetadata: false
                wantXMLValidation: true
                signatureAlgorithm: 'http://www.w3.org/2001/04/xmldsig-more#rsa-sha256'
                digestAlgorithm: 'http://www.w3.org/2001/04/xmlenc#sha256'
            contactPerson:
                technical:
                    givenName: 'Kimai Admin'
                    emailAddress: 'admin@example.com'
                support:
                    givenName: 'Kimai Support'
                    emailAddress: 'support@example.com'
            organization:
                en:
                    name: 'Kimai'
                    displayname: 'Kimai'
                    url: 'https://www.example.com'
```  

More information about the connection configs can be used in the [onelogin/php-saml](https://github.com/onelogin/php-saml#how-it-works) library, which is used internally for the SAML connections.

## Configuration details

```yaml
kimai:
    saml:
        activate: true
        title: Login with SAML
        mapping:
            - { saml: $Email, kimai: email }
            - { saml: $FirstName $LastName, kimai: alias }
        roles:
            resetOnLogin: true
            attribute: Roles
            mapping:
                - { saml: Admin, kimai: ROLE_ADMIN }
                - { saml: Manager, kimai: ROLE_TEAMLEAD }
```

A brief description of the available fields:
- `activate` (bool) activates the SAML authentication flow
- `title` (string) the name of the Login button in the authentication screen
- `mapping` (array) an array of attributes that will be synced with Kimai. The `kimai` value (`email` and `alias`) are the names in Kimai, the `saml` key (`$Email` and `$FirstName $LastName`) are the attributes from the SAML response. You can assign static values to every user (like `title` = `SAML User`) or you fetch one or more values from the SAML message (`$Email` refers to the SAML attribute `Email` and `$FirstName $LastName` refers to the two SAML attributes `$FirstName` and `$LastName`).
- `roles` (array) settings related to the user roles syncing
    - `resetOnLogin` (bool) if `true` all user roles will be reset upon login and synced with the SAML roles, if `false` you can configure user roles in Kimai and only the mapped ones will be forced when the user logs-in (other roles will stick with the user) - config exists since 1.22.0 
    - `attribute` (string) the SAML attribute whose values are used for syncing the groups
    - `mapping` (array) an array of role name mappings. The `saml` key is your SAML role name (here `Admin` and `Manager`) and the key `kimai` (here `ROLE_ADMIN` and `ROLE_TEAMLEAD`) is the role name in Kimai. Unmapped roles from the SAML message will be IGNORED even if they are existing in Kimai.

If you have troubles with your certificate you can [use this online tool](https://www.samltool.com/format_x509cert.php) to convert the X.509 cert into "string format".

{% alert %}User data and roles are synchronized during each login.{% endalert %}
{% alert %}Every user automatically owns the ROLE_USER role, you don't have to create a mapping for it.{% endalert %}
{% alert warning %}Every user needs a username and email address, you cannot activate SAML without a mapping for the email. The username cannot be set from SAML attributes, but will always be taken from the SAML request.{% endalert %}

### Multiline Certificate - x509cert

The certificate looks like this:

```
-----BEGIN CERTIFICATE-----
MIIDdDCCAlygAwIBAgIGAW/OIR0dMA0GCSqGSIb3DQEBCwUAMHsxFDASBgNVBAoTC0dvb2dsZSBJ
... multiple lines here ... 
ys6QpDx0SFtUTm65ZmgT0zspicoRhsfWHsJsXWh/KR0C
-----END CERTIFICATE-----
```

This certificate can be converted into one line by removing the first line (`BEGIN CERTIFICATE`) and 
the last line (`END CERTIFICATE`) and then removing all line-breaks.
Using multi and single line has proven to work, but using a multi-line certificate in yaml has caused issues in the past.

## Identity provider

### Google Workspace

For Google, please check the [Google SAML documentation]({% link _documentation/saml-google.md %})

### Azure

For Azure AD, please check the [Azure SAML documentation]({% link _documentation/saml-azure.md %})

### Keycloak

For Keycloak, please check the [Keycloak SAML documentation]({% link _documentation/saml-keycloak.md %})

### Authentik

For Authentik, please check the [Authentik SAML documentation]({% link _documentation/saml-authentik.md %})

## Known limitations

A manually registered user can log in via SAML, but his account is then migrated to **SAML only**,
so he can't log in via password any longer.
Additionally, all configured SAML attributes will be applied.
To change such an account back to "password login", you need to update the `auth` column in the `kimai2_users` table and set the value from `saml` to `kimai`.

## Using SAML only

If SAML is activated, you can turn off the login form entirely by unchecking the `Login form` configuration under `Authentication` at [System > Settings]({% link _documentation/configurations.md %}).

## Troubleshooting

### Proxy and http vs https

**Error:**  
The response was received at `http://kimai-test.example.com/auth/saml/acs` instead of `https://kimai-test.example.com/auth/saml/acs`

**Solution:**  
Use the `baseurl` configuration and set it to `https://kimai-test.example.com/auth/saml/` (and flush the cache!)
