---
title: "Release 1.10 - Reporting, Activity permissions"
date: "2020-08-27 08:00:00 +0200"
author: kevinpapst
tags: [On-Premise]
---

The new release 1.10 (+ the bugfix release 1.10.1) was published, some of its highlights are:

- The long awaited "reporting screen" with the first reports for: user weekly times, user monthly times, all user monthly times
- Basic exports of: users, customers, projects, activities
- Team permissions for activities
- The new "view_all_data" permission that deactivates team permission checks (previously hard-coded for all admins, now configurable per user-role)
- New translations for: Vietnamese, Hebrew, Romanian
- Stacked bar-chart in "My times" widget to distinguish activities
- Timesheet lockdown with grace period
- New dialog to create timesheet for multiple users at once
- More features in all detail pages for customer, projects, activities

Thanks to all of you for using and supporting Kimai, especially:
- all clients and donors who help me to keep up the work for Kimai
- the developers who contributed their time
- everyone else contributing at GitHub, too many to name you all 

All of you guys rock big times ❤️ thanks for being part of the Kimai community!

> Want to upgrade? [Click here to find out how]({%link _documentation/updates.md %}).

# Changelog

[Full Changelog]({{ site.kimai_v2_repo }}/compare/1.9...1.10.1)

**Implemented enhancements:**

- Adding/viewing Acitivities while in Project view  [\#1885]({{ site.kimai_v2_repo }}/issues/1885)
- Report, copy&paste in Excel issue [\#1839]({{ site.kimai_v2_repo }}/issues/1839)
- reporting feature: summary row in first line; last column always visible; fixed width of first column [\#1824]({{ site.kimai_v2_repo }}/issues/1824)
- Add username ID to timesheet export [\#1823]({{ site.kimai_v2_repo }}/issues/1823)
- Export user list [\#1822]({{ site.kimai_v2_repo }}/issues/1822)
- Only question: Export of all projects even if they are empty [\#1819]({{ site.kimai_v2_repo }}/issues/1819)
- Translation [\#1811]({{ site.kimai_v2_repo }}/issues/1811)
- Dashboard showing 'wrong' data at turn of month [\#1801]({{ site.kimai_v2_repo }}/issues/1801)
- Sort feature for columns not in the default view [\#1754]({{ site.kimai_v2_repo }}/issues/1754)
- Kimai accepts ultra weak API keys [\#1753]({{ site.kimai_v2_repo }}/issues/1753)
- Add new language \(Vietnamese\) [\#1748]({{ site.kimai_v2_repo }}/issues/1748)
- Translation to Hebrew [\#1723]({{ site.kimai_v2_repo }}/issues/1723)
- Allow export option for Users view [\#1706]({{ site.kimai_v2_repo }}/issues/1706)
- API for getting time sheet records updated after certain timestamp [\#1699]({{ site.kimai_v2_repo }}/issues/1699)
- manipulate invoice counter [\#1673]({{ site.kimai_v2_repo }}/issues/1673)
- invoice language of variables in dependence of invoice language settings \(not user language\) [\#1670]({{ site.kimai_v2_repo }}/issues/1670)
- Duplicate entry in language files leads to wrong translation [\#1616]({{ site.kimai_v2_repo }}/issues/1616)
- Time based permissions [\#1605]({{ site.kimai_v2_repo }}/issues/1605)
- invoice counter for customer [\#1554]({{ site.kimai_v2_repo }}/issues/1554)
- invoice: sum calculation on entry per week [\#1434]({{ site.kimai_v2_repo }}/issues/1434)
- Kimai permissions are not consistent when creating a new group with identical rights [\#1400]({{ site.kimai_v2_repo }}/issues/1400)
- cleanup for 1.10 [\#1906]({{ site.kimai_v2_repo }}/pull/1906) ([kevinpapst](https://github.com/kevinpapst))
- Dutch translation update [\#1905]({{ site.kimai_v2_repo }}/pull/1905) ([IxFail](https://github.com/IxFail))
- more extension points for plugins [\#1904]({{ site.kimai_v2_repo }}/pull/1904) ([kevinpapst](https://github.com/kevinpapst))
- Cosmetic improvements for reporting [\#1903]({{ site.kimai_v2_repo }}/pull/1903) ([kevinpapst](https://github.com/kevinpapst))
- allow to order tables by more fields [\#1902]({{ site.kimai_v2_repo }}/pull/1902) ([kevinpapst](https://github.com/kevinpapst))
- the never ending group\_by pagination issue [\#1901]({{ site.kimai_v2_repo }}/pull/1901) ([kevinpapst](https://github.com/kevinpapst))
- helper for handling billable fields [\#1900]({{ site.kimai_v2_repo }}/pull/1900) ([kevinpapst](https://github.com/kevinpapst))
- stacked bars in dashboard widget [\#1893]({{ site.kimai_v2_repo }}/pull/1893) ([kevinpapst](https://github.com/kevinpapst))
- Weekly reporting view [\#1892]({{ site.kimai_v2_repo }}/pull/1892) ([kevinpapst](https://github.com/kevinpapst))
- Team permissions for activities [\#1872]({{ site.kimai_v2_repo }}/pull/1872) ([kevinpapst](https://github.com/kevinpapst))
- remove usage of getenv from codebase [\#1861]({{ site.kimai_v2_repo }}/pull/1861) ([kevinpapst](https://github.com/kevinpapst))
- disable headings in markdown [\#1843]({{ site.kimai_v2_repo }}/pull/1843) ([kevinpapst](https://github.com/kevinpapst))
- Reporting drilldown [\#1842]({{ site.kimai_v2_repo }}/pull/1842) ([kevinpapst](https://github.com/kevinpapst))
- Teams hidden user [\#1841]({{ site.kimai_v2_repo }}/pull/1841) ([kevinpapst](https://github.com/kevinpapst))
- invoice: allow to increase number, customer specific counter [\#1836]({{ site.kimai_v2_repo }}/pull/1836) ([kevinpapst](https://github.com/kevinpapst))
- added some more tests [\#1835]({{ site.kimai_v2_repo }}/pull/1835) ([kevinpapst](https://github.com/kevinpapst))
- add generic object exporter via annotations [\#1831]({{ site.kimai_v2_repo }}/pull/1831) ([kevinpapst](https://github.com/kevinpapst))
- UI improvement [\#1829]({{ site.kimai_v2_repo }}/pull/1829) ([kevinpapst](https://github.com/kevinpapst))
- added username to export [\#1827]({{ site.kimai_v2_repo }}/pull/1827) ([kevinpapst](https://github.com/kevinpapst))
- API improvements [\#1826]({{ site.kimai_v2_repo }}/pull/1826) ([kevinpapst](https://github.com/kevinpapst))
- Preparations for coming features [\#1818]({{ site.kimai_v2_repo }}/pull/1818) ([kevinpapst](https://github.com/kevinpapst))
- polish detail pages [\#1817]({{ site.kimai_v2_repo }}/pull/1817) ([kevinpapst](https://github.com/kevinpapst))
- Enhancements [\#1808]({{ site.kimai_v2_repo }}/pull/1808) ([kevinpapst](https://github.com/kevinpapst))
- Added reporting screen [\#1805]({{ site.kimai_v2_repo }}/pull/1805) ([kevinpapst](https://github.com/kevinpapst))
- Permissions [\#1803]({{ site.kimai_v2_repo }}/pull/1803) ([kevinpapst](https://github.com/kevinpapst))
- new translations to clarify working time periods [\#1802]({{ site.kimai_v2_repo }}/pull/1802) ([kevinpapst](https://github.com/kevinpapst))
- Composer [\#1796]({{ site.kimai_v2_repo }}/pull/1796) ([kevinpapst](https://github.com/kevinpapst))
- Fixed SV locale date format [\#1790]({{ site.kimai_v2_repo }}/pull/1790) ([Oscariremma](https://github.com/Oscariremma))
- Invoices: show only custom documents in upload form [\#1786]({{ site.kimai_v2_repo }}/pull/1786) ([kevinpapst](https://github.com/kevinpapst))
- Configuration improvements [\#1784]({{ site.kimai_v2_repo }}/pull/1784) ([kevinpapst](https://github.com/kevinpapst))
- add support for weekly invoice [\#1780]({{ site.kimai_v2_repo }}/pull/1780) ([maarten-k](https://github.com/maarten-k))
- Invoice: switch from and to address [\#1776]({{ site.kimai_v2_repo }}/pull/1776) ([kevinpapst](https://github.com/kevinpapst))
- improve configurations for usage in multi-environment setups [\#1775]({{ site.kimai_v2_repo }}/pull/1775) ([kevinpapst](https://github.com/kevinpapst))
- Fixed and added some Swedish translations [\#1774]({{ site.kimai_v2_repo }}/pull/1774) ([Oscariremma](https://github.com/Oscariremma))
- Allow to recalculate rates via bulk edit [\#1768]({{ site.kimai_v2_repo }}/pull/1768) ([kevinpapst](https://github.com/kevinpapst))
- Added Vietnamese translations [\#1758]({{ site.kimai_v2_repo }}/pull/1758) ([kevinpapst](https://github.com/kevinpapst))
- Store sessions in database [\#1736]({{ site.kimai_v2_repo }}/pull/1736) ([kevinpapst](https://github.com/kevinpapst))
- added hebrew translations [\#1724]({{ site.kimai_v2_repo }}/pull/1724) ([kevinpapst](https://github.com/kevinpapst))
- added romanian translations [\#1722]({{ site.kimai_v2_repo }}/pull/1722) ([kevinpapst](https://github.com/kevinpapst))
- new system-config to prevent overlapping records [\#1720]({{ site.kimai_v2_repo }}/pull/1720) ([kevinpapst](https://github.com/kevinpapst))
- re-using menu translation for tags [\#1717]({{ site.kimai_v2_repo }}/pull/1717) ([kevinpapst](https://github.com/kevinpapst))
- create timesheet for multiple users [\#1716]({{ site.kimai_v2_repo }}/pull/1716) ([kevinpapst](https://github.com/kevinpapst))
- Invoice [\#1693]({{ site.kimai_v2_repo }}/pull/1693) ([kevinpapst](https://github.com/kevinpapst))
- include project name in invoice name [\#1672]({{ site.kimai_v2_repo }}/pull/1672) ([kevinpapst](https://github.com/kevinpapst))
- Timesheet lockdown with grace period [\#1644]({{ site.kimai_v2_repo }}/pull/1644) ([HonzaKopecky](https://github.com/HonzaKopecky))
- No per user invoices [\#1734]({{ site.kimai_v2_repo }}/issues/1734)

**Fixed bugs:**

- Filter activities shows all activities instead of just for project [\#1890]({{ site.kimai_v2_repo }}/issues/1890)
- Import timesheets using console fails to process tags [\#1877]({{ site.kimai_v2_repo }}/issues/1877)
- Reporting module displays only one activity for project but time sum is displayed for all acivities [\#1859]({{ site.kimai_v2_repo }}/issues/1859)
- Calendar view displays wrong start and end hour [\#1858]({{ site.kimai_v2_repo }}/issues/1858)
- Changing calendar configuration can break week / day view [\#1834]({{ site.kimai_v2_repo }}/issues/1834)
- New Project \> Shoudn't preselect the first customer [\#1828]({{ site.kimai_v2_repo }}/issues/1828)
- Consistent formatting of invoice variables [\#1812]({{ site.kimai_v2_repo }}/issues/1812)
- Project \> timesheet is not filtered [\#1806]({{ site.kimai_v2_repo }}/issues/1806)
- Internal rate and rate columns are switched in PDF [\#1785]({{ site.kimai_v2_repo }}/issues/1785)
- deactivated users and team assignments [\#1781]({{ site.kimai_v2_repo }}/issues/1781)
- Syntax error or access violation: 1055 'k0\_.number' isn't in GROUP BY [\#1769]({{ site.kimai_v2_repo }}/issues/1769)
- API-Endpoint requires budget and timeBudget to create a new customer [\#1713]({{ site.kimai_v2_repo }}/issues/1713)
- Clicking calendar cell in weekly view causes crash [\#1705]({{ site.kimai_v2_repo }}/issues/1705)
- Fatal error on composer install due to missing dependency? [\#1689]({{ site.kimai_v2_repo }}/issues/1689)
- added form type to select a daytime and to prevent invalid config values [\#1895]({{ site.kimai_v2_repo }}/pull/1895) ([kevinpapst](https://github.com/kevinpapst))
- Bugfix in JS for project/activity selection in timesheet edit dialog [\#1894]({{ site.kimai_v2_repo }}/pull/1894) ([kevinpapst](https://github.com/kevinpapst))
- Fix serialize dates [\#1888]({{ site.kimai_v2_repo }}/pull/1888) ([kevinpapst](https://github.com/kevinpapst))
- assign existing tag on timesheet import \(\#1877\) [\#1883]({{ site.kimai_v2_repo }}/pull/1883) ([synaestic](https://github.com/synaestic))
- fix batch update resets export state [\#1866]({{ site.kimai_v2_repo }}/pull/1866) ([kevinpapst](https://github.com/kevinpapst))
- Fix groupby [\#1830]({{ site.kimai_v2_repo }}/pull/1830) ([kevinpapst](https://github.com/kevinpapst))
- fixed team permissions on user queries [\#1815]({{ site.kimai_v2_repo }}/pull/1815) ([kevinpapst](https://github.com/kevinpapst))
- fixing invoices: money display, number and date formats and some translations [\#1814]({{ site.kimai_v2_repo }}/pull/1814) ([kevinpapst](https://github.com/kevinpapst))
- improve invoice create command [\#1756]({{ site.kimai_v2_repo }}/pull/1756) ([kevinpapst](https://github.com/kevinpapst))
- fix required fields in API [\#1718]({{ site.kimai_v2_repo }}/pull/1718) ([kevinpapst](https://github.com/kevinpapst))
- allow to change PDF export layout via code [\#1684]({{ site.kimai_v2_repo }}/pull/1684) ([kevinpapst](https://github.com/kevinpapst))
- fixed multilineIndent [\#1669]({{ site.kimai_v2_repo }}/pull/1669) ([kevinpapst](https://github.com/kevinpapst))
- Users with view\_rate\_own\_timesheet can see all users revenue in dashboard [\#1913]({{ site.kimai_v2_repo }}/issues/1913)
- invoice language [\#1910]({{ site.kimai_v2_repo }}/issues/1910)
- use configured language for non-twig invoice templates [\#1924]({{ site.kimai_v2_repo }}/pull/1924) ([kevinpapst](https://github.com/kevinpapst))
- query widget data with user if requested [\#1917]({{ site.kimai_v2_repo }}/pull/1917) ([kevinpapst](https://github.com/kevinpapst))

**Closed issues:**

- fresh installation via portainer [\#1891]({{ site.kimai_v2_repo }}/issues/1891)
- Printview [\#1850]({{ site.kimai_v2_repo }}/issues/1850)
- Selectable Language for Invoices [\#1820]({{ site.kimai_v2_repo }}/issues/1820)
- filter does not work [\#1809]({{ site.kimai_v2_repo }}/issues/1809)
- Add user property to Post timesheets API [\#1787]({{ site.kimai_v2_repo }}/issues/1787)
- Getting "500 Internal Server Error" on fresh install [\#1751]({{ site.kimai_v2_repo }}/issues/1751)
- When selecting activity many times I have to select it twice [\#1740]({{ site.kimai_v2_repo }}/issues/1740)
- Export sheet always has internal rate [\#1737]({{ site.kimai_v2_repo }}/issues/1737)
- Switch Positions of "Save" and "Close" Button  [\#1515]({{ site.kimai_v2_repo }}/issues/1515)
