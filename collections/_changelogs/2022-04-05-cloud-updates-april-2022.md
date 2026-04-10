---
title: "Cloud Updates - April 2022"
date: "2022-04-05 23:07:54 +0200"
---

In the first half of April 2022 all clouds will be updated to the latest Kimai version.

Your cloud might be in maintenance mode for around 1 minute during the update.
In case of any question or problem, please contact [our support](https://www.kimai.cloud/support-center/request).

**Highlights:**
- Support for SAML authentication (in beta-test for Google Workspace customers) - [see documentation](https://www.kimai.cloud/help/saml-authentication)
- Configure the default value of the timesheet `billable` field per customer, project & activity - [see  documentation]({% link _documentation/billable.md %})
- Tasks: added task list to customer, project & activity detail pages
- Expenses: added sums to revenue on dashboard
- Expenses: show amount/cost/refundable statistics on customer, project & activity detail pages
- Expenses: added category description, which will be copied into the expense description when selected

**Enhancements:**
- Show user account number in report export [\#3224](https://github.com/kevinpapst/kimai2/pull/3224)
- Improved button label for non-translated export templates [\#3204](https://github.com/kevinpapst/kimai2/pull/3204)
- Support more complex custom-field queries (search empty, non existing and entries with values) [\#3228](https://github.com/kevinpapst/kimai2/pull/3228)
- Expenses: added pagination support for category page
- Translation updates [\#3208](https://github.com/kevinpapst/kimai2/pull/3208), [\#3194](https://github.com/kevinpapst/kimai2/pull/3194), [\#3221](https://github.com/kevinpapst/kimai2/pull/3221), [\#3235](https://github.com/kevinpapst/kimai2/pull/3235)

**Fixed bugs:**
- Fixed avatar image size when using images  [\#3204](https://github.com/kevinpapst/kimai2/pull/3204), [\#3163](https://github.com/kevinpapst/kimai2/issues/3163), [\#3180](https://github.com/kevinpapst/kimai2/issues/3180)
- SVG avatars not shown in top bar [\#3163](https://github.com/kevinpapst/kimai2/issues/3163)
- Kimai API billable switch missing [\#2705](https://github.com/kevinpapst/kimai2/issues/2705)
- Fixed truncated comments: customer, project, task [\#3204](https://github.com/kevinpapst/kimai2/pull/3204)
- Fix relative times in budget calculation in exports [\#3216](https://github.com/kevinpapst/kimai2/pull/3216)
- Fixed project dropdown for empty order numbers [\#3244](https://github.com/kevinpapst/kimai2/pull/3244)
