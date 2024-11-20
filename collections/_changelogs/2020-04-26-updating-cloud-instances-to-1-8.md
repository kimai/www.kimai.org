---
title: "Updating cloud instances to 1.8"
date: "2020-04-26 23:06:15 +0200"
---

We are currently upgrading all cloud instances. Our customer clouds are currently running Kimai 1.7 and we are upgrading to Kimai 1.8.

The next update for Kimai 1.9 will follow in a couple of weeks and will be announced as usual here on the blog.

In case of any question or problem, please use the [support channel](https://www.kimai.cloud/support-center/request).

## Upcoming changes 

Here is a list of the most important changes, that you can look out for:

- Duplication of projects & timesheet entries
- User specific rates
- Polish translations
- Decimal format in user timesheet export
- Configurable language and duration format per invoice template
- Pagination for working time widget
- API for users and teams

## Full changelog

We are committed to the open source world and try to publish everything we do, so here is the full list of all changes:

### Version 1.8

**Implemented enhancements:**

- character problems in export PDF table header [\#1433](https://github.com/kevinpapst/kimai2/issues/1433)
- Polish translations [\#1425](https://github.com/kevinpapst/kimai2/issues/1425)
- Duplicating timesheet entries [\#1422](https://github.com/kevinpapst/kimai2/issues/1422)
- User and Team API [\#1331](https://github.com/kevinpapst/kimai2/issues/1331)
- Duplicate or copy & paste of existing entries [\#1246](https://github.com/kevinpapst/kimai2/issues/1246)
- SAML Support for Authentication [\#1227](https://github.com/kevinpapst/kimai2/issues/1227)
- Replace paginator [\#1182](https://github.com/kevinpapst/kimai2/issues/1182)
- Create a new plugin to create/manage new Roles directly from the frontend [\#1057](https://github.com/kevinpapst/kimai2/issues/1057)
- added configuration for default start-time [\#1506](https://github.com/kevinpapst/kimai2/pull/1506) ([kevinpapst](https://github.com/kevinpapst))
- Upload invoice documents via UI [\#1495](https://github.com/kevinpapst/kimai2/pull/1495) ([kevinpapst](https://github.com/kevinpapst))
- human friendly name for bundles [\#1491](https://github.com/kevinpapst/kimai2/pull/1491) ([kevinpapst](https://github.com/kevinpapst))
- allow to edit single system config section in modal [\#1490](https://github.com/kevinpapst/kimai2/pull/1490) ([kevinpapst](https://github.com/kevinpapst))
- Use decimal format in user timesheet export [\#1489](https://github.com/kevinpapst/kimai2/pull/1489) ([kevinpapst](https://github.com/kevinpapst))
- action to duplicate timesheet record [\#1478](https://github.com/kevinpapst/kimai2/pull/1478) ([kevinpapst](https://github.com/kevinpapst))
- Improve firewall [\#1472](https://github.com/kevinpapst/kimai2/pull/1472) ([kevinpapst](https://github.com/kevinpapst))
- feature: duplicate projects with all settings [\#1465](https://github.com/kevinpapst/kimai2/pull/1465) ([kevinpapst](https://github.com/kevinpapst))
- added option to use only pre-defined tags [\#1463](https://github.com/kevinpapst/kimai2/pull/1463) ([kevinpapst](https://github.com/kevinpapst))
- Replaced mailer library, added first templates [\#1462](https://github.com/kevinpapst/kimai2/pull/1462) ([kevinpapst](https://github.com/kevinpapst))
- remove pagerfanta bundle [\#1458](https://github.com/kevinpapst/kimai2/pull/1458) ([kevinpapst](https://github.com/kevinpapst))
- Added user-specific rates [\#1455](https://github.com/kevinpapst/kimai2/pull/1455) ([kevinpapst](https://github.com/kevinpapst))
- added github action to check code styles [\#1452](https://github.com/kevinpapst/kimai2/pull/1452) ([kevinpapst](https://github.com/kevinpapst))
- invoices: choose language and duration format [\#1438](https://github.com/kevinpapst/kimai2/pull/1438) ([kevinpapst](https://github.com/kevinpapst))
- Missing italian translations files added. [\#1437](https://github.com/kevinpapst/kimai2/pull/1437) ([buoncri](https://github.com/buoncri))
- Polish Language Translation [\#1426](https://github.com/kevinpapst/kimai2/pull/1426) ([MikKrz](https://github.com/MikKrz))
- code improvements [\#1423](https://github.com/kevinpapst/kimai2/pull/1423) ([kevinpapst](https://github.com/kevinpapst))
- added pagination to working time widget [\#1418](https://github.com/kevinpapst/kimai2/pull/1418) ([kevinpapst](https://github.com/kevinpapst))
- Various smaller code improvements [\#1415](https://github.com/kevinpapst/kimai2/pull/1415) ([kevinpapst](https://github.com/kevinpapst))
- updated slovak translations [\#1414](https://github.com/kevinpapst/kimai2/pull/1414) ([kevinpapst](https://github.com/kevinpapst))
- added support for saml login [\#1408](https://github.com/kevinpapst/kimai2/pull/1408) ([kevinpapst](https://github.com/kevinpapst))
- markdown autolink file urls [\#1402](https://github.com/kevinpapst/kimai2/pull/1402) ([kevinpapst](https://github.com/kevinpapst))
- API methods to handle teams and users [\#1384](https://github.com/kevinpapst/kimai2/pull/1384) ([kevinpapst](https://github.com/kevinpapst))
- Prepare update to Symfony 4.4 [\#1275](https://github.com/kevinpapst/kimai2/pull/1275) ([kevinpapst](https://github.com/kevinpapst))

**Fixed bugs:**

- Wrong duration for time entries in the future with undefined end [\#1501](https://github.com/kevinpapst/kimai2/issues/1501)
- dashboard runtime error: Division by zero [\#1428](https://github.com/kevinpapst/kimai2/issues/1428)
- Kein \<CRLF\> im Datenfeld Customer Adress bei Rechnungen [\#1373](https://github.com/kevinpapst/kimai2/issues/1373)
- format excel cell types in invoices [\#1507](https://github.com/kevinpapst/kimai2/pull/1507) ([kevinpapst](https://github.com/kevinpapst))
- fix passing date objects to project API [\#1451](https://github.com/kevinpapst/kimai2/pull/1451) ([kevinpapst](https://github.com/kevinpapst))
- fixed glyphs in pdf export table header [\#1435](https://github.com/kevinpapst/kimai2/pull/1435) ([infeeeee](https://github.com/infeeeee))
- Better handling of custom field columns in tables [\#1419](https://github.com/kevinpapst/kimai2/pull/1419) ([kevinpapst](https://github.com/kevinpapst))

**Closed issues:**

- Invoice generation cares for user permissions [\#1494](https://github.com/kevinpapst/kimai2/issues/1494)
- login after setup [\#1493](https://github.com/kevinpapst/kimai2/issues/1493)
- Updating hourly rate on timesheet entry won't work [\#1482](https://github.com/kevinpapst/kimai2/issues/1482)
- cannot create invoice or preview invoice or export [\#1460](https://github.com/kevinpapst/kimai2/issues/1460)
- Scheduled Export [\#1412](https://github.com/kevinpapst/kimai2/issues/1412)
- Unable to start kimai from docker repo [\#1404](https://github.com/kevinpapst/kimai2/issues/1404)
- Export time in decimal format [\#1368](https://github.com/kevinpapst/kimai2/issues/1368)
- Feedback Upgrade 1.0 - 2.0 [\#998](https://github.com/kevinpapst/kimai2/issues/998)
