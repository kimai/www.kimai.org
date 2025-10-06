---
title: Single Sign-On (SAML)
description: Log-in to your Kimai-Cloud with your company credentials
---

{% alert info %}This feature is **available for annual PRO subscriptions**, check the feature comparison page for more details.{% endalert %}

Users of your Kimai-Cloud can authenticate using an identity provider that supports SSO (Single Sign-On) via SAML.
You find the configuration after login at: **[My Kimai-Cloud]({{ site.cloud.my_cloud }}) > SSO Authentication**.

Currently, the following providers are supported:

- [Google Workspace](#google-saml)
- [Microsoft Azure AD](#microsoft-saml)
- [Keycloak](#keycloak-saml)

**Important to know**

- Existing cloud users will be upgraded to SAML logins, after their first SAML login (if identifier matches)
- SAML users cannot log in with password
- Without configured role mapping, every SAML user will only own the `User` role (even Admins will be downgraded on every login)

**Further settings**

The SSO configuration includes three settings, which can be de-/activated via toggles (checkboxes):
- `Activate SSO Login` - this toggles the login via SSO button
- `Activate regular login with username` - this toggles the username/password form (can be deactivated if every user logs in with SSO)
- `Reset assigned user roles during login` - if activated user roles will be removed upon login: custom role assignments are only temporary until the next login

## <span id="google-saml"></span> Google SAML

### <span id="google-workspace"></span> Workspace configuration

- Go to https://admin.google.com/ac/apps/unified
- Choose "Add app" followed by "Add custom SAML app"
- Choose your name (e.g. "Kimai-Cloud Live") and [add this image](https://raw.githubusercontent.com/kimai/images/master/logo-transparent-cloud.png)
- Copy & paste the values from the Google Step-by-Step (page 2) guide into your Kimai-Cloud SAML configuration screen:
    - `SSO-URL` into `Single Sign-On URL`
    - `Entity-ID` into `Entity ID`
    - `Certificate` into `X.509 Certificate`
- Copy & paste the values from the Kimai-Cloud SAML configuration screen into Google Step-by-Step guide (page 3):
    - `ACS-URL` into `ACS-URL`
    - `Entity ID` into `Entity-ID`
    - Choose the `Name-ID Format`: "X509_SUBJECT"
    - Select the `Name-ID`: "Basic Information > Primary Email"
- On page 4 `Attributes` you have to define the `User attribute` mapping like this (**correct case is important, and you need to configure all attributes, even if you do not use them**):
    - `Basic Information > Primary email` → `Email`
    - `Basic Information > First name` → `FirstName` (optional)
    - `Basic Information > Last name` → `LastName` (optional)
    - `Employee Details > Employee ID` → `AccountNumber` (optional)
    - `Employee Details > Title` → `Title` (optional)
- Back on the overview page: activate the new application for your users
- The last configuration step takes care of the `User role` mapping, which can be defined in two ways:
    - Using Google Groups (recommended):
        - Create Groups for the Kimai roles you want to apply under Directory > Groups
        - Apply these groups to your users
        - Go back to edit your SAML application and configure the optional group-membership:
            - Choose all groups you configured for Kimai and map them to the App-Attribute `Groups`
    - Using a custom attribute:
        - Create a [User defined attribute](https://admin.google.com/ac/customschema) called `SAML Group`
        - Add a field `KimaiRole` as text type with multi-value
        - Edit your users and apply the values within the new attribute:
            - The value `Kimai-System` maps to the Kimai role `System-Admin`
            - The value `Kimai-Admin` maps to the Kimai role `Administrator`
            - The value `Kimai-Teamlead` maps to the Kimai role `Teamlead`
        - Go back to edit your SAML application and configure one more attribute mapping:
            - The Google directory attribute `SAML Group > KimaiRole` to the App-Attribute `Groups`

You can use other names for your groups, the mapping happens in the next step in your Cloud configuration.

This screenshot is a showcase of the attribute mapping including groups:

{% include docs-image.html src="/images/documentation/cloud/saml-google-attributes.webp" title="Google - SAMl attribute mapping" width="800px" %}

### <span id="google-cloud"></span> Cloud configuration

{% include docs-image.html src="/images/documentation/cloud/saml-google-cloud.webp" title="Google - Cloud configuration" width="800px" %}

## <span id="microsoft-saml"></span> Microsoft SAML

### <span id="microsoft-azure"></span> Entra ID (ex. Azure AD) Configuration

- Sign in to the [Azure portal](https://portal.azure.com/).
- Select the **Microsoft Entra ID** service from the navigation.
- Navigate to **Enterprise Applications** and then select **New application**.
- In the "Browse Microsoft Entra Gallery" section, search for **Microsoft Entra SAML Toolkit** and select it.
- Enter the application name to "Kimai-Cloud", hit the `Create` button add wait for the app to be added.
- On the "Overview" page select "Assign user and groups" and add all users that should have access to Kimai.
- Back on the "Overview" page select "Set up single sign on" and choose **SAML** as your choice.
- Edit the **Basic SAML Configuration** and add the required **URLs**:
    - Replace `foo.kimai.cloud` in the following examples with your cloud domain
    - Identifier (Entity ID): `https://foo.kimai.cloud/auth/saml/metadata`
    - Reply URL (Assertion Consumer Service URL): `https://foo.kimai.cloud/auth/saml/acs`
    - Sign on URL: `https://foo.kimai.cloud/`
    - Relay State (Optional) - skip this one
    - Logout Url (Optional) - skip this one
- After saving the URLs: edit the **Attributes & Claims** and configure required settings (see screenshot below):
    - Change `Source attribute` of the `Unique User Identifier (Name ID)` to `user.mail`
    - Select `Add a group claim` with the settings `All groups` and the Source attribute `Group ID`
    - Now you can add optional attributes, which Kimai supports (from the `http://schemas.xmlsoap.org/ws/2005/05/identity/claims` namespace): 
      - Select `Add new claim` with Name: `givenname`, Source attribute: `user.givenname` (optional)
      - Select `Add new claim` with Name: `surname`, Source attribute: `user.surname` (optional)
      - Select `Add new claim` with Name: `displayname`, Source attribute: `user.displayname` (optional)
      - Select `Add new claim` with Name: `employeeid`, Source attribute: `user.employeeid` (optional)
- Return to the **Set up Single Sign-On with SAML** page and download **Certificate (Base64)** from the "SAML Signing Certificate" section. Edit the `Kimai Cloud.cer` file and copy&paste the content into the Cloud configuration field `X.509 Certificate`.
- Copy the values of **Set up Kimai-Cloud** into the Cloud configuration:
    - Login URL: `Login URL`
    - Microsoft Entra Identifier: `Azure AD Identifier (SAML Entity ID)`

**Configure "Attributes & Claims":**
{% include docs-image.html src="/images/documentation/cloud/saml-azure-attributes.webp" title="Azure - Attributes & Claims" width="800px" %}

**Configure "Groups":**
- In the "Azure Active Directory" section, choose "Groups" from the navigation.
- Click "New group" (with the group type: Security) and repeat this action for each group:
    - Set the name `Kimai Teamlead` and add members
    - Set the name `Kimai Admin` and add members
    - Set the name `Kimai System-Admin` and add members
- Copy & paste the `Object Id` of each group into the Cloud configuration (see screenshot below).
  {% include docs-image.html src="/images/documentation/cloud/saml-azure-groups.webp" title="Azure - Groups" width="800px" %}

### <span id="microsoft-cloud"></span> Cloud configuration

{% include docs-image.html src="/images/documentation/cloud/saml-azure-cloud.webp" title="Azure - Cloud configuration" width="800px" %}

## <span id="keycloak-saml"></span> Keycloak SAML

Start by setting up your Keycloak following the [Keycloak docs]({% link _documentation/saml-keycloak.md %}). 

Then make sure to define the `User attribute` mapping like this (**correct case is important, and you need to configure all attributes, even if you do not use them**):

- `Basic Information > Primary email` → `Email`
- `Basic Information > First name` → `FirstName`
- `Basic Information > Last name` → `LastName`
- `Employee Details > Employee ID` → `AccountNumber`
- `Employee Details > Title` → `Title`

Important: Edit the SAML capabilities and set the `Name ID format` to `email`. 
