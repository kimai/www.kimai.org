---
layout: kimai
title: Documentation for Kimai
description: Documentation for Kimai Time-Tracking
---
# SAML Authentication

Security Assertion Markup Language (SAML) allows for an exchange of authentication and authorization information between 
a service provider and an identity provider.

Kimai is the service provider and the identity provider is an external system that is trusted to authenticate a user.

## Supported Identity Providers

While any SAML compliant identity provider should work with Kimai the following providers have been tested 
during development.

* Google GSuite
* Microsoft ADFS

## SAML Support Basics

In order to work, both the service provider (Kimai) and the identity provider must be configured to work together.

Kimai's auth.php file needs to be configured with the following options:

  * Identity Provider Information (Options come from the Identity Provider)
    * saml_idpentityId: Entity ID
    * saml_idpssoURL: Single Signon URL
    * saml_idpslsURL: Single Logout Service URL (optional)
    * saml_idpcertFingerprint: Fingerprint of the SSL certificate used to sign the response
    * saml_idpcertFingerprintAlgorithm: Algorithm os the Fingerprint (ex: sha1)
  * Service Provider Information (Kimai options specific to your installation)
    * saml_spentityId: Entity ID (https://kimai.example.com)
    * saml_spacsURL: AssertionConsumerService where to send the SAML response (https://kimai.example.com/index.php)
    * saml_spslsURL: Single logout service (https://kimai.example.com/index.php)
    * saml_spx509cert: Certificate used to encrypt and sign the request to the identity provider (optional)
    * saml_spprivateKey: Private Key encrypt and sign the request to the identity provider (optional)
  * Other Options
    * saml_strict: Enforce SAML Standard and Encrypted/Signed where specified
    * saml_debug: Not as useful as it would appear
    * saml_baseurl: Optional
    * nonSAMLAcounts: accounts that can sign in local (no SAML)

The saml_idp and saml_sp options must be configure the same in both the Kimai options and the Identity Provider configuration.

## Kimai Options

Use options similar to the following in your Kimai authentication file (includes/auth.php)

```php
    'saml_strict' => true,
    'saml_debug' => true,
    'saml_baseurl' => '',
    'saml_spentityId' => 'https://kimai.example.com',
    'saml_spacsURL' => 'https://kimai.example.com/index.php',
    'saml_spslsURL' => 'https://kimai.example.com/index.php',
    'saml_spx509cert' => '',
    'saml_spprivateKey' => '',
    'saml_idpentityId' => 'http://sts.example.com/adfs/services/trust',	// Microsoft ADFS
    'saml_idpssoURL' => 'https://sts.example.com/adfs/ls',		// Microsoft ADFS
    //'saml_idpentityId' => 'https://accounts.google.com/o/saml2?idpid=?????????',	// Google GSuite
    //'saml_idpssoURL' => 'https://accounts.google.com/o/saml2/idp?idpid=?????????',	// Google GSuite
    'saml_idpslsURL' => '',
    'saml_idpcertFingerprint' => '00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00',
    'saml_idpcertFingerprintAlgorithm' => 'sha1',
    'nonSAMLAcounts' => array('admin'),
```

### Google GSuite

Google GSuite is Google's offering for Business and includes GMail, Google Drive (Docs) etc.  It allows you to 
offer Google products under your own Domain and gives yo access to use your GSuite as a SAML identity provider.

Google GSuite allows you to create a SAML App from the Google Admin section of your account:

  * Select SAML apps ander the Apps menu
  * Enter the Service Provider Details
  * Obtain the Identity Provider information to be used in your Kimai config
  * Setup the Attribute Mapping
    * Name ID = Primary Email
    * Name ID Format = EMAIL
  * Kimai requires the following additional attribute mapping:
    * fn = First Name
    * ln = Last Name
    * mail = Primary Email

https://support.google.com/a/answer/6087519?hl=en

### Microsoft ADFS

Microsoft ADFS is Microsoft's SAML Identity Provider.  It allows you to specify any number of methods to authenticate a user. 
Kimai really only requires a few options but due to those options it is a little more involved.  If you have setup a SAML 
end point with ADFS before or you have a working example it is not difficult.

Microsoft uses the following steps

* Configure an ADFS relying party (Tells ADFS about Kimai)
* Configure a Claims Rule (Map the Attributes in Active Directory to those required by Kimai)
  * Name ID = Primary Email
  * Name ID Format = EMAIL
  * fn = First Name
  * ln = Last Name
  * mail = Primary Email

There are a number of documents provided with a web search that will help you through the ADFS setup

## Troubleshooting

### Step 1 - Did I get the Identity Provider login page

After Kimai is configured to use saml as the authenticator and the options are provided in the includes/auth.php file 
attempting to access the login page for Kimai will redirect you to the Identity Provider's login page.

If you do not get the correct page you need to review the following options:

```php
    'saml_idpentityId' => 'http://sts.example.com/adfs/services/trust',	// Microsoft ADFS
    'saml_idpssoURL' => 'https://sts.example.com/adfs/ls',		// Microsoft ADFS
```

### Step 2 - Error on the Identity Provider login page
If you get the page but see an error you need to review the following options:

```php
    'saml_spentityId' => 'https://kimai.example.com',
    'saml_spacsURL' => 'https://kimai.example.com/index.php',
```

### Step 3 - SAML Response rejected
If you are able to enter your user name and password and get:

Signature validation failed. SAML Response rejected

you need to review the following options:

```php
    'saml_idpcertFingerprint' => '00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00',
    'saml_idpcertFingerprintAlgorithm' => 'sha1',
```

### Step 4 - Can't login to Kimai
At this point you should be getting to the login page, entering your credentials and getting redirected back to Kimai 
if the username and password entered was accepted.

You need to review what information is being returned to Kimai.  There are a number of options for this but the 
best is the SAML Message Decoder add in for Chrome.  It will allow you to see the request that Kimai sent to the 
Itentity Provider and the returned response.

Request:

```xml
<samlp:AuthnRequest xmlns:samlp="urn:oasis:names:tc:SAML:2.0:protocol"
                    xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion"
                    ID="ONELOGIN_d98b86b08d3332e859831fde5c989bb46661be89"
                    Version="2.0"
                    IssueInstant="2018-02-25T23:32:27Z"
                    Destination="https://sts.example.com/adfs/ls"
                    ProtocolBinding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
                    AssertionConsumerServiceURL="https://kimai.example.com/index.php">
  <saml:Issuer>https://kimai.example.com</saml:Issuer>
  <samlp:NameIDPolicy Format="urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified"
                      AllowCreate="true" />
  <samlp:RequestedAuthnContext Comparison="exact">
    <saml:AuthnContextClassRef>urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport</saml:AuthnContextClassRef>
  </samlp:RequestedAuthnContext>
</samlp:AuthnRequest>
```

Response:

```xml
<samlp:Response ID="_2abda509-6e70-4ab1-8cd0-9e13e242f49b"
                Version="2.0"
                IssueInstant="2018-02-25T23:32:28.089Z"
                Destination="https://kimai.example.com/index.php"
                Consent="urn:oasis:names:tc:SAML:2.0:consent:unspecified"
                InResponseTo="ONELOGIN_d98b86b08d3332e859831fde5c989bb46661be89"
                xmlns:samlp="urn:oasis:names:tc:SAML:2.0:protocol">
  <Issuer xmlns="urn:oasis:names:tc:SAML:2.0:assertion">http://sts.example.com/adfs/services/trust</Issuer>
  <samlp:Status>
    <samlp:StatusCode Value="urn:oasis:names:tc:SAML:2.0:status:Success" /></samlp:Status>
  <Assertion ID="_afd047df-a3f0-4716-9f82-8ad9659b0a2b"
             IssueInstant="2018-02-25T23:32:28.088Z"
             Version="2.0"
             xmlns="urn:oasis:names:tc:SAML:2.0:assertion">
    <Issuer>http://sts.example.com/adfs/services/trust</Issuer>
    <ds:Signature xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
      <ds:SignedInfo>
        <ds:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#" />
        <ds:SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1" />
        <ds:Reference URI="#_afd047df-a3f0-4716-9f82-8ad9659b0a2b">
          <ds:Transforms>
            <ds:Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature" />
            <ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#" /></ds:Transforms>
          <ds:DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1" />
          <ds:DigestValue>7T+JWDr88yGktzn9ZauVijcqr9c=</ds:DigestValue>
        </ds:Reference>
      </ds:SignedInfo>
      <ds:SignatureValue>
Mqv..................snip.................................==
</ds:SignatureValue>
      <KeyInfo
      xmlns="http://www.w3.org/2000/09/xmldsig#">
        <ds:X509Data>
          <ds:X509Certificate>
MII...........................................snip ..........................==
</ds:X509Certificate>
        </ds:X509Data>
        </KeyInfo>
    </ds:Signature>
    <Subject>
      <NameID Format="urn:oasis:names:tc:SAML:2.0:nameid-format:kerberos">EXAMPLE\johndoe</NameID>
      <SubjectConfirmation Method="urn:oasis:names:tc:SAML:2.0:cm:bearer">
        <SubjectConfirmationData InResponseTo="ONELOGIN_d98b86b08d3332e859831fde5c989bb46661be89"
                                 NotOnOrAfter="2018-02-25T23:37:28.089Z"
                                 Recipient="https://kimai.example.com/index.php" />
      </SubjectConfirmation>
    </Subject>
    <Conditions NotBefore="2018-02-25T23:32:28.081Z"
                NotOnOrAfter="2018-02-26T00:32:28.081Z">
      <AudienceRestriction>
        <Audience>https://kimai.example.com</Audience>
      </AudienceRestriction>
    </Conditions>
    <AttributeStatement>
      <Attribute Name="mail">
        <AttributeValue>john.doe@example.com</AttributeValue>
      </Attribute>
      <Attribute Name="fn">
        <AttributeValue>John</AttributeValue>
      </Attribute>
      <Attribute Name="ln">
        <AttributeValue>Doe</AttributeValue>
      </Attribute>
    </AttributeStatement>
    <AuthnStatement AuthnInstant="2018-02-25T22:12:03.603Z"
                    SessionIndex="_afd047df-a3f0-4716-9f82-8ad9659b0a2b">
      <AuthnContext>
        <AuthnContextClassRef>urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport</AuthnContextClassRef>
      </AuthnContext>
    </AuthnStatement>
  </Assertion>
</samlp:Response>

```

