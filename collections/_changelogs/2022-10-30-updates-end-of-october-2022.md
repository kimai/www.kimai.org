---
title: "Updates end of October 2022"
date: "2022-10-30 12:00:00 +0200"
---

At the end of October 2022 all clouds will be updated with the latest improvements.

Your clouds might be in maintenance mode for around 1 minute during the update.
In case of any question or problem, please contact [our support](https://www.kimai.cloud/support-center/request).

**Features**

- New setting to copy teams from logged-in user for new projects
- Added team filter for invoice, export, expenses and reports
- New setting that allows to show customer name in project dropdown
- Added first and last date fields as invoice template variables
- Hide user / team fields in search forms if count of users < 2 or teams < 2
- Added new custom field type (drop-down) with filter / inline search for large datasets
- Added duration select (dropdown) to estimation field for tasks
- Loosen strict format for tasks estimation field (allow to enter a duration like 2.5 and 5h)
- Allow time logging to any task with `task_start_all` permission
- Allow to order by hourlyRate in timesheet listing
- Translation updates

**Fixed bugs**

- Fix one-minute rounding bug in quick-entries and more
- Prevent session usage for pure API calls
- Allow 4 decimals for rounded rates
- Fix several markdown rendering issues
- Custom translations were not used in rare edge cases (e.g. HTML export template)
- Do not show invoices with a negative total
- Use custom-field type translation in index / listing page
