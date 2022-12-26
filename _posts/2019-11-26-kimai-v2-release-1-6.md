---
title: "Release 1.6 - Permissions & Invoices"
date: "2019-11-26 18:00:00 +0200"
author: kevinpapst
tags: [Release]
---

The next release is out, as always containing various bugfixes and some exciting new features:

- Support for different export formats in "My times"
- Enhanced search capabilities for dropdowns
- Configure calendar slot length in System Configurations
- Configure rounding options in System Configurations
- New fields: VAT ID for customer, Vat ID for invoice, Payment details for invoice, Contact details for invoice
- Improved "freelancer" and "default" HTML invoice templates
- Multi-update and multi-delete for timesheets and tags
- User roles and permission management via Admin UI
- Dutch translations

Thanks to all of you for using and supporting Kimai, especially:
- all clients and donators who help me to keep up the work for Kimai
- the developers who contributed their time ...
- and everyone else contributing at GitHub, too many to name you all - you guys rock!

> Want to upgrade? [Click here to find out how]({%link _documentation/updates.md %}).

# Changelog

[Full Changelog]({{ site.kimai_v2_repo }}/compare/1.5...1.6)

**Implemented enhancements:**

- Dependency: API: About self: ID \(and maybe other vars\) [\#1263]({{ site.kimai_v2_repo }}/issues/1263)
- Language of user is ignored in new error pages \(page not found\) [\#1218]({{ site.kimai_v2_repo }}/issues/1218)
- Support for different formats in user export [\#822]({{ site.kimai_v2_repo }}/issues/822)
- Select2 search enhancement [\#1276]({{ site.kimai_v2_repo }}/pull/1276) ([choules](https://github.com/choules))
- enable interactive features of Swagger UI [\#1273]({{ site.kimai_v2_repo }}/pull/1273) ([kevinpapst](https://github.com/kevinpapst))
- Translation: Add de\_CH [\#1272]({{ site.kimai_v2_repo }}/pull/1272) ([aptevo](https://github.com/aptevo))
- allow to configure calendar slot length [\#1269]({{ site.kimai_v2_repo }}/pull/1269) ([kevinpapst](https://github.com/kevinpapst))
- Added update command [\#1268]({{ site.kimai_v2_repo }}/pull/1268) ([kevinpapst](https://github.com/kevinpapst))
- API: Allow to set user for timesheet [\#1259]({{ site.kimai_v2_repo }}/pull/1259) ([kevinpapst](https://github.com/kevinpapst))
- added new invoice fields, improved invoice templates [\#1258]({{ site.kimai_v2_repo }}/pull/1258) ([kevinpapst](https://github.com/kevinpapst))
- added money fields without currency for invoices [\#1254]({{ site.kimai_v2_repo }}/pull/1254) ([kevinpapst](https://github.com/kevinpapst))
- Update and delete multi timesheets and tags [\#1240]({{ site.kimai_v2_repo }}/pull/1240) ([kevinpapst](https://github.com/kevinpapst))
- include bundle configuration in system configuration screen [\#1235]({{ site.kimai_v2_repo }}/pull/1235) ([kevinpapst](https://github.com/kevinpapst))
- User roles and permission management via Admin UI [\#1231]({{ site.kimai_v2_repo }}/pull/1231) ([kevinpapst](https://github.com/kevinpapst))
- Round begin when starting record [\#1229]({{ site.kimai_v2_repo }}/pull/1229) ([kevinpapst](https://github.com/kevinpapst))
- Dutch translation files [\#1226]({{ site.kimai_v2_repo }}/pull/1226) ([1willem](https://github.com/1willem))
- support different formats in user timesheet exports [\#1222]({{ site.kimai_v2_repo }}/pull/1222) ([kevinpapst](https://github.com/kevinpapst))
- highlight menus on sub-pages [\#1220]({{ site.kimai_v2_repo }}/pull/1220) ([kevinpapst](https://github.com/kevinpapst))
- added csv importer for timesheet and project data [\#1216]({{ site.kimai_v2_repo }}/pull/1216) ([kevinpapst](https://github.com/kevinpapst))

**Fixed bugs:**

- Error 500 when teamlead adds new activity [\#1271]({{ site.kimai_v2_repo }}/issues/1271)
- Error deleting a tagged record [\#1241]({{ site.kimai_v2_repo }}/issues/1241)
- Reset password looks broken [\#1198]({{ site.kimai_v2_repo }}/issues/1198)
- Minor cosmetic bug: On "Grant access to projects", "Reset" does not reflect [\#1190]({{ site.kimai_v2_repo }}/issues/1190)
- fix the password reset page layout [\#1261]({{ site.kimai_v2_repo }}/pull/1261) ([kevinpapst](https://github.com/kevinpapst))
- fix reset input for forms [\#1251]({{ site.kimai_v2_repo }}/pull/1251) ([kevinpapst](https://github.com/kevinpapst))
- fixes wrong foreign keys on timesheet\_tags join table [\#1242]({{ site.kimai_v2_repo }}/pull/1242) ([kevinpapst](https://github.com/kevinpapst))
