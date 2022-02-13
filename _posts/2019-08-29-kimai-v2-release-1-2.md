---
layout: post
title: "Release 1.2 - Teams"
date: "2019-08-29 16:45:00 +0200"
author: kevinpapst
tags: [Release]
---

One release a month, so far working out... the update on my personal Kimai installation took me about 60 seconds, 
so I hope nobody is stressed by decreasing the time between releases. 

In the meantime a couple of new addons were added to the Marketplace:
- Kimai2 [Android app for offline tracking]({% link _store/mr-software-android-offline-tracker.md %})
- the [command line tools]({% link _store/infeeeee-kimai2-cmd.md %}) and [argos client]({% link _store/infeeeee-kimai2-cmd-argos.md %})
- the [Readonly access plugin]({% link _store/derpilzcc-readonly-access-bundle.md %})

Thanks to all of you, especially:
- all clients and donators, you guys rock and help me to keep up the work for Kimai!!!
- the developers who contributed their time and the plugins to the community
- the guys at Cloudron, which now [support Kimai 2](https://cloudron.io/store/org.kimai.cloudronapp.html)
- everyone else contributing at GitHub, too many to name you all ...

This release is mainly about the new introduced [team permissions]({%link _documentation/teams.md %}).
Also about invoice refactoring and an improved export dialog.  
Oh and did you know, Kimai is now translated to Korean?! Still waiting for a contribution from the community in India.

> I hope you all know how to upgrade... if not [click here]({%link _documentation/updates.md %}). And now enjoy the latest features 😄

[Full Changelog](https://github.com/kevinpapst/kimai2/compare/1.1...1.2)

**Implemented enhancements:**

- wants to Edit Weekend Day and Another role in my user [\#1048](https://github.com/kevinpapst/kimai2/issues/1048)
- Hide inactive users [\#1047](https://github.com/kevinpapst/kimai2/issues/1047)
- Format ${query.month} as a number [\#1025](https://github.com/kevinpapst/kimai2/issues/1025)
- Change/Set Currency Globally for Customers, Users, etc. [\#1017](https://github.com/kevinpapst/kimai2/issues/1017)
- auto copy current values if autocopy flag is set for fields created though metafields [\#1015](https://github.com/kevinpapst/kimai2/issues/1015)
- API \[POST\] User [\#977](https://github.com/kevinpapst/kimai2/issues/977)
- Minor: Currency upon NewProject [\#972](https://github.com/kevinpapst/kimai2/issues/972)
- Minor: Currency upon NewProject [\#972](https://github.com/kevinpapst/kimai2/issues/972)
- Better visualization of active time-recordings and start-stop [\#961](https://github.com/kevinpapst/kimai2/issues/961)
- Template variable with decimal time entry \(with "dirty" self-made solutions\) [\#955](https://github.com/kevinpapst/kimai2/issues/955)
- Configurable default date-range for initial filter in export, invoice and team-timesheets [\#887](https://github.com/kevinpapst/kimai2/issues/887)
- Exporting - Minutes output or a Summery of hours when filtering [\#882](https://github.com/kevinpapst/kimai2/issues/882)
- added API functions to save meta fields [\#1063](https://github.com/kevinpapst/kimai2/pull/1063) ([kevinpapst](https://github.com/kevinpapst))
- improve invoice handling for different rates [\#1058](https://github.com/kevinpapst/kimai2/pull/1058) ([kevinpapst](https://github.com/kevinpapst))
- support creating new roles [\#1050](https://github.com/kevinpapst/kimai2/pull/1050) ([kevinpapst](https://github.com/kevinpapst))
- refactored invoice and export forms [\#1046](https://github.com/kevinpapst/kimai2/pull/1046) ([kevinpapst](https://github.com/kevinpapst))
- added manual links to all screens [\#1044](https://github.com/kevinpapst/kimai2/pull/1044) ([kevinpapst](https://github.com/kevinpapst))
- added css class to target running records in timesheet tables [\#1042](https://github.com/kevinpapst/kimai2/pull/1042) ([kevinpapst](https://github.com/kevinpapst))
- added korean messages [\#1039](https://github.com/kevinpapst/kimai2/pull/1039) ([kevinpapst](https://github.com/kevinpapst))
- added decimal format for invoice duration [\#1037](https://github.com/kevinpapst/kimai2/pull/1037) ([kevinpapst](https://github.com/kevinpapst))
- added invoice variable for numeric month [\#1033](https://github.com/kevinpapst/kimai2/pull/1033) ([kevinpapst](https://github.com/kevinpapst))
- Copy meta fields [\#1030](https://github.com/kevinpapst/kimai2/pull/1030) ([kevinpapst](https://github.com/kevinpapst))
- upgraded to latest FosUserBundle and Symfony 4.3 [\#1005](https://github.com/kevinpapst/kimai2/pull/1005) ([kevinpapst](https://github.com/kevinpapst))
- Fix various minor English grammar translations [\#1002](https://github.com/kevinpapst/kimai2/pull/1002) ([trentks](https://github.com/trentks))
- Team permissions [\#996](https://github.com/kevinpapst/kimai2/pull/996) ([kevinpapst](https://github.com/kevinpapst))
- Fix english translation for 'info' [\#995](https://github.com/kevinpapst/kimai2/pull/995) ([trentks](https://github.com/trentks))
- added commands to further break down version infos [\#994](https://github.com/kevinpapst/kimai2/pull/994) ([kevinpapst](https://github.com/kevinpapst))
- user roles selects [\#993](https://github.com/kevinpapst/kimai2/pull/993) ([kevinpapst](https://github.com/kevinpapst))
- added calendar slot\_duration config [\#989](https://github.com/kevinpapst/kimai2/pull/989) ([kevinpapst](https://github.com/kevinpapst))
- optimize composer and commands [\#986](https://github.com/kevinpapst/kimai2/pull/986) ([kevinpapst](https://github.com/kevinpapst))
- Optimize DE Translation sigular "Schlagwort\(e\)" [\#950](https://github.com/kevinpapst/kimai2/pull/950) ([cdahinten](https://github.com/cdahinten))
- testing with mysql [\#924](https://github.com/kevinpapst/kimai2/pull/924) ([kevinpapst](https://github.com/kevinpapst))

**Fixed bugs:**

- whole team vanishes if single user is deleted [\#1052](https://github.com/kevinpapst/kimai2/issues/1052)
- Failing redirect [\#1049](https://github.com/kevinpapst/kimai2/issues/1049)
- edit team leads to empty modal [\#1040](https://github.com/kevinpapst/kimai2/issues/1040)
- Failed to create database schema : General error: 1709 Index column size too large. The maximum column size is 767 bytes. [\#1028](https://github.com/kevinpapst/kimai2/issues/1028)
- Wrong quantity / unit price for fixed rate entries during invoice generation [\#1008](https://github.com/kevinpapst/kimai2/issues/1008)
- Import failes during activities [\#999](https://github.com/kevinpapst/kimai2/issues/999)
- Dashboard incorrect timezone \(histogram only\) [\#987](https://github.com/kevinpapst/kimai2/issues/987)
- ${invoice.total\_time} sums up time and fixed rate entities [\#959](https://github.com/kevinpapst/kimai2/issues/959)
- fix empty user language [\#1054](https://github.com/kevinpapst/kimai2/pull/1054) ([kevinpapst](https://github.com/kevinpapst))
- do not delete team if linked entity is deleted [\#1053](https://github.com/kevinpapst/kimai2/pull/1053) ([kevinpapst](https://github.com/kevinpapst))
- fix team opens in modal [\#1041](https://github.com/kevinpapst/kimai2/pull/1041) ([kevinpapst](https://github.com/kevinpapst))
- reduce field size to 150 chars to not break MySQL index length [\#1031](https://github.com/kevinpapst/kimai2/pull/1031) ([kevinpapst](https://github.com/kevinpapst))
- Fix activity import Kimai v1 [\#1001](https://github.com/kevinpapst/kimai2/pull/1001) ([kevinpapst](https://github.com/kevinpapst))
- respect users timezone when populating working-time dashboard widget [\#988](https://github.com/kevinpapst/kimai2/pull/988) ([kevinpapst](https://github.com/kevinpapst))
- fix migration for sqlite users [\#985](https://github.com/kevinpapst/kimai2/pull/985) ([kevinpapst](https://github.com/kevinpapst))

**Closed issues:**

- Failed to get Password Recovery mail [\#1060](https://github.com/kevinpapst/kimai2/issues/1060)
- team user permission [\#1045](https://github.com/kevinpapst/kimai2/issues/1045)
- installation problem [\#1022](https://github.com/kevinpapst/kimai2/issues/1022)
- Unable to install version 1.1 [\#1020](https://github.com/kevinpapst/kimai2/issues/1020)
- Database Settings [\#1019](https://github.com/kevinpapst/kimai2/issues/1019)
- Filter by tags not working by via the REST API [\#1016](https://github.com/kevinpapst/kimai2/issues/1016)
- Add default API passwords in the demo installation to the documentation [\#1007](https://github.com/kevinpapst/kimai2/issues/1007)
- How to add a logo to the login screen? [\#990](https://github.com/kevinpapst/kimai2/issues/990)
- Feature Suggestion: Document How To record login/logoff events [\#911](https://github.com/kevinpapst/kimai2/issues/911)

**Merged pull requests:**

- ES translate update more natural TR [\#945](https://github.com/kevinpapst/kimai2/pull/945) ([yayitazale](https://github.com/yayitazale))
