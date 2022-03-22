---
title: Authentik SAML
description: How to use Authentik as identity provider for Kimai
toc: true
related:
  - saml
  - saml-azure
  - saml-keycloak
---

[Authentik](https://goauthentik.io) is an open-source Identity Provider focused on flexibility and versatility.
It has proven to work with Kimai, see [#3212](https://github.com/kevinpapst/kimai2/discussions/3212).

Make sure that the mapping field match the XML response:

```yaml
    mapping:
      - { saml: $http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress, kimai: email }
      - { saml: $http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name, kimai: alias }
```

Here is a full example:
```yaml
kimai:
  saml:
    activate: true
    title: Login with SAML
    mapping:
      - { saml: $http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress, kimai: email }
      - { saml: $http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name, kimai: alias }
    roles:
      attribute: Roles
      mapping:
      # Insert your roles here (ROLE_USER is added automatically)
        - { saml: admin.group, kimai: ROLE_ADMIN }
    connection:
      # You SAML provider
      # Your Authentik instance, replace https://authentik.company with your authentik URL
      idp:
        entityId: "https://authentik.company/"
        singleSignOnService:
          url: "https://authentik.company/application/saml/<application-slug>/sso/binding/redirect/"
          binding: "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect"
        # the "single logout" feature was not yet tested, if you want to help, please let me know!
        singleLogoutService:
          url: "https://authentik.company/if/session-end/<application-slug>/"
          binding: "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect"
        # Signing certificate from *Advanced protocol settings*
        x509cert: "XXXXXXXXXXXXXXXXXXXXXXXXXXX=="
      # Service Provider Data that we are deploying.
      # Your Kimai instance, replace https://kimai.company with your Kimai URL
      sp:
        entityId: "https://kimai.company/"
        assertionConsumerService:
          url: "https://kimai.company/auth/saml/acs"
          binding: "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
        singleLogoutService:
          url: "https://kimai.company/auth/saml/logout"
          binding: "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect"
        #privateKey: ''
      # only set baseurl, if auto-detection doesn't work
      baseurl: "https://kimai.company/auth/saml/"
      strict: false
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
        signatureAlgorithm: "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"
        digestAlgorithm: "http://www.w3.org/2001/04/xmlenc#sha256"
      contactPerson:
        technical:
          givenName: "Kimai Admin"
          emailAddress: "admin@example.com"
      organization:
        en:
          name: "Kimai"
          displayname: "Kimai"
          url: "https://kimai.company"
```

