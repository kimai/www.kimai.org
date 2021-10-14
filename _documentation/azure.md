---
title: Azure SAML
description: How to use Azure AD SAML identity provider with Kimai
toc: true
since_version: 1.8
---

Go [back to general SAML configuration]({% link _documentation/saml.md %}) for Kimai. 

### Introduction
SAML authentication with Azure accounts has proven to work. It requires four phases to get SAML configured. We will call them:
* Toolkit Deployment
* Toolkit Configuration
* Setting Up Kimai
* Adding Users and Testing the Toolkit

**Note**: The Azure AD is a part of the Microsoft Cloud offerings; you will likely need either a Microsoft Cloud license 
or an Office 365 license associated with your domain. In case you managed to set it up using a free offering,  
[please let us know](https://github.com/kevinpapst/kimai2/discussions) so we can add it to the documentation. 

### Toolkit Deployment
Please check the following steps to set up an enterprise application using the SAML toolkit.

1. Sign in to the Azure portal using either a work or school account, or a personal Microsoft account.
2. On the left navigation pane, select the **Azure Active Directory** service.
3. Navigate to **Enterprise Applications** and then select **All Applications**.
4. To add new application, select **New application**.
5. In the Add from the gallery section, type **Azure AD SAML Toolkit** in the search box.
6. Select **Azure AD SAML Toolkit** from the results panel and then add the app. Wait a few seconds while the app is added to your tenant.

Other languages are accessible through the Microsoft Documentation under: 
[Click here to get to the documentation.](https://docs.microsoft.com/en-us/azure/active-directory/saas-apps/saml-toolkit-tutorial#adding-azure-ad-saml-toolkit-from-the-gallery)

### Toolkit Configuration

1. Sign in to the Azure portal using either a work or school account, or a personal Microsoft account.
2. On the left navigation panel, select the **Azure Active Directory** service.
3. Navigate to **App registrations** and then select **All Applications**.
4. Please click on the newly created application **Azure AD SAML Toolkit** and then select **Branding** on the left navigation bar to change the name of the application. We will call it Kimai.  
**Note**: The name of the application has no technical effect, but could be displayed to users during login.
5. Click on **Overview** on the left navigation panel. Now click on the value under **Managed application in local directory**:
![Picture](/images/documentation/azure-saml-pic1.png)
6. Now navigate to **Single sign-on** on the left navigation and choose **SAML** as your choice:
![Picture](/images/documentation/azure-saml-pic2.png)
7. Edit the **Basic SAML Configuration** at the top and add the required **URLs**:
![Picture](/images/documentation/azure-saml-pic3.png)

    | Setting |Value  |
    | ------------- | -----:|
    | Identifier (Entity ID) | https://timetracking.example.com/auth/saml/metadata |
    | Reply URL (Assertion Consumer Service URL) | https://timetracking.example.com/auth/saml/acs |
    | Sign on URL | https://timetracking.example.com/ |
    | Logout Url | https://timetracking.example.com/auth/saml/logout |

8. Edit the **User Attributes & Claims** and ensure the following settings: 
![Picture](/images/documentation/azure-saml-pic4.png)  
**Note**: It is likely, that you have a missing entry **displayname**, thus please add the claim by clicking **Add new claim** and set the following settings:  
![Picture](/images/documentation/azure-saml-pic5.png)

    | Setting |Value  |
    | ------------- | -----:|
    | Name | displayname |
    | Namespace | http://schemas.xmlsoap.org/ws/2005/05/identity/claims |
    | Source attribute | user.displayname |

    After applying these changes hit **Save**.
    
9. Return to the **Single Sign-On**(Visible in the navigation panel on the left) and download **Certificate (Base64)**:
![Picture](/images/documentation/azure-saml-pic6.png) 
10. Copy the three values of **Set up Kimai**, as we will need them to configure Kimai:
![Picture](/images/documentation/azure-saml-pic7.png)

### Setting Up Kimai
Kimai uses a [local.yaml]({% link _documentation/local-yaml.md %}) configuration file for changes in the application. This configuration file has to be created by the user itself under `/config/packages/local.yaml`.

Configuration Example:
```yaml
security:
    firewalls:
        secured_area:
            kimai_saml: ~

kimai:
    saml:
        activate: true
        title: Azure AD SAML
        mapping:
            - { saml: $http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress, kimai: email }
            - { saml: $http://schemas.xmlsoap.org/ws/2005/05/identity/claims/displayname, kimai: alias }
        roles:
            attribute: Roles
            mapping:
                - { saml: Admins, kimai: ROLE_ADMIN }
                - { saml: Management, kimai: ROLE_TEAMLEAD }
        connection:
            idp:
                entityId: 'https://sts.windows.net/****-****-***/'
                singleSignOnService:
                    url: 'https://login.microsoftonline.com/****-****-***/saml2'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
                singleLogoutService:
                    url: 'https://login.microsoftonline.com/****-****-***/saml2'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
                x509cert:  'M***********Y'
            sp:
                entityId: 'https://timetracking.example.com/auth/saml/metadata'
                assertionConsumerService:
                    url: 'https://timetracking.example.com/auth/saml/acs'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST'
                singleLogoutService:
                    url: 'https://timetracking.example.com/auth/saml/logout'
                    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
            #baseurl: 'https://timetracking.example.com/auth/saml/'
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

1. Change the title to the wanted text on the login screen
```yaml
title: ExampleSAML
```

2. Change the **idp** configuration and add the before copied URLs:
```yaml
entityId: 'https://sts.windows.net/****-****-***/'                # Azure AD Identifier
singleSignOnService:
    url: 'https://login.microsoftonline.com/****-****-***/saml2'  # Login URL
    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
singleLogoutService:
    url: 'https://login.microsoftonline.com/****-****-***/saml2'  # Logout URL
    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
```

3. Change the **sp** configuration:
```yaml
entityId: 'https://timetracking.example.com/auth/saml/metadata'
assertionConsumerService:
    url: 'https://timetracking.example.com/auth/saml/acs'
    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST'
singleLogoutService:
    url: 'https://timetracking.example.com/auth/saml/logout'
    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
```

4. Change the **x509cert** by opening the earlier downloaded certificate and copy it, without “Next-line” Enters into the configuration:
```yaml
x509cert:  'REALLY LONG SET OF CHARACTERS'
```

5. [Reload your cache]({% link _documentation/cache.md %}) 

### Adding Users and Testing the Toolkit

1. Sign in to the Azure portal using either a work or school account, or a personal Microsoft account.
2. On the left navigation panel, select the **Azure Active Directory** service.
3. Navigate to **App registrations** and then select **All Applications**.
4. Please click on the Kimai application , we called it **Kimai**, and then navigate to **Users and groups** on the left navigation bar.
5. Click on **Add user/group** and add the groups or users, who should have access.

You should now be able to test the Login by visiting **https://timetracking.example.com/** and clicking on the title of the SAML method, you defined earlier.
