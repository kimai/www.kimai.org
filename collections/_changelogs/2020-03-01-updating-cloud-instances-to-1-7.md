---
title: "Updating cloud instances to 1.7"
date: "2020-03-01 23:50:15 +0200"
---

We are currently (between 1th and 8th of March) upgrading all cloud instances. Our customer clouds are currently running Kimai 1.6.2 and we are upgrading to Kimai 1.7.

After this first round of upgrades and when all clouds are running stable, we will upgrade the customer clouds to Kimai 1.8 in the next weeks. We will announce the update as usual here on the blog.

You might experience a couple of minutes downtime during the update of your own time-tracking cloud. 

In case of any question or problem, please use the [support channel](https://www.kimai.cloud/support-center/request).

## Upcoming changes 

Here is a list of the most important changes, that you can look out for:

- New: Task Management / Todo list
- Customer detail page (with comments, team and project listing …)
- Project detail page (with comments, team and activity listing …)
- Chinese translations
- Basque translations
- Boxed layout (in user preferences)
- Filter by export state
- Batch update of rates

## Full changelog

We are committed to the open source world and try to publish everything we do, so here is the full list of all changes:

### Version 1.7

**Implemented enhancements:**

- Report function for project progress [\#1374](https://github.com/kevinpapst/kimai2/issues/1374)
- Option to diplay the total amount when printing a report [\#1365](https://github.com/kevinpapst/kimai2/issues/1365)
- mpdf v7.1.9 requires php ... does not 7.4.1 [\#1352](https://github.com/kevinpapst/kimai2/issues/1352)
- Move loader icon to viewport [\#1330](https://github.com/kevinpapst/kimai2/issues/1330)
- Invoice: duration format in preview listing [\#1301](https://github.com/kevinpapst/kimai2/issues/1301)
- Currency symbol \(like €\) to be shown with rates on invoice [\#1288](https://github.com/kevinpapst/kimai2/issues/1288)
- Access to teams with API [\#1286](https://github.com/kevinpapst/kimai2/issues/1286)
- Show team assignment on project page [\#1247](https://github.com/kevinpapst/kimai2/issues/1247)
- Better workflow when creating project and team [\#1238](https://github.com/kevinpapst/kimai2/issues/1238)
- Invoice not really usable [\#1237](https://github.com/kevinpapst/kimai2/issues/1237)
- Timeline for projects [\#1212](https://github.com/kevinpapst/kimai2/issues/1212)
- Show duration while creating new time entry [\#818](https://github.com/kevinpapst/kimai2/issues/818)
- Basque language translation [\#1382](https://github.com/kevinpapst/kimai2/pull/1382) ([ikusimakusi](https://github.com/ikusimakusi))
- Improve user role permissions [\#1372](https://github.com/kevinpapst/kimai2/pull/1372) ([kevinpapst](https://github.com/kevinpapst))
- Detail pages with comment for customers and projects [\#1371](https://github.com/kevinpapst/kimai2/pull/1371) ([kevinpapst](https://github.com/kevinpapst))
- working on PHP 7.4 support [\#1355](https://github.com/kevinpapst/kimai2/pull/1355) ([kevinpapst](https://github.com/kevinpapst))
- toolbar filter for exported timesheet records [\#1327](https://github.com/kevinpapst/kimai2/pull/1327) ([kevinpapst](https://github.com/kevinpapst))
- set rates via batch update [\#1326](https://github.com/kevinpapst/kimai2/pull/1326) ([kevinpapst](https://github.com/kevinpapst))
- renamed translation files from .xliff to .xlf [\#1314](https://github.com/kevinpapst/kimai2/pull/1314) ([kevinpapst](https://github.com/kevinpapst))
- added chinese translations [\#1310](https://github.com/kevinpapst/kimai2/pull/1310) ([kevinpapst](https://github.com/kevinpapst))
- Changed Typo [\#1309](https://github.com/kevinpapst/kimai2/pull/1309) ([dabenzel](https://github.com/dabenzel))
- simplify to add widgets via plugin [\#1308](https://github.com/kevinpapst/kimai2/pull/1308) ([kevinpapst](https://github.com/kevinpapst))
- loose email validation on customer [\#1224](https://github.com/kevinpapst/kimai2/pull/1224) ([kevinpapst](https://github.com/kevinpapst))
- added invoice variables for newest fields [\#1390](https://github.com/kevinpapst/kimai2/issues/1390) ([kevinpapst](https://github.com/kevinpapst))
- delete log file from doctor [\#1388](https://github.com/kevinpapst/kimai2/pull/1388) ([kevinpapst](https://github.com/kevinpapst))
- added layout chooser in user preferences (new: boxed layout) [\#1388](https://github.com/kevinpapst/kimai2/pull/1388) ([kevinpapst](https://github.com/kevinpapst))
- added missing raw filter [\#1393](https://github.com/kevinpapst/kimai2/pull/1393) ([lduer](https://github.com/lduer))

**Fixed bugs:**

- Permission create\_project isn't sufficient for creating projects [\#1340](https://github.com/kevinpapst/kimai2/issues/1340)
- \[API\]: GET ​/api​/timesheets with tags produce "Bad Request" error message [\#1322](https://github.com/kevinpapst/kimai2/issues/1322)
- Hide Begin / End in "my times" section when duration tracking is active [\#1307](https://github.com/kevinpapst/kimai2/issues/1307)
- Error thrown while trying to restart a job using the 'Start again' option in the 'Actions' menu [\#1295](https://github.com/kevinpapst/kimai2/issues/1295)
- Project: orderDate timezone problem [\#1239](https://github.com/kevinpapst/kimai2/issues/1239)
- Including the active/inactive flag in the dashboard tiles [\#1221](https://github.com/kevinpapst/kimai2/issues/1221)
- Dashboard shows numbers of project without having access to it [\#1161](https://github.com/kevinpapst/kimai2/issues/1161)
- fix widgets imports [\#1387](https://github.com/kevinpapst/kimai2/pull/1387) ([kevinpapst](https://github.com/kevinpapst))
- allow empty date in export [\#1338](https://github.com/kevinpapst/kimai2/pull/1338) ([kevinpapst](https://github.com/kevinpapst))
- fix daterange filter for multi-timezone setups [\#1321](https://github.com/kevinpapst/kimai2/pull/1321) ([kevinpapst](https://github.com/kevinpapst))
