---
title: "Release 0.9 - API, Plugins & DB Configs"
date: "2019-04-29 00:00:00 +0200"
author: kevinpapst
tags: [on-premise]
---

Two month are longer than expected for this release, but a lot changed in the background. 
These will be announced in a couple of weeks, and until then: update to 0.9, enjoy time-tracking and let me know [what you think]({{ site.kimai_v2_repo }}/issues) about this version.

[Full Changelog]({{ site.kimai_v2_repo }}/compare/0.8.1..0.9)

**Upgrade from 0.8.1:**

- Execute the database migrations: [How to upgrade Kimai]({{ site.kimai_v2_repo }}/blob/main/UPGRADING.md)
- Follow the other steps mentioned in [UPGRADING.md]({{ site.kimai_v2_repo }}/blob/main/UPGRADING.md)

**Implemented enhancements:**

- Translation to Swedish [\#731]({{ site.kimai_v2_repo }}/issues/731)
- Remove active flag in user preferences form for non admin user [\#694]({{ site.kimai_v2_repo }}/issues/694)
- Add floor and ceil rounding [\#692]({{ site.kimai_v2_repo }}/issues/692)
- POST/PUT API endpoints for projects and activities [\#683]({{ site.kimai_v2_repo }}/issues/683)
- API is not able to handle CORS [\#646]({{ site.kimai_v2_repo }}/issues/646)
- Recompile the frontend assets for usage in a sub-directory [\#635]({{ site.kimai_v2_repo }}/issues/635)
- Remove database table prefix [\#633]({{ site.kimai_v2_repo }}/issues/633)
- Autofocus on first entry of forms [\#620]({{ site.kimai_v2_repo }}/issues/620)
- Activity admin - filter for globals [\#598]({{ site.kimai_v2_repo }}/issues/598)
- Non visible customer/projects etc are shown in dropdowns [\#597]({{ site.kimai_v2_repo }}/issues/597)
- remove duplicate confirm dialog of deletion [\#591]({{ site.kimai_v2_repo }}/issues/591)
- remove mobile navbar header [\#588]({{ site.kimai_v2_repo }}/issues/588)
- Support 12h time format [\#578]({{ site.kimai_v2_repo }}/issues/578)
- add timerange filter to timesheet export api [\#577]({{ site.kimai_v2_repo }}/issues/577)
- Extend rounding options with "to closest" mode [\#576]({{ site.kimai_v2_repo }}/issues/576)
- Custom CSS [\#516]({{ site.kimai_v2_repo }}/issues/516)
- reduce config complexity by converting php format to js format [\#734]({{ site.kimai_v2_repo }}/pull/734) ([kevinpapst](https://github.com/kevinpapst))
- Updated authorization screens [\#727]({{ site.kimai_v2_repo }}/pull/727) ([kevinpapst](https://github.com/kevinpapst))
- added delete timesheet API endpoint [\#726]({{ site.kimai_v2_repo }}/pull/726) ([kevinpapst](https://github.com/kevinpapst))
- Design updates [\#723]({{ site.kimai_v2_repo }}/pull/723) ([kevinpapst](https://github.com/kevinpapst))
- API: changed date-format, camelCase instead of snake\_case, null values, update and create for customer and project [\#718]({{ site.kimai_v2_repo }}/pull/718) ([kevinpapst](https://github.com/kevinpapst))
- added api/activities POST and PATCH [\#717]({{ site.kimai_v2_repo }}/pull/717) ([horlabs](https://github.com/horlabs))
- allow to overwrite config via prepend [\#715]({{ site.kimai_v2_repo }}/pull/715) ([kevinpapst](https://github.com/kevinpapst))
- Load export type ids dynamically [\#703]({{ site.kimai_v2_repo }}/pull/703) ([simone-gasparini](https://github.com/simone-gasparini))
- fixing default env var for cors header [\#656]({{ site.kimai_v2_repo }}/pull/656) ([kevinpapst](https://github.com/kevinpapst))
- added cors bundle to allow external api access [\#655]({{ site.kimai_v2_repo }}/pull/655) ([kevinpapst](https://github.com/kevinpapst))
- added route to redirect locale to configured homepage [\#654]({{ site.kimai_v2_repo }}/pull/654) ([kevinpapst](https://github.com/kevinpapst))
-  added database driven system configurations with admin screen [\#647]({{ site.kimai_v2_repo }}/pull/647) ([kevinpapst](https://github.com/kevinpapst))
- added new rounding mode: closest [\#611]({{ site.kimai_v2_repo }}/pull/611) ([kevinpapst](https://github.com/kevinpapst))
- order datatable items by name [\#594]({{ site.kimai_v2_repo }}/pull/594) ([kevinpapst](https://github.com/kevinpapst))
- UI improvements for datatables [\#593]({{ site.kimai_v2_repo }}/pull/593) ([kevinpapst](https://github.com/kevinpapst))
- Plugins support [\#592]({{ site.kimai_v2_repo }}/pull/592) ([kevinpapst](https://github.com/kevinpapst))

**Fixed bugs:**

- 500 \(Internal Server Error\) create customer [\#711]({{ site.kimai_v2_repo }}/issues/711)
- Export date parsing does not care about timezone [\#707]({{ site.kimai_v2_repo }}/issues/707)
- API docs are wrong for GET entity \(ignores serialization group\) [\#701]({{ site.kimai_v2_repo }}/issues/701)
- API date and datetime format [\#700]({{ site.kimai_v2_repo }}/issues/700)
- totals do not match [\#691]({{ site.kimai_v2_repo }}/issues/691)
- Validate email when creating user via cmd-line [\#663]({{ site.kimai_v2_repo }}/issues/663)
- Datepicker "From" not working [\#651]({{ site.kimai_v2_repo }}/issues/651)
- Error export PDF [\#648]({{ site.kimai_v2_repo }}/issues/648)
- Error on importing v1 timeSheets [\#645]({{ site.kimai_v2_repo }}/issues/645)
- Time selection dropdown not working in Firefox [\#618]({{ site.kimai_v2_repo }}/issues/618)
- Revoke of start\_own\_timesheet permission doesn't prevent start active entry [\#606]({{ site.kimai_v2_repo }}/issues/606)
- remove invalid cache header [\#722]({{ site.kimai_v2_repo }}/pull/722) ([kevinpapst](https://github.com/kevinpapst))
- fix modal - autofocus problem, datepicker not shown on begin date [\#653]({{ site.kimai_v2_repo }}/pull/653) ([kevinpapst](https://github.com/kevinpapst))
- fix pdf export cache directory [\#650]({{ site.kimai_v2_repo }}/pull/650) ([kevinpapst](https://github.com/kevinpapst))

**Closed issues:**

- 403 error after installation [\#725]({{ site.kimai_v2_repo }}/issues/725)
- AppExtension Error after bin/console cache:clear --env=prod on Line 43 [\#721]({{ site.kimai_v2_repo }}/issues/721)
- Kimai-v1 Import Failure [\#719]({{ site.kimai_v2_repo }}/issues/719)
- Review export lifecycle for plugin injection [\#702]({{ site.kimai_v2_repo }}/issues/702)
- Missing database-table kimai2\_configuration while trying to run import/migration script [\#698]({{ site.kimai_v2_repo }}/issues/698)
- Import from v1 fails if two users have the same email or blank email [\#688]({{ site.kimai_v2_repo }}/issues/688)
- mysql limit of max amount of activities ? [\#681]({{ site.kimai_v2_repo }}/issues/681)
- Filter by project broken [\#670]({{ site.kimai_v2_repo }}/issues/670)
- Group of user [\#669]({{ site.kimai_v2_repo }}/issues/669)
- Demo not loading [\#665]({{ site.kimai_v2_repo }}/issues/665)
- Admin Panel [\#662]({{ site.kimai_v2_repo }}/issues/662)
- mixed date formats in the api for the timesheet [\#658]({{ site.kimai_v2_repo }}/issues/658)
- Some activites don't show up in last activities [\#609]({{ site.kimai_v2_repo }}/issues/609)
- Wrong link in the CSS [\#605]({{ site.kimai_v2_repo }}/issues/605)
- Failed to import users: failed to validate user [\#600]({{ site.kimai_v2_repo }}/issues/600)
- Edit timesheet , delete user edit own timesheet [\#498]({{ site.kimai_v2_repo }}/issues/498)
- Add demo bundle [\#442]({{ site.kimai_v2_repo }}/issues/442)
- Add audit logs [\#62]({{ site.kimai_v2_repo }}/issues/62)

**Merged pull requests:**

- added svenska [\#732]({{ site.kimai_v2_repo }}/pull/732) ([kevinpapst](https://github.com/kevinpapst))
- apply users timezone to toolbar queries [\#716]({{ site.kimai_v2_repo }}/pull/716) ([kevinpapst](https://github.com/kevinpapst))
- remove unused role ROLE\_CUSTOMER [\#712]({{ site.kimai_v2_repo }}/pull/712) ([kevinpapst](https://github.com/kevinpapst))
- Update to Symfony 4.2 [\#710]({{ site.kimai_v2_repo }}/pull/710) ([kevinpapst](https://github.com/kevinpapst))
- fix validation for create user command [\#709]({{ site.kimai_v2_repo }}/pull/709) ([kevinpapst](https://github.com/kevinpapst))
- remove the total counter from all admin pages [\#708]({{ site.kimai_v2_repo }}/pull/708) ([kevinpapst](https://github.com/kevinpapst))
- removed active flag in user preferences form for non admin user. \(\#694\) [\#696]({{ site.kimai_v2_repo }}/pull/696) ([simone-gasparini](https://github.com/simone-gasparini))
- added floor and ceil rounding with tests \(\#692\) [\#695]({{ site.kimai_v2_repo }}/pull/695) ([simone-gasparini](https://github.com/simone-gasparini))
- fixed activity-project assignment for kimai v1 importer [\#679]({{ site.kimai_v2_repo }}/pull/679) ([kevinpapst](https://github.com/kevinpapst))
- added content-type to allowed headers for api [\#672]({{ site.kimai_v2_repo }}/pull/672) ([hmr-it-jr](https://github.com/hmr-it-jr))
- added plugin screen [\#671]({{ site.kimai_v2_repo }}/pull/671) ([kevinpapst](https://github.com/kevinpapst))
- Updated hungarian translation [\#661]({{ site.kimai_v2_repo }}/pull/661) ([infeeeee](https://github.com/infeeeee))
- remove mailer url from about debug info [\#657]({{ site.kimai_v2_repo }}/pull/657) ([kevinpapst](https://github.com/kevinpapst))
- delete directory with invalid case [\#643]({{ site.kimai_v2_repo }}/pull/643) ([kevinpapst](https://github.com/kevinpapst))
- added command to create release packages \(for FTP user\) [\#642]({{ site.kimai_v2_repo }}/pull/642) ([kevinpapst](https://github.com/kevinpapst))
- removed dynamic database prefix [\#641]({{ site.kimai_v2_repo }}/pull/641) ([kevinpapst](https://github.com/kevinpapst))
- set autofocus attribute on form fields for better keyboard support [\#640]({{ site.kimai_v2_repo }}/pull/640) ([kevinpapst](https://github.com/kevinpapst))
- API - added begin end and export filter for timesheets [\#639]({{ site.kimai_v2_repo }}/pull/639) ([kevinpapst](https://github.com/kevinpapst))
- replaced delete confirm dialog with modal [\#638]({{ site.kimai_v2_repo }}/pull/638) ([kevinpapst](https://github.com/kevinpapst))
- convert-timezone: add a default value 'y' to the asked question [\#637]({{ site.kimai_v2_repo }}/pull/637) ([blueowl04](https://github.com/blueowl04))
- support subdirectories and subdomains for assets [\#636]({{ site.kimai_v2_repo }}/pull/636) ([kevinpapst](https://github.com/kevinpapst))
- improved plugin support [\#634]({{ site.kimai_v2_repo }}/pull/634) ([kevinpapst](https://github.com/kevinpapst))
- fix random order in recent activities [\#631]({{ site.kimai_v2_repo }}/pull/631) ([kevinpapst](https://github.com/kevinpapst))
- fix for firefox datepicker focus problem in modals [\#630]({{ site.kimai_v2_repo }}/pull/630) ([kevinpapst](https://github.com/kevinpapst))
- remove invisible entities from toolbars [\#628]({{ site.kimai_v2_repo }}/pull/628) ([kevinpapst](https://github.com/kevinpapst))
- removed inline documentation [\#624]({{ site.kimai_v2_repo }}/pull/624) ([kevinpapst](https://github.com/kevinpapst))
- added support for Ante meridiem and Post meridiem format [\#615]({{ site.kimai_v2_repo }}/pull/615) ([kevinpapst](https://github.com/kevinpapst))
- added filter for global activities [\#614]({{ site.kimai_v2_repo }}/pull/614) ([kevinpapst](https://github.com/kevinpapst))
- Improve create and start permission handling [\#613]({{ site.kimai_v2_repo }}/pull/613) ([kevinpapst](https://github.com/kevinpapst))
- Edit and create timesheet records in modal [\#603]({{ site.kimai_v2_repo }}/pull/603) ([kevinpapst](https://github.com/kevinpapst))
- code cleanup [\#602]({{ site.kimai_v2_repo }}/pull/602) ([kevinpapst](https://github.com/kevinpapst))
- simplify theme settings in user profile [\#586]({{ site.kimai_v2_repo }}/pull/586) ([kevinpapst](https://github.com/kevinpapst))


