---
title: "Release 1.8 - SAML, Team API & user rates"
date: "2020-03-01 12:00:00 +0200"
author: kevinpapst
tags: [Release]
---

The next release is out, as always containing various bugfixes and new features:

- SAML support for SSO login
- Duplication of projects & timesheet entries
- User specific rates
- Polish translations
- API for users and teams
- Upload invoice documents via UI
- Decimal format in user timesheet export
- Configurable language and duration format per invoice
- Pagination for working time widget

Thanks to all of you for using and supporting Kimai, especially:
- all clients and donators who help me to keep up the work for Kimai
- the developers who contributed their time ...
- and everyone else contributing at GitHub, too many to name you all - you guys rock!

> Want to upgrade? [Click here to find out how]({%link _documentation/updates.md %}).

# Changelog

[Full Changelog]({{ site.kimai_v2_repo }}/compare/1.7...1.8)

**Implemented enhancements:**

- character problems in export PDF table header [\#1433]({{ site.kimai_v2_repo }}/issues/1433)
- Polish translations [\#1425]({{ site.kimai_v2_repo }}/issues/1425)
- Duplicating timesheet entries [\#1422]({{ site.kimai_v2_repo }}/issues/1422)
- User and Team API [\#1331]({{ site.kimai_v2_repo }}/issues/1331)
- Duplicate or copy & paste of existing entries [\#1246]({{ site.kimai_v2_repo }}/issues/1246)
- SAML Support for Authentication [\#1227]({{ site.kimai_v2_repo }}/issues/1227)
- Replace paginator [\#1182]({{ site.kimai_v2_repo }}/issues/1182)
- Create a new plugin to create/manage new Roles directly from the frontend [\#1057]({{ site.kimai_v2_repo }}/issues/1057)
- added configuration for default start-time [\#1506]({{ site.kimai_v2_repo }}/pull/1506) ([kevinpapst](https://github.com/kevinpapst))
- Upload invoice documents via UI [\#1495]({{ site.kimai_v2_repo }}/pull/1495) ([kevinpapst](https://github.com/kevinpapst))
- human friendly name for bundles [\#1491]({{ site.kimai_v2_repo }}/pull/1491) ([kevinpapst](https://github.com/kevinpapst))
- allow to edit single system config section in modal [\#1490]({{ site.kimai_v2_repo }}/pull/1490) ([kevinpapst](https://github.com/kevinpapst))
- Use decimal format in user timesheet export [\#1489]({{ site.kimai_v2_repo }}/pull/1489) ([kevinpapst](https://github.com/kevinpapst))
- action to duplicate timesheet record [\#1478]({{ site.kimai_v2_repo }}/pull/1478) ([kevinpapst](https://github.com/kevinpapst))
- Improve firewall [\#1472]({{ site.kimai_v2_repo }}/pull/1472) ([kevinpapst](https://github.com/kevinpapst))
- feature: duplicate projects with all settings [\#1465]({{ site.kimai_v2_repo }}/pull/1465) ([kevinpapst](https://github.com/kevinpapst))
- added option to use only pre-defined tags [\#1463]({{ site.kimai_v2_repo }}/pull/1463) ([kevinpapst](https://github.com/kevinpapst))
- Replaced mailer library, added first templates [\#1462]({{ site.kimai_v2_repo }}/pull/1462) ([kevinpapst](https://github.com/kevinpapst))
- remove pagerfanta bundle [\#1458]({{ site.kimai_v2_repo }}/pull/1458) ([kevinpapst](https://github.com/kevinpapst))
- Added user-specific rates [\#1455]({{ site.kimai_v2_repo }}/pull/1455) ([kevinpapst](https://github.com/kevinpapst))
- added github action to check code styles [\#1452]({{ site.kimai_v2_repo }}/pull/1452) ([kevinpapst](https://github.com/kevinpapst))
- invoices: choose language and duration format [\#1438]({{ site.kimai_v2_repo }}/pull/1438) ([kevinpapst](https://github.com/kevinpapst))
- Missing italian translations files added. [\#1437]({{ site.kimai_v2_repo }}/pull/1437) ([buoncri](https://github.com/buoncri))
- Polish Language Translation [\#1426]({{ site.kimai_v2_repo }}/pull/1426) ([MikKrz](https://github.com/MikKrz))
- code improvements [\#1423]({{ site.kimai_v2_repo }}/pull/1423) ([kevinpapst](https://github.com/kevinpapst))
- added pagination to working time widget [\#1418]({{ site.kimai_v2_repo }}/pull/1418) ([kevinpapst](https://github.com/kevinpapst))
- Various smaller code improvements [\#1415]({{ site.kimai_v2_repo }}/pull/1415) ([kevinpapst](https://github.com/kevinpapst))
- updated slovak translations [\#1414]({{ site.kimai_v2_repo }}/pull/1414) ([kevinpapst](https://github.com/kevinpapst))
- added support for saml login [\#1408]({{ site.kimai_v2_repo }}/pull/1408) ([kevinpapst](https://github.com/kevinpapst))
- markdown autolink file urls [\#1402]({{ site.kimai_v2_repo }}/pull/1402) ([kevinpapst](https://github.com/kevinpapst))
- API methods to handle teams and users [\#1384]({{ site.kimai_v2_repo }}/pull/1384) ([kevinpapst](https://github.com/kevinpapst))
- Prepare update to Symfony 4.4 [\#1275]({{ site.kimai_v2_repo }}/pull/1275) ([kevinpapst](https://github.com/kevinpapst))

**Fixed bugs:**

- Wrong duration for time entries in the future with undefined end [\#1501]({{ site.kimai_v2_repo }}/issues/1501)
- dashboard runtime error: Division by zero [\#1428]({{ site.kimai_v2_repo }}/issues/1428)
- Kein \<CRLF\> im Datenfeld Customer Adress bei Rechnungen [\#1373]({{ site.kimai_v2_repo }}/issues/1373)
- format excel cell types in invoices [\#1507]({{ site.kimai_v2_repo }}/pull/1507) ([kevinpapst](https://github.com/kevinpapst))
- fix passing date objects to project API [\#1451]({{ site.kimai_v2_repo }}/pull/1451) ([kevinpapst](https://github.com/kevinpapst))
- fixed glyphs in pdf export table header [\#1435]({{ site.kimai_v2_repo }}/pull/1435) ([infeeeee](https://github.com/infeeeee))
- Better handling of custom field columns in tables [\#1419]({{ site.kimai_v2_repo }}/pull/1419) ([kevinpapst](https://github.com/kevinpapst))
