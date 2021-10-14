---
layout: post
title: "Release 1.14 - Reports, invoices & search bookmark"
date: "2021-05-21 10:00:00 +0200"
author: kevinpapst
tags: [Release]
---

The release 1.14.3 was just published, after the major release was already released on the 23th of April.
Sorry for the late posting, but some bugs popped up that needed to be fixed before this announcement.

**Attention**  
This release includes a critical backward compatibility break: 
dropped SQLite support and FTP installation package (see [announcement](https://www.kimai.org/blog/2021/sqlite-and-ftp-support-removed/)).

### List of notable changes

- A new translation language was added: Greek
- Prevent overbooking of budgets (can be deactivated)
- Differentiate between billable and non-billable timesheets
- Duplicate timesheet entries via dialog for immediate adjustments
- Create bookmarks to change the default search of all listings (including invoice and export)
- Highlight invisible/deactivated items with light yellow background
- Change select box for colors: pre-select from a configured list via dropdown 
- Redesigned action-toolbar on detail pages
- Export preview with money and time totals grouped by customer

#### Configurations

- Configure start of "financial year"
- Improved "Sunday being first day of week"
- Select report as initial view after login
- Configure the initial reporting view

#### Invoices
- Added preview grouped by customer
- Batch generation of invoices 
- Added invoice archive with search
- Save payment date for invoices
- Export list of generated invoices

#### Calendar
- Display a daily total in "week" and "day" view
- Delete a time entry in the calendar view via drag & drop

#### New reports

- Monthly view for all users
- Yearly view for all users
- Project overview
- Inactive projects

### Security issues

David Woodhouse from [Aegis9](https://www.aegis9.com.au) and [Mohammed Al Oraimi](https://twitter.com/ixSly) reported a security issue related to CSV exports, 
called `Dynamic Data Exchange` or `DDE payload` attack (Users can add DDE payloads in timesheet descriptions). 
This is not a Kimai problem, but applies to all programs that support user input and CSV export.
Microsoft actually calls this problem a "feature" of Excel.
Advice: Do not rely on CSV for data exchange if you use Excel, export XSLX instead. 

### Thank you!

Thanks to all of you for using and supporting Kimai, especially:
- all clients and donors who help me to keep up the work for Kimai
- the developers who contributed their time
- the translators at Weblate
- the security researcher out there, who privately disclose any issue   
- everyone else contributing at GitHub, too many to name you all 

Thanks for being part of the Kimai community ❤️

> Want to upgrade? [Click here to find out how]({%link _documentation/updates.md %}).

## Full changelog

You can find [all commits here](https://github.com/kevinpapst/kimai2/compare/1.13...1.14.2).

**Implemented enhancements:**

- Tags in invoices [\#2525](https://github.com/kevinpapst/kimai2/issues/2525)
- Monthly view for all users [\#2460](https://github.com/kevinpapst/kimai2/issues/2460)
- Invoices -\> new field to save the date when the invoice was payed [\#2449](https://github.com/kevinpapst/kimai2/issues/2449)
- More columns for the spreadsheet exporter [\#2355](https://github.com/kevinpapst/kimai2/issues/2355)
- Projects: Make data field "time budget" available in "eye" function of list view [\#2343](https://github.com/kevinpapst/kimai2/issues/2343)
- Reporting: Not only for users, also for projects [\#2265](https://github.com/kevinpapst/kimai2/issues/2265)
- Calendar: add day-total per day on the calendar-view  [\#2252](https://github.com/kevinpapst/kimai2/issues/2252)
- Batch generation of invoices for all customers [\#2178](https://github.com/kevinpapst/kimai2/issues/2178)
- allow time entry for reporting / initial view [\#2131](https://github.com/kevinpapst/kimai2/issues/2131)
- Calendar: provide possibility to delete a time entry in the calendar view [\#2124](https://github.com/kevinpapst/kimai2/issues/2124)
- Disallow reports for inactive users [\#2048](https://github.com/kevinpapst/kimai2/issues/2048)
- Listexport of generated Invoices from a certain state [\#1955](https://github.com/kevinpapst/kimai2/issues/1955)
- User - restrict permission on changing Name, Title, and Profile Image [\#1935](https://github.com/kevinpapst/kimai2/issues/1935)
- change select box for colors [\#1919](https://github.com/kevinpapst/kimai2/issues/1919)
- Display a "time/budget"-bar on the projects overview [\#1912](https://github.com/kevinpapst/kimai2/issues/1912)
- Support tags in invoices [\#2526](https://github.com/kevinpapst/kimai2/pull/2526) ([kevinpapst](https://github.com/kevinpapst))
- show daily sum in calendar week and day view [\#2519](https://github.com/kevinpapst/kimai2/pull/2519) ([kevinpapst](https://github.com/kevinpapst))
- added activity events for plugins [\#2516](https://github.com/kevinpapst/kimai2/pull/2516) ([kevinpapst](https://github.com/kevinpapst))
- Added drag & drop area to delete entries from the calendar [\#2513](https://github.com/kevinpapst/kimai2/pull/2513) ([kevinpapst](https://github.com/kevinpapst))
- update backend and frontend libraries [\#2512](https://github.com/kevinpapst/kimai2/pull/2512) ([kevinpapst](https://github.com/kevinpapst))
- Inactive projects, bookmark export search, billable timesheets [\#2503](https://github.com/kevinpapst/kimai2/pull/2503) ([kevinpapst](https://github.com/kevinpapst))
- New report + UI improvements [\#2494](https://github.com/kevinpapst/kimai2/pull/2494) ([kevinpapst](https://github.com/kevinpapst))
- Highlight invisible items [\#2493](https://github.com/kevinpapst/kimai2/pull/2493) ([kevinpapst](https://github.com/kevinpapst))
- allow to pre-define colors to choose from [\#2481](https://github.com/kevinpapst/kimai2/pull/2481) ([kevinpapst](https://github.com/kevinpapst))
- project overview [\#2467](https://github.com/kevinpapst/kimai2/pull/2467) ([kevinpapst](https://github.com/kevinpapst))
- Create multiple invoices at once [\#2465](https://github.com/kevinpapst/kimai2/pull/2465) ([kevinpapst](https://github.com/kevinpapst))
- add subtotal and payment date to invoices [\#2450](https://github.com/kevinpapst/kimai2/pull/2450) ([cayacdev](https://github.com/cayacdev))
- Set default search options [\#2445](https://github.com/kevinpapst/kimai2/pull/2445) ([kevinpapst](https://github.com/kevinpapst))
- improve project view table [\#2441](https://github.com/kevinpapst/kimai2/pull/2441) ([kevinpapst](https://github.com/kevinpapst))
- Fix deprecations [\#2440](https://github.com/kevinpapst/kimai2/pull/2440) ([kevinpapst](https://github.com/kevinpapst))
- Added version ID for simpler comparison [\#2439](https://github.com/kevinpapst/kimai2/pull/2439) ([kevinpapst](https://github.com/kevinpapst))
- Allow to configure default report per user [\#2430](https://github.com/kevinpapst/kimai2/pull/2430) ([kevinpapst](https://github.com/kevinpapst))
- Show budget and time-budget in listing views [\#2429](https://github.com/kevinpapst/kimai2/pull/2429) ([kevinpapst](https://github.com/kevinpapst))
- Timesheet validator: prevent overbooking budgets [\#2422](https://github.com/kevinpapst/kimai2/pull/2422) ([kevinpapst](https://github.com/kevinpapst))
- Page actions [\#2420](https://github.com/kevinpapst/kimai2/pull/2420) ([kevinpapst](https://github.com/kevinpapst))
- More columns in spreadsheet exports [\#2413](https://github.com/kevinpapst/kimai2/pull/2413) ([kevinpapst](https://github.com/kevinpapst))
- Invoice archive - search and export [\#2408](https://github.com/kevinpapst/kimai2/pull/2408) ([kevinpapst](https://github.com/kevinpapst))
- Drop SQLite support [\#2405](https://github.com/kevinpapst/kimai2/pull/2405) ([kevinpapst](https://github.com/kevinpapst))
- allow to select reports as initial view [\#2403](https://github.com/kevinpapst/kimai2/pull/2403) ([kevinpapst](https://github.com/kevinpapst))
- User profile layout [\#2402](https://github.com/kevinpapst/kimai2/pull/2402) ([kevinpapst](https://github.com/kevinpapst))
- remove redundant translation key [\#2394](https://github.com/kevinpapst/kimai2/pull/2394) ([kevinpapst](https://github.com/kevinpapst))
- refactored templates to match controller [\#2391](https://github.com/kevinpapst/kimai2/pull/2391) ([kevinpapst](https://github.com/kevinpapst))
- Performance improvements [\#2329](https://github.com/kevinpapst/kimai2/pull/2329) ([kevinpapst](https://github.com/kevinpapst))
- Translations update from Weblate [\#2293](https://github.com/kevinpapst/kimai2/pull/2293), [\#2474](https://github.com/kevinpapst/kimai2/pull/2474) and [\#2401](https://github.com/kevinpapst/kimai2/pull/2401) ([weblate](https://github.com/weblate))

**Fixed bugs:**

- The dates in the header row of the table on the Reporting page are not in the correct format for English \(US\) [\#2492](https://github.com/kevinpapst/kimai2/issues/2492)
- The table Reporting page does not respect the user's First day of the week setting [\#2475](https://github.com/kevinpapst/kimai2/issues/2475)
- API Timesheets collection fails with error 500 instead of 404 [\#2466](https://github.com/kevinpapst/kimai2/issues/2466)
- The calendar view on the DateRangePicker does not respect the user's First day of the week setting [\#2459](https://github.com/kevinpapst/kimai2/issues/2459)
- Cleaning Dashboard from projects out of date [\#2390](https://github.com/kevinpapst/kimai2/issues/2390)
- Unreadable dirty modal notice [\#2370](https://github.com/kevinpapst/kimai2/issues/2370)
- Fix calendar view for drag&drop entries with tags in dropdown-mode [\#2520](https://github.com/kevinpapst/kimai2/pull/2520) ([kevinpapst](https://github.com/kevinpapst))
- fix sunday being first day of week [\#2483](https://github.com/kevinpapst/kimai2/pull/2483) ([kevinpapst](https://github.com/kevinpapst))
- fix api 404 on page parameter [\#2468](https://github.com/kevinpapst/kimai2/pull/2468) ([kevinpapst](https://github.com/kevinpapst))
- allow increasing invoice numbers per day [\#2433](https://github.com/kevinpapst/kimai2/pull/2433) ([kevinpapst](https://github.com/kevinpapst))
- hide expired projects in team-projects widget [\#2432](https://github.com/kevinpapst/kimai2/pull/2432) ([kevinpapst](https://github.com/kevinpapst))
- Widget fixes [\#2373](https://github.com/kevinpapst/kimai2/pull/2373) ([kevinpapst](https://github.com/kevinpapst))
