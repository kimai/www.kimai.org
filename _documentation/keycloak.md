---
title: Keycloak SAML
description: Use Keycloak as SAML identity provider for Kimai
toc: true
---

Go [back to general SAML configuration]({% link _documentation/saml.md %}) for Kimai.

### Introduction

SAML authentication with Keycloak accounts has proven to work with the following configurations:

#### Add a client for Kimai SAML

![Picture](/images/documentation/keycloak-saml-1.png)

#### Configure the client

Deactivate "Client Signature Required".

![Picture](/images/documentation/keycloak-saml-2.png)
![Picture](/images/documentation/keycloak-saml-3.png)

#### Create user attributes

Which will then be mapped on the Kimai user attributes:

![Configure attributes](/images/documentation/keycloak-saml-4.png)
![X500 GivenName](/images/documentation/keycloak-saml-5.png)
![X500 Surname](/images/documentation/keycloak-saml-6.png)
![X500 Email](/images/documentation/keycloak-saml-7.png)


#### Configure local.yaml

And here is the matching Kimai configuration:

```yaml
kimai:
    saml:
        activate: true
        title: Keycloak
        mapping:
            - { saml: $Email, kimai: email }
            - { saml: $FirstName $LastName, kimai: alias }
        roles:
            attribute: Roles
            mapping:
                - { saml: Admins, kimai: ROLE_ADMIN }
                - { saml: Management, kimai: ROLE_TEAMLEAD }
        connection:
            # You SAML provider, here an example for Keycloak
            idp:
                entityId: 'https://keycloak.domain.de/auth/realms/Firmenrealm'
                singleSignOnService:
                    url: 'https://keycloak.domain.de/auth/realms/Firmenrealm/protocol/saml'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
                #    url: 'https://127.0.0.1:8010/logout' binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
                x509cert: 'Get your Keycloak certificate at Realm Settings --> Keys --> RS256 --> Certificate '
            # Your Kimai instance, replace https://127.0.0.1:8010 with your base URL
            sp:
                entityId: 'Kimai2'
                assertionConsumerService:
                    url: 'https://kimai.domain.de/auth/saml/acs'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST'
                singleLogoutService:
                    url: 'https://kimai.domain.de/auth/saml/logout'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
                #privateKey: ''
            # only set baseurl, if auto-detection doesn't work
            #baseurl: 'https://kimai.domain.de/auth/saml/'
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

You should now be able to test the Login by visiting **https://timetracking.example.com/** and clicking on the `Keycloak` title of the SAML method, you defined earlier.
