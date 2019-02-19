---
layout: post
title: "Kimai v2 - Release 0.6"
date: "2018-11-18 22:00:00 +0200"
author: kevinpapst
---

Version 0.6 was released, the main topic was "global activities" ... but many more improvements were added.

[Full Changelog]({{ site.kimai_v2_repo }}/compare/0.5...0.6)

**The release main topic was "global activities". Most notable changes:**

- Global activity support
- API endpoints for timesheets
- Toolbar & filter improvement
- Docker images for development and production
- Hungarian and Arabic translations
- Invoice calculator to group entries by activity

**Upgrade from 0.5:**

Don't forget to execute the database migrations! Read more about upgrading Kimai in [UPGRADING]({{ site.kimai_v2_repo }}/blob/master/UPGRADING.md).

**Fixed bugs:**

- Invoicing export - 500: Internal Server Error [\#390]({{ site.kimai_v2_repo }}/issues/390)
- invalid CSRF-Token [\#344]({{ site.kimai_v2_repo }}/issues/344)
- fix column visibility if unconfigured \(no cookie existing\) [\#423]({{ site.kimai_v2_repo }}/pull/423) ([kevinpapst](https://github.com/kevinpapst))
- fix duration and rate for html invoices [\#414]({{ site.kimai_v2_repo }}/pull/414) ([kevinpapst](https://github.com/kevinpapst))
- fixed broken toolbar form with empty date [\#391]({{ site.kimai_v2_repo }}/pull/391) ([kevinpapst](https://github.com/kevinpapst))

**Closed issues:**

- Language setting does not work immediately [\#418]({{ site.kimai_v2_repo }}/issues/418)
- After installation no graphic/background/icons shown [\#417]({{ site.kimai_v2_repo }}/issues/417)
- Form fields should be always visible [\#408]({{ site.kimai_v2_repo }}/issues/408)
- Merge projects and/or activities [\#406]({{ site.kimai_v2_repo }}/issues/406)
- Active filter should stay open [\#405]({{ site.kimai_v2_repo }}/issues/405)
- Make project field optional [\#401]({{ site.kimai_v2_repo }}/issues/401)
- Global activities support for Kimai 1 importer [\#400]({{ site.kimai_v2_repo }}/issues/400)
- Unrecognized Options "renderer, number\_generator" under "kimai.invoice" [\#381]({{ site.kimai_v2_repo }}/issues/381)
- Invoice Grouped by Activity [\#379]({{ site.kimai_v2_repo }}/issues/379)
- Set the order of columns \(in my times page\) [\#371]({{ site.kimai_v2_repo }}/issues/371)
- Columns on small/narrow displays \(mobile\) on „my times“ page [\#370]({{ site.kimai_v2_repo }}/issues/370)
- Make settings more accessible [\#365]({{ site.kimai_v2_repo }}/issues/365)
- Data validation for register page username field. [\#360]({{ site.kimai_v2_repo }}/issues/360)
- Option for setting default calendar view [\#359]({{ site.kimai_v2_repo }}/issues/359)
- 500: Internal Server Error after login \(new install\) [\#342]({{ site.kimai_v2_repo }}/issues/342)
- Invoices export error [\#341]({{ site.kimai_v2_repo }}/issues/341)
- Activities just Duration [\#334]({{ site.kimai_v2_repo }}/issues/334)
- API: Add filtering/sorting/limits [\#333]({{ site.kimai_v2_repo }}/issues/333)
- add the same activity for multiple projects [\#325]({{ site.kimai_v2_repo }}/issues/325)
- API: Endpoint for API docs needs session cookie [\#319]({{ site.kimai_v2_repo }}/issues/319)
- API: Timesheets [\#315]({{ site.kimai_v2_repo }}/issues/315)
- Feature request: Quick search box for activities when creating new timesheet [\#307]({{ site.kimai_v2_repo }}/issues/307)
- docker image for kimai2 [\#284]({{ site.kimai_v2_repo }}/issues/284)
- Separate Customer / Project / Activity input when logging time [\#250]({{ site.kimai_v2_repo }}/issues/250)
- Interactive help after fresh installation [\#94]({{ site.kimai_v2_repo }}/issues/94)

**Merged pull requests:**

- redirect to user language after profile update [\#421]({{ site.kimai_v2_repo }}/pull/421) ([kevinpapst](https://github.com/kevinpapst))
- added more timesheet related invoice fields [\#411]({{ site.kimai_v2_repo }}/pull/411) ([kevinpapst](https://github.com/kevinpapst))
- toolbar improvements [\#410]({{ site.kimai_v2_repo }}/pull/410) ([kevinpapst](https://github.com/kevinpapst))
- move entries from one entity to another upon deletion [\#409]({{ site.kimai_v2_repo }}/pull/409) ([kevinpapst](https://github.com/kevinpapst))
- show toolbar filter if they were submitted [\#407]({{ site.kimai_v2_repo }}/pull/407) ([kevinpapst](https://github.com/kevinpapst))
- full configurable data columns in all screen sizes [\#404]({{ site.kimai_v2_repo }}/pull/404) ([kevinpapst](https://github.com/kevinpapst))
- added global activity support in importer [\#402]({{ site.kimai_v2_repo }}/pull/402) ([kevinpapst](https://github.com/kevinpapst))
- added parsedown extension for header ids \(\#388\) [\#399]({{ site.kimai_v2_repo }}/pull/399) ([lduer](https://github.com/lduer))
- Fix for \#397 [\#398]({{ site.kimai_v2_repo }}/pull/398) ([tobybatch](https://github.com/tobybatch))
- Added links to docker hub and my docker repo [\#396]({{ site.kimai_v2_repo }}/pull/396) ([tobybatch](https://github.com/tobybatch))
- fixed issues- & milestone links [\#395]({{ site.kimai_v2_repo }}/pull/395) ([lduer](https://github.com/lduer))
- added links to further docker images by the community [\#394]({{ site.kimai_v2_repo }}/pull/394) ([kevinpapst](https://github.com/kevinpapst))
- beta test: added quick search box for customers, projects and activities [\#392]({{ site.kimai_v2_repo }}/pull/392) ([kevinpapst](https://github.com/kevinpapst))
- updated the documentation, reflecting the changes in \#306 [\#387]({{ site.kimai_v2_repo }}/pull/387) ([lduer](https://github.com/lduer))
- Added Hungarian translation and fixed the path of kimai.yaml in translation documentation [\#385]({{ site.kimai_v2_repo }}/pull/385) ([infeeeee](https://github.com/infeeeee))
- improved docs and cross-linked docker [\#383]({{ site.kimai_v2_repo }}/pull/383) ([kevinpapst](https://github.com/kevinpapst))
- Doc update of install/update instructions re: username [\#382]({{ site.kimai_v2_repo }}/pull/382) ([srdco](https://github.com/srdco))
- invoice calculator to group entries by activity [\#380]({{ site.kimai_v2_repo }}/pull/380) ([kevinpapst](https://github.com/kevinpapst))
- basic about screen with server and debug infos [\#378]({{ site.kimai_v2_repo }}/pull/378) ([kevinpapst](https://github.com/kevinpapst))
- Dev/demo dockerfile [\#377]({{ site.kimai_v2_repo }}/pull/377) ([tobybatch](https://github.com/tobybatch))
- Sidebar - user-profile links and language settings [\#369]({{ site.kimai_v2_repo }}/pull/369) ([kevinpapst](https://github.com/kevinpapst))
- added configurable initial calendar view [\#363]({{ site.kimai_v2_repo }}/pull/363) ([kevinpapst](https://github.com/kevinpapst))
- decrease minimum username to 3 character [\#362]({{ site.kimai_v2_repo }}/pull/362) ([kevinpapst](https://github.com/kevinpapst))
- Default country \(\#2\) [\#358]({{ site.kimai_v2_repo }}/pull/358) ([tobybatch](https://github.com/tobybatch))
- composer: removed deprecated symfony/lt, updated others [\#354]({{ site.kimai_v2_repo }}/pull/354) ([kevinpapst](https://github.com/kevinpapst))
- updated admin-lte theme bundle to 2.1.1 [\#350]({{ site.kimai_v2_repo }}/pull/350) ([kevinpapst](https://github.com/kevinpapst))
- updated timesheet and email documentation [\#349]({{ site.kimai_v2_repo }}/pull/349) ([kevinpapst](https://github.com/kevinpapst))
- updated required dependencies [\#346]({{ site.kimai_v2_repo }}/pull/346) ([kevinpapst](https://github.com/kevinpapst))
- Fix password reset [\#345]({{ site.kimai_v2_repo }}/pull/345) ([kevinpapst](https://github.com/kevinpapst))
- added arabic translations and locale support in datepicker [\#337]({{ site.kimai_v2_repo }}/pull/337) ([kevinpapst](https://github.com/kevinpapst))
- API endpoint for Timesheet entries [\#332]({{ site.kimai_v2_repo }}/pull/332) ([kevinpapst](https://github.com/kevinpapst))
- Support global activities [\#259]({{ site.kimai_v2_repo }}/pull/259) ([kevinpapst](https://github.com/kevinpapst))
