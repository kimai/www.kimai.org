---
title: "Cloud Updates - March 2022"
date: "2022-03-12 14:00:00 +0200"
---

In the middle of March 2022 all clouds will be updated to the latest Kimai version.

Your clouds might be in maintenance mode for around 1 minute during the update.
In case of any question or problem, please contact [our support](https://www.kimai.cloud/support-center/request).

**Most exciting updates:**

- Reporting: new "Yearly view for one user" report [\#3155](https://github.com/kevinpapst/kimai2/pull/3155)
- Reporting: choose shown data-type (duration, rate, internal rate)  [\#3155](https://github.com/kevinpapst/kimai2/pull/3155)
- Reporting: Excel export of user-list reports [\#3154](https://github.com/kevinpapst/kimai2/pull/3154)
- Configure display of customer, project and activity in dropdown lists [\#3151](https://github.com/kevinpapst/kimai2/pull/3151)
- Allow to use negative rates in Expense module (for paying customers only)

In addition to many small adjustments, the following changes should be highlighted:

- PDF invoice template: improved font family, relocate customer number and order number in default template, added customer number and relocated some fields in freelancer template
- Sort users by display-name in users reports
- New languages `Norwegian Bokmål` and `Persian`
- Many translation updates and activated missing translations in `de_CH`, `pt_BR`, `zh_CN`
- Added comment to customer/project/activity entity and collections API
- Fix select2 and dropdown width (eg. in weekly-times form) [\#3188](https://github.com/kevinpapst/kimai2/pull/3188) 
- Fix missing custom translations in modal dialogs [\#3190](https://github.com/kevinpapst/kimai2/pull/3190) 
- Fix empty string issue in CSV export [\#3189](https://github.com/kevinpapst/kimai2/pull/3189) 
- Decimal format in print export doesn't work with language `de_AT` [\#3172](https://github.com/kevinpapst/kimai2/issues/3172)
- XLSX export: change SUM function to SUBTOTAL function [\#3166](https://github.com/kevinpapst/kimai2/pull/3166)
- Expenses: support modernized search with filter count and reset action
- Expenses: fixed exporting PDF with many entries/pages
- Expenses: fixed exposing correct columns in XLSX and CVS  export
