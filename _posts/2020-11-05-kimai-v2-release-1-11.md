---
layout: post
title: "Release 1.11 - Calendar drag & drop"
date: "2020-11-05 08:00:00 +0200"
author: kevinpapst
tags: [Release]
---

The new release 1.11 was published, some of the highlights are:

- Drag & Drop for calendar
- Configurable first day of the week
- Finnish translations
- Performance improvements
- Decrement invoice counter
- Unified notifications by SweetAlert 2

This version includes a bugfix for XSS vulnerabilities in some admin pages, which was found and reported by [SektionEins](https://sektioneins.de). Thank you! 

Thanks to all of you for using and supporting Kimai, especially:
- all clients and donors who help me to keep up the work for Kimai
- the developers who contributed their time
- everyone else contributing at GitHub, too many to name you all 

All of you guys rock ❤️ thanks for being part of the Kimai community!

> Want to upgrade? [Click here to find out how]({%link _documentation/updates.md %}).

# Changelog

[Full Changelog](https://github.com/kevinpapst/kimai2/compare/1.10.2...1.11)

**Implemented enhancements:**

- make the "permanent login" checkbox configurable [\#2008](https://github.com/kevinpapst/kimai2/issues/2008)
- Different rates for on-site and off-site \(remote\) and possibility to choose in time sheet [\#2001](https://github.com/kevinpapst/kimai2/issues/2001)
- Invoice grouped time entries per day [\#2000](https://github.com/kevinpapst/kimai2/issues/2000)
- Remove CLA from Weblate component [\#1965](https://github.com/kevinpapst/kimai2/issues/1965)
- Project/Activity color  in Calendar view [\#1946](https://github.com/kevinpapst/kimai2/issues/1946)
- Improve calendar view with last activities [\#1852](https://github.com/kevinpapst/kimai2/issues/1852)
- Reporting function [\#1838](https://github.com/kevinpapst/kimai2/issues/1838)
- Permissions to activities [\#1750](https://github.com/kevinpapst/kimai2/issues/1750)
- Configurable first day of the week [\#1732](https://github.com/kevinpapst/kimai2/issues/1732)
- CI workflows [\#2061](https://github.com/kevinpapst/kimai2/pull/2061) ([kevinpapst](https://github.com/kevinpapst))
- Dutch translation update 1.10.2 stable [\#2058](https://github.com/kevinpapst/kimai2/pull/2058) ([IxFail](https://github.com/IxFail))
- Fix Composer 2 compatibility [\#2056](https://github.com/kevinpapst/kimai2/pull/2056) ([kevinpapst](https://github.com/kevinpapst))
- allow to configured database version via ENV var [\#2055](https://github.com/kevinpapst/kimai2/pull/2055) ([kevinpapst](https://github.com/kevinpapst))
- improved timesheet importer [\#2049](https://github.com/kevinpapst/kimai2/pull/2049) ([kevinpapst](https://github.com/kevinpapst))
- Finnish translations [\#2046](https://github.com/kevinpapst/kimai2/pull/2046) ([vilu85](https://github.com/vilu85))
- support custom fields in timesheet batch update [\#2043](https://github.com/kevinpapst/kimai2/pull/2043) ([kevinpapst](https://github.com/kevinpapst))
- added dateformat and timezone options to project importer [\#2042](https://github.com/kevinpapst/kimai2/pull/2042) ([kevinpapst](https://github.com/kevinpapst))
- Some arbitrary changes 1.11 [\#2032](https://github.com/kevinpapst/kimai2/pull/2032) ([kevinpapst](https://github.com/kevinpapst))
- open create form for activity/project/customer in modals [\#2025](https://github.com/kevinpapst/kimai2/pull/2025) ([kevinpapst](https://github.com/kevinpapst))
- SQL performance improvements [\#2017](https://github.com/kevinpapst/kimai2/pull/2017) ([kevinpapst](https://github.com/kevinpapst))
- lifecycle events for projects [\#2013](https://github.com/kevinpapst/kimai2/pull/2013) ([kevinpapst](https://github.com/kevinpapst))
- Translations update from Weblate [\#2011](https://github.com/kevinpapst/kimai2/pull/2011) ([weblate](https://github.com/weblate))
- add a i18n api field for the users "now" datetime [\#2007](https://github.com/kevinpapst/kimai2/pull/2007) ([kevinpapst](https://github.com/kevinpapst))
- explain limited access if project or customer has team permission [\#2006](https://github.com/kevinpapst/kimai2/pull/2006) ([kevinpapst](https://github.com/kevinpapst))
- Simpler configurations [\#1995](https://github.com/kevinpapst/kimai2/pull/1995) ([kevinpapst](https://github.com/kevinpapst))
- Translations update from Weblate [\#1994](https://github.com/kevinpapst/kimai2/pull/1994) ([weblate](https://github.com/weblate))
- Execute migrations in kimai:reset-dev command [\#1982](https://github.com/kevinpapst/kimai2/pull/1982) ([kx1000](https://github.com/kx1000))
- weblate compatibility [\#1970](https://github.com/kevinpapst/kimai2/pull/1970) ([kevinpapst](https://github.com/kevinpapst))
- weblate compatibility [\#1969](https://github.com/kevinpapst/kimai2/pull/1969) ([kevinpapst](https://github.com/kevinpapst))
- fixing "translation id" in hebrew and romanian [\#1968](https://github.com/kevinpapst/kimai2/pull/1968) ([kevinpapst](https://github.com/kevinpapst))
- Translation fixes [\#1966](https://github.com/kevinpapst/kimai2/pull/1966) ([kevinpapst](https://github.com/kevinpapst))
- Calendar drag and drop [\#1962](https://github.com/kevinpapst/kimai2/pull/1962) ([kevinpapst](https://github.com/kevinpapst))
- plugin installation command [\#1953](https://github.com/kevinpapst/kimai2/pull/1953) ([kevinpapst](https://github.com/kevinpapst))
- User: configure first day of week [\#1952](https://github.com/kevinpapst/kimai2/pull/1952) ([kevinpapst](https://github.com/kevinpapst))
- Fix cwd in kimai reload [\#1951](https://github.com/kevinpapst/kimai2/pull/1951) ([tobybatch](https://github.com/tobybatch))
- Decrement invoice counter [\#1947](https://github.com/kevinpapst/kimai2/pull/1947) ([kevinpapst](https://github.com/kevinpapst))
- cleanup global context [\#1943](https://github.com/kevinpapst/kimai2/pull/1943) ([kevinpapst](https://github.com/kevinpapst))
- bump tests to phpstan level 5 [\#1922](https://github.com/kevinpapst/kimai2/pull/1922) ([kevinpapst](https://github.com/kevinpapst))
- Notifications by SweetAlert2 [\#1508](https://github.com/kevinpapst/kimai2/pull/1508) ([kevinpapst](https://github.com/kevinpapst))
- added project importer and grandtotal converter [\#1468](https://github.com/kevinpapst/kimai2/pull/1468) ([kevinpapst](https://github.com/kevinpapst))
- Importing Data [\#2041](https://github.com/kevinpapst/kimai2/issues/2041)
- Inaccuracies in Kimai Reporting Documentation [\#2019](https://github.com/kevinpapst/kimai2/issues/2019)
- validate color [\#2072](https://github.com/kevinpapst/kimai2/pull/2072) ([kevinpapst](https://github.com/kevinpapst))
- fix assertion deprecation [\#2068](https://github.com/kevinpapst/kimai2/pull/2068) ([kevinpapst](https://github.com/kevinpapst))
- Translations update from Weblate [\#2066](https://github.com/kevinpapst/kimai2/pull/2066) ([weblate](https://github.com/weblate))

**Fixed bugs:**

- Overlapping times: Not possible to add two entries with same start/stop time [\#2033](https://github.com/kevinpapst/kimai2/issues/2033)
- Deleting a user who is a teamleader will make the Database inkonsistent [\#2022](https://github.com/kevinpapst/kimai2/issues/2022)
- Reporting - Internal Server Error [\#2014](https://github.com/kevinpapst/kimai2/issues/2014)
- Kimai has become very slow after upgrade to 1.10.2 - Timesheet displays only one record per page [\#2012](https://github.com/kevinpapst/kimai2/issues/2012)
- Missing validation for duplicate email address and username [\#2003](https://github.com/kevinpapst/kimai2/issues/2003)
- Missing class active in sidebar [\#2002](https://github.com/kevinpapst/kimai2/issues/2002)
- cannot edit timesheetentry when "Allow overlapping time entries" is disabled [\#1999](https://github.com/kevinpapst/kimai2/issues/1999)
- Invoice creation: Different ordering in web-interface compared to command line [\#1972](https://github.com/kevinpapst/kimai2/issues/1972)
- Issue with missing timesheets in list / bad left joins [\#1948](https://github.com/kevinpapst/kimai2/issues/1948)
- Calendar date picker not using i18n setting [\#1572](https://github.com/kevinpapst/kimai2/issues/1572)
- Calendar popup does not disappear [\#1448](https://github.com/kevinpapst/kimai2/issues/1448)
- Fix xss [\#2060](https://github.com/kevinpapst/kimai2/pull/2060) ([kevinpapst](https://github.com/kevinpapst))
- prevent spreadsheet export and invoice from breaking [\#2054](https://github.com/kevinpapst/kimai2/pull/2054) ([kevinpapst](https://github.com/kevinpapst))
- highlight reporting in navigation for user-by-week report [\#2005](https://github.com/kevinpapst/kimai2/pull/2005) ([kevinpapst](https://github.com/kevinpapst))
- Fix user-email validation [\#2004](https://github.com/kevinpapst/kimai2/pull/2004) ([kevinpapst](https://github.com/kevinpapst))
- Fix backdrop location of Sweetalert modals [\#1997](https://github.com/kevinpapst/kimai2/pull/1997) ([kevinpapst](https://github.com/kevinpapst))
- fix restart timesheet with meta-fields [\#1993](https://github.com/kevinpapst/kimai2/pull/1993) ([kevinpapst](https://github.com/kevinpapst))
- ascending order for invoice items in command [\#1980](https://github.com/kevinpapst/kimai2/pull/1980) ([kevinpapst](https://github.com/kevinpapst))
- Can create second timesheet entry [\#2064](https://github.com/kevinpapst/kimai2/issues/2064)
- fix auto-stop when starting timesheet with tags [\#2067](https://github.com/kevinpapst/kimai2/pull/2067) ([kevinpapst](https://github.com/kevinpapst))
