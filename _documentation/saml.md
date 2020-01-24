---
title: SAML
description: How to use SAML identity provider with Kimai 2
toc: true
since_version: 1.8
---

Kimai supports authentication via a SAML provider of your choice (for now it was tested with G Suite and MS Azure accounts). 
SAML users will be imported during the first login with their attributes and groups. 

## Installation

In order to use the SAML authentication, you have to add configurations changes to your 
[local.yaml]({% link _documentation/configurations.md %}) (this example is for G Suite accounts):

```yaml
# DO NOT MODIFY THE SETTINGS in "security"
security:
    firewalls:
        secured_area:
            saml:
                check_path: saml_acs
                login_path: saml_login
                failure_path: fos_user_security_login
                user_factory: App\Auth\User\SamlUserFactory
                persist_user: true

# YOU HAVE TO ADJUST "title", "mapping" and "roles"
kimai:
    saml:
        activate: true
        title: Login with Google
        mapping:
            email: $Email
            username: $Email
        roles:
            attribute: Roles
            mapping:
                - { saml: Admins, kimai: ROLE_ADMIN }
                - { saml: Management, kimai: ROLE_TEAMLEAD }

# THESE SETTINGS NEED TO BE ADJUSTED FOR YOUR APPLICATION
# YOU'LL GET THE REQUIRED VALUES FROM YOUR SAML IDENTITY PROVIDER
hslavich_onelogin_saml:
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
        x509cert: 'ADD YOU MULTI-LINE CERTIFICATE CONTENT'
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
    # only set this, if auto-detection doesn't work
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
            name: 'Kimai'
            displayname: 'Kimai'
            url: 'https://www.kimai.org'
```  

After that, you need to re-build the cache as described in the [configurations chapter]({% link _documentation/configurations.md %}). 

You can deactivate SAML by removing (or commenting) at least the settings `kimai` and `security` nodes from above and then rebuild the cache. 

### Configuration details

```yaml
kimai:
    saml:
        activate: true
        title: Login with Google
        mapping:
            email: $Email
            username: $Email
            title: SAML User
        roles:
            attribute: Roles
            mapping:
                - { saml: Admins, kimai: ROLE_ADMIN }
                - { saml: Management, kimai: ROLE_TEAMLEAD }
```

A brief description of the available fields:
- `activate` (bool) activates the SAML authentication flow 
- `title` (string) the name of the red Login button in the authentication screen
- `mapping` (array) an array of attributes that will be synced with Kimai, the key (here `email`, `username` and `title`) is the name in Kimai, the value (here `$Email`, `$Email` and `SAML User`) is the attribute to be set. You can assign static values to every user (like `tiitle` = `SAML User`) or you fetch values from the SAML message (`$Email` refers to the SAML attribute `Email`).
- `roles` (array) settings related to the group syncing
  - `attribute` (string) the SAML attribute whose values are used for syncing the groups
  - `mapping` (array) an array of group name mappings, the key `saml` is your SAML group name (here `Admins` and `Management`) and the key `kimai` (here `ROLE_ADMIN` and `ROLE_TEAMLEAD`) is the group name in Kimai. Unmapped group names will be taken as is from the SAML message.  

{% include alert.html type="warning" alert="Every user automatically owns the ROLE_USER role, you don't have to create a mapping for it." %}

Remember to re-build the cache for changes to take effect, see [configurations chapter]({% link _documentation/configurations.md %}). 

### G Suite and roles (or groups)

If you want to sync user-roles as well, you have to know that Google doesn't support that out-of-the-box. 
You need to setup additional user attributes and add those to the SAML attributes of your application.

Links:
- [Setup groups in G Suite](https://www.dynatrace.com/support/help/how-to-use-dynatrace/user-management-and-sso/manage-users-and-groups-with-saml/saml-gsuite/#preparing-group-mapping)
- [Creating custom attributes using the user schema](https://support.google.com/cloudidentity/answer/6327792?hl=en&ref_topic=7558947)

## User synchronization

User data is synchronized during the first login.

**Password handling**

Obviously Kimai does not store the users password when logged-in via SAML and there is no fallback mechanism available, if your SAML IDP is not available.

{% include alert.html type="danger" alert="The default configuration allows a user to change the internal password. This manually chosen password is not overwritten by the SAML plugin and would allow a user to login, even after you removed him from SAML." %} 

To prevent that problem:
- disable the "[Password reset]({% link _documentation/users.md %})" function
```yaml
kimai:
    user:
        registration: false
        password_reset: false
```
- disable the "change my own password" permission for each role:
```yaml
kimai:
    permissions:
        roles:
            ROLE_USER: ['!password_own_profile']
            ROLE_TEAMLEAD: ['!password_own_profile']
            ROLE_ADMIN: ['!password_own_profile']
```

Read more about `password_own_profile` and `password_other_profile` [permissions]({% link _documentation/permissions.md %}).

If you don't adjust your configuration, you have to deactivate SAML users manually in Kimai after deleting their SAML accounts.

## Known limitations

There are a couple of caveats that should be taken into account.

### Missing email address

Kimai requires that every user account has an `email` and `username`. If you do not configure an attribute for `username`, 
the `email` will be used as fallback for the `username` during the initial import of the user account.
