---
layout: post
title: "Release 0.8 - Export, Timezones & UI"
date: "2019-02-19 12:00:00 +0200"
author: kevinpapst
tags: [Release]
---

This release includes database changes and one major change, which makes the upgrade process slightly more complicated, 
as you have to execute one more step after the normal [update procedure]({% link _documentation/updates.md %}).

[Full Changelog]({{ site.kimai_v2_repo }}/compare/0.7...0.8)

**Upgrade from 0.7:**

- Execute the database migrations: [How to upgrade Kimai](https://github.com/kevinpapst/kimai2/blob/master/UPGRADING.md)
- One more step is required: [Convert your timesheet data for timezone support](https://github.com/kevinpapst/kimai2/pull/372)

**The release main topic was "Export, Timezones & UI". Most notable changes:**

- Added export module
- Full timezone support for shared teams
- Daily stats in timesheet

**Implemented enhancements:**

- Export other users' timesheets using the API [\#562]({{ site.kimai_v2_repo }}/issues/562)
- Some importer bugs/improvements [\#553]({{ site.kimai_v2_repo }}/issues/553)
- Export timesheet only exports entries on the current page [\#534]({{ site.kimai_v2_repo }}/issues/534)
- On the last activities dropdown show tha last ten DIFFERENT activities [\#533]({{ site.kimai_v2_repo }}/issues/533)
- Better user expierence on "My Times" [\#526]({{ site.kimai_v2_repo }}/issues/526)
- Highlight current day in datepickers and not only the selected day [\#522]({{ site.kimai_v2_repo }}/issues/522)
- Configuration of first page after login [\#501]({{ site.kimai_v2_repo }}/issues/501)
- Visual Grouping of entry from same day or same week with some stats of that group [\#495]({{ site.kimai_v2_repo }}/issues/495)

**Fixed bugs:**

- Error 404 on 'My times' page 2+ if the time range is changed to something smaller [\#558]({{ site.kimai_v2_repo }}/issues/558)
- Timezone is not working correctly [\#554]({{ site.kimai_v2_repo }}/issues/554)
- New time picker not working on languages without updated translation [\#546]({{ site.kimai_v2_repo }}/issues/546)
- Export timesheet only exports entries on the current page [\#534]({{ site.kimai_v2_repo }}/issues/534)
- Kimai2 will not allow me to enter times in the future [\#531]({{ site.kimai_v2_repo }}/issues/531)
- No projects in filter section [\#525]({{ site.kimai_v2_repo }}/issues/525)
- This value should be greater than or equal to zero [\#511]({{ site.kimai_v2_repo }}/issues/511)
- Wrong time after migration kimai v1 data [\#507]({{ site.kimai_v2_repo }}/issues/507)

**Closed issues:**

- Feedback for improving installation setup [\#541]({{ site.kimai_v2_repo }}/issues/541)
- template entry.end\_time shows empty field [\#535]({{ site.kimai_v2_repo }}/issues/535)
- Global Projects [\#413]({{ site.kimai_v2_repo }}/issues/413)

**Merged pull requests:**

- handle deleted user during import from v1 [\#569]({{ site.kimai_v2_repo }}/pull/569) ([kevinpapst](https://github.com/kevinpapst))
- fix pagination in combination with daterange picker [\#568]({{ site.kimai_v2_repo }}/pull/568) ([kevinpapst](https://github.com/kevinpapst))
- allow to query other users timesheets via api [\#563]({{ site.kimai_v2_repo }}/pull/563) ([kevinpapst](https://github.com/kevinpapst))
- Updated HTML invoice templates [\#560]({{ site.kimai_v2_repo }}/pull/560) ([kevinpapst](https://github.com/kevinpapst))
- updated composer packages [\#559]({{ site.kimai_v2_repo }}/pull/559) ([kevinpapst](https://github.com/kevinpapst))
- fix timezone problems in timesheet forms [\#555]({{ site.kimai_v2_repo }}/pull/555) ([kevinpapst](https://github.com/kevinpapst))
- Daily stats in timesheet [\#552]({{ site.kimai_v2_repo }}/pull/552) ([kevinpapst](https://github.com/kevinpapst))
- Added more php requirements to documentation [\#551]({{ site.kimai_v2_repo }}/pull/551) ([infeeeee](https://github.com/infeeeee))
- improve recent activities [\#550]({{ site.kimai_v2_repo }}/pull/550) ([kevinpapst](https://github.com/kevinpapst))
- scss fixes: year selector width, dropdown menu width, navbar refactoring [\#549]({{ site.kimai_v2_repo }}/pull/549) ([infeeeee](https://github.com/infeeeee))
- improved installation docs [\#548]({{ site.kimai_v2_repo }}/pull/548) ([kevinpapst](https://github.com/kevinpapst))
- fix daterange-picker for fr, hu and ar [\#547]({{ site.kimai_v2_repo }}/pull/547) ([kevinpapst](https://github.com/kevinpapst))
- do not limit users timesheet export page size [\#545]({{ site.kimai_v2_repo }}/pull/545) ([kevinpapst](https://github.com/kevinpapst))
- Use Symfony formatter for currency symbol placement [\#542]({{ site.kimai_v2_repo }}/pull/542) ([sanjitlpatel](https://github.com/sanjitlpatel))
- Localized date-inputs and daterange-picker [\#540]({{ site.kimai_v2_repo }}/pull/540) ([kevinpapst](https://github.com/kevinpapst))
- added export module [\#538]({{ site.kimai_v2_repo }}/pull/538) ([kevinpapst](https://github.com/kevinpapst))
- updated documentation [\#536]({{ site.kimai_v2_repo }}/pull/536) ([kevinpapst](https://github.com/kevinpapst))
- support remote data in beta-test selectpicker [\#529]({{ site.kimai_v2_repo }}/pull/529) ([kevinpapst](https://github.com/kevinpapst))
- Improve allowed running records [\#528]({{ site.kimai_v2_repo }}/pull/528) ([kevinpapst](https://github.com/kevinpapst))
- Improve daterangepicker [\#527]({{ site.kimai_v2_repo }}/pull/527) ([kevinpapst](https://github.com/kevinpapst))
- added configurable view after login [\#523]({{ site.kimai_v2_repo }}/pull/523) ([kevinpapst](https://github.com/kevinpapst))
- convert timesheets to UTC with support for user timezone [\#372]({{ site.kimai_v2_repo }}/pull/372) ([kevinpapst](https://github.com/kevinpapst))
