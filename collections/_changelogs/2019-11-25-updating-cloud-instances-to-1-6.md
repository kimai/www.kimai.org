---
title: "Updating cloud instances to 1.6"
date: "2019-11-25 18:00:00 +0200"
---

We are currently (between November 25th and November 27th) upgrading all cloud instances to the latest available Kimai version. All customer clouds are currently running Kimai 1.4.2 and we are upgrading to Kimai 1.5.

After this first round of upgrades and when all clouds are running stable, we will upgrade the customer clouds to Kimai 1.6 in the begin of December. You might experience a couple of minutes downtime during the update of your own time-tracking cloud. 

In case of any question or problem, please use the [support channel](https://www.kimai.cloud/support-center/request).

## Upcoming changes 

Here is a list of the most important changes, that you should look out for:

- Branding options in system configurations
- Configurable calendar slot length in "System Configurations"
- Configurable rounding options in "System Configurations"
- User roles and permission management via Admin UI
- New fields: VAT ID for customer, Vat ID for invoice, Payment details for invoice, Contact details for invoice
- Improved invoice templates
- Turkish translations
- Dutch translations
- Danish translations
- Support for different export formats in "My times"
- Multi-update and multi-delete for timesheets and tags
- Enhanced search capabilities for dropdowns
- The "now" button and duration field in timesheet edit dialog

## Full changelog

We are committed to the open source world and try to publish everything we do, so here is the full list of all changes:

### Version 1.5

**Implemented enhancements:**

- Query API by custom fields / meta fields [\#1174](https://github.com/kevinpapst/kimai2/issues/1174)
- Add a "now" button to manual timesheet entry [\#844](https://github.com/kevinpapst/kimai2/issues/844)
- dynamic branding options [\#1205](https://github.com/kevinpapst/kimai2/pull/1205) ([kevinpapst](https://github.com/kevinpapst))
- reformat edit forms [\#1192](https://github.com/kevinpapst/kimai2/pull/1192) ([kevinpapst](https://github.com/kevinpapst))
- improve list views [\#1191](https://github.com/kevinpapst/kimai2/pull/1191) ([kevinpapst](https://github.com/kevinpapst))
- added order-date field to project [\#1186](https://github.com/kevinpapst/kimai2/pull/1186) ([kevinpapst](https://github.com/kevinpapst))
- Added some spanish new strings [\#1183](https://github.com/kevinpapst/kimai2/pull/1183) ([yayitazale](https://github.com/yayitazale))
- duration field in timesheet edit dialog [\#1180](https://github.com/kevinpapst/kimai2/pull/1180) ([kevinpapst](https://github.com/kevinpapst))
- Turkish Language Translations [\#1160](https://github.com/kevinpapst/kimai2/pull/1160) ([guneysus](https://github.com/guneysus))
- Phpunit 8 [\#1155](https://github.com/kevinpapst/kimai2/pull/1155) ([kevinpapst](https://github.com/kevinpapst))

**Fixed bugs:**

- Redirection of "Show all record" link fails on a servername alias. [\#1199](https://github.com/kevinpapst/kimai2/issues/1199)
- Avatar url broken [\#1196](https://github.com/kevinpapst/kimai2/issues/1196)
- Error pages aren't working in production [\#1194](https://github.com/kevinpapst/kimai2/issues/1194)
- Filter timesheet from user list [\#1179](https://github.com/kevinpapst/kimai2/issues/1179)
- REST-API Calls always returning 302 redirect to login page [\#1169](https://github.com/kevinpapst/kimai2/issues/1169)
- Dashboard view not getting updated properly with the work time for the day - 'working hours today'  [\#1163](https://github.com/kevinpapst/kimai2/issues/1163)
- Fix broken navigation and error pages [\#1210](https://github.com/kevinpapst/kimai2/pull/1210) ([kevinpapst](https://github.com/kevinpapst))
- fix for production settings not exposing framework details [\#1173](https://github.com/kevinpapst/kimai2/pull/1173) ([adrianrudnik](https://github.com/adrianrudnik))

**Closed issues:**

- Error 500 When I click on "My profile" [\#1164](https://github.com/kevinpapst/kimai2/issues/1164)
- Upgrading to 1.4.1 broke it :\( [\#1162](https://github.com/kevinpapst/kimai2/issues/1162)

### Version 1.6

**Implemented enhancements:**

- Dependency: API: About self: ID \(and maybe other vars\) [\#1263](https://github.com/kevinpapst/kimai2/issues/1263)
- Language of user is ignored in new error pages \(page not found\) [\#1218](https://github.com/kevinpapst/kimai2/issues/1218)
- Support for different formats in user export [\#822](https://github.com/kevinpapst/kimai2/issues/822)
- Select2 search enhancement [\#1276](https://github.com/kevinpapst/kimai2/pull/1276) ([choules](https://github.com/choules))
- enable interactive features of Swagger UI [\#1273](https://github.com/kevinpapst/kimai2/pull/1273) ([kevinpapst](https://github.com/kevinpapst))
- Translation: Add de\_CH [\#1272](https://github.com/kevinpapst/kimai2/pull/1272) ([aptevo](https://github.com/aptevo))
- allow to configure calendar slot length [\#1269](https://github.com/kevinpapst/kimai2/pull/1269) ([kevinpapst](https://github.com/kevinpapst))
- Added update command [\#1268](https://github.com/kevinpapst/kimai2/pull/1268) ([kevinpapst](https://github.com/kevinpapst))
- API: Allow to set user for timesheet [\#1259](https://github.com/kevinpapst/kimai2/pull/1259) ([kevinpapst](https://github.com/kevinpapst))
- added new invoice fields, improved invoice templates [\#1258](https://github.com/kevinpapst/kimai2/pull/1258) ([kevinpapst](https://github.com/kevinpapst))
- added money fields without currency for invoices [\#1254](https://github.com/kevinpapst/kimai2/pull/1254) ([kevinpapst](https://github.com/kevinpapst))
- Update and delete multi timesheets and tags [\#1240](https://github.com/kevinpapst/kimai2/pull/1240) ([kevinpapst](https://github.com/kevinpapst))
- include bundle configuration in system configuration screen [\#1235](https://github.com/kevinpapst/kimai2/pull/1235) ([kevinpapst](https://github.com/kevinpapst))
- User roles and permission management via Admin UI [\#1231](https://github.com/kevinpapst/kimai2/pull/1231) ([kevinpapst](https://github.com/kevinpapst))
- Round begin when starting record [\#1229](https://github.com/kevinpapst/kimai2/pull/1229) ([kevinpapst](https://github.com/kevinpapst))
- Dutch translation files [\#1226](https://github.com/kevinpapst/kimai2/pull/1226) ([1willem](https://github.com/1willem))
- support different formats in user timesheet exports [\#1222](https://github.com/kevinpapst/kimai2/pull/1222) ([kevinpapst](https://github.com/kevinpapst))
- highlight menus on sub-pages [\#1220](https://github.com/kevinpapst/kimai2/pull/1220) ([kevinpapst](https://github.com/kevinpapst))
- added csv importer for timesheet and project data [\#1216](https://github.com/kevinpapst/kimai2/pull/1216) ([kevinpapst](https://github.com/kevinpapst))
- Currency symbol \(like €\) to be shown with rates on invoice [\#1288](https://github.com/kevinpapst/kimai2/issues/1288)
- Access to teams with API [\#1286](https://github.com/kevinpapst/kimai2/issues/1286)
- Invoice not really usable [\#1237](https://github.com/kevinpapst/kimai2/issues/1237)
- Danish translations [\#1296](https://github.com/kevinpapst/kimai2/pull/1296) ([Badgie](https://github.com/Badgie))

**Fixed bugs:**

- Error 500 when teamlead adds new activity [\#1271](https://github.com/kevinpapst/kimai2/issues/1271)
- Error deleting a tagged record [\#1241](https://github.com/kevinpapst/kimai2/issues/1241)
- Reset password looks broken [\#1198](https://github.com/kevinpapst/kimai2/issues/1198)
- Minor cosmetic bug: On "Grant access to projects", "Reset" does not reflect [\#1190](https://github.com/kevinpapst/kimai2/issues/1190)
- fix the password reset page layout [\#1261](https://github.com/kevinpapst/kimai2/pull/1261) ([kevinpapst](https://github.com/kevinpapst))
- fix reset input for forms [\#1251](https://github.com/kevinpapst/kimai2/pull/1251) ([kevinpapst](https://github.com/kevinpapst))
- fixes wrong foreign keys on timesheet\_tags join table [\#1242](https://github.com/kevinpapst/kimai2/pull/1242) ([kevinpapst](https://github.com/kevinpapst))
- fix installer for older databases and improve invoice templates [\#1282](https://github.com/kevinpapst/kimai2/pull/1282) ([kevinpapst](https://github.com/kevinpapst))
- fix sqlite installer [\#1283](https://github.com/kevinpapst/kimai2/pull/1283) ([kevinpapst](https://github.com/kevinpapst))
- Error thrown while trying to restart a job using the 'Start again' option in the 'Actions' menu [\#1295](https://github.com/kevinpapst/kimai2/issues/1295)
- Including the active/inactive flag in the dashboard tiles [\#1221](https://github.com/kevinpapst/kimai2/issues/1221)
- Dashboard shows numbers of project without having access to it [\#1161](https://github.com/kevinpapst/kimai2/issues/1161)
