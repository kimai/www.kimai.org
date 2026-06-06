---
title: "Quality of life improvements"
date: "2026-06-06 11:00:00 +0200"
---

A lot of small improvements were shipped since our last update information, 
so we thought it's time to summarize the visible changes of the last weeks.

**Improvements**

- Added configuration to define the theme for non-authenticated pages (`Login` or `Kiosk`)
- Added Catalan translations
- Added `user` as new filter in the the invoice archive
- Added `user.account` and `entry.user_account` as invoice template variables
- Added setting to disable first time wizard for new users
- Fix: user flag `System-Account` is always editable
- Fix: new weekly-hours could not be added in weeks with exported timesheets
- Fix: exporter column styles (duration, internal price and more)
- Fix: sticky tooltip survives page reload
- Fix: some dashboard widget links were invisible in dark mode

**API**

- New API endpoints to manage comments for projects and customers
- New API endpoint to download invoices
- New API endpoint to save invoice meta-fields
- API passwords were deprecated two years ago and [are scheduled for removal]({% link _posts/en/2026-04-13-removing-api-passwords.md %}).

**Tasks**

- Assign timesheets to task (if they match project and activity)
- Widgets update ticktack on start/stop/unassign/delete
- Widgets update duration of active timesheets
- Open "edit timesheet" form with teamlead permissions if available

**Expenses**

- Added `Mark as exported` batch action

**Importer**

- Fix: generator created duplicate customer/project numbers
- All validations on all import objects must pass before persisting
- Show errors on failed validations at their respective rows and fields
- Support for the new structured customer address and more field variations in customer importer

**Videos**

We published new videos:

- [Track Expenses](https://www.youtube.com/watch?v=OuHq0tFspuQ)
- [Working Times](https://www.youtube.com/watch?v=BYkgplGTz4Q) 

Please [follow us on YouTube](https://www.youtube.com/@kimai_org) to stay up to date.
