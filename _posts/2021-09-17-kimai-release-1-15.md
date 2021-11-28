---
layout: post
title: "Release 1.15 - Project detail report & Monthly budgets"
date: "2021-09-17 10:00:00 +0200"
author: kevinpapst
tags: [Release]
---

The release 1.15 was published in September 2021. 

### Attention before upgrading 

- Support for [PHP 7.2 was dropped and PHP 8 support was added]({% link _posts/2021-05-31-php8-support-php72-dropped.md %})!
- Remember that [release 1.14]({% link _posts/2021-05-21-kimai-v2-release-1-14.md %}) dropped SQLite and the FTP package (see [announcement]({% link _posts/2021-04-03-sqlite-and-ftp-support-removed.md %})).
- Updating the database might take quite a while, depending on the amount of timesheet entries (~1 minute per 100k records).
- API: Due to team structure changes, it was impossible to keep the (writing) API structure. Please adjust your code accordingly!

**LDAP & SAML**

Please verify your config with the [LDAP](https://www.kimai.org/documentation/ldap.html) and [SAML](https://www.kimai.org/documentation/saml.html) documentation, especially:

- SAML users: activate it by setting the `kimai.saml.activate: true` config key
- LDAP users: activate it by setting the `kimai.ldap.activate: true` config key
- LDAP and SAML users need to remove the complete `security` section from their `local.yaml`

### List of notable changes

- Monthly budgets and report
- Project detail report
- Improved play and stop button if only one record is allowed
- Added setting to limit the maximum length of a timesheet record
- Support multiple teamleads in each team
- Store search in session
- Added search modal for timesheet export

#### Configurations

- Self-registration is disabled by default
- Self-registration now always requires email confirmation
- Removed the YearChart widget and the related configs named `userRecapThisYear`, `userRecapLastYear`, `userRecapTwoYears`, `userRecapThreeYears`

### Security issues

Thanks to Mohammed Al Oraimi and David Woodhouse for reporting possible CSV attacks: called Dynamic Data Exchange or DDE payload attacks, actually a problem in Microsoft Excel. Do not rely on CSV for data exchange if you use Excel. This is not exclusively for Kimai, but applies for all software products that support user input and CSV export.

### Thank you!

Thanks to all of you for using and supporting Kimai, especially:
- all clients and donors who help me to keep up the work for Kimai
- the developers who contributed their time
- the translators at Weblate
- the security researcher at huntr.dev, who privately disclose any issue   
- everyone else contributing at GitHub, too many to name you all 

Thanks for being part of the Kimai community ❤️

> Want to upgrade? [Click here to find out how]({%link _documentation/updates.md %}).

## Full changelog

You can find [all commits here](https://github.com/kevinpapst/kimai2/compare/1.14.2...1.15.6).

### Implemented enhancements

- Cumbersome position of "End" button for active timesheet entry since Kimai 1.14 [#2693](https://github.com/kevinpapst/kimai2/issues/2693)
- DragAndDrop 10 RecentActivities configurable [#2646](https://github.com/kevinpapst/kimai2/issues/2646)
- Wrong version number for 1.14.3 [#2582](https://github.com/kevinpapst/kimai2/issues/2582)
- Optionally hide Username/Password and Login button [#2458](https://github.com/kevinpapst/kimai2/issues/2458)
- Explain missing time period in timesheet export [#2091](https://github.com/kevinpapst/kimai2/issues/2091)
- store search in session [#2735](https://github.com/kevinpapst/kimai2/issues/2735)
- datatable sorting [#2734](https://github.com/kevinpapst/kimai2/issues/2734)
- Added search modal for timesheet export [#2728](https://github.com/kevinpapst/kimai2/issues/2728)
- Login screen UI [#2711](https://github.com/kevinpapst/kimai2/issues/2711)
- Fixes for 1.15 [#2704](https://github.com/kevinpapst/kimai2/issues/2704)
- Support multiple teamleads in each team [#2702](https://github.com/kevinpapst/kimai2/issues/2702)
- move supported languages logic to service [#2701](https://github.com/kevinpapst/kimai2/issues/2701)
- Classical cleanup PR [#2700](https://github.com/kevinpapst/kimai2/issues/2700)
- improved play and stop button if only one record is allowed [#2692](https://github.com/kevinpapst/kimai2/issues/2692)
- allow to merge multiple Kimai 1 installations [#2691](https://github.com/kevinpapst/kimai2/issues/2691)
- allow 65535 character in meta fields [#2690](https://github.com/kevinpapst/kimai2/issues/2690)
- monthly budgets and report [#2684](https://github.com/kevinpapst/kimai2/issues/2684)
- added account number field to user [#2671](https://github.com/kevinpapst/kimai2/issues/2671)
- Bugfixes [#2669](https://github.com/kevinpapst/kimai2/issues/2669)
- better readability for drag and drop boxes [#2659](https://github.com/kevinpapst/kimai2/issues/2659)
- improve permission checks for report access [#2658](https://github.com/kevinpapst/kimai2/issues/2658)
- Configurable print export [#2657](https://github.com/kevinpapst/kimai2/issues/2657)
- Project detail report [#2651](https://github.com/kevinpapst/kimai2/issues/2651)
- refactor configurations [#2626](https://github.com/kevinpapst/kimai2/issues/2626)
- Improve color choice and name validation [#2622](https://github.com/kevinpapst/kimai2/issues/2622)
- added setting to limit the maximum length of a timesheet record [#2612](https://github.com/kevinpapst/kimai2/issues/2612)
- removed soft_limit setting [#2611](https://github.com/kevinpapst/kimai2/issues/2611)
- Refactor authentication system [#2602](https://github.com/kevinpapst/kimai2/issues/2602)
- allow to configure timezone for the lockdown period [#2593](https://github.com/kevinpapst/kimai2/issues/2593)
- Lint container [#2591](https://github.com/kevinpapst/kimai2/issues/2591)
- feat: adds support for setting description by http params [#2580](https://github.com/kevinpapst/kimai2/issues/2580) @tobybatch
- limit amount of items in calendar drag and drop boxes [#2291](https://github.com/kevinpapst/kimai2/issues/2291)
- Support for PHP 8 [#2158](https://github.com/kevinpapst/kimai2/issues/2158)
- Add a calendar configuration event [#2698](https://github.com/kevinpapst/kimai2/issues/2698) @Jelle-S
- customer-name as part of the invoice number [#2640](https://github.com/kevinpapst/kimai2/issues/2640)
- Translations update from Weblate [#2739](https://github.com/kevinpapst/kimai2/issues/2739), [#2672](https://github.com/kevinpapst/kimai2/issues/2672), [#2665](https://github.com/kevinpapst/kimai2/issues/2665), [#2613](https://github.com/kevinpapst/kimai2/issues/2613), [#2577](https://github.com/kevinpapst/kimai2/issues/2577), [#2717](https://github.com/kevinpapst/kimai2/issues/2717), [#2661](https://github.com/kevinpapst/kimai2/issues/2661) @weblate
- Copy the billable status when restarting timesheet [#2778](https://github.com/kevinpapst/kimai2/issues/2778) @Guillaume-Duc-95
- Translations update from Weblate [#2781](https://github.com/kevinpapst/kimai2/issues/2781) @weblate
- added customer number in invoice export [#2775](https://github.com/kevinpapst/kimai2/issues/2775)
- updated changelog to clarify required LDAP changes [#2772](https://github.com/kevinpapst/kimai2/issues/2772)
- export budget and timeBudget [#2812](https://github.com/kevinpapst/kimai2/issues/2812)
- removed subtitle [#2811](https://github.com/kevinpapst/kimai2/issues/2811)
- Translations update from Weblate @[#2791](https://github.com/kevinpapst/kimai2/issues/2791) @milotype @dansamara @bittin
- added croatian language [#2817](https://github.com/kevinpapst/kimai2/issues/2817) - thanks @milotype
- set security options on cookies [#2825](https://github.com/kevinpapst/kimai2/issues/2825) - thanks @nareshsarnala
- In create screen make option to make Billable status to not billable [#2779](https://github.com/kevinpapst/kimai2/issues/2779)
- Make billable field batch editable [#2694](https://github.com/kevinpapst/kimai2/issues/2694)
- Timesheet uncheck billable by default [#2625](https://github.com/kevinpapst/kimai2/issues/2625)
- API: Add customer number to customer collection [#2358](https://github.com/kevinpapst/kimai2/issues/2358)
- improve billable flag [#2851](https://github.com/kevinpapst/kimai2/issues/2851)
- refactor system configuration title and wording [#2847](https://github.com/kevinpapst/kimai2/issues/2847)
- Translations update from Weblate [#2823](https://github.com/kevinpapst/kimai2/issues/2823) @weblate
- improve summary rows layout in reports [#2861](https://github.com/kevinpapst/kimai2/issues/2861)

### Fixed bugs

- Bug in activities API [#2765](https://github.com/kevinpapst/kimai2/issues/2765)
- No update to 1.14.3 it stops by 1.14.1 [#2759](https://github.com/kevinpapst/kimai2/issues/2759)
- Kimai2 Migrations conflict with MySQL ANSI_QUOTES mode [#2751](https://github.com/kevinpapst/kimai2/issues/2751)
- Exported XLS - cell format [#2744](https://github.com/kevinpapst/kimai2/issues/2744)
- Changing public folder path [#2742](https://github.com/kevinpapst/kimai2/issues/2742)
- copy entries not working if overlapping timentries are disabled [#2731](https://github.com/kevinpapst/kimai2/issues/2731)
- update problem [#2706](https://github.com/kevinpapst/kimai2/issues/2706)
- Tag colour defaults to grey on editing [#2649](https://github.com/kevinpapst/kimai2/issues/2649)
- Version reporting mismatch on upgrade: 1.14.1 or 1.14.3? [#2648](https://github.com/kevinpapst/kimai2/issues/2648)
- Calendar is cut off at the bottom of the browser [#2609](https://github.com/kevinpapst/kimai2/issues/2609)
- Reassigning activity to other customer/project does not adapt timesheet entries [#2576](https://github.com/kevinpapst/kimai2/issues/2576)
- CSV importer adds only first missing customer, assigning all other projects to that new customer [#2479](https://github.com/kevinpapst/kimai2/issues/2479)
- using the same tag multiple times in csv not resolved [#2318](https://github.com/kevinpapst/kimai2/issues/2318)
- Small color bug with projects [#2200](https://github.com/kevinpapst/kimai2/issues/2200)
- Api fixes [#2766](https://github.com/kevinpapst/kimai2/issues/2766)
- fix duplicating timesheet if allow overlapping is deactivated [#2732](https://github.com/kevinpapst/kimai2/issues/2732)
- prevent email or username becoming non-unique [#2730](https://github.com/kevinpapst/kimai2/issues/2730)
- fix team edit with deactivated users [#2716](https://github.com/kevinpapst/kimai2/issues/2716)
- fix user stats in profile for first year [#2712](https://github.com/kevinpapst/kimai2/issues/2712)
- Ldap [#2689](https://github.com/kevinpapst/kimai2/issues/2689)
- LDAP: fixing issues for re-authenticating users [#2681](https://github.com/kevinpapst/kimai2/issues/2681)
- make sure that timezone is properly validated [#2663](https://github.com/kevinpapst/kimai2/issues/2663)
- bugfixes and improvements [#2660](https://github.com/kevinpapst/kimai2/issues/2660)
- Bugfixes [#2655](https://github.com/kevinpapst/kimai2/issues/2655)
- fix url under certain environments [#2621](https://github.com/kevinpapst/kimai2/issues/2621)
- fix datepicker appears out of screen [#2610](https://github.com/kevinpapst/kimai2/issues/2610)
- Whitespace on line endings in created docx invoices [#2748](https://github.com/kevinpapst/kimai2/issues/2748) @Input-BDF
- Fix division by zero in report [#2782](https://github.com/kevinpapst/kimai2/issues/2782)
- Cleanup required directories, check configured data directory, do not check for freetype support [#2782](https://github.com/kevinpapst/kimai2/issues/2782)
- remove duplicate statistic events [#2776](https://github.com/kevinpapst/kimai2/issues/2776)
- fix api doc @teams [#2773](https://github.com/kevinpapst/kimai2/issues/2773)
- Prevent expired / future projects from being displayed in the dashboard for normal users [#2721](https://github.com/kevinpapst/kimai2/issues/2721)
- Dashboard: Anzahl Kunden - Anzahl Projekte kann für Teamleiter nicht ausgeblendet werden [#2718](https://github.com/kevinpapst/kimai2/issues/2718)
- Editing timesheet record with a rate factor applied, keeps applying the factor with each edit. [#1988](https://github.com/kevinpapst/kimai2/issues/1988)
- do not apply rate factor multiple times [#2807](https://github.com/kevinpapst/kimai2/issues/2807)
- allow to customize dashboard permissions for latest row [#2806](https://github.com/kevinpapst/kimai2/issues/2806)
- hide not started projects in widget [#2805](https://github.com/kevinpapst/kimai2/issues/2805)
- respect customer visibility in project-overview report [#2804](https://github.com/kevinpapst/kimai2/issues/2804)
- fix open budget calculation [#2821](https://github.com/kevinpapst/kimai2/issues/2821) - thanks @diamondq
- Small typo leads to broken update [#2839](https://github.com/kevinpapst/kimai2/issues/2839)
- Wrong version number for 1.15.4 [#2831](https://github.com/kevinpapst/kimai2/issues/2831)
- Custom fields on timesheet copy not visible [#2842](https://github.com/kevinpapst/kimai2/issues/2842)
- Not able to update from 1.14.3 to 1.15.4 [#2837](https://github.com/kevinpapst/kimai2/issues/2837)
- fix missing meta fields in duplicate timesheet action [#2845](https://github.com/kevinpapst/kimai2/issues/2845)
- improve sunday FDOW handling [#2862](https://github.com/kevinpapst/kimai2/issues/2862)
- make sure that minute_increment is not zero [#2860](https://github.com/kevinpapst/kimai2/issues/2860)
