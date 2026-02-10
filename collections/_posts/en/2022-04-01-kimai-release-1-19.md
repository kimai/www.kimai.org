---
title: "Release 1.19 - Billable default option"
date: "2022-04-19 10:00:00 +0200"
author: kevinpapst
tags: [on-premise]
---

The releases 1.19.x were published in April 2022.

**You are lucky, despite announcing otherwise is release still supports PHP 7.3 and PHP 7.4. [But be warned: it's only tested with 7.4 and developed with 8.1]({% link _posts/en/2021-12-06-sunsetting-php-7.md %}).**

## Highlights

New feature highlights from the releases [1.19]({{ site.kimai_v2_repo }}/releases/tag/1.19), [1.19.1]({{ site.kimai_v2_repo }}/releases/tag/1.19.1), 
[1.19.2]({{ site.kimai_v2_repo }}/releases/tag/1.19.2), [1.19.3]({{ site.kimai_v2_repo }}/releases/tag/1.19.3) and [1.19.4]({{ site.kimai_v2_repo }}/releases/tag/1.19.4) are:

- Configure default option of the "Billable" attribute by customer, project and activity
- Added new "customer" report: month grouped by project, activity and user

### Thank you!

Thanks to all of you for using and supporting Kimai, especially:
- everyone who contributes financially, allowing me to spend so much time with Kimai
- the community for all their input, discussions, feature requests and bug notices
- the developers contributing their knowledge and time
- the translators at Weblate
- the security researcher who privately disclose any issue   

Thanks for being part of the Kimai community ❤️

> Want to upgrade? [Click here to find out how]({%link _documentation/updates.md %}).

## Full changelog

This changelist contains all changes between 1.16 and 1.17.

You can find [all commits here]({{ site.kimai_v2_repo }}/compare/1.16...1.17).

### Implemented enhancements

- Default option of the "Billable" attribute for each defined activity [\#3200]({{ site.kimai_v2_repo }}/pull/3200), [\#2594]({{ site.kimai_v2_repo }}/issues/2594)
- Added new report: month grouped by project, activity and user [\#3255]({{ site.kimai_v2_repo }}/pull/3255)
- Show user account number in report export [\#3224]({{ site.kimai_v2_repo }}/pull/3224)
- Support more complex metafield queries [\#3228]({{ site.kimai_v2_repo }}/pull/3228)
- Login redirects to homepage if already being logged-in [\#3255]({{ site.kimai_v2_repo }}/pull/3255)
- Translations update from Hosted Weblate [\#3208]({{ site.kimai_v2_repo }}/pull/3208), [\#3194]({{ site.kimai_v2_repo }}/pull/3194), [\#3235]({{ site.kimai_v2_repo }}/pull/3235), [\#3221]({{ site.kimai_v2_repo }}/pull/3221), [\#3263]({{ site.kimai_v2_repo }}/pull/3263)

### Internals

- Kimai API billable switch missing [\#2705]({{ site.kimai_v2_repo }}/issues/2705)
- Better default button label for non-translated renderer [\#3204]({{ site.kimai_v2_repo }}/pull/3204)
- Improved logic to extract configuration from string [\#3244]({{ site.kimai_v2_repo }}/pull/3244)
- Allow arbitrary string length for system configurations [\#3243]({{ site.kimai_v2_repo }}/pull/3243)
- Added interface for saml config [\#3249]({{ site.kimai_v2_repo }}/pull/3249)
- Added event to extend the detail pages from plugins [\#3209]({{ site.kimai_v2_repo }}/pull/3209)

### Fixed bugs

- Avatar size differences for image URL / no image URL set [\#3180]({{ site.kimai_v2_repo }}/issues/3180)
- SVG avatars not shown in top bar [\#3163]({{ site.kimai_v2_repo }}/issues/3163)
- Fixed truncated comments: customer, project, activity, task [\#3204]({{ site.kimai_v2_repo }}/pull/3204)
- Fixed avatar image size when using images [\#3204]({{ site.kimai_v2_repo }}/pull/3204)
- Billable of time-records created from recent acitivities in calendar view [\#3218]({{ site.kimai_v2_repo }}/issues/3218)
- Fix billable calculation on timesheet restart [\#3225]({{ site.kimai_v2_repo }}/pull/3225)
- Fix relative times in budget calculation in export [\#3216]({{ site.kimai_v2_repo }}/pull/3216)
- Fixed null issue in project dropdown with activated order number [\#3244]({{ site.kimai_v2_repo }}/pull/3244)
- Fix budget validation for entries that are moved to another moth [\#3255]({{ site.kimai_v2_repo }}/pull/3255)
- Invoice: fix amount should be decimal if decimal template is used [\#3255]({{ site.kimai_v2_repo }}/pull/3255)
