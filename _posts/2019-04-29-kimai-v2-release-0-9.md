---
layout: post
title: "Release 0.9 - API, Plugins & DB Configs"
date: "2019-04-29 00:00:00 +0200"
author: kevinpapst
tags: [Release]
---

Two month are longer than expected for this release, but a lot changed in the background. These will be announced in a 
couple of weeks, and until then: update to 0.9, enjoy time-tracking and let me know [what you think](https://github.com/kevinpapst/kimai2/issues) about this version.

If you enjoy the new release, here is the [donation page](https://www.kimai.org/donate/). 

[Full Changelog](https://github.com/kevinpapst/kimai2/compare/0.8.1..0.9)

**Upgrade from 0.8.1:**

- Execute the database migrations: [How to upgrade Kimai](https://github.com/kevinpapst/kimai2/blob/master/UPGRADING.md)
- Follow the other steps mentioned in [UPGRADING.md](https://github.com/kevinpapst/kimai2/blob/master/UPGRADING.md)

**Implemented enhancements:**

- Translation to Swedish [\#731](https://github.com/kevinpapst/kimai2/issues/731)
- Remove active flag in user preferences form for non admin user [\#694](https://github.com/kevinpapst/kimai2/issues/694)
- Add floor and ceil rounding [\#692](https://github.com/kevinpapst/kimai2/issues/692)
- POST/PUT API endpoints for projects and activities [\#683](https://github.com/kevinpapst/kimai2/issues/683)
- API is not able to handle CORS [\#646](https://github.com/kevinpapst/kimai2/issues/646)
- Recompile the frontend assets for usage in a sub-directory [\#635](https://github.com/kevinpapst/kimai2/issues/635)
- Remove database table prefix [\#633](https://github.com/kevinpapst/kimai2/issues/633)
- Autofocus on first entry of forms [\#620](https://github.com/kevinpapst/kimai2/issues/620)
- Activity admin - filter for globals [\#598](https://github.com/kevinpapst/kimai2/issues/598)
- Non visible customer/projects etc are shown in dropdowns [\#597](https://github.com/kevinpapst/kimai2/issues/597)
- remove duplicate confirm dialog of deletion [\#591](https://github.com/kevinpapst/kimai2/issues/591)
- remove mobile navbar header [\#588](https://github.com/kevinpapst/kimai2/issues/588)
- Support 12h time format [\#578](https://github.com/kevinpapst/kimai2/issues/578)
- add timerange filter to timesheet export api [\#577](https://github.com/kevinpapst/kimai2/issues/577)
- Extend rounding options with "to closest" mode [\#576](https://github.com/kevinpapst/kimai2/issues/576)
- Custom CSS [\#516](https://github.com/kevinpapst/kimai2/issues/516)
- reduce config complexity by converting php format to js format [\#734](https://github.com/kevinpapst/kimai2/pull/734) ([kevinpapst](https://github.com/kevinpapst))
- Updated authorization screens [\#727](https://github.com/kevinpapst/kimai2/pull/727) ([kevinpapst](https://github.com/kevinpapst))
- added delete timesheet API endpoint [\#726](https://github.com/kevinpapst/kimai2/pull/726) ([kevinpapst](https://github.com/kevinpapst))
- Design updates [\#723](https://github.com/kevinpapst/kimai2/pull/723) ([kevinpapst](https://github.com/kevinpapst))
- API: changed date-format, camelCase instead of snake\_case, null values, update and create for customer and project [\#718](https://github.com/kevinpapst/kimai2/pull/718) ([kevinpapst](https://github.com/kevinpapst))
- added api/activities POST and PATCH [\#717](https://github.com/kevinpapst/kimai2/pull/717) ([horlabs](https://github.com/horlabs))
- allow to overwrite config via prepend [\#715](https://github.com/kevinpapst/kimai2/pull/715) ([kevinpapst](https://github.com/kevinpapst))
- Load export type ids dynamically [\#703](https://github.com/kevinpapst/kimai2/pull/703) ([simone-gasparini](https://github.com/simone-gasparini))
- fixing default env var for cors header [\#656](https://github.com/kevinpapst/kimai2/pull/656) ([kevinpapst](https://github.com/kevinpapst))
- added cors bundle to allow external api access [\#655](https://github.com/kevinpapst/kimai2/pull/655) ([kevinpapst](https://github.com/kevinpapst))
- added route to redirect locale to configured homepage [\#654](https://github.com/kevinpapst/kimai2/pull/654) ([kevinpapst](https://github.com/kevinpapst))
-  added database driven system configurations with admin screen [\#647](https://github.com/kevinpapst/kimai2/pull/647) ([kevinpapst](https://github.com/kevinpapst))
- added new rounding mode: closest [\#611](https://github.com/kevinpapst/kimai2/pull/611) ([kevinpapst](https://github.com/kevinpapst))
- order datatable items by name [\#594](https://github.com/kevinpapst/kimai2/pull/594) ([kevinpapst](https://github.com/kevinpapst))
- UI improvements for datatables [\#593](https://github.com/kevinpapst/kimai2/pull/593) ([kevinpapst](https://github.com/kevinpapst))
- Plugins support [\#592](https://github.com/kevinpapst/kimai2/pull/592) ([kevinpapst](https://github.com/kevinpapst))

**Fixed bugs:**

- 500 \(Internal Server Error\) create customer [\#711](https://github.com/kevinpapst/kimai2/issues/711)
- Export date parsing does not care about timezone [\#707](https://github.com/kevinpapst/kimai2/issues/707)
- API docs are wrong for GET entity \(ignores serialization group\) [\#701](https://github.com/kevinpapst/kimai2/issues/701)
- API date and datetime format [\#700](https://github.com/kevinpapst/kimai2/issues/700)
- totals do not match [\#691](https://github.com/kevinpapst/kimai2/issues/691)
- Validate email when creating user via cmd-line [\#663](https://github.com/kevinpapst/kimai2/issues/663)
- Datepicker "From" not working [\#651](https://github.com/kevinpapst/kimai2/issues/651)
- Error export PDF [\#648](https://github.com/kevinpapst/kimai2/issues/648)
- Error on importing v1 timeSheets [\#645](https://github.com/kevinpapst/kimai2/issues/645)
- Time selection dropdown not working in Firefox [\#618](https://github.com/kevinpapst/kimai2/issues/618)
- Revoke of start\_own\_timesheet permission doesn't prevent start active entry [\#606](https://github.com/kevinpapst/kimai2/issues/606)
- remove invalid cache header [\#722](https://github.com/kevinpapst/kimai2/pull/722) ([kevinpapst](https://github.com/kevinpapst))
- fix modal - autofocus problem, datepicker not shown on begin date [\#653](https://github.com/kevinpapst/kimai2/pull/653) ([kevinpapst](https://github.com/kevinpapst))
- fix pdf export cache directory [\#650](https://github.com/kevinpapst/kimai2/pull/650) ([kevinpapst](https://github.com/kevinpapst))

**Closed issues:**

- 403 error after installation [\#725](https://github.com/kevinpapst/kimai2/issues/725)
- AppExtension Error after bin/console cache:clear --env=prod on Line 43 [\#721](https://github.com/kevinpapst/kimai2/issues/721)
- Kimai-v1 Import Failure [\#719](https://github.com/kevinpapst/kimai2/issues/719)
- Review export lifecycle for plugin injection [\#702](https://github.com/kevinpapst/kimai2/issues/702)
- Missing database-table kimai2\_configuration while trying to run import/migration script [\#698](https://github.com/kevinpapst/kimai2/issues/698)
- Import from v1 fails if two users have the same email or blank email [\#688](https://github.com/kevinpapst/kimai2/issues/688)
- mysql limit of max amount of activities ? [\#681](https://github.com/kevinpapst/kimai2/issues/681)
- Filter by project broken [\#670](https://github.com/kevinpapst/kimai2/issues/670)
- Group of user [\#669](https://github.com/kevinpapst/kimai2/issues/669)
- Demo not loading [\#665](https://github.com/kevinpapst/kimai2/issues/665)
- Admin Panel [\#662](https://github.com/kevinpapst/kimai2/issues/662)
- mixed date formats in the api for the timesheet [\#658](https://github.com/kevinpapst/kimai2/issues/658)
- Some activites don't show up in last activities [\#609](https://github.com/kevinpapst/kimai2/issues/609)
- Wrong link in the CSS [\#605](https://github.com/kevinpapst/kimai2/issues/605)
- Failed to import users: failed to validate user [\#600](https://github.com/kevinpapst/kimai2/issues/600)
- Edit timesheet , delete user edit own timesheet [\#498](https://github.com/kevinpapst/kimai2/issues/498)
- Add demo bundle [\#442](https://github.com/kevinpapst/kimai2/issues/442)
- Add audit logs [\#62](https://github.com/kevinpapst/kimai2/issues/62)

**Merged pull requests:**

- added svenska [\#732](https://github.com/kevinpapst/kimai2/pull/732) ([kevinpapst](https://github.com/kevinpapst))
- apply users timezone to toolbar queries [\#716](https://github.com/kevinpapst/kimai2/pull/716) ([kevinpapst](https://github.com/kevinpapst))
- remove unused role ROLE\_CUSTOMER [\#712](https://github.com/kevinpapst/kimai2/pull/712) ([kevinpapst](https://github.com/kevinpapst))
- Update to Symfony 4.2 [\#710](https://github.com/kevinpapst/kimai2/pull/710) ([kevinpapst](https://github.com/kevinpapst))
- fix validation for create user command [\#709](https://github.com/kevinpapst/kimai2/pull/709) ([kevinpapst](https://github.com/kevinpapst))
- remove the total counter from all admin pages [\#708](https://github.com/kevinpapst/kimai2/pull/708) ([kevinpapst](https://github.com/kevinpapst))
- removed active flag in user preferences form for non admin user. \(\#694\) [\#696](https://github.com/kevinpapst/kimai2/pull/696) ([simone-gasparini](https://github.com/simone-gasparini))
- added floor and ceil rounding with tests \(\#692\) [\#695](https://github.com/kevinpapst/kimai2/pull/695) ([simone-gasparini](https://github.com/simone-gasparini))
- fixed activity-project assignment for kimai v1 importer [\#679](https://github.com/kevinpapst/kimai2/pull/679) ([kevinpapst](https://github.com/kevinpapst))
- added content-type to allowed headers for api [\#672](https://github.com/kevinpapst/kimai2/pull/672) ([hmr-it-jr](https://github.com/hmr-it-jr))
- added plugin screen [\#671](https://github.com/kevinpapst/kimai2/pull/671) ([kevinpapst](https://github.com/kevinpapst))
- Updated hungarian translation [\#661](https://github.com/kevinpapst/kimai2/pull/661) ([infeeeee](https://github.com/infeeeee))
- remove mailer url from about debug info [\#657](https://github.com/kevinpapst/kimai2/pull/657) ([kevinpapst](https://github.com/kevinpapst))
- delete directory with invalid case [\#643](https://github.com/kevinpapst/kimai2/pull/643) ([kevinpapst](https://github.com/kevinpapst))
- added command to create release packages \(for FTP user\) [\#642](https://github.com/kevinpapst/kimai2/pull/642) ([kevinpapst](https://github.com/kevinpapst))
- removed dynamic database prefix [\#641](https://github.com/kevinpapst/kimai2/pull/641) ([kevinpapst](https://github.com/kevinpapst))
- set autofocus attribute on form fields for better keyboard support [\#640](https://github.com/kevinpapst/kimai2/pull/640) ([kevinpapst](https://github.com/kevinpapst))
- API - added begin end and export filter for timesheets [\#639](https://github.com/kevinpapst/kimai2/pull/639) ([kevinpapst](https://github.com/kevinpapst))
- replaced delete confirm dialog with modal [\#638](https://github.com/kevinpapst/kimai2/pull/638) ([kevinpapst](https://github.com/kevinpapst))
- convert-timezone: add a default value 'y' to the asked question [\#637](https://github.com/kevinpapst/kimai2/pull/637) ([blueowl04](https://github.com/blueowl04))
- support subdirectories and subdomains for assets [\#636](https://github.com/kevinpapst/kimai2/pull/636) ([kevinpapst](https://github.com/kevinpapst))
- improved plugin support [\#634](https://github.com/kevinpapst/kimai2/pull/634) ([kevinpapst](https://github.com/kevinpapst))
- fix random order in recent activities [\#631](https://github.com/kevinpapst/kimai2/pull/631) ([kevinpapst](https://github.com/kevinpapst))
- fix for firefox datepicker focus problem in modals [\#630](https://github.com/kevinpapst/kimai2/pull/630) ([kevinpapst](https://github.com/kevinpapst))
- remove invisible entities from toolbars [\#628](https://github.com/kevinpapst/kimai2/pull/628) ([kevinpapst](https://github.com/kevinpapst))
- removed inline documentation [\#624](https://github.com/kevinpapst/kimai2/pull/624) ([kevinpapst](https://github.com/kevinpapst))
- added support for Ante meridiem and Post meridiem format [\#615](https://github.com/kevinpapst/kimai2/pull/615) ([kevinpapst](https://github.com/kevinpapst))
- added filter for global activities [\#614](https://github.com/kevinpapst/kimai2/pull/614) ([kevinpapst](https://github.com/kevinpapst))
- Improve create and start permission handling [\#613](https://github.com/kevinpapst/kimai2/pull/613) ([kevinpapst](https://github.com/kevinpapst))
- Edit and create timesheet records in modal [\#603](https://github.com/kevinpapst/kimai2/pull/603) ([kevinpapst](https://github.com/kevinpapst))
- code cleanup [\#602](https://github.com/kevinpapst/kimai2/pull/602) ([kevinpapst](https://github.com/kevinpapst))
- simplify theme settings in user profile [\#586](https://github.com/kevinpapst/kimai2/pull/586) ([kevinpapst](https://github.com/kevinpapst))


