---
title: "Release 1.20 - Calendar switch"
date: "2022-06-14 10:00:00 +0200"
author: kevinpapst
tags: [on-premise]
---

The release 1.20 and its bugfix releases were published between May and June 2022.

**You are lucky, despite announcing otherwise this release still supports PHP 7.3 and PHP 7.4. [But be warned: it is only tested with 7.4 and developed with 8.1]({% link _posts/en/2021-12-06-sunsetting-php-7.md %}).**

## Highlights

New feature highlights from the releases [1.20]({{ site.kimai_v2_repo }}/releases/tag/1.20), [1.20.1]({{ site.kimai_v2_repo }}/releases/tag/1.20.1), 
[1.20.2]({{ site.kimai_v2_repo }}/releases/tag/1.20.2), [1.20.3]({{ site.kimai_v2_repo }}/releases/tag/1.20.3) and [1.20.4]({{ site.kimai_v2_repo }}/releases/tag/1.20.4) are:

- Calendar user switching
- Exported timesheets by default for invoices
- New validation for "empty duration" timesheets
- Invoice text field to replace activity / project name
- New config settings for "weekly hours"
- New `en_GB` locale

### Thank you!

Thanks to all of you for using and supporting Kimai, especially:
- everyone who contributes financially, allowing me to spend so much time with Kimai
- the community for all their input, discussions, feature requests and bug notices
- the developers contributing their knowledge and time
- the translators at Weblate
- the security researcher who privately disclose any issue   

Thanks for being part of the Kimai community ❤️

> Want to upgrade? [Click here to find out how]({%link _documentation/updates.md %}).

## Full changelog

This changelist contains all changes between 1.19.7 and 1.20.4.

You can find [all commits here]({{ site.kimai_v2_repo }}/compare/1.19.7...1.20.4).


**Implemented enhancements:**

- Allow switching user displayed in calendar #3314, #1746, #1067
- Permission check for "mark-as-exported" checkboxes #3313
- Prevent bookings with same start / stop time #3304, #2342
- Added weekly-hours setting "how many weeks in the past for recent activities" #3296
- Added weekly-hours setting "minimum number of rows" #3297
- Added `en_GB` locale with `dd/mm/yyyy` format #3311
- improved timesheet calculator with changesets and priority #3317
- calculate and include `exported` stats (e.g. available in export templates) #3317
- added `hourly rate` column to timesheet listing #3317
- added invoice text field to project and activity #3335
- added css class for custom fields columns on listing page #3328, #3336
- added css classes in many forms for simpler customization via custom css #3320
- Added new permission to separate time and money budget #3352
- Support pdfContext for PDF invoice templates #3340
- Hide user switcher in calendar if there is only one user to choose #3340
- Mark invoices as exported by default #3340
- Make quick entry responsive for mobile-only users #3340
- Updated composer packages #3340
- Translations update from Weblate #3321, #3329, #3310, #3276, #3339
- helper method to reset timesheet rates #3317

**Fixed bugs:**
- pre-select an option if it is the only available one worked only on every second click #3337
- Unify extension check (add xsl to doctor)
- Fix updating one system-config section redirects to all sections
- edit_export_other_timesheet #1473
- Fix edit timesheet link #3340
- Fix drag & drop creates record for wrong user #3340
- Fix search with multiple bindings #3340
- Fix serialization deprecation warning #3340
- Fix duration calculation for fixed rate entries #3340
- Fix checkbox for horizontal forms #3340
- fix calendar drag and drop for regular user #3358
