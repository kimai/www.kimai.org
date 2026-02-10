---
title: "New features - September 2022"
date: "2022-09-22 18:00:00 +0200"
---

During September 2022 all clouds will be updated to the latest Kimai version.

Your clouds might be in maintenance mode for around 1 minute during the update.
In case of any question or problem, please contact [our support](https://www.kimai.cloud/support-center/request).

**Features**

- New: added a brand new importer for Customer, Project and Timesheet in JSON and CSV format
- New: [keyboard shortcuts]({% link _documentation/keyboard-shortcuts.md %}) for the most important actions
- Project: allow to restrict usage of global activities for projects
- Calendar: configurable calendar drag and drop behavior (whether to copy description and tags)
- Weekly-Hours: order by project name
- Budget: show total hourly rate in detail pages
- Invoice: support own fonts in custom PDF templates
- Invoice: link customer, project and activity in invoice listing
- Invoice: disable create-invoice links after click
- Invoice/Export: Total sums for duration and hourly-rate in invoice and export preview
- Invoice/Export: use inline disposition for PDF previews (do not download, but preview in browser)
- Export: make project and customer available in summaries for custom templates
- Report: added budget-type independent listing in "project monthly" report
- SAML: configure whether user roles will be reset on SAML login (allows to keep manual assigned groups)
- SAML: replace default group mapping names with configuration
- Audit: improved query speed for entries with multiple related changes
- Translation: added Croatian
- Translation: updated all languages
- Translation: added Dutch and Polish translations for Expenses
- Translation: added Polish translations for audit logs

**Fixed bugs**

- Multiple budget validation checks were not triggered in edge cases
- Do not require `user_preference` permission when creating new user
- Weekly-Hours were editable in "lockdown" if "grace period" was matching midnight

**Platform updates**

And in case you missed them, here are some platform from this year:

- [SAML Login with Google Workspace](https://www.kimai.cloud/news/saml-login-with-google-workspace)
- [SAML Login with Azure AD](https://www.kimai.cloud/news/saml-login-with-azure-ad)
- [SEPA Debit payments now available](https://www.kimai.cloud/news/sepa-debit-payments-now-available)
- [Video Support for paying customers](https://www.kimai.cloud/news/video-support-for-paying-customers)
