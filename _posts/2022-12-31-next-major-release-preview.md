---
title: "Next major release"
date: "2022-12-31 20:00:00 +0200"
image: /images/blog/cover-16.jpeg
author: kevinpapst
tags: [On-Premise]
---

Wooohooo 😀 I am super excited to share this update, as I was working on it for more than one year now!!! 🎉

Kimai gets a major overhaul, both technically and for the end-user.
The biggest changes, which I want to present right away are:

- Switched frontend from AdminLTE to Tabler.io (and therefor the newest bootstrap version)
- Upgraded to Symfony 6, shipping new backend possibilities
- Re-added the inline search: improving the UX by reducing click-counter
- Added context menu on all listings and the calendar
- Two-factor authentication with TOTP
- Configurable dashboard per user
- Real remember me mode
- Store column visibility server side
- Upgraded the entire frontend stack and reduced JS and CSS footprint (main app from 1.2MB to 350kB, calendar from 760kB to 210kB)
- Re-licensed under the terms of the [AGPL v3](https://www.gnu.org/licenses/agpl-3.0.en.html)

This release is the result of over one year and more than 500 commits. 
Hundreds of hours went into Kimai core, the website & documentation, all plugins and so many other tasks around Kimai in general. 
The details of core changes can be seen in [#2902](https://github.com/kimai/kimai/pull/2902).

You can test the new version at the [Demo sites]({% link _pages/demo.md %}).

## Detailed changelog

- Raised PHP requirement to PHP 8.1
- Migrated frontend to [tabler.io](https://preview.tabler.io/) and dozens of other frontend improvements
- New configurable dashboard (per user and in-browser editing)
- New report start screen
- Updated to Symfony 6 and upgraded all composer packages to the latest release
- Store column visibility server side
- Sticky "column profiles" per device (for desktop and mobile, with different sets of columns)
- Two-factor login 2FA with [TOTP](https://symfony.com/bundles/SchebTwoFactorBundle/6.x/providers/totp.html)
- True "Remember me" mode
- New "welcome" wizard for first time users
- Context menu in all listings (and for calendar entries) with the option to hide the "actions dropdown" column
- New "system user" field for user (hides user in reports and dropdowns)
- Integrated "recalculate rates" logic from external bundle (prevent wrong rates after changing project...)
- New per-user favorites menu
- Confirm edit dialogs with keyboard shortcut
- Added project action buttons in project detail report
- Tags (if less than 500 registered) and user with colored dots in dropdowns
- API pagination header (fixes #1536) - see [docs]({% link _documentation/api-pagination.md %})
- New API endpoints for item actions
- Customer number must be unique
- Configurable customer number format (formats very limited on purpose right now) - see #3373
- Auto numbering for new customers
- Link to timesheet export from project detail
- Extracted importer logic to a [new importer bundle]({% link _store/keleo-importer-bundle.md %})
- Plugins need to be updated, most are not yet compatible

**Notable code changes**

- Plugin developers: read the [migration guide]({% link _documentation/migration-v2.md %})
- Upgrade to new Symfony Security System - **LDAP untested!**
- Removed Sweetalert2 in favor of Bootstrap Toasts & Modals
- Removed `gd` extension requirement
- Removed third-party mailer packages
- Migrate to FullCalendar >= 5.10.2
- Migrated from Moment.js to Luxon
- Migrated from daterangepicker to litepicker (dependency free and without locale files)
- Removed jQuery
- Deleted settings for [Random colors](https://github.com/kimai/kimai/discussions/3446) and limited colors (default true for both now)
- Deleted setting `OFF` for `Minute selection for Duration`
- Replaced all annotations (Symfony and Doctrine) with attributes
- Removed "invoice template" meta field support from invoice command (use template via customer!)

## Beta tester 

Yes, I need you! These changes are so massive, that only the combined view of many eyes will help to ship a shiny release (AKA reducing the bug count).

When you want to test this locally, be aware that all plugins need to be updated, previous versions are not compatible. 
Paid plugins are not yet released.

## Past and future

The Kimai release series 1.x will not receive any new feature from here on, but both core and plugins will receive bug fixes and security updates for a couple of months.
Longer support for the old series is not planned. Symfony 4, the base of Kimai 1.x, is out of maintenance and not receiving any updates. 
So using it for longer might impose security risks. 

The last few years have shown that there is interest and support for paid plugins, and although this has been a nice pocket money, it has never paid my bills.
That's why I created the [Kimai-Cloud]({{ site.cloud.url }}): a hosted environment, including SAML login, custom domains, IP restriction, full backups and many more features.

While I love my work and enjoy giving away Kimai for free, I have to support my family and company.
More than 4 years after the first pre-release of Kimai I am still loosing money (not to forget the first two years, where I had basically zero income and what I paid entirely out of my own savings). 
The basic foundation is now done, and I have many ideas which will keep me fueled for the next years.
A couple of great companies are supporting my work, and while I totally appreciate that, I am still looking for a way to stabilize my income and really free me of my last freelancer gigs. 

While some of you might not like that announcement, I hope that most will understand it: plugin distribution will switch (at least partially) to a subscription model.
This is not about "maximising profit", I would not share so much of my code and time for free otherwise.
It's about being able to run a sustainable business, being able to concentrate 100% on Kimai and 
being able to get an employee (who should take care of all the content like documentation, news and video tutorials).

Details are not yet clear. 
Be assured, that all of you who supported me up until here will get updates for 2.0. 
I know you have questions, I don't have all the answers yet. But as soon as I have, I will share them.

## Thank you 

For now, I want to thank you all for your support and for using Kimai.
And I am really looking forward to your feedback on the new version 🙈😁

Oh, and did you notice: I added a newsletter form to the website (on the [News page]({% link _pages/blog.html %})). 
Please do me a favor and subscribe - I want to give this medium a try and test how well it works. 
