---
title: "Release 1.0 - Tags, Colors, UX, Budgets, LDAP, Custom fields ..."
date: "2019-07-02 14:00:00 +0200"
author: kevinpapst
tags: [On-Premise]
---

This release is filled with exciting new features, that's why it took longer than anticipated. I wanted to get the most important features into the first production stable release.

Wait what? The first "stable release"? Well yeah, I know ... most of you are already using Kimai and never cared about the version number - but there are some large companies out there,
who want to add Kimai to their one-click installations and they don't want to support a "pre-release" version (totally understandable).

I am really excited about this release and the new stuff, that will follow in the next days. Please stay tuned! 
   
If you enjoy the new release, here is the [donation page](https://www.kimai.org/donate/). 

[Full Changelog]({{ site.kimai_v2_repo }}/compare/0.9..1.0)

**Upgrade from 0.9:**

- Execute the database migrations: [How to upgrade Kimai]({{ site.kimai_v2_repo }}/blob/main/UPGRADING.md)
- Follow the other steps mentioned in [UPGRADING.md]({{ site.kimai_v2_repo }}/blob/main/UPGRADING.md)

**Implemented enhancements:**

- Admin Timesheets Toolbar: order users by username [\#876]({{ site.kimai_v2_repo }}/issues/876)
- import project "budget" field [\#841]({{ site.kimai_v2_repo }}/issues/841)
- Add tag data to exports [\#825]({{ site.kimai_v2_repo }}/issues/825)
- Additional status indicators for a field \(tag field\) more like lables which are globally assigable and appear for each task a user is working on or has started [\#769]({{ site.kimai_v2_repo }}/issues/769)
- Include option of tags field to link various timesheet entries together and use them for filtering data [\#768]({{ site.kimai_v2_repo }}/issues/768)
- Disable manual To date and duration entry option in timer [\#764]({{ site.kimai_v2_repo }}/issues/764)
- Custom data for external references [\#760]({{ site.kimai_v2_repo }}/issues/760)
- Refactor active entries dropdown [\#754]({{ site.kimai_v2_repo }}/issues/754)
- Stop entries without page reload [\#753]({{ site.kimai_v2_repo }}/issues/753)
- More actions on data records resp. table rows [\#748]({{ site.kimai_v2_repo }}/issues/748)
- Action menu instead of icons [\#747]({{ site.kimai_v2_repo }}/issues/747)
- Multiple Work Orders under Project for a Customer [\#720]({{ site.kimai_v2_repo }}/issues/720)
- Add custom fields in timesheet record [\#697]({{ site.kimai_v2_repo }}/issues/697)
- Lock exported objects [\#686]({{ site.kimai_v2_repo }}/issues/686)
- Option to allow Markdown in Project/Activity-comments [\#677]({{ site.kimai_v2_repo }}/issues/677)
- Recalculate rates on every change [\#673]({{ site.kimai_v2_repo }}/issues/673)
- Show on the title if there is an active recording [\#660]({{ site.kimai_v2_repo }}/issues/660)
- Allow edit Date From for saved time records [\#627]({{ site.kimai_v2_repo }}/issues/627)
- Restarting a entry- missing description [\#626]({{ site.kimai_v2_repo }}/issues/626)
- Calendar: Return to last view after creating a new time entry [\#622]({{ site.kimai_v2_repo }}/issues/622)
- Unable to select «projects» while filtering in timesheets [\#601]({{ site.kimai_v2_repo }}/issues/601)
- View cut off on 4:3 monitor [\#575]({{ site.kimai_v2_repo }}/issues/575)
- Calendar view: more space for business hours [\#530]({{ site.kimai_v2_repo }}/issues/530)
- maximale Anzahl Projektstunden als Vorgabe [\#467]({{ site.kimai_v2_repo }}/issues/467)
- don't allow start end dates, just punch in or out [\#448]({{ site.kimai_v2_repo }}/issues/448)
- Refresh of Duration time [\#420]({{ site.kimai_v2_repo }}/issues/420)
- Statistic of time-used vs. time-budget [\#416]({{ site.kimai_v2_repo }}/issues/416)
- Colors for customers / projects [\#374]({{ site.kimai_v2_repo }}/issues/374)
- allow to disable user preferences by permission [\#895]({{ site.kimai_v2_repo }}/pull/895) ([kevinpapst](https://github.com/kevinpapst))
- order users by username [\#880]({{ site.kimai_v2_repo }}/pull/880) ([kevinpapst](https://github.com/kevinpapst))
- use default\_begin in duration only mode [\#873]({{ site.kimai_v2_repo }}/pull/873) ([kevinpapst](https://github.com/kevinpapst))
- Custom fields for timesheets, customers, projects and activities [\#871]({{ site.kimai_v2_repo }}/pull/871) ([kevinpapst](https://github.com/kevinpapst))
- export tags in spreadsheets [\#860]({{ site.kimai_v2_repo }}/pull/860) ([kevinpapst](https://github.com/kevinpapst))
- add tracking mode \(duration + fixed start time\) [\#859]({{ site.kimai_v2_repo }}/pull/859) ([kevinpapst](https://github.com/kevinpapst))
- branding options [\#856]({{ site.kimai_v2_repo }}/pull/856) ([kevinpapst](https://github.com/kevinpapst))
- Widget refactoring [\#847]({{ site.kimai_v2_repo }}/pull/847) ([kevinpapst](https://github.com/kevinpapst))
- added hourly and money budgets to activity, project and customer [\#843]({{ site.kimai_v2_repo }}/pull/843) ([kevinpapst](https://github.com/kevinpapst))
- updated dockerfile [\#840]({{ site.kimai_v2_repo }}/pull/840) ([kevinpapst](https://github.com/kevinpapst))
- added installation command [\#838]({{ site.kimai_v2_repo }}/pull/838) ([kevinpapst](https://github.com/kevinpapst))
- add ldap support [\#815]({{ site.kimai_v2_repo }}/pull/815) ([kevinpapst](https://github.com/kevinpapst))
- added punch-in punch-out / time-clock mode [\#812]({{ site.kimai_v2_repo }}/pull/812) ([kevinpapst](https://github.com/kevinpapst))
- allow markdown for customer, project and activity comments [\#807]({{ site.kimai_v2_repo }}/pull/807) ([kevinpapst](https://github.com/kevinpapst))
- improved html export [\#802]({{ site.kimai_v2_repo }}/pull/802) ([kevinpapst](https://github.com/kevinpapst))
-  use dropdown for entity actions on detail pages [\#801]({{ site.kimai_v2_repo }}/pull/801) ([kevinpapst](https://github.com/kevinpapst))
- lock exported timesheets [\#798]({{ site.kimai_v2_repo }}/pull/798) ([kevinpapst](https://github.com/kevinpapst))
- Calendar improvements [\#784]({{ site.kimai_v2_repo }}/pull/784) ([kevinpapst](https://github.com/kevinpapst))
- restart via API allows to copy description [\#782]({{ site.kimai_v2_repo }}/pull/782) ([kevinpapst](https://github.com/kevinpapst))
- delete timesheets via api [\#776]({{ site.kimai_v2_repo }}/pull/776) ([kevinpapst](https://github.com/kevinpapst))
- javascript and api to stop and display active records [\#772]({{ site.kimai_v2_repo }}/pull/772) ([kevinpapst](https://github.com/kevinpapst))
- recent activities via API [\#761]({{ site.kimai_v2_repo }}/pull/761) ([kevinpapst](https://github.com/kevinpapst))
- ES6 javascript conversion [\#733]({{ site.kimai_v2_repo }}/pull/733) ([kevinpapst](https://github.com/kevinpapst))
- Use tags for every timesheet entry [\#604]({{ site.kimai_v2_repo }}/pull/604) ([infastra](https://github.com/infastra))

**Fixed bugs:**

- Invoice calculator that differs between fixed and hourly rates [\#884]({{ site.kimai_v2_repo }}/issues/884)
- Timesheets table empty after update [\#878]({{ site.kimai_v2_repo }}/issues/878)
- Ability to hide the revenue stats to users [\#853]({{ site.kimai_v2_repo }}/issues/853)
- Error on update database migration:  Syntax error or access violation: 1071 Specified key was too long; max key length is 767 bytes [\#788]({{ site.kimai_v2_repo }}/issues/788)
- adding a new timesheet entry is broken [\#778]({{ site.kimai_v2_repo }}/issues/778)
- calendar week timesheet task with duration=true error 500 [\#704]({{ site.kimai_v2_repo }}/issues/704)
- Inter-month entries don't get exported in single month [\#652]({{ site.kimai_v2_repo }}/issues/652)
- fix selectbox is not resettable [\#901]({{ site.kimai_v2_repo }}/pull/901) ([kevinpapst](https://github.com/kevinpapst))
- fixed short invoice [\#891]({{ site.kimai_v2_repo }}/pull/891) ([kevinpapst](https://github.com/kevinpapst))
- fix sqlite migration [\#881]({{ site.kimai_v2_repo }}/pull/881) ([kevinpapst](https://github.com/kevinpapst))
- added LDAP config to set filter for finding user attributes [\#877]({{ site.kimai_v2_repo }}/pull/877) ([kevinpapst](https://github.com/kevinpapst))
- fix LDAP install for systems without ldap extension [\#846]({{ site.kimai_v2_repo }}/pull/846) ([kevinpapst](https://github.com/kevinpapst))
- fixed mpdf temp directory [\#845]({{ site.kimai_v2_repo }}/pull/845) ([kevinpapst](https://github.com/kevinpapst))
- enhance tag query to show all tags of an item [\#810]({{ site.kimai_v2_repo }}/pull/810) ([kevinpapst](https://github.com/kevinpapst))
- fix column and max key length [\#789]({{ site.kimai_v2_repo }}/pull/789) ([kevinpapst](https://github.com/kevinpapst))
- bugfix for API selects [\#780]({{ site.kimai_v2_repo }}/pull/780) ([kevinpapst](https://github.com/kevinpapst))
- translate date picker and charts [\#775]({{ site.kimai_v2_repo }}/pull/775) ([kevinpapst](https://github.com/kevinpapst))
- refactored javascript to ES6 classes [\#759]({{ site.kimai_v2_repo }}/pull/759) ([kevinpapst](https://github.com/kevinpapst))

**Closed issues:**

- Update Spanish translation [\#898]({{ site.kimai_v2_repo }}/issues/898)
- Update Hungarian translation [\#897]({{ site.kimai_v2_repo }}/issues/897)
- Authentication to Active Directory [\#875]({{ site.kimai_v2_repo }}/issues/875)
- LDAP Documentation Enhancement for Active Directory [\#867]({{ site.kimai_v2_repo }}/issues/867)
- Cannot find bundle in plugin tests [\#863]({{ site.kimai_v2_repo }}/issues/863)
- Allowed memory in reset-dev [\#857]({{ site.kimai_v2_repo }}/issues/857)
- 503 Error Service Unavailable [\#834]({{ site.kimai_v2_repo }}/issues/834)
- Documentation for native wrapper like nativefier [\#830]({{ site.kimai_v2_repo }}/issues/830)
- Create documentation for layman users to deploy the code on their servers  [\#827]({{ site.kimai_v2_repo }}/issues/827)
- Allow export of data in timesheet view directly from the frontend [\#826]({{ site.kimai_v2_repo }}/issues/826)
- Adding a command as Plugin [\#797]({{ site.kimai_v2_repo }}/issues/797)
- connect kimai to ldap [\#795]({{ site.kimai_v2_repo }}/issues/795)
- Older Kimai2 version compatible with PHP 7.0? [\#790]({{ site.kimai_v2_repo }}/issues/790)
- POLL: Global vs. customer currency [\#781]({{ site.kimai_v2_repo }}/issues/781)
- Docker refactor [\#763]({{ site.kimai_v2_repo }}/issues/763)
- Finally got this installed! [\#743]({{ site.kimai_v2_repo }}/issues/743)
- Possible to translate login page [\#736]({{ site.kimai_v2_repo }}/issues/736)
- Grouping Users when Exporting [\#680]({{ site.kimai_v2_repo }}/issues/680)

**Merged pull requests:**

- Added last changed strings [\#906]({{ site.kimai_v2_repo }}/pull/906) ([yayitazale](https://github.com/yayitazale))
- Update japanese translation 190702 [\#905]({{ site.kimai_v2_repo }}/pull/905) ([nabbisen](https://github.com/nabbisen))
- Update Hungarian translation [\#902]({{ site.kimai_v2_repo }}/pull/902) ([infeeeee](https://github.com/infeeeee))
- performance tuning on timesheets [\#874]({{ site.kimai_v2_repo }}/pull/874) ([kevinpapst](https://github.com/kevinpapst))
- Removed lines that skip plugins in test env [\#864]({{ site.kimai_v2_repo }}/pull/864) ([tobybatch](https://github.com/tobybatch))
- fix/LDAP multivalues Email Aliases [\#862]({{ site.kimai_v2_repo }}/pull/862) ([jacoblanco](https://github.com/jacoblanco))
- Spanish translate updated [\#852]({{ site.kimai_v2_repo }}/pull/852) ([yayitazale](https://github.com/yayitazale))
- Update of the French translation [\#850]({{ site.kimai_v2_repo }}/pull/850) ([jeau](https://github.com/jeau))
- improved fixture data for devs [\#848]({{ site.kimai_v2_repo }}/pull/848) ([kevinpapst](https://github.com/kevinpapst))
- Implement japanese translation 190601 [\#837]({{ site.kimai_v2_repo }}/pull/837) ([nabbisen](https://github.com/nabbisen))
- use codecov for coverage [\#833]({{ site.kimai_v2_repo }}/pull/833) ([kevinpapst](https://github.com/kevinpapst))
- code cleanup [\#811]({{ site.kimai_v2_repo }}/pull/811) ([kevinpapst](https://github.com/kevinpapst))
- refactored permissions for simpler customizations [\#808]({{ site.kimai_v2_repo }}/pull/808) ([kevinpapst](https://github.com/kevinpapst))
- added phpstan for code analyzes [\#806]({{ site.kimai_v2_repo }}/pull/806) ([kevinpapst](https://github.com/kevinpapst))
- added SECURITY.md [\#805]({{ site.kimai_v2_repo }}/pull/805) ([kevinpapst](https://github.com/kevinpapst))
- added funding yaml [\#804]({{ site.kimai_v2_repo }}/pull/804) ([kevinpapst](https://github.com/kevinpapst))
- timesheet controller refactoring [\#796]({{ site.kimai_v2_repo }}/pull/796) ([kevinpapst](https://github.com/kevinpapst))
- fix phpunit annotations [\#794]({{ site.kimai_v2_repo }}/pull/794) ([kevinpapst](https://github.com/kevinpapst))
- Modify Japanese translation [\#779]({{ site.kimai_v2_repo }}/pull/779) ([nabbisen](https://github.com/nabbisen))
- Add Japanese translation [\#774]({{ site.kimai_v2_repo }}/pull/774) ([nabbisen](https://github.com/nabbisen))
- fix toolbar requests for empty choice [\#758]({{ site.kimai_v2_repo }}/pull/758) ([kevinpapst](https://github.com/kevinpapst))
- added more entity actions [\#757]({{ site.kimai_v2_repo }}/pull/757) ([bjoerne2](https://github.com/bjoerne2))
- Database interoperability [\#756]({{ site.kimai_v2_repo }}/pull/756) ([kevinpapst](https://github.com/kevinpapst))
- dynamically update title and visible durations for running records [\#752]({{ site.kimai_v2_repo }}/pull/752) ([kevinpapst](https://github.com/kevinpapst))
- colors for visual grouping of customer, projects and activities [\#751]({{ site.kimai_v2_repo }}/pull/751) ([kevinpapst](https://github.com/kevinpapst))
- moved shared entity fields and functions to trait [\#750]({{ site.kimai_v2_repo }}/pull/750) ([kevinpapst](https://github.com/kevinpapst))
- Entity actions re-designed \(table buttons\) [\#746]({{ site.kimai_v2_repo }}/pull/746) ([kevinpapst](https://github.com/kevinpapst))
- navbar block cleanup [\#742]({{ site.kimai_v2_repo }}/pull/742) ([kevinpapst](https://github.com/kevinpapst))
- use bootstrap tooltips instead of own solution [\#741]({{ site.kimai_v2_repo }}/pull/741) ([kevinpapst](https://github.com/kevinpapst))
- always query timesheets by begin date [\#740]({{ site.kimai_v2_repo }}/pull/740) ([kevinpapst](https://github.com/kevinpapst))
- prevent jumping icons in navbar between collapsed and open state [\#739]({{ site.kimai_v2_repo }}/pull/739) ([kevinpapst](https://github.com/kevinpapst))
- translate time-tracking in login screen and browser title [\#738]({{ site.kimai_v2_repo }}/pull/738) ([kevinpapst](https://github.com/kevinpapst))
- theme update for swedish auth screens [\#737]({{ site.kimai_v2_repo }}/pull/737) ([kevinpapst](https://github.com/kevinpapst))
- Testing: Webpack upgrade [\#729]({{ site.kimai_v2_repo }}/pull/729) ([kevinpapst](https://github.com/kevinpapst))
