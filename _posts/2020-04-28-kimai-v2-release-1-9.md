---
layout: post
title: "Release 1.9 - Invoice archive, internal rates"
date: "2020-04-28 12:00:00 +0200"
author: kevinpapst
tags: [Release]
---

The new release 1.9 was published, some of its highlights are:

- Invoice: archive for created invoices with status
- Invoice: configurable invoice number format
- Export: improved Excel tables with auto filters and more  
- Listing: support for many new columns is all views (hidden by default: try the "eye" icon)  
- Rates: Improved rates for differentiation between customer invoices (external rates) and internal rates
- Short summary on invoice and export preview
- Multiselect of customer, project and activity in search filters 
- API: TimeBudget, Fees
- Esperanto translations
- Create invoices via bash/shell
- Highlight overlapping times (red lines between time entries)

Thanks to all of you for using and supporting Kimai, especially:
- all clients and donators who help me to keep up the work for Kimai
- the developers who contributed their time ...
- and everyone else contributing at GitHub, too many to name you all - you guys rock!

> Want to upgrade? [Click here to find out how]({%link _documentation/updates.md %}).

# Changelog

[Full Changelog](https://github.com/kevinpapst/kimai2/compare/1.8...1.9)

**Implemented enhancements:**

- TimeBudget via API [\#1657](https://github.com/kevinpapst/kimai2/issues/1657)
- TAG in permissions: Deny create for users [\#1623](https://github.com/kevinpapst/kimai2/issues/1623)
- Inconsistent behavior when creating and copying a project [\#1610](https://github.com/kevinpapst/kimai2/issues/1610)
- delete invoices from archive [\#1555](https://github.com/kevinpapst/kimai2/issues/1555)
- editing translation not visible [\#1546](https://github.com/kevinpapst/kimai2/issues/1546)
- API methods for Fees [\#1523](https://github.com/kevinpapst/kimai2/issues/1523)
- Excel export with table format [\#1512](https://github.com/kevinpapst/kimai2/issues/1512)
- Columns "Order number" and "Order date" not visible in Projects overview  [\#1498](https://github.com/kevinpapst/kimai2/issues/1498)
- Data import doesn't import teams [\#1480](https://github.com/kevinpapst/kimai2/issues/1480)
- Bad project overview for projects of the same name [\#1475](https://github.com/kevinpapst/kimai2/issues/1475)
- zend-ldap is deprecated [\#1445](https://github.com/kevinpapst/kimai2/issues/1445)
- Stundensatz im Projekt für Abrechnung mit customer [\#1361](https://github.com/kevinpapst/kimai2/issues/1361)
- Selection of multiple workers/customers/projects/activities and display the time of it [\#1357](https://github.com/kevinpapst/kimai2/issues/1357)
- Add invoice tabel to archive created invoices with invoice number and date [\#1279](https://github.com/kevinpapst/kimai2/issues/1279)
- Invoice Generator by Date + consecutive numbering [\#1189](https://github.com/kevinpapst/kimai2/issues/1189)
- Add short summary on render invoices page [\#1188](https://github.com/kevinpapst/kimai2/issues/1188)
- Extend multi select options present in user selection to customer, projects and activities also [\#1055](https://github.com/kevinpapst/kimai2/issues/1055)
- display more columns in invoice template listing [\#1663](https://github.com/kevinpapst/kimai2/pull/1663) ([kevinpapst](https://github.com/kevinpapst))
- using font awesome icon to render color dot [\#1656](https://github.com/kevinpapst/kimai2/pull/1656) ([kevinpapst](https://github.com/kevinpapst))
- Delete Invoices [\#1652](https://github.com/kevinpapst/kimai2/pull/1652) ([kevinpapst](https://github.com/kevinpapst))
- Code improvements [\#1649](https://github.com/kevinpapst/kimai2/pull/1649) ([kevinpapst](https://github.com/kevinpapst))
- minimize count and visibility columns for better table alignments [\#1636](https://github.com/kevinpapst/kimai2/pull/1636) ([kevinpapst](https://github.com/kevinpapst))
- Add color to tags [\#1631](https://github.com/kevinpapst/kimai2/pull/1631) ([jojoemade](https://github.com/jojoemade))
- Fix Czech translation [\#1630](https://github.com/kevinpapst/kimai2/pull/1630) ([KuboF](https://github.com/KuboF))
- Esperanto translation [\#1607](https://github.com/kevinpapst/kimai2/pull/1607) ([KuboF](https://github.com/KuboF))
- added event before rendering permissions [\#1599](https://github.com/kevinpapst/kimai2/pull/1599) ([kevinpapst](https://github.com/kevinpapst))
- add event for updated timesheet entites [\#1598](https://github.com/kevinpapst/kimai2/pull/1598) ([lduer](https://github.com/lduer))
- allow html and pdf export customization with twig templates [\#1582](https://github.com/kevinpapst/kimai2/pull/1582) ([kevinpapst](https://github.com/kevinpapst))
- added json, xml and txt invoice renderer [\#1576](https://github.com/kevinpapst/kimai2/pull/1576) ([kevinpapst](https://github.com/kevinpapst))
- added command to create invoices via bash [\#1574](https://github.com/kevinpapst/kimai2/pull/1574) ([kevinpapst](https://github.com/kevinpapst))
- switch to kimai specific user-bundle fork [\#1568](https://github.com/kevinpapst/kimai2/pull/1568) ([kevinpapst](https://github.com/kevinpapst))
- Added multi-select for customer, project and activity [\#1557](https://github.com/kevinpapst/kimai2/pull/1557) ([kevinpapst](https://github.com/kevinpapst))
- validate v1 data before import [\#1552](https://github.com/kevinpapst/kimai2/pull/1552) ([kevinpapst](https://github.com/kevinpapst))
- support more columns in listings [\#1548](https://github.com/kevinpapst/kimai2/pull/1548) ([kevinpapst](https://github.com/kevinpapst))
- show sum of duration and amount under export table [\#1547](https://github.com/kevinpapst/kimai2/pull/1547) ([kevinpapst](https://github.com/kevinpapst))
- update to latest libs [\#1545](https://github.com/kevinpapst/kimai2/pull/1545) ([kevinpapst](https://github.com/kevinpapst))
- fix deprecations in older migrations [\#1544](https://github.com/kevinpapst/kimai2/pull/1544) ([kevinpapst](https://github.com/kevinpapst))
- added invoice archive & configurable invoice numbers [\#1541](https://github.com/kevinpapst/kimai2/pull/1541) ([kevinpapst](https://github.com/kevinpapst))
- Italian translations update [\#1538](https://github.com/kevinpapst/kimai2/pull/1538) ([buoncri](https://github.com/buoncri))
- Highlight overlapping times [\#1534](https://github.com/kevinpapst/kimai2/pull/1534) ([kevinpapst](https://github.com/kevinpapst))
- Import groups [\#1532](https://github.com/kevinpapst/kimai2/pull/1532) ([HonzaKopecky](https://github.com/HonzaKopecky))
- Migrate from zend-ldap to laminas-ldap [\#1530](https://github.com/kevinpapst/kimai2/pull/1530) ([sabbelasichon](https://github.com/sabbelasichon))
- disable title on small reponsive screens [\#1527](https://github.com/kevinpapst/kimai2/pull/1527) ([kevinpapst](https://github.com/kevinpapst))
- inline css for html invoices [\#1526](https://github.com/kevinpapst/kimai2/pull/1526) ([kevinpapst](https://github.com/kevinpapst))
- phpstan level 4 [\#1522](https://github.com/kevinpapst/kimai2/pull/1522) ([kevinpapst](https://github.com/kevinpapst))
- xlsx improvements \(\#1512\) [\#1518](https://github.com/kevinpapst/kimai2/pull/1518) ([adrianrudnik](https://github.com/adrianrudnik))
- support budget and timeBudget in API calls [\#1658](https://github.com/kevinpapst/kimai2/pull/1658) ([kevinpapst](https://github.com/kevinpapst))

**Fixed bugs:**

- "To" is not correctly calculated from timesheets view [\#1638](https://github.com/kevinpapst/kimai2/issues/1638)
- Uncaught PHP Exception Doctrine\ORM\ORMInvalidArgumentException [\#1618](https://github.com/kevinpapst/kimai2/issues/1618)
- Expired projects are hidden in search form under My Times [\#1615](https://github.com/kevinpapst/kimai2/issues/1615)
- error when creating invoice  [\#1590](https://github.com/kevinpapst/kimai2/issues/1590)
- Optical error when deleting roles [\#1588](https://github.com/kevinpapst/kimai2/issues/1588)
- Installation via FTP \| 500 server error \| Path /assets /css missing? [\#1586](https://github.com/kevinpapst/kimai2/issues/1586)
- Database import from Kimai 1.3.1 [\#1573](https://github.com/kevinpapst/kimai2/issues/1573)
- Password rest [\#1566](https://github.com/kevinpapst/kimai2/issues/1566)
- kimai2\_users title field length limit will cause error logging in via SAML if SAML provided title is too long. [\#1562](https://github.com/kevinpapst/kimai2/issues/1562)
- setCustomer\(\) must be an instance  [\#1539](https://github.com/kevinpapst/kimai2/issues/1539)
- Accounting person cannot see Time Sheets [\#1525](https://github.com/kevinpapst/kimai2/issues/1525)
- Upgrade from v1 fails with v1.8 due to undefined method setHourlyRate [\#1519](https://github.com/kevinpapst/kimai2/issues/1519)
- Export reporting wrong durations vs. Print [\#1496](https://github.com/kevinpapst/kimai2/issues/1496)
- fix removing single permissions from event [\#1661](https://github.com/kevinpapst/kimai2/pull/1661) ([kevinpapst](https://github.com/kevinpapst))
- added translate filter for meta-fields in detail pages [\#1655](https://github.com/kevinpapst/kimai2/pull/1655) ([kevinpapst](https://github.com/kevinpapst))
- fix annotation for collections [\#1654](https://github.com/kevinpapst/kimai2/pull/1654) ([kevinpapst](https://github.com/kevinpapst))
- show expired projects in search filter [\#1641](https://github.com/kevinpapst/kimai2/pull/1641) ([kevinpapst](https://github.com/kevinpapst))
- remove roles from users when role is deleted [\#1640](https://github.com/kevinpapst/kimai2/pull/1640) ([kevinpapst](https://github.com/kevinpapst))
- fix duration calculation in admin timesheet view [\#1639](https://github.com/kevinpapst/kimai2/pull/1639) ([kevinpapst](https://github.com/kevinpapst))
- Search term fixes for API [\#1597](https://github.com/kevinpapst/kimai2/pull/1597) ([kevinpapst](https://github.com/kevinpapst))
- fix non-ascii character break invoice download [\#1592](https://github.com/kevinpapst/kimai2/pull/1592) ([kevinpapst](https://github.com/kevinpapst))
- ensure user attributes are truncated [\#1580](https://github.com/kevinpapst/kimai2/pull/1580) ([kevinpapst](https://github.com/kevinpapst))
- improve kimai v1 importer [\#1543](https://github.com/kevinpapst/kimai2/pull/1543) ([kevinpapst](https://github.com/kevinpapst))
- fix timesheet permissions for non-admins [\#1542](https://github.com/kevinpapst/kimai2/pull/1542) ([kevinpapst](https://github.com/kevinpapst))
- fix pdf creation for very large exports [\#1533](https://github.com/kevinpapst/kimai2/pull/1533) ([kevinpapst](https://github.com/kevinpapst))
- \[BUGFIX\] Escape distinguished name in ldap search [\#1528](https://github.com/kevinpapst/kimai2/pull/1528) ([sabbelasichon](https://github.com/sabbelasichon))
- fixing rates in kimai v1 import [\#1521](https://github.com/kevinpapst/kimai2/pull/1521) ([kevinpapst](https://github.com/kevinpapst))

**Closed issues:**

- Activity dropdown not working in v1.8 [\#1662](https://github.com/kevinpapst/kimai2/issues/1662)
- Updating to 1.8 can't acces [\#1660](https://github.com/kevinpapst/kimai2/issues/1660)
- Populate project and customer by activity selection [\#1634](https://github.com/kevinpapst/kimai2/issues/1634)
- Stop button not working  [\#1632](https://github.com/kevinpapst/kimai2/issues/1632)
- Installation instructions shared host: add netcup [\#1620](https://github.com/kevinpapst/kimai2/issues/1620)
- unable to export to pdf invoice [\#1619](https://github.com/kevinpapst/kimai2/issues/1619)
- Invoice generation not taking quantity into consideration [\#1531](https://github.com/kevinpapst/kimai2/issues/1531)
- A little more help regarding adding Exports and adjusting the Dashboard [\#1347](https://github.com/kevinpapst/kimai2/issues/1347)
