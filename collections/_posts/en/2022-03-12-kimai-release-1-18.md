---
title: "Release 1.18 - Export report data"
date: "2022-03-12 14:00:00 +0200"
author: kevinpapst
tags: [on-premise]
---

The releases 1.18.x were published between February and March 2022.

**You are lucky, despite announcing otherwise is release still supports PHP 7.3 and PHP 7.4. [But be warned: it's only tested with 7.4 and developed with 8.1]({% link _posts/en/2021-12-06-sunsetting-php-7.md %}).**

## Highlights 

New feature highlights from the releases [1.18]({{ site.kimai_v2_repo }}/releases/tag/1.18), [1.18.1]({{ site.kimai_v2_repo }}/releases/tag/1.18.1) and [1.18.2]({{ site.kimai_v2_repo }}/releases/tag/1.18.2) are:
 
- Reporting: choose data-types (duration, rate, internal rate)
- Reporting: new report "user per year"
- Reporting: export user-list reports in excel
- Configure display of customer, project and activity in dropdown lists
- Added and activated language `Norwegian Bokmål` - thanks @comradekingu

### Thank you!

Thanks to all of you for using and supporting Kimai, especially:
- everyone who contributes financially, allowing me to spend so much time with Kimai
- the community for all their input, discussions, feature requests and bug notices
- the developers contributing their knowledge and time
- the translators at Weblate

Thanks for being part of the Kimai community ❤️

> Want to upgrade? [Click here to find out how]({%link _documentation/updates.md %}).

## Full changelog

This changelist contains all changes between 1.17 and 1.18.2.

You can find [all commits here]({{ site.kimai_v2_repo }}/compare/1.17...1.18.2).

### Implemented enhancements

- Reporting: choose data-types (duration, rate, internal rate)
- Reporting: new report "user per year"
- Reporting: export user-list reports in excel
- Configure display of customer, project and activity in dropdown lists
- Added and activated language `Norwegian Bokmål` - thanks @comradekingu
- Activated language `Persian`
- Updated translations
- PDF invoice templates
    - Moved customer number and order number in default template to different location
    - Improved freelancer pdf invoice template: added customer number, moved some fields around
    - Improved font family (remove unused font)
- Sort users by display-name in users reports
- Added comment to customer/project/activity entity and collections API

### Internals

- Improve console version output
- Allow changing password interactively on the console (prevents bash history leaks)
- Unify access to custom fields
- Added explicit classes for widgets
- Bump PHPUnit to version 9, removed PHP 7.3 from Github actions and activate PHP 8.1
- Added twig helper for markdown renderer with header support

### Fixed bugs

- Decimal format in print export doesn't work when language is set to German \(Austria\)
- xlsx export: change SUM function to SUBTOTAL function
- fix negative sum display in excel export
- use proper cell format for report exports
- Missing translation files
- Fix: translation file extensions / activate missing translations in `de_CH`, `pt_BR`, `zh_CN`
- Fix: title pattern when description is included in customer/project/activity dropdown
- Fix: fix select2 and dropdown width for quick-entry form
- Fix: fix empty string issue in csv export- fixes
- Fix: deprecations with php 8 (twig with sort filter)
- Fix: missing custom translations in modal dialogs

