---
title: Single Sign-On (SAML)
description: Log-in to your Kimai-Cloud with your company credentials
---

Users of your Kimai-Cloud can authenticate using an identity provider that supports SSO (Single Sign-On) via SAML.
You find the configuration after login at: **My Kimai-Cloud > SSO Authentication**.

Currently, the following provider are supported:

- [Google Workspace](#google-saml)
- [Microsoft Azure AD](#microsoft-saml)

If you are using another IDP and want to use Kimai: please get in touch, I am open for your ideas.

## Important to know

- Existing cloud users will be upgraded to SAML logins, after their first SAML login (if identifier matches)
- SAML users cannot log in with password
- Without configured role mapping, every SAML user will only own the `User` role (previous Admins will be downgraded on every login)

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
- On page 4 `Attributes` you have to define the `User attribute` mapping like this (correct case is important and you need to configure all attributes, even if you do not use them):
    - `Basic Information > Primary email` → `Email`
    - `Basic Information > First name` → `FirstName`
    - `Basic Information > Last name` → `LastName`
    - `Employee Details > Employee ID` → `AccountNumber`
    - `Employee Details > Title` → `Title`
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

{% include docs-image.html src="/images/documentation/cloud/saml-google-attributes.png" title="Google - SAMl attribute mapping" width="800px" %}

### <span id="google-cloud"></span> Cloud configuration

{% include docs-image.html src="/images/documentation/cloud/saml-google-cloud.png" title="Google - Cloud configuration" width="800px" %}

## <span id="microsoft-saml"></span> Microsoft SAML

### <span id="microsoft-azure"></span> Azure AD Configuration

- Sign in to the [Azure portal](https://portal.azure.com/).
- Select the **Azure Active Directory** service from the navigation.
- Navigate to **Enterprise Applications** and then select **New application**.
- In the "Browse Azure AD Gallery" section, type **Azure AD SAML Toolkit** in the search box and select it.
- Enter the application name to "Kimai-Cloud", hit the "Creat" button add wait for the app to be added.
- On the "Overview" page select "Assign user and groups" and add all users that should have access to Kimai.
- Back on the "Overview" page select "Set up single sign on" and choose **SAML** as your choice.
- Edit the **Basic SAML Configuration** and add the required **URLs**:
    - Identifier (Entity ID): `https://timetracking.example.com/auth/saml/metadata`
    - Reply URL (Assertion Consumer Service URL): `https://timetracking.example.com/auth/saml/acs`
    - Sign on URL: `https://timetracking.example.com/`
- After saving the URLs: edit the **Attributes & Claims** and configure required settings (see screenshot below):
    - Change `Source attribute` of the `Unique User Identifier (Name ID)` to `user.mail`
    - Select `Add a group claim` with the settings `All groups` and the Source attribute `Group ID`
    - Select `Add new claim` with Name: `displayname`, Namespace: `http://schemas.xmlsoap.org/ws/2005/05/identity/claims`, Source attribute: `user.displayname`
    - Select `Add new claim` with Name: `employeeid`, Namespace: `http://schemas.xmlsoap.org/ws/2005/05/identity/claims`, Source attribute: `user.employeeid`
- Return to the **SAML-based Sign-on** page and download **Certificate (Base64)** from the "SAML Signing Certificate" section. Edit the `Kimai Cloud.cer` file and copy&paste the content into the Cloud configuration field `X.509 Certificate`.
- Copy the values of **Set up Kimai-Cloud** into the Cloud configuration:
    - Login URL: `Login URL`
    - Azure AD Identifier: `Azure AD Identifier (SAML Entity ID)`

**Configure "Attributes & Claims":**
{% include docs-image.html src="/images/documentation/cloud/saml-azure-attributes.png" title="Azure - Attributes & Claims" width="800px" %}

**Configure "Groups":**
- In the "Azure Active Directory" section, choose "Groups" from the navigation.
- Click "New group" (with the group type: Security) and repeat this action for each group:
    - Set the name `Kimai Teamlead` and add members
    - Set the name `Kimai Admin` and add members
    - Set the name `Kimai System-Admin` and add members
- Copy & paste the `Object Id` of each group into the Cloud configuration (see screenshot below).
  {% include docs-image.html src="/images/documentation/cloud/saml-azure-groups.png" title="Azure - Groups" width="800px" %}


### <span id="microsoft-cloud"></span> Cloud configuration

{% include docs-image.html src="/images/documentation/cloud/saml-azure-cloud.png" title="Azure - Cloud configuration" width="800px" %}

## Costs

There are **no additional costs** involved with the SAML SSO login. 

Instead this feature is **only available for certain plans**, check the feature comparison before subscribing to a plan.  
