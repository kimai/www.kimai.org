---
title: Keycloak SAML
description: Use Keycloak as SAML identity provider for Kimai
canonical: /documentation/saml-keycloak.html
---

Go back to general [SAML configuration]({% link _documentation/saml.md %}) for Kimai.

SAML authentication with Keycloak accounts has proven to work with the following configurations.

Screenshots might be outdated, please check the text version below each image. 

### Important settings

- `singleSignOnService.url`: `https://{keycloak-domain}/realms/{realm}/protocol/saml`
- In Kimai: `kimai.saml.connection.idp.x509cert` = value from IdP `ds:X509Certificate`
- In Kimai: `kimai.saml.connection.security.authnRequestsSigned: true`
- In Keycloak: enable **Force name ID format**

### Add a client for Kimai SAML

{% include docs-image.html src="/images/documentation/keycloak-saml-1.webp" title="Add a client" width="800px" %}

### Configure the client

{% include docs-image.html src="/images/documentation/keycloak-saml-2.webp" title="Deactivate *Client Signature Required* (1)" width="900px" %}
{% include docs-image.html src="/images/documentation/keycloak-saml-3.webp" title="Deactivate *Client Signature Required* (2)" width="900px" %}

### Certificates

- **IdP certificate**: Obtain the `ds:X509Certificate` from Keycloak’s SAML descriptor:  
  `https://{keycloak-domain}/realms/{realm}/protocol/saml/descriptor`  
  ⚠️ Do *not* use the RS256 realm key from Realm Settings.

- **SP keys**: In Kimai config, set:
    - `sp.privateKey` → private key generated in Keycloak (*Clients → Kimai → Keys*)
    - `sp.x509cert` → corresponding public key

### Create user attributes

Keycloak client mappers (inside the `{client}-dedicated` scope)

Remove the default `role list`, then add:

- **X500 email** → `SAML Attribute Name: Email`, `SAML Attribute NameFormat: Unspecified`
- **X500 surname** → `SAML Attribute Name: LastName`, `SAML Attribute NameFormat: Unspecified`
- **X500 givenName** → `SAML Attribute Name: FirstName`, `SAML Attribute NameFormat: Unspecified`
- **Role list** → `Role attribute name: Roles`, `SAML Attribute NameFormat: Unspecified`, `Single Role Attribute: On`

{% include docs-image.html src="/images/documentation/keycloak-saml-4.webp" title="Kimai user attributes (listing)" width="1000px" %}
{% include docs-image.html src="/images/documentation/keycloak-saml-5.webp" title="Kimai user attributes (X500 GivenName)" width="700px" %}
{% include docs-image.html src="/images/documentation/keycloak-saml-6.webp" title="Kimai user attributes (X500 Surname)" width="700px" %}
{% include docs-image.html src="/images/documentation/keycloak-saml-7.webp" title="Kimai user attributes (X500 Email)" width="700px" %}

### Client Scopes / Roles

Make sure to map unique Keycloak roles to Kimai roles.  
If you reuse the same Keycloak role, the last mapping wins.

- Go to Configuration -> Client Scopes -> role_list
- Select Tab "Mappers", edit "role_list"
- Set" Single Role Attribute" to "ON"

Example:

```
{ saml: Admins, kimai: ROLE_SUPER_ADMIN }
{ saml: Management, kimai: ROLE_ADMIN }
{ saml: Teamlead, kimai: ROLE_TEAMLEAD }
```



### Configure local.yaml

And here is the matching Kimai configuration:

```yaml
kimai:
    saml:
        provider: keycloak
        activate: true
        title: Keycloak
        mapping:
            - { saml: $Email, kimai: email }
            - { saml: $FirstName $LastName, kimai: alias }
        roles:
            resetOnLogin: true
            attribute: Roles
            mapping:
                - { saml: Admins, kimai: ROLE_SUPER_ADMIN }
                - { saml: Management, kimai: ROLE_ADMIN }
                - { saml: Teamlead, kimai: ROLE_TEAMLEAD }
        connection:
            # You SAML provider, here an example for Keycloak
            idp:
                entityId: 'https://example.com/realms/master'
                singleSignOnService:
                    url: 'https://example.com/realms/master/protocol/saml'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
                x509cert: 'cert from https://{keycloak-domain}/realms/{realm}/protocol/saml/descriptor > ds:X509Certificate'
           # Your Kimai instance, replace https://127.0.0.1:8010 with your base URL
            sp:
                entityId: 'Kimai2'
                assertionConsumerService:
                    url: 'https://example.com/auth/saml/acs'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST'
                singleLogoutService:
                    url: 'https://example.com/auth/saml/logout'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
                privateKey: 'private key generated in the Keycloak > Clients > Kimai > Keys'
                x509cert: 'public key generated in the Keycloak > Clients > Kimai > Keys'
            # only set baseurl, if auto-detection doesn't work
            baseurl: 'https://example.com/auth/saml/'
            strict: true
            debug: true
            security:
                nameIdEncrypted: false
                authnRequestsSigned: true
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
