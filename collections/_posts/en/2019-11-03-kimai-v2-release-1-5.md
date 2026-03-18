---
title: "Release 1.5 - The now button"
date: "2019-11-03 18:00:00 +0200"
author: kevinpapst
tags: [on-premise]
---

This release contains various bugfixes and some new features:

- Add a "now" button to manual timesheet entry
- Query API by custom/meta fields
- Branding options in system configurations
- Reformatted edit forms
- Duration field in timesheet edit dialog
- Turkish translations

Thanks to all of you for using and supporting Kimai, especially:
- all clients and donators who help me to keep up the work for Kimai
- the developers who contributed their time ...
- and everyone else contributing at GitHub, too many to name you all - you guys rock!

> I hope you all know how to upgrade... if not [click here]({%link _documentation/updates.md %}).

# Changelog

[Full Changelog]({{ site.kimai_v2_repo }}/compare/1.4.2...1.5)

**Implemented enhancements:**

- Query API by custom fields / meta fields [\#1174]({{ site.kimai_v2_repo }}/issues/1174)
- Add a "now" button to manual timesheet entry [\#844]({{ site.kimai_v2_repo }}/issues/844)
- dynamic branding options [\#1205]({{ site.kimai_v2_repo }}/pull/1205) ([kevinpapst](https://github.com/kevinpapst))
- reformat edit forms [\#1192]({{ site.kimai_v2_repo }}/pull/1192) ([kevinpapst](https://github.com/kevinpapst))
- improve list views [\#1191]({{ site.kimai_v2_repo }}/pull/1191) ([kevinpapst](https://github.com/kevinpapst))
- added order-date field to project [\#1186]({{ site.kimai_v2_repo }}/pull/1186) ([kevinpapst](https://github.com/kevinpapst))
- Added some spanish new strings [\#1183]({{ site.kimai_v2_repo }}/pull/1183) ([yayitazale](https://github.com/yayitazale))
- duration field in timesheet edit dialog [\#1180]({{ site.kimai_v2_repo }}/pull/1180) ([kevinpapst](https://github.com/kevinpapst))
- Turkish Language Translations [\#1160]({{ site.kimai_v2_repo }}/pull/1160) ([guneysus](https://github.com/guneysus))
- Phpunit 8 [\#1155]({{ site.kimai_v2_repo }}/pull/1155) ([kevinpapst](https://github.com/kevinpapst))

**Fixed bugs:**

- Redirection of "Show all record" link fails on a servername alias. [\#1199]({{ site.kimai_v2_repo }}/issues/1199)
- Avatar url broken [\#1196]({{ site.kimai_v2_repo }}/issues/1196)
- Error pages aren't working in production [\#1194]({{ site.kimai_v2_repo }}/issues/1194)
- Filter timesheet from user list [\#1179]({{ site.kimai_v2_repo }}/issues/1179)
- REST-API Calls always returning 302 redirect to login page [\#1169]({{ site.kimai_v2_repo }}/issues/1169)
- Dashboard view not getting updated properly with the work time for the day - 'working hours today'  [\#1163]({{ site.kimai_v2_repo }}/issues/1163)
- Fix broken navigation and error pages [\#1210]({{ site.kimai_v2_repo }}/pull/1210) ([kevinpapst](https://github.com/kevinpapst))
- fix for production settings not exposing framework details [\#1173]({{ site.kimai_v2_repo }}/pull/1173) ([adrianrudnik](https://github.com/adrianrudnik))

**Closed issues:**

- Error 500 When I click on "My profile" [\#1164]({{ site.kimai_v2_repo }}/issues/1164)
- Upgrading to 1.4.1 broke it :\( [\#1162]({{ site.kimai_v2_repo }}/issues/1162)
