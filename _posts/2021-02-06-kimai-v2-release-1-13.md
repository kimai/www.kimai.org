---
layout: post
title: "Release 1.13 - Duration input and dropdown"
date: "2021-02-06 08:00:00 +0200"
author: kevinpapst
tags: [Release]
---

The release 1.13 was published, containing a lot of bugfixes and some new features. 

### Timesheet tracking form

New configurations available for the "duration selector" and "start and end date minute dropdown":

![Configuration](/images/documentation/timesheet/minute_configuration.png "Configuration values to influence timesheet dropdowns"){:height="150px"}

Default setting is to match your rounding rules. So when you have a rounding rule, that rounds the "duration" to 15 minutes you will see the new duration dropdown:

![Configuration](/images/documentation/timesheet/duration_selector.png "The new duration select dropdown"){:height="300px"}

If your rounding rule keep "From" and "To" as they are, you can still configure the minute selector to show ten minute 
steps for "From" and "To" (see first screenshot) and you will get a shorter dropdown::
 
![Configuration](/images/documentation/timesheet/minute_selector.png "Minute selects support steps as well"){:height="300px"}

As additional improvement, the duration field now accepts more formats and can interpret decimal as well.

For entering 90 minutes you can now type `1:30`,  `01:30`,  `1,5`, `1.5`, `1h30m` or `90m` ... or you simply select it from the dropdown!

### Prevent modals from closing accidentally

Previously clicking outside a modal always closed it and you could easily loose all your changes. 
Now all forms that are changed, cause the modal to display a warning message when you clicked outside of it, and the modal can only be 
closed by using the "Save" or "Close" button.

The message appears at the top of form, below the modals title:
![Warning message](/images/documentation/modal_close.png "Warning message prevents that changed forms will be accidentally closed"){:height="150px"}

### List actions for last items

The action dropdown in long lists were partially hidden for the last iotems in the list, if the action menu was rather long.
Thanks to Philipp these menus now appear as "drop-ups" and all entries can be selected: 

![Configuration](/images/news/1-13-dropup.png "List actions appear as drop-up"){:height="400px"}

### Lockdown configuration

The timesheet lockdown period is somewhat complicated to configure, if you are unfamiliar with the syntax of PHP datetime.
To help with the process, the configuration screen now shows the calculated results of your configuration below the config boxes:
    
![Warning message](/images/documentation/lockdown_configuration.png "Rendered lockdown configuration values"){:height="250px"}

### Invoices

The invoice template "Single service date" (formerly called "Freelancer") was converted to produce a PDF version (was HTML before).
PDF invoices have many benefits over HTML, like proper header and footer placement, immutability for legal reasons, 
they can be shared easily with your clients and more.

### Translations

New languages "German (Austrian)" and "Portuguese" were added. 
Austrian matches german by now in most cases, but has some translations for the calendar.

Updated translations for Spanish, Polish, Hungarian, Chinese, Hebrew, French, Turkish, Slovak, Portuguese & Portuguese Brazil, Czech, Esperanto.

### Security issues

This version includes a fix for a security vulnerability for XLSX (Excel) exports, which was found and reported by David Woodhouse from [Aegis9](https://www.aegis9.com.au). Thank you! 

### Thank you!

Thanks to all of you for using and supporting Kimai, especially:
- all clients and donors who help me to keep up the work for Kimai
- the developers who contributed their time
- the translators at Weblate
- everyone else contributing at GitHub, too many to name you all 

All of you guys rock ❤️ thanks for being part of the Kimai community!

> Want to upgrade? [Click here to find out how]({%link _documentation/updates.md %}).

## Full changelog

You can find [all commits here](https://github.com/kevinpapst/kimai2/compare/1.12...1.13).

**Implemented enhancements:**

- Add in Dashboard links to My Team Projects & Budget [\#2196](https://github.com/kevinpapst/kimai2/issues/2196)
- More mobile friendly hour/minute set value. [\#2044](https://github.com/kevinpapst/kimai2/issues/2044)
- Give modals static backdrop [\#1794](https://github.com/kevinpapst/kimai2/issues/1794)
- duration input should be more flexible about values entered [\#1702](https://github.com/kevinpapst/kimai2/issues/1702)
- Time selector should match time rounding [\#1701](https://github.com/kevinpapst/kimai2/issues/1701)
- When entering time record, the "duration" field it pre-filled with 00:00 and has to be deleted before being filled [\#1667](https://github.com/kevinpapst/kimai2/issues/1667)
- added de\_AT and pt as languages [\#2292](https://github.com/kevinpapst/kimai2/pull/2292) ([kevinpapst](https://github.com/kevinpapst))
- improve API validation error messages [\#2278](https://github.com/kevinpapst/kimai2/pull/2278) ([kevinpapst](https://github.com/kevinpapst))
- show calculated lockdown date in config screen [\#2274](https://github.com/kevinpapst/kimai2/pull/2274) ([kevinpapst](https://github.com/kevinpapst))
- Improved duration selector [\#2264](https://github.com/kevinpapst/kimai2/pull/2264) ([kevinpapst](https://github.com/kevinpapst))
- Added event for recent activities [\#2254](https://github.com/kevinpapst/kimai2/pull/2254) ([kevinpapst](https://github.com/kevinpapst))
- Translations update from Weblate [\#2253](https://github.com/kevinpapst/kimai2/pull/2253), [\#2226](https://github.com/kevinpapst/kimai2/pull/2226), [\#2195](https://github.com/kevinpapst/kimai2/pull/2195)
- fix deprecations [\#2225](https://github.com/kevinpapst/kimai2/pull/2225) ([kevinpapst](https://github.com/kevinpapst))
- simplify html timesheet exporter [\#2224](https://github.com/kevinpapst/kimai2/pull/2224) ([kevinpapst](https://github.com/kevinpapst))
- Export context [\#2216](https://github.com/kevinpapst/kimai2/pull/2216) ([kevinpapst](https://github.com/kevinpapst))
- Fix dropdowns on the bottom of a page [\#2212](https://github.com/kevinpapst/kimai2/pull/2212) ([strouble](https://github.com/strouble))
- replace "freelancer" invoice template with pdf version [\#2289](https://github.com/kevinpapst/kimai2/pull/2289) ([kevinpapst](https://github.com/kevinpapst))
- Term "Umsatzsteuer" change to "Mehrwertsteuer" for Swiss customers [\#2230](https://github.com/kevinpapst/kimai2/issues/2230)

**Fixed bugs:**

- Calendar Drag and Drop-Box ist visible on printer-view [\#2258](https://github.com/kevinpapst/kimai2/issues/2258)
- Dashboard timechart starts at 2022 [\#2235](https://github.com/kevinpapst/kimai2/issues/2235)
- Dashboard My working hours chart shows incorrect date on 01/01/2021 [\#2232](https://github.com/kevinpapst/kimai2/issues/2232)
- Template disappeared all of a sudden [\#2213](https://github.com/kevinpapst/kimai2/issues/2213)
- Week 53 not showing [\#2204](https://github.com/kevinpapst/kimai2/issues/2204)
- Timezone UTC and calendar [\#2155](https://github.com/kevinpapst/kimai2/issues/2155)
- I can still delete a time entry from a locked period [\#2121](https://github.com/kevinpapst/kimai2/issues/2121)
- Rounding problem \(forcing error\) when prohibiting time overlaps [\#1963](https://github.com/kevinpapst/kimai2/issues/1963)
- Rounding changes end time on timesheet entry edit [\#1959](https://github.com/kevinpapst/kimai2/issues/1959)
- When exporting with decimals, sums that are in the thousands don't show correctly. [\#1659](https://github.com/kevinpapst/kimai2/issues/1659)
- prevent duplicate if overlapping records are disabled [\#2311](https://github.com/kevinpapst/kimai2/pull/2311) ([kevinpapst](https://github.com/kevinpapst))
- do not break excel invoice templates with replacer inside formulas [\#2272](https://github.com/kevinpapst/kimai2/pull/2272) ([kevinpapst](https://github.com/kevinpapst))
- improve permission checks for timesheets with activated lockdown [\#2271](https://github.com/kevinpapst/kimai2/pull/2271) ([kevinpapst](https://github.com/kevinpapst))
- fix calendar UTC problem [\#2268](https://github.com/kevinpapst/kimai2/pull/2268) ([kevinpapst](https://github.com/kevinpapst))
- remove drag&drop on calendar for print views [\#2261](https://github.com/kevinpapst/kimai2/pull/2261) ([kevinpapst](https://github.com/kevinpapst))
- fix pagination on invoice templates page [\#2260](https://github.com/kevinpapst/kimai2/pull/2260) ([kevinpapst](https://github.com/kevinpapst))
- hide multi-update-form for tags if delete\_tag permission is missing [\#2259](https://github.com/kevinpapst/kimai2/pull/2259) ([kevinpapst](https://github.com/kevinpapst))
- ISO week numbers in calendar [\#2248](https://github.com/kevinpapst/kimai2/pull/2248) ([kevinpapst](https://github.com/kevinpapst))
- fix first week in year shows wrong year [\#2239](https://github.com/kevinpapst/kimai2/pull/2239) ([kevinpapst](https://github.com/kevinpapst))
- make sure to generate a valid filename [\#2238](https://github.com/kevinpapst/kimai2/pull/2238) ([kevinpapst](https://github.com/kevinpapst))
- wrong decimal duration for more than 1000 hours [\#2214](https://github.com/kevinpapst/kimai2/pull/2214) ([kevinpapst](https://github.com/kevinpapst))
- Tiny fix: use the correct name for the CustomEvent [\#2210](https://github.com/kevinpapst/kimai2/pull/2210) ([strouble](https://github.com/strouble))
- fix years with 53 weeks [\#2206](https://github.com/kevinpapst/kimai2/pull/2206) ([kevinpapst](https://github.com/kevinpapst))
