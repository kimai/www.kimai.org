---
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

[Full Changelog]({{ site.kimai_v2_repo }}/compare/1.8...1.9)

**Implemented enhancements:**

- TimeBudget via API [\#1657]({{ site.kimai_v2_repo }}/issues/1657)
- TAG in permissions: Deny create for users [\#1623]({{ site.kimai_v2_repo }}/issues/1623)
- Inconsistent behavior when creating and copying a project [\#1610]({{ site.kimai_v2_repo }}/issues/1610)
- delete invoices from archive [\#1555]({{ site.kimai_v2_repo }}/issues/1555)
- editing translation not visible [\#1546]({{ site.kimai_v2_repo }}/issues/1546)
- API methods for Fees [\#1523]({{ site.kimai_v2_repo }}/issues/1523)
- Excel export with table format [\#1512]({{ site.kimai_v2_repo }}/issues/1512)
- Columns "Order number" and "Order date" not visible in Projects overview  [\#1498]({{ site.kimai_v2_repo }}/issues/1498)
- Data import doesn't import teams [\#1480]({{ site.kimai_v2_repo }}/issues/1480)
- Bad project overview for projects of the same name [\#1475]({{ site.kimai_v2_repo }}/issues/1475)
- zend-ldap is deprecated [\#1445]({{ site.kimai_v2_repo }}/issues/1445)
- Stundensatz im Projekt für Abrechnung mit customer [\#1361]({{ site.kimai_v2_repo }}/issues/1361)
- Selection of multiple workers/customers/projects/activities and display the time of it [\#1357]({{ site.kimai_v2_repo }}/issues/1357)
- Add invoice tabel to archive created invoices with invoice number and date [\#1279]({{ site.kimai_v2_repo }}/issues/1279)
- Invoice Generator by Date + consecutive numbering [\#1189]({{ site.kimai_v2_repo }}/issues/1189)
- Add short summary on render invoices page [\#1188]({{ site.kimai_v2_repo }}/issues/1188)
- Extend multi select options present in user selection to customer, projects and activities also [\#1055]({{ site.kimai_v2_repo }}/issues/1055)
- display more columns in invoice template listing [\#1663]({{ site.kimai_v2_repo }}/pull/1663) ([kevinpapst](https://github.com/kevinpapst))
- using font awesome icon to render color dot [\#1656]({{ site.kimai_v2_repo }}/pull/1656) ([kevinpapst](https://github.com/kevinpapst))
- Delete Invoices [\#1652]({{ site.kimai_v2_repo }}/pull/1652) ([kevinpapst](https://github.com/kevinpapst))
- Code improvements [\#1649]({{ site.kimai_v2_repo }}/pull/1649) ([kevinpapst](https://github.com/kevinpapst))
- minimize count and visibility columns for better table alignments [\#1636]({{ site.kimai_v2_repo }}/pull/1636) ([kevinpapst](https://github.com/kevinpapst))
- Add color to tags [\#1631]({{ site.kimai_v2_repo }}/pull/1631) ([jojoemade](https://github.com/jojoemade))
- Fix Czech translation [\#1630]({{ site.kimai_v2_repo }}/pull/1630) ([KuboF](https://github.com/KuboF))
- Esperanto translation [\#1607]({{ site.kimai_v2_repo }}/pull/1607) ([KuboF](https://github.com/KuboF))
- added event before rendering permissions [\#1599]({{ site.kimai_v2_repo }}/pull/1599) ([kevinpapst](https://github.com/kevinpapst))
- add event for updated timesheet entites [\#1598]({{ site.kimai_v2_repo }}/pull/1598) ([lduer](https://github.com/lduer))
- allow html and pdf export customization with twig templates [\#1582]({{ site.kimai_v2_repo }}/pull/1582) ([kevinpapst](https://github.com/kevinpapst))
- added json, xml and txt invoice renderer [\#1576]({{ site.kimai_v2_repo }}/pull/1576) ([kevinpapst](https://github.com/kevinpapst))
- added command to create invoices via bash [\#1574]({{ site.kimai_v2_repo }}/pull/1574) ([kevinpapst](https://github.com/kevinpapst))
- switch to kimai specific user-bundle fork [\#1568]({{ site.kimai_v2_repo }}/pull/1568) ([kevinpapst](https://github.com/kevinpapst))
- Added multi-select for customer, project and activity [\#1557]({{ site.kimai_v2_repo }}/pull/1557) ([kevinpapst](https://github.com/kevinpapst))
- validate v1 data before import [\#1552]({{ site.kimai_v2_repo }}/pull/1552) ([kevinpapst](https://github.com/kevinpapst))
- support more columns in listings [\#1548]({{ site.kimai_v2_repo }}/pull/1548) ([kevinpapst](https://github.com/kevinpapst))
- show sum of duration and amount under export table [\#1547]({{ site.kimai_v2_repo }}/pull/1547) ([kevinpapst](https://github.com/kevinpapst))
- update to latest libs [\#1545]({{ site.kimai_v2_repo }}/pull/1545) ([kevinpapst](https://github.com/kevinpapst))
- fix deprecations in older migrations [\#1544]({{ site.kimai_v2_repo }}/pull/1544) ([kevinpapst](https://github.com/kevinpapst))
- added invoice archive & configurable invoice numbers [\#1541]({{ site.kimai_v2_repo }}/pull/1541) ([kevinpapst](https://github.com/kevinpapst))
- Italian translations update [\#1538]({{ site.kimai_v2_repo }}/pull/1538) ([buoncri](https://github.com/buoncri))
- Highlight overlapping times [\#1534]({{ site.kimai_v2_repo }}/pull/1534) ([kevinpapst](https://github.com/kevinpapst))
- Import groups [\#1532]({{ site.kimai_v2_repo }}/pull/1532) ([HonzaKopecky](https://github.com/HonzaKopecky))
- Migrate from zend-ldap to laminas-ldap [\#1530]({{ site.kimai_v2_repo }}/pull/1530) ([sabbelasichon](https://github.com/sabbelasichon))
- disable title on small reponsive screens [\#1527]({{ site.kimai_v2_repo }}/pull/1527) ([kevinpapst](https://github.com/kevinpapst))
- inline css for html invoices [\#1526]({{ site.kimai_v2_repo }}/pull/1526) ([kevinpapst](https://github.com/kevinpapst))
- phpstan level 4 [\#1522]({{ site.kimai_v2_repo }}/pull/1522) ([kevinpapst](https://github.com/kevinpapst))
- xlsx improvements \(\#1512\) [\#1518]({{ site.kimai_v2_repo }}/pull/1518) ([adrianrudnik](https://github.com/adrianrudnik))
- support budget and timeBudget in API calls [\#1658]({{ site.kimai_v2_repo }}/pull/1658) ([kevinpapst](https://github.com/kevinpapst))

**Fixed bugs:**

- "To" is not correctly calculated from timesheets view [\#1638]({{ site.kimai_v2_repo }}/issues/1638)
- Uncaught PHP Exception Doctrine\ORM\ORMInvalidArgumentException [\#1618]({{ site.kimai_v2_repo }}/issues/1618)
- Expired projects are hidden in search form under My Times [\#1615]({{ site.kimai_v2_repo }}/issues/1615)
- error when creating invoice  [\#1590]({{ site.kimai_v2_repo }}/issues/1590)
- Optical error when deleting roles [\#1588]({{ site.kimai_v2_repo }}/issues/1588)
- Installation via FTP \| 500 server error \| Path /assets /css missing? [\#1586]({{ site.kimai_v2_repo }}/issues/1586)
- Database import from Kimai 1.3.1 [\#1573]({{ site.kimai_v2_repo }}/issues/1573)
- Password rest [\#1566]({{ site.kimai_v2_repo }}/issues/1566)
- kimai2\_users title field length limit will cause error logging in via SAML if SAML provided title is too long. [\#1562]({{ site.kimai_v2_repo }}/issues/1562)
- setCustomer\(\) must be an instance  [\#1539]({{ site.kimai_v2_repo }}/issues/1539)
- Accounting person cannot see Time Sheets [\#1525]({{ site.kimai_v2_repo }}/issues/1525)
- Upgrade from v1 fails with v1.8 due to undefined method setHourlyRate [\#1519]({{ site.kimai_v2_repo }}/issues/1519)
- Export reporting wrong durations vs. Print [\#1496]({{ site.kimai_v2_repo }}/issues/1496)
- fix removing single permissions from event [\#1661]({{ site.kimai_v2_repo }}/pull/1661) ([kevinpapst](https://github.com/kevinpapst))
- added translate filter for meta-fields in detail pages [\#1655]({{ site.kimai_v2_repo }}/pull/1655) ([kevinpapst](https://github.com/kevinpapst))
- fix annotation for collections [\#1654]({{ site.kimai_v2_repo }}/pull/1654) ([kevinpapst](https://github.com/kevinpapst))
- show expired projects in search filter [\#1641]({{ site.kimai_v2_repo }}/pull/1641) ([kevinpapst](https://github.com/kevinpapst))
- remove roles from users when role is deleted [\#1640]({{ site.kimai_v2_repo }}/pull/1640) ([kevinpapst](https://github.com/kevinpapst))
- fix duration calculation in admin timesheet view [\#1639]({{ site.kimai_v2_repo }}/pull/1639) ([kevinpapst](https://github.com/kevinpapst))
- Search term fixes for API [\#1597]({{ site.kimai_v2_repo }}/pull/1597) ([kevinpapst](https://github.com/kevinpapst))
- fix non-ascii character break invoice download [\#1592]({{ site.kimai_v2_repo }}/pull/1592) ([kevinpapst](https://github.com/kevinpapst))
- ensure user attributes are truncated [\#1580]({{ site.kimai_v2_repo }}/pull/1580) ([kevinpapst](https://github.com/kevinpapst))
- improve kimai v1 importer [\#1543]({{ site.kimai_v2_repo }}/pull/1543) ([kevinpapst](https://github.com/kevinpapst))
- fix timesheet permissions for non-admins [\#1542]({{ site.kimai_v2_repo }}/pull/1542) ([kevinpapst](https://github.com/kevinpapst))
- fix pdf creation for very large exports [\#1533]({{ site.kimai_v2_repo }}/pull/1533) ([kevinpapst](https://github.com/kevinpapst))
- \[BUGFIX\] Escape distinguished name in ldap search [\#1528]({{ site.kimai_v2_repo }}/pull/1528) ([sabbelasichon](https://github.com/sabbelasichon))
- fixing rates in kimai v1 import [\#1521]({{ site.kimai_v2_repo }}/pull/1521) ([kevinpapst](https://github.com/kevinpapst))

**Closed issues:**

- Activity dropdown not working in v1.8 [\#1662]({{ site.kimai_v2_repo }}/issues/1662)
- Updating to 1.8 can't acces [\#1660]({{ site.kimai_v2_repo }}/issues/1660)
- Populate project and customer by activity selection [\#1634]({{ site.kimai_v2_repo }}/issues/1634)
- Stop button not working  [\#1632]({{ site.kimai_v2_repo }}/issues/1632)
- Installation instructions shared host: add netcup [\#1620]({{ site.kimai_v2_repo }}/issues/1620)
- unable to export to pdf invoice [\#1619]({{ site.kimai_v2_repo }}/issues/1619)
- Invoice generation not taking quantity into consideration [\#1531]({{ site.kimai_v2_repo }}/issues/1531)
- A little more help regarding adding Exports and adjusting the Dashboard [\#1347]({{ site.kimai_v2_repo }}/issues/1347)
