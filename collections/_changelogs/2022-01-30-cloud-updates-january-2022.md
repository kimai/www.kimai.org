---
title: "Cloud Updates - January 2022"
date: "2022-01-30 20:00:00 +0200"
---

At the end of January 2022 all clouds will be updated to the latest Kimai version.

Your clouds might be in maintenance mode for around 1 minute during the update.
In case of any question or problem, please contact [our support](https://www.kimai.cloud/support-center/request).

## Changes at a glance 

This update focused on detail improvements and bug fixes and two new features for paying customers: Custom content & Invoice extensions

### Custom content 

This feature is only available for paying customers.

The new menu "Custom content" replaces the recently introduced function "Custom CSS" and extends it with further options. 

- CSS / Stylesheets
- Javascript
- Global alert
- Custom content for news/instructions etc. with markdown support

More documentation is available [here]({% link _documentation/plugin-custom-content.md %}).

### Invoice extensions 

This feature is only available for paying customers.

- Set a language for formatting money and time values in invoices. The invoice language is then only used for translations. Applies to PDF and HTML templates.
- Automatic generation of another PDF file for involved timesheets. Possibility to configure the export template yourself.

Each of these functions is only active if the corresponding configuration is not empty:

![Invoice configurations]({% link images/marketplace/invoice-configuration.webp %})

More documentation is available [here]({% link _documentation/plugin-invoice.md %}).

### Further changes 

Besides many small adjustments the most important changes are:


- Added comment field to invoices [\#3045](https://github.com/kevinpapst/kimai2/pull/3045)
- Added invoice custom-fields [\#3077](https://github.com/kevinpapst/kimai2/pull/3077)
- New export template [\#3082](https://github.com/kevinpapst/kimai2/pull/3082)
- Translation updates [\#3048](https://github.com/kevinpapst/kimai2/pull/3048), [\#3032](https://github.com/kevinpapst/kimai2/pull/3032), [\#3093](https://github.com/kevinpapst/kimai2/pull/3093)
- Improve permission handling for weekly-hours controller [\#3081](https://github.com/kevinpapst/kimai2/pull/3081)
- Weekly-hours: configure amount of recent activity rows for empty weeks [\#3026](https://github.com/kevinpapst/kimai2/pull/3026)
- Improve export permission checks [\#3027](https://github.com/kevinpapst/kimai2/pull/3027)
- Fix timesheet export-state validator [\#3078](https://github.com/kevinpapst/kimai2/pull/3078)
- Fix working time widget (dashboard) with "first day of week" = sunday [\#3047](https://github.com/kevinpapst/kimai2/pull/3047)
- Fix admin access for customer in invoice module [\#3095](https://github.com/kevinpapst/kimai2/pull/3095)
- Improve team member handling [\#3097](https://github.com/kevinpapst/kimai2/pull/3097)
- Can't add user to existing team [\#2921](https://github.com/kevinpapst/kimai2/pull/2921)
- API: PATCH team members removes existing ones [\#2975](https://github.com/kevinpapst/kimai2/pull/2975)
