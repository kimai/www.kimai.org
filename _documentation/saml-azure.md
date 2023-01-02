---
title: Azure SAML
description: How to use Azure AD SAML identity provider with Kimai
---

Go back to general [SAML configuration]({% link _documentation/saml.md %}) for Kimai. 

SAML authentication with Azure accounts has proven to work. It requires four phases to get SAML configured. We will call them:
* Toolkit Setup
* Kimai Configuration
* Adding Users and Testing the Toolkit

**Note**: The Azure AD is a part of the Microsoft Cloud offerings; you will likely need either a Microsoft Cloud license 
or an Office 365 license associated with your domain. But it also works with a "Usage based Microsoft Azure Plan" account 
in which Azure AD can be used free of charge. 

### Toolkit Setup

Please check the following steps to set up an enterprise application using the SAML toolkit.
This documentation is available in other languages as well [in the Microsoft documentation](https://docs.microsoft.com/en-us/azure/active-directory/saas-apps/saml-toolkit-tutorial#adding-azure-ad-saml-toolkit-from-the-gallery)

- Sign in to the Azure portal. 
- On the left navigation pane, select the **Azure Active Directory** service.
- Navigate to **Enterprise Applications** and then select **All Applications**.
- To add new application, select **New application**.
- In the Add from the gallery section, type **Azure AD SAML Toolkit** in the search box.
- Select **Azure AD SAML Toolkit** from the results panel and then add the app.
- On the left navigation panel, select the **Azure Active Directory** service.
- Navigate to **App registrations** and then select **All Applications**.
- Please click on the newly created application **Azure AD SAML Toolkit** and then select **Branding** on the left navigation bar to change the name of the application to "Kimai".  
**Note**: The name of the application has no technical effect, but could be displayed to users during login.
- Click on **Overview** on the left navigation panel. Now click on the value under **Managed application in local directory**: 
{% include docs-image.html src="/images/documentation/azure-saml-pic1.png" title="Managed applications" width="900px" %}
- Now navigate to **Single sign-on** on the left navigation and choose **SAML** as your choice: 
{% include docs-image.html src="/images/documentation/azure-saml-pic2.png" title="Select SAML" width="900px" %}
- Edit the **Basic SAML Configuration** at the top and add the required **URLs**:
{% include docs-image.html src="/images/documentation/azure-saml-pic3.png" title="Basic SAML configuration" width="900px" %}

| Setting                                    | Value                                               |
|--------------------------------------------|-----------------------------------------------------|
| Identifier (Entity ID)                     | https://timetracking.example.com/auth/saml/metadata |
| Reply URL (Assertion Consumer Service URL) | https://timetracking.example.com/auth/saml/acs      |
| Sign on URL                                | https://timetracking.example.com/                   |
| Logout Url                                 | https://timetracking.example.com/auth/saml/logout   |

- Edit the **User Attributes & Claims** and ensure the following settings:
{% include docs-image.html src="/images/documentation/azure-saml-pic4.png" title="User Attributes & Claims" width="900px" %}
- Return to the **Single Sign-On** (visible in the left navigation panel) and download **Certificate (Base64)**:
{% include docs-image.html src="/images/documentation/azure-saml-pic6.png" title="Download Certificate" width="900px" %}
- Copy the three values of **Set up Kimai**, as we will need them to configure Kimai:
{% include docs-image.html src="/images/documentation/azure-saml-pic7.png" title="Copy Azure URLs" width="900px" %}

### Kimai Configuration

Please copy & paste the entire [SAML configuration]({% link _documentation/saml.md %}).
Adjust the following keys with your Azure / App specific settings:

```yaml
kimai:
    saml:
        activate: true
        title: Login with Azure
        mapping:
            - { saml: $http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name, kimai: username }
            - { saml: $http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress, kimai: email }
            - { saml: $http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname $http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname, kimai: alias }
            - { saml: $http://schemas.xmlsoap.org/ws/2005/05/identity/claims/displayname, kimai: title }
        roles:
            resetOnLogin: true
            attribute: http://schemas.microsoft.com/ws/2008/06/identity/claims/groups
            mapping:
                - { saml: xxxxxxxx-yyyy-xxxx-yyyy-xxxxxxxxxxxx, kimai: ROLE_ADMIN }
                - { saml: Azure-Group-Object-Id, kimai: ROLE_TEAMLEAD }
        connection:
            idp:
                entityId: 'https://sts.windows.net/****-****-***/'
                singleSignOnService:
                    url: 'https://login.microsoftonline.com/****-****-***/saml2'
                x509cert: 'ADD YOUR CERTIFICATE HERE'
            sp:
                entityId: 'https://timetracking.example.com/auth/saml/metadata'
                assertionConsumerService:
                    url: 'https://timetracking.example.com/auth/saml/acs'
                singleLogoutService:
                    url: 'https://timetracking.example.com/auth/saml/logout'
            security:
                requestedAuthnContext: false
```

1. Change the title to the wanted text on the login screen
```yaml
title: Login with Azure
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
# logout does not seem to work properly
#singleLogoutService:
#    url: 'https://timetracking.example.com/auth/saml/logout'
#    binding: 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect'
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
