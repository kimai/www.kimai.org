---
title: "Release 1.23 - Budget validation"
date: "2022-08-30 10:00:00 +0200"
author: kevinpapst
tags: [on-premise]
---

The release 1.23 was published in August 2022.

**You are lucky, despite announcing otherwise this release still supports PHP 7.3 and PHP 7.4. [But be warned: it is only tested with 7.4 and developed with 8.1]({% link _posts/en/2021-12-06-sunsetting-php-7.md %}).**

## Highlights

New feature highlights from the release [1.23.0]({{ site.kimai_v2_repo }}/releases/tag/1.23.0) and [1.23.1]({{ site.kimai_v2_repo }}/releases/tag/1.23.1) are:

- Order "weekly hours" by project name
- Fixed multiple budget validation checks

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

- Order quick entries by project name (#3488)
- Translations update from Hosted Weblate (#3482) (#3462)

### Fixed bugs

- Fix unit test failing on month borders (#3494)
- Prevent invoice template update (#3493)
- Fixed multiple budget validation checks (#3489)
- Do not require user_preference permission when creating new user (#3474)
- Bump version 1.23.1 (#3499)
