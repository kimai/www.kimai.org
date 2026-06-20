---
title: "Release 1.21 - Budget graph"
date: "2022-07-14 10:00:00 +0200"
author: kevinpapst
tags: [on-premise]
---

The release 1.21 was published in July 2022.

**You are lucky, despite announcing otherwise this release still supports PHP 7.3 and PHP 7.4. [But be warned: it is only tested with 7.4 and developed with 8.1]({% link _posts/en/2021-12-06-sunsetting-php-7.md %}).**

## Highlights

New feature highlights from the release [1.21.0]({{ site.kimai_v2_repo }}/releases/tag/1.21.0) are:

- Budget graph in project details
- Re-style overlapping border

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

This changelist contains all changes between 1.20.4 and 1.21.

You can find [all commits here]({{ site.kimai_v2_repo }}/compare/1.20.4...1.21).


## Enhancements

- Budget graph in project details (#3406)
- Allow to filter for canceled invoices (#3415)
- Re-style overlapping border (#3400)
- Suppress deprecation notice, convert route param (#3391)
- Allow to set API token when creating user via API (#3380)
- Export invoice metafields (#3366)
- Require a language for invoice templates (#3387)
- Translations update from Hosted Weblate (#3399) (#3356)

## Fixed bugs

- fix en\_GB format definition (#3383)
- remove currency symbol if unknown (#3381)
- reload permissions page after role was created (#3377)
- removed invalid destroy calls to daterangepicker (#3371)
- do not copy description if restarting via calendar via drag&drop (#3406)

## Internals

- New command to delete empty translations (#3392)
- Added release drafter workflow (#3362)

