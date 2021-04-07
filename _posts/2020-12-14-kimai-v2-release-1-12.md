---
layout: post
title: "Release 1.12 - Bugs, bugs, bugs"
date: "2020-12-14 08:00:00 +0200"
author: kevinpapst
tags: [Release]
---

The release 1.12 was published quite a while ago - sorry for the late release post! 

This release was mainly a bugfix version, which improves internals for plugin developer.

### Export repositories

Allow custom export repositories: eg. [Expenses]({% link _store/keleo-expenses-bundle.md %}) will be included in the global Export.

### Reassign timesheets

Allows reassigning of timesheet records from "delete user" dialog, so historical data can be moved to a backup account upon user deletion:

![Confirm reassignment](/images/documentation/user/delete_user_reassign.png "Reassign timesheets when deleting account"){:height="250px"}

### Translations

Updated translations for Spanish, Turkish, Portuguese Brazil, Portuguese, Dutch, Romanian, Slovak, Russian, Esperanto, Hungarian, Arabic, French, Polish and Korean.

### Security issues

This version includes a bugfix for XSS vulnerabilities in some admin pages, which was found and reported by David Woodhouse from [Aegis9](https://www.aegis9.com.au). Thank you! 

### Thank you!

Thanks to all of you for using and supporting Kimai, especially:
- all clients and donors who help me to keep up the work for Kimai
- the developers who contributed their time
- the translators in our [Weblate community](http://hosted.weblate.org/projects/kimai/)
- everyone else contributing at GitHub, too many to name you all 

All of you guys rock ❤️ thanks for being part of the Kimai community!

> Want to upgrade? [Click here to find out how]({%link _documentation/updates.md %}).

# Changelog

[Full Changelog](https://github.com/kevinpapst/kimai2/compare/1.11.1...1.12)

**Implemented enhancements:**

- Consolidation of items in the search function between time recording and expenses [\#2118](https://github.com/kevinpapst/kimai2/issues/2118)
- Dashboard \> My Teams \> displayed without order [\#1773](https://github.com/kevinpapst/kimai2/issues/1773)
- allow custom export repositories [\#2182](https://github.com/kevinpapst/kimai2/pull/2182) ([kevinpapst](https://github.com/kevinpapst))
- helper function for invoice templates [\#2168](https://github.com/kevinpapst/kimai2/pull/2168) ([kevinpapst](https://github.com/kevinpapst))
- allow to reassign timesheet from delete user dialog [\#2159](https://github.com/kevinpapst/kimai2/pull/2159) ([kevinpapst](https://github.com/kevinpapst))
- sort teams alphabetically in team\_list [\#2119](https://github.com/kevinpapst/kimai2/pull/2119) ([kevinpapst](https://github.com/kevinpapst))
- added event to manage javascript translations [\#2104](https://github.com/kevinpapst/kimai2/pull/2104) ([kevinpapst](https://github.com/kevinpapst))
- sort composer packages [\#2089](https://github.com/kevinpapst/kimai2/pull/2089) ([kevinpapst](https://github.com/kevinpapst))
- Api doc [\#2085](https://github.com/kevinpapst/kimai2/pull/2085) ([kevinpapst](https://github.com/kevinpapst))
- updated dependencies [\#2125](https://github.com/kevinpapst/kimai2/pull/2125) ([kevinpapst](https://github.com/kevinpapst))
- display application name and version in console [\#2150](https://github.com/kevinpapst/kimai2/pull/2150) ([kevinpapst](https://github.com/kevinpapst))
- escape configurable fields [\#2191](https://github.com/kevinpapst/kimai2/pull/2191), [\#2192](https://github.com/kevinpapst/kimai2/pull/2192) ([kevinpapst](https://github.com/kevinpapst))
- Translations update from Weblate [\#2081](https://github.com/kevinpapst/kimai2/pull/2081), [\#2071](https://github.com/kevinpapst/kimai2/pull/2071), [\#2106](https://github.com/kevinpapst/kimai2/pull/2106), [\#2136](https://github.com/kevinpapst/kimai2/pull/2136), [\#2135](https://github.com/kevinpapst/kimai2/pull/2135), [\#2102](https://github.com/kevinpapst/kimai2/pull/2102), [\#2093](https://github.com/kevinpapst/kimai2/pull/2093) ([weblate](https://github.com/weblate))

**Fixed bugs:**

- support mysqli in connection string [\#2190](https://github.com/kevinpapst/kimai2/issues/2190)
- API Auth fail with GET activities/:id/rates [\#2160](https://github.com/kevinpapst/kimai2/issues/2160)
- reporting translation issue [\#2154](https://github.com/kevinpapst/kimai2/issues/2154)
- Project directory detected wrong. Symlinks [\#2145](https://github.com/kevinpapst/kimai2/issues/2145)
- 500 server error while exporting timesheets - Kimai v2 [\#2144](https://github.com/kevinpapst/kimai2/issues/2144)
- Error 500 for AJAX GET when selecting clients/projects after update to 1.11.1 [\#2142](https://github.com/kevinpapst/kimai2/issues/2142)
- Calendar view after logging time shows resume activity [\#2105](https://github.com/kevinpapst/kimai2/issues/2105)
- Ex- and import with timelogs crossing day-edges results in inconsistent state [\#2086](https://github.com/kevinpapst/kimai2/issues/2086)
- Daterange picker does not work correctly with Sunday being first day of week [\#2078](https://github.com/kevinpapst/kimai2/issues/2078)
- Restart last activity fails if last entry was deleted [\#2036](https://github.com/kevinpapst/kimai2/issues/2036)
- Invoice creation from command line: All but the first invoice have wrong styling [\#1973](https://github.com/kevinpapst/kimai2/issues/1973)
- Failed to assign teams in future projects [\#1653](https://github.com/kevinpapst/kimai2/issues/1653)
- suppress notice for tempnam [\#2166](https://github.com/kevinpapst/kimai2/pull/2166) ([kevinpapst](https://github.com/kevinpapst))
- fixed broken test [\#2151](https://github.com/kevinpapst/kimai2/pull/2151) ([kevinpapst](https://github.com/kevinpapst))
- Re-order search form [\#2120](https://github.com/kevinpapst/kimai2/pull/2120) ([kevinpapst](https://github.com/kevinpapst))
- fix timesheet importer for entries passing midnight [\#2098](https://github.com/kevinpapst/kimai2/pull/2098) ([kevinpapst](https://github.com/kevinpapst))
- fix styling issues in PDF invoice [\#2097](https://github.com/kevinpapst/kimai2/pull/2097) ([kevinpapst](https://github.com/kevinpapst))
- fix Sunday being first day of week [\#2084](https://github.com/kevinpapst/kimai2/pull/2084) ([kevinpapst](https://github.com/kevinpapst))
- improve customer validation [\#2083](https://github.com/kevinpapst/kimai2/pull/2083) ([kevinpapst](https://github.com/kevinpapst))
