---
title: "Release 1.17 - A bit of everything"
date: "2022-01-23 14:00:00 +0200"
author: kevinpapst
tags: [on-premise]
---

The release 1.17 was published in January 2022.

**This is the last release with [support for PHP 7.3 / 7.4]({% link _posts/en/2021-12-06-sunsetting-php-7.md %}).**

There have been 10 minor releases between the release [1.16]({% link _posts/en/2021-11-16-kimai-release-1-16.md %}) and this one. 
You should use the "watch feature" in the Github repository to be notified ASAP of these updates.

In the meantime 3 new plugins were released:
- [Translation]({% link _store/keleo-translation-bundle.md %}) - translate and/or change the labels of visible UI elements
- [Custom content]({% link _store/keleo-custom-content-bundle.md %}) - allows adding custom CSS, Javascript, a global warning message and a new content page
- [Invoice]({% link _store/keleo-invoice-bundle.md %}) - enhanced invoicing features, that should not be part of the core system

### Attention before upgrading 

This is the last release with [support for PHP 7]({% link _posts/en/2021-12-06-sunsetting-php-7.md %}).
If not yet done: please upgrade to PHP 8 soon.

Release 1.15 changed the config structure for LDAP & SAML and also [dropped support for PHP 7.2]({% link _posts/en/2021-05-31-php8-support-php72-dropped.md %}).

### Security issues

Some possible CSRF and XSS attacks were found and patched. Thanks for the disclosure go out to @haxatron and @asura-n and @noobpk.

If you use Kimai in a multi-user environment, you are urged to update as soon as possible.

### Thank you!

Thanks to all of you for using and supporting Kimai, especially:
- everyone contributing financially, allowing me to spend so much time with Kimai
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

- improve permission handling for quick entry controller [\#3081]({{ site.kimai_v2_repo }}/pull/3081)
- Invoice events [\#3079]({{ site.kimai_v2_repo }}/pull/3079)
- Invoice meta fields [\#3077]({{ site.kimai_v2_repo }}/pull/3077)
- Bugfixes [\#3078]({{ site.kimai_v2_repo }}/pull/3078)
- shrink prod error messages [\#3091]({{ site.kimai_v2_repo }}/pull/3091)
- new export template [\#3082]({{ site.kimai_v2_repo }}/pull/3082)
- Translations update from Hosted Weblate [\#2951]({{ site.kimai_v2_repo }}/pull/2951), [\#3013]({{ site.kimai_v2_repo }}/pull/3013), [\#3032]({{ site.kimai_v2_repo }}/pull/3032), [\#3048]({{ site.kimai_v2_repo }}/pull/3048)
- weekly hours form: allow to configure the amount of recent activity rows in an empty week [\#3026]({{ site.kimai_v2_repo }}/pull/3026)
- added comment field to invoice [\#3045]({{ site.kimai_v2_repo }}/pull/3045)
- improve export permission checks [\#3027]({{ site.kimai_v2_repo }}/pull/3027)
- new invoice template variables for budgets [\#3005]({{ site.kimai_v2_repo }}/pull/3005)
- new command to work with translation files [\#2993]({{ site.kimai_v2_repo }}/pull/2993)
- cleanup duplicate translation ids [\#3001]({{ site.kimai_v2_repo }}/pull/3001)
- improve translation test [\#2998]({{ site.kimai_v2_repo }}/pull/2998)
- prevent that lock files will be committed in PRs [\#2983]({{ site.kimai_v2_repo }}/pull/2983) and [\#2992]({{ site.kimai_v2_repo }}/pull/2992)
- allow to delete invoice documents from within kimai [\#2968]({{ site.kimai_v2_repo }}/pull/2968)
- improve export filename [\#2958]({{ site.kimai_v2_repo }}/pull/2958)
- include calendar week in week chooser [\#2933]({{ site.kimai_v2_repo }}/pull/2933)
- bump dependencies [\#3089]({{ site.kimai_v2_repo }}/pull/3089)
- code improvements [\#3088]({{ site.kimai_v2_repo }}/pull/3088)
- phpstan improvements [\#3092]({{ site.kimai_v2_repo }}/pull/3092)

### Fixed bugs

- Import from Kimai v1:  This timesheet is already exported [\#3061]({{ site.kimai_v2_repo }}/issues/3061)
- fix working time widget (dashboard) with "first day of week" = sunday [\#3047]({{ site.kimai_v2_repo }}/issues/3047)
- Fix projects are not filtered after submit [\#3016]({{ site.kimai_v2_repo }}/issues/3016)
- Fix invoice budget calculation [\#3024]({{ site.kimai_v2_repo }}/issues/3024)
- Fix "filter user timesheet" action display [\#3018]({{ site.kimai_v2_repo }}/issues/3018)
- fix selection of customer/project/activity in multi-step forms [\#2989]({{ site.kimai_v2_repo }}/issues/2989)
- more csrf protection for invoice and search [\#2984]({{ site.kimai_v2_repo }}/issues/2984)
- fix invoice create and search [\#2990]({{ site.kimai_v2_repo }}/issues/2990)
- fix HTML forms (two opening <form> tags) [\#2972]({{ site.kimai_v2_repo }}/issues/2972)
- fix deleting invoice documents [\#2980]({{ site.kimai_v2_repo }}/issues/2980)
- CSRF Tokens are not properly refreshed on some form submissions [\#2947]({{ site.kimai_v2_repo }}/issues/2947) [\#2948]({{ site.kimai_v2_repo }}/issues/2948)
- escape customer, project and activity name in javascript [\#2959]({{ site.kimai_v2_repo }}/issues/2959)
- escape data in calendar popover [\#2960]({{ site.kimai_v2_repo }}/issues/2960)
- make sure that markdown uses safe mode [\#2961]({{ site.kimai_v2_repo }}/issues/2961)
- improve permission handling in invoice screen [\#2965]({{ site.kimai_v2_repo }}/issues/2965)
- drop default value to prevent error when server version is not set [\#2769]({{ site.kimai_v2_repo }}/issues/2769) [\#2796]({{ site.kimai_v2_repo }}/issues/2796) [\#2943]({{ site.kimai_v2_repo }}/issues/2943)
- Filtering the administrative project list by Visible=Both results in 500 Server Error [\#2941]({{ site.kimai_v2_repo }}/issues/2941)
