---
layout: post
title: "Release 1.19 - Billable default option"
date: "2022-04-19 10:00:00 +0200"
author: kevinpapst
tags: [Release]
---

The releases 1.19.x were published in April 2022.

**You are lucky, despite announcing otherwise is release still supports PHP 7.3 and PHP 7.4. [But be warned: it's only tested with 7.4 and developed with 8.1](https://www.kimai.org/blog/2021/sunsetting-php-7/).**

## Highlights

New feature highlights from the releases [1.19](https://github.com/kevinpapst/kimai2/releases/tag/1.19), [1.19.1](https://github.com/kevinpapst/kimai2/releases/tag/1.19.1), 
[1.19.2](https://github.com/kevinpapst/kimai2/releases/tag/1.19.2), [1.19.3](https://github.com/kevinpapst/kimai2/releases/tag/1.19.3) and [1.19.4](https://github.com/kevinpapst/kimai2/releases/tag/1.19.4) are:

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

You can find [all commits here](https://github.com/kevinpapst/kimai2/compare/1.16...1.17).

### Implemented enhancements

- Default option of the "Billable" attribute for each defined activity [\#3200](https://github.com/kevinpapst/kimai2/pull/3200), [\#2594](https://github.com/kevinpapst/kimai2/issues/2594)
- Added new report: month grouped by project, activity and user [\#3255](https://github.com/kevinpapst/kimai2/pull/3255)
- Show user account number in report export [\#3224](https://github.com/kevinpapst/kimai2/pull/3224)
- Support more complex metafield queries [\#3228](https://github.com/kevinpapst/kimai2/pull/3228)
- Login redirects to homepage if already being logged-in [\#3255](https://github.com/kevinpapst/kimai2/pull/3255)
- Translations update from Hosted Weblate [\#3208](https://github.com/kevinpapst/kimai2/pull/3208), [\#3194](https://github.com/kevinpapst/kimai2/pull/3194), [\#3235](https://github.com/kevinpapst/kimai2/pull/3235), [\#3221](https://github.com/kevinpapst/kimai2/pull/3221), [\#3263](https://github.com/kevinpapst/kimai2/pull/3263)

### Internals

- Kimai API billable switch missing [\#2705](https://github.com/kevinpapst/kimai2/issues/2705)
- Better default button label for non-translated renderer [\#3204](https://github.com/kevinpapst/kimai2/pull/3204)
- Improved logic to extract configuration from string [\#3244](https://github.com/kevinpapst/kimai2/pull/3244)
- Allow arbitrary string length for system configurations [\#3243](https://github.com/kevinpapst/kimai2/pull/3243)
- Added interface for saml config [\#3249](https://github.com/kevinpapst/kimai2/pull/3249)
- Added event to extend the detail pages from plugins [\#3209](https://github.com/kevinpapst/kimai2/pull/3209)

### Fixed bugs

- Avatar size differences for image URL / no image URL set [\#3180](https://github.com/kevinpapst/kimai2/issues/3180)
- SVG avatars not shown in top bar [\#3163](https://github.com/kevinpapst/kimai2/issues/3163)
- Fixed truncated comments: customer, project, activity, task [\#3204](https://github.com/kevinpapst/kimai2/pull/3204)
- Fixed avatar image size when using images [\#3204](https://github.com/kevinpapst/kimai2/pull/3204)
- Billable of time-records created from recent acitivities in calendar view [\#3218](https://github.com/kevinpapst/kimai2/issues/3218)
- Fix billable calculation on timesheet restart [\#3225](https://github.com/kevinpapst/kimai2/pull/3225)
- Fix relative times in budget calculation in export [\#3216](https://github.com/kevinpapst/kimai2/pull/3216)
- Fixed null issue in project dropdown with activated order number [\#3244](https://github.com/kevinpapst/kimai2/pull/3244)
- Fix budget validation for entries that are moved to another moth [\#3255](https://github.com/kevinpapst/kimai2/pull/3255)
- Invoice: fix amount should be decimal if decimal template is used [\#3255](https://github.com/kevinpapst/kimai2/pull/3255)
