---
title: "Release 1.22 - Restrict global activities"
date: "2022-08-01 10:00:00 +0200"
author: kevinpapst
tags: [on-premise]
---

The release 1.22 was published in August 2022.

**You are lucky, despite announcing otherwise this release still supports PHP 7.3 and PHP 7.4. [But be warned: it is only tested with 7.4 and developed with 8.1]({% link _posts/en/2021-12-06-sunsetting-php-7.md %}).**

## Highlights

New feature highlights from the release [1.22.0]({{ site.kimai_v2_repo }}/releases/tag/1.22.0) and [1.22.1]({{ site.kimai_v2_repo }}/releases/tag/1.22.1) are:

- Allow to restrict usage of global activities for projects
- Show (calculated total) hourly rate in detail pages
- SAML: allow to keep existing roles on login

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

### Implemented enhancements

- Show total hourly rate in detail pages (#3441)
- SAML: allow to keep existing roles on login (#3440)
- Allow to restrict usage of global activities for projects (#3437)
- Link customer, project and activity in invoice listing (#3428)
- Total sums for duration and rate in invoice and export preview (#3431)
- Project date-range report: allow budget-type independent project-listing (#3430)
- Disable create-invoice links after click (#3452)
- Translations update from Hosted Weblate (#3436)
- Croatian translation (#3447)

### Internals

- code improvements (#3438)
- bump composer packages (#3455)

### Fixed bugs

- rebuild assets for croatian (#3451)
- fix invoice preview opening in current tab (#3454)
