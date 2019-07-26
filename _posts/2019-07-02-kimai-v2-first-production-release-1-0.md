---
layout: post
title: "Release 1.0 - Tags, Colors, UX, Budgets, LDAP, Custom fields and so much more"
date: "2019-07-02 14:00:00 +0200"
author: kevinpapst
tags: [Release]
---

This release is filled with exciting new features, that's why it took longer than anticipated. I wanted to get the most important features into the first production stable release.
Wait what? The first "stable release"? Well yeah, I know ... most of you are already using Kimai and never cared about the version number - but there are some large companies out there,
who want to add Kimai to their one-click installations and they don't want to support a "pre-release" version (totally understandable).

I am really excited about this release and the new stuff, that will follow in the next days. Please stay tuned! 
   
If you enjoy the new release, here is the [donation page](https://www.kimai.org/donate/). 

[Full Changelog](https://github.com/kevinpapst/kimai2/compare/0.9..1.0)

**Upgrade from 0.9:**

- Execute the database migrations: [How to upgrade Kimai](https://github.com/kevinpapst/kimai2/blob/master/UPGRADING.md)
- Follow the other steps mentioned in [UPGRADING.md](https://github.com/kevinpapst/kimai2/blob/master/UPGRADING.md)

**Implemented enhancements:**

- Admin Timesheets Toolbar: order users by username [\#876](https://github.com/kevinpapst/kimai2/issues/876)
- import project "budget" field [\#841](https://github.com/kevinpapst/kimai2/issues/841)
- Add tag data to exports [\#825](https://github.com/kevinpapst/kimai2/issues/825)
- Additional status indicators for a field \(tag field\) more like lables which are globally assigable and appear for each task a user is working on or has started [\#769](https://github.com/kevinpapst/kimai2/issues/769)
- Include option of tags field to link various timesheet entries together and use them for filtering data [\#768](https://github.com/kevinpapst/kimai2/issues/768)
- Disable manual To date and duration entry option in timer [\#764](https://github.com/kevinpapst/kimai2/issues/764)
- Custom data for external references [\#760](https://github.com/kevinpapst/kimai2/issues/760)
- Refactor active entries dropdown [\#754](https://github.com/kevinpapst/kimai2/issues/754)
- Stop entries without page reload [\#753](https://github.com/kevinpapst/kimai2/issues/753)
- More actions on data records resp. table rows [\#748](https://github.com/kevinpapst/kimai2/issues/748)
- Action menu instead of icons [\#747](https://github.com/kevinpapst/kimai2/issues/747)
- Multiple Work Orders under Project for a Customer [\#720](https://github.com/kevinpapst/kimai2/issues/720)
- Add custom fields in timesheet record [\#697](https://github.com/kevinpapst/kimai2/issues/697)
- Lock exported objects [\#686](https://github.com/kevinpapst/kimai2/issues/686)
- Option to allow Markdown in Project/Activity-comments [\#677](https://github.com/kevinpapst/kimai2/issues/677)
- Recalculate rates on every change [\#673](https://github.com/kevinpapst/kimai2/issues/673)
- Show on the title if there is an active recording [\#660](https://github.com/kevinpapst/kimai2/issues/660)
- Allow edit Date From for saved time records [\#627](https://github.com/kevinpapst/kimai2/issues/627)
- Restarting a entry- missing description [\#626](https://github.com/kevinpapst/kimai2/issues/626)
- Calendar: Return to last view after creating a new time entry [\#622](https://github.com/kevinpapst/kimai2/issues/622)
- Unable to select «projects» while filtering in timesheets [\#601](https://github.com/kevinpapst/kimai2/issues/601)
- View cut off on 4:3 monitor [\#575](https://github.com/kevinpapst/kimai2/issues/575)
- Calendar view: more space for business hours [\#530](https://github.com/kevinpapst/kimai2/issues/530)
- maximale Anzahl Projektstunden als Vorgabe [\#467](https://github.com/kevinpapst/kimai2/issues/467)
- don't allow start end dates, just punch in or out [\#448](https://github.com/kevinpapst/kimai2/issues/448)
- Refresh of Duration time [\#420](https://github.com/kevinpapst/kimai2/issues/420)
- Statistic of time-used vs. time-budget [\#416](https://github.com/kevinpapst/kimai2/issues/416)
- Colors for customers / projects [\#374](https://github.com/kevinpapst/kimai2/issues/374)
- allow to disable user preferences by permission [\#895](https://github.com/kevinpapst/kimai2/pull/895) ([kevinpapst](https://github.com/kevinpapst))
- order users by username [\#880](https://github.com/kevinpapst/kimai2/pull/880) ([kevinpapst](https://github.com/kevinpapst))
- use default\_begin in duration only mode [\#873](https://github.com/kevinpapst/kimai2/pull/873) ([kevinpapst](https://github.com/kevinpapst))
- Custom fields for timesheets, customers, projects and activities [\#871](https://github.com/kevinpapst/kimai2/pull/871) ([kevinpapst](https://github.com/kevinpapst))
- export tags in spreadsheets [\#860](https://github.com/kevinpapst/kimai2/pull/860) ([kevinpapst](https://github.com/kevinpapst))
- add tracking mode \(duration + fixed start time\) [\#859](https://github.com/kevinpapst/kimai2/pull/859) ([kevinpapst](https://github.com/kevinpapst))
- branding options [\#856](https://github.com/kevinpapst/kimai2/pull/856) ([kevinpapst](https://github.com/kevinpapst))
- Widget refactoring [\#847](https://github.com/kevinpapst/kimai2/pull/847) ([kevinpapst](https://github.com/kevinpapst))
- added hourly and money budgets to activity, project and customer [\#843](https://github.com/kevinpapst/kimai2/pull/843) ([kevinpapst](https://github.com/kevinpapst))
- updated dockerfile [\#840](https://github.com/kevinpapst/kimai2/pull/840) ([kevinpapst](https://github.com/kevinpapst))
- added installation command [\#838](https://github.com/kevinpapst/kimai2/pull/838) ([kevinpapst](https://github.com/kevinpapst))
- add ldap support [\#815](https://github.com/kevinpapst/kimai2/pull/815) ([kevinpapst](https://github.com/kevinpapst))
- added punch-in punch-out / time-clock mode [\#812](https://github.com/kevinpapst/kimai2/pull/812) ([kevinpapst](https://github.com/kevinpapst))
- allow markdown for customer, project and activity comments [\#807](https://github.com/kevinpapst/kimai2/pull/807) ([kevinpapst](https://github.com/kevinpapst))
- improved html export [\#802](https://github.com/kevinpapst/kimai2/pull/802) ([kevinpapst](https://github.com/kevinpapst))
-  use dropdown for entity actions on detail pages [\#801](https://github.com/kevinpapst/kimai2/pull/801) ([kevinpapst](https://github.com/kevinpapst))
- lock exported timesheets [\#798](https://github.com/kevinpapst/kimai2/pull/798) ([kevinpapst](https://github.com/kevinpapst))
- Calendar improvements [\#784](https://github.com/kevinpapst/kimai2/pull/784) ([kevinpapst](https://github.com/kevinpapst))
- restart via API allows to copy description [\#782](https://github.com/kevinpapst/kimai2/pull/782) ([kevinpapst](https://github.com/kevinpapst))
- delete timesheets via api [\#776](https://github.com/kevinpapst/kimai2/pull/776) ([kevinpapst](https://github.com/kevinpapst))
- javascript and api to stop and display active records [\#772](https://github.com/kevinpapst/kimai2/pull/772) ([kevinpapst](https://github.com/kevinpapst))
- recent activities via API [\#761](https://github.com/kevinpapst/kimai2/pull/761) ([kevinpapst](https://github.com/kevinpapst))
- ES6 javascript conversion [\#733](https://github.com/kevinpapst/kimai2/pull/733) ([kevinpapst](https://github.com/kevinpapst))
- Use tags for every timesheet entry [\#604](https://github.com/kevinpapst/kimai2/pull/604) ([infastra](https://github.com/infastra))

**Fixed bugs:**

- Invoice calculator that differs between fixed and hourly rates [\#884](https://github.com/kevinpapst/kimai2/issues/884)
- Timesheets table empty after update [\#878](https://github.com/kevinpapst/kimai2/issues/878)
- Ability to hide the revenue stats to users [\#853](https://github.com/kevinpapst/kimai2/issues/853)
- Error on update database migration:  Syntax error or access violation: 1071 Specified key was too long; max key length is 767 bytes [\#788](https://github.com/kevinpapst/kimai2/issues/788)
- adding a new timesheet entry is broken in current master [\#778](https://github.com/kevinpapst/kimai2/issues/778)
- calendar week timesheet task with duration=true error 500 [\#704](https://github.com/kevinpapst/kimai2/issues/704)
- Inter-month entries don't get exported in single month [\#652](https://github.com/kevinpapst/kimai2/issues/652)
- fix selectbox is not resettable [\#901](https://github.com/kevinpapst/kimai2/pull/901) ([kevinpapst](https://github.com/kevinpapst))
- fixed short invoice [\#891](https://github.com/kevinpapst/kimai2/pull/891) ([kevinpapst](https://github.com/kevinpapst))
- fix sqlite migration [\#881](https://github.com/kevinpapst/kimai2/pull/881) ([kevinpapst](https://github.com/kevinpapst))
- added LDAP config to set filter for finding user attributes [\#877](https://github.com/kevinpapst/kimai2/pull/877) ([kevinpapst](https://github.com/kevinpapst))
- fix LDAP install for systems without ldap extension [\#846](https://github.com/kevinpapst/kimai2/pull/846) ([kevinpapst](https://github.com/kevinpapst))
- fixed mpdf temp directory [\#845](https://github.com/kevinpapst/kimai2/pull/845) ([kevinpapst](https://github.com/kevinpapst))
- enhance tag query to show all tags of an item [\#810](https://github.com/kevinpapst/kimai2/pull/810) ([kevinpapst](https://github.com/kevinpapst))
- fix column and max key length [\#789](https://github.com/kevinpapst/kimai2/pull/789) ([kevinpapst](https://github.com/kevinpapst))
- bugfix for API selects [\#780](https://github.com/kevinpapst/kimai2/pull/780) ([kevinpapst](https://github.com/kevinpapst))
- translate date picker and charts [\#775](https://github.com/kevinpapst/kimai2/pull/775) ([kevinpapst](https://github.com/kevinpapst))
- refactored javascript to ES6 classes [\#759](https://github.com/kevinpapst/kimai2/pull/759) ([kevinpapst](https://github.com/kevinpapst))

**Closed issues:**

- Update Spanish translation [\#898](https://github.com/kevinpapst/kimai2/issues/898)
- Update Hungarian translation [\#897](https://github.com/kevinpapst/kimai2/issues/897)
- Authentication to Active Directory [\#875](https://github.com/kevinpapst/kimai2/issues/875)
- LDAP Documentation Enhancement for Active Directory [\#867](https://github.com/kevinpapst/kimai2/issues/867)
- Cannot find bundle in plugin tests [\#863](https://github.com/kevinpapst/kimai2/issues/863)
- Allowed memory in reset-dev [\#857](https://github.com/kevinpapst/kimai2/issues/857)
- 503 Error Service Unavailable [\#834](https://github.com/kevinpapst/kimai2/issues/834)
- Documentation for native wrapper like nativefier [\#830](https://github.com/kevinpapst/kimai2/issues/830)
- Create documentation for layman users to deploy the master code on their servers  [\#827](https://github.com/kevinpapst/kimai2/issues/827)
- Allow export of data in timesheet view directly from the frontend [\#826](https://github.com/kevinpapst/kimai2/issues/826)
- Adding a command as Plugin [\#797](https://github.com/kevinpapst/kimai2/issues/797)
- connect kimai to ldap [\#795](https://github.com/kevinpapst/kimai2/issues/795)
- Older Kimai2 version compatible with PHP 7.0? [\#790](https://github.com/kevinpapst/kimai2/issues/790)
- POLL: Global vs. customer currency [\#781](https://github.com/kevinpapst/kimai2/issues/781)
- Docker refactor [\#763](https://github.com/kevinpapst/kimai2/issues/763)
- Finally got this installed! [\#743](https://github.com/kevinpapst/kimai2/issues/743)
- Possible to translate login page [\#736](https://github.com/kevinpapst/kimai2/issues/736)
- Grouping Users when Exporting [\#680](https://github.com/kevinpapst/kimai2/issues/680)

**Merged pull requests:**

- Added last changed strings [\#906](https://github.com/kevinpapst/kimai2/pull/906) ([yayitazale](https://github.com/yayitazale))
- Update japanese translation 190702 [\#905](https://github.com/kevinpapst/kimai2/pull/905) ([nabbisen](https://github.com/nabbisen))
- Update Hungarian translation [\#902](https://github.com/kevinpapst/kimai2/pull/902) ([infeeeee](https://github.com/infeeeee))
- performance tuning on timesheets [\#874](https://github.com/kevinpapst/kimai2/pull/874) ([kevinpapst](https://github.com/kevinpapst))
- Removed lines that skip plugins in test env [\#864](https://github.com/kevinpapst/kimai2/pull/864) ([tobybatch](https://github.com/tobybatch))
- fix/LDAP multivalues Email Aliases [\#862](https://github.com/kevinpapst/kimai2/pull/862) ([jacoblanco](https://github.com/jacoblanco))
- Spanish translate updated [\#852](https://github.com/kevinpapst/kimai2/pull/852) ([yayitazale](https://github.com/yayitazale))
- Update of the French translation [\#850](https://github.com/kevinpapst/kimai2/pull/850) ([jeau](https://github.com/jeau))
- improved fixture data for devs [\#848](https://github.com/kevinpapst/kimai2/pull/848) ([kevinpapst](https://github.com/kevinpapst))
- Implement japanese translation 190601 [\#837](https://github.com/kevinpapst/kimai2/pull/837) ([nabbisen](https://github.com/nabbisen))
- use codecov for coverage [\#833](https://github.com/kevinpapst/kimai2/pull/833) ([kevinpapst](https://github.com/kevinpapst))
- code cleanup [\#811](https://github.com/kevinpapst/kimai2/pull/811) ([kevinpapst](https://github.com/kevinpapst))
- refactored permissions for simpler customizations [\#808](https://github.com/kevinpapst/kimai2/pull/808) ([kevinpapst](https://github.com/kevinpapst))
- added phpstan for code analyzes [\#806](https://github.com/kevinpapst/kimai2/pull/806) ([kevinpapst](https://github.com/kevinpapst))
- added SECURITY.md [\#805](https://github.com/kevinpapst/kimai2/pull/805) ([kevinpapst](https://github.com/kevinpapst))
- added funding yaml [\#804](https://github.com/kevinpapst/kimai2/pull/804) ([kevinpapst](https://github.com/kevinpapst))
- timesheet controller refactoring [\#796](https://github.com/kevinpapst/kimai2/pull/796) ([kevinpapst](https://github.com/kevinpapst))
- fix phpunit annotations [\#794](https://github.com/kevinpapst/kimai2/pull/794) ([kevinpapst](https://github.com/kevinpapst))
- Modify Japanese translation [\#779](https://github.com/kevinpapst/kimai2/pull/779) ([nabbisen](https://github.com/nabbisen))
- Add Japanese translation [\#774](https://github.com/kevinpapst/kimai2/pull/774) ([nabbisen](https://github.com/nabbisen))
- fix toolbar requests for empty choice [\#758](https://github.com/kevinpapst/kimai2/pull/758) ([kevinpapst](https://github.com/kevinpapst))
- added more entity actions [\#757](https://github.com/kevinpapst/kimai2/pull/757) ([bjoerne2](https://github.com/bjoerne2))
- Database interoperability [\#756](https://github.com/kevinpapst/kimai2/pull/756) ([kevinpapst](https://github.com/kevinpapst))
- dynamically update title and visible durations for running records [\#752](https://github.com/kevinpapst/kimai2/pull/752) ([kevinpapst](https://github.com/kevinpapst))
- colors for visual grouping of customer, projects and activities [\#751](https://github.com/kevinpapst/kimai2/pull/751) ([kevinpapst](https://github.com/kevinpapst))
- moved shared entity fields and functions to trait [\#750](https://github.com/kevinpapst/kimai2/pull/750) ([kevinpapst](https://github.com/kevinpapst))
- Entity actions re-designed \(table buttons\) [\#746](https://github.com/kevinpapst/kimai2/pull/746) ([kevinpapst](https://github.com/kevinpapst))
- navbar block cleanup [\#742](https://github.com/kevinpapst/kimai2/pull/742) ([kevinpapst](https://github.com/kevinpapst))
- use bootstrap tooltips instead of own solution [\#741](https://github.com/kevinpapst/kimai2/pull/741) ([kevinpapst](https://github.com/kevinpapst))
- always query timesheets by begin date [\#740](https://github.com/kevinpapst/kimai2/pull/740) ([kevinpapst](https://github.com/kevinpapst))
- prevent jumping icons in navbar between collapsed and open state [\#739](https://github.com/kevinpapst/kimai2/pull/739) ([kevinpapst](https://github.com/kevinpapst))
- translate time-tracking in login screen and browser title [\#738](https://github.com/kevinpapst/kimai2/pull/738) ([kevinpapst](https://github.com/kevinpapst))
- theme update for swedish auth screens [\#737](https://github.com/kevinpapst/kimai2/pull/737) ([kevinpapst](https://github.com/kevinpapst))
- Testing: Webpack upgrade [\#729](https://github.com/kevinpapst/kimai2/pull/729) ([kevinpapst](https://github.com/kevinpapst))
