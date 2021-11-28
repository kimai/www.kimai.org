---
layout: post
title: "Release 1.6.2 - Important bugfixes"
date: "2019-12-02 09:00:00 +0200"
author: kevinpapst
tags: [Release]
---

A second bugfix was released for the 1.6 series, including some new invoice features as well.

These [changes](https://github.com/kevinpapst/kimai2/compare/1.5...1.6.2) are included:

- Added danish translations - thanks @Badgie
- Fixes [\#1281](https://github.com/kevinpapst/kimai2/issues/1281) - fix installation for older databases
- Fixes [\#1280](https://github.com/kevinpapst/kimai2/issues/1280) - hide multi update checkboxes for disallowed records
- Fixes [\#1286](https://github.com/kevinpapst/kimai2/issues/1286) - API: Adds team information to user, add user and teamlead information to team 
- Fixes [\#1161](https://github.com/kevinpapst/kimai2/issues/822) - dashboard counter for user/customer/project/activity (only show visible, respect team permissions) 
- Fixes [\#1295](https://github.com/kevinpapst/kimai2/issues/1295) - Fix restart action with rule "do not allow future times" 
- Changed default begin for CSV timesheet importer to prevent summer/winter time bugs
- Improve teamlead permission handling in team timesheets
- Keep basic order of user preferences

**Invoices**
- Fixes [\#1237](https://github.com/kevinpapst/kimai2/issues/1237) - New template variables for the current logged-in user
- Fixes [\#1288](https://github.com/kevinpapst/kimai2/issues/1288) - New template variables for unformatted money values
- Fix: copy invoice templates forgets new fields
- Change: decimal durations in default invoice template (added amount formatter)
- New variables for current users data in invoices
- Updated Docx template, use new template fields
- Spreadsheets: support to replace multiple values in one cell
- Spreadsheets: support to replace values in mixed content cells
- Changed invoice menu icons
- Improved permission handling for invoices (when accessed by a regular user)

> Want to upgrade? [Click here to find out how]({%link _documentation/updates.md %}).

Thanks to all of you for using and supporting Kimai, especially:
- all clients and donators who help me to keep up the work for Kimai
- the developers who contributed their time ...
- and everyone else contributing at GitHub, too many to name you all - you guys rock!
