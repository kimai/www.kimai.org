---
title: "Kimai 2.0 - It's here!"
date: "2023-05-20 10:00:00 +0200"
author: kevinpapst
tags: [Announcement]
---

🎉 Yes, you all have been waiting for this moment for almost too long 🎉 

The new version of Kimai, which was announced and released as beta back in January, has received 22 minor releases since then. 
And now it is finally time to make it official: Kimai 2.0 is available for everyone.

**Let's explore 5 reasons why you should upgrade.**

## 1) Sooooo many new features ⭐️

This release is the result of almost 1.5 years work and received hundreds of visible and invisible changes.
Hundreds of hours went into the improvement of Kimai itself, the website and documentation. 
Read the [detailed list in this post]({% link _posts/2022-12-31-next-major-release-preview.md %}), here are some:

- New and improved UI design (e.g. buttons with labels, inline search, dark mode, right-to-left support)
- Two-factor authentication 2FA with TOTP tokens (e.g. Google Authenticator app)
- Brute force protection for the log in
- Configurable dashboard widgets per user
- Store column visibility server side with sticky "column profiles" per device
- New "reporting" start screen with much simpler access to all available report types
- A "Welcome wizard" for first time users
- Context menus on all listings and the calendar (much quicker than the action menu)
- New "system user" field for user (hide user in reports and dropdowns, e.g. for Admins or pure API accounts)
- New "recalculate rates" logic (prevent wrong rates after copying timesheet or changing project, activity and user)
- New custom-field for auto-tagging of timesheets
- Auto numbering for new customers, with configurable customer number format
- Pre-fill timesheet custom-fields via URL
- Date and money formats are now bound to the chosen locale
- Confirm edit dialogs with keyboard shortcut

## 2) Version 1 is out of maintenance 🐛

With this news the 1.x series is also officially retired and will not receive any more updates.

In fact, the last release for the 1.x series was released on the 17th of February with the number 1.30.8.

## 3) Improved security 🔒

These super important security features were added to Kimai:

- Two-factor authentication with TOTP tokens
- Two-factor for SAML and LDAP users
- Brute force protection for log in screen

## 4) PHP 8.1 is faster 🚀

It's a simple technical fact: PHP 8.1 outperforms 7.4.

In combination with the new frontend architecture, this should make Kimai faster. 
If it doesn't: change your hoster and/or read Reason 5.

What happened in Kimai:

- Symfony was upgraded from 4.4 to 6.2
- Caching is now used for many data entries, which are usually only read and not changed 
- The amount of necessary database queries per page was reduced
- The frontend was migrated from AdminLTE (with Bootstrap 4) to Tabler.io (with Bootstrap 5.3)
- jQuery was removed
- moment.js was replaced with Luxon
- The overall size of CSS and Javascript was reduced by around 50%

## 5) PHP 7.4 is EOL ☠️

PHP 7.4, which is the supported version of Kimai 1.30 and the one many of you are using, is end-of-life.
Meaning that it doesn't receive updates sind December 2021 and [doesn't even receive security fixes](https://www.php.net/supported-versions.php) since December 2022.

Do not run your business on an outdated software stack, especially if it publicly available server software. 

## Moving to the cloud is for free 👍

Kimai is a server software, that needs a bit of technical knowledge when it comes to hosting and maintenance.
And not everyone is familiar with the Linux bash. 

If you want to use the latest and greatest feature, you can use [www.kimai.cloud](https://www.kimai.cloud) and be always up-to-date. 
If you have many employees or a strict governance, using the on-premise version of Kimai might be the best solution.
But if you are a solo entrepreneur or a small company, it is cheaper and a big time-saver to use the cloud version of Kimai.

To make it simpler for you to move to the cloud, and saving you the hassle of updating Kimai, I am announcing the "Summer of Free Migration": 
If you switch to [a paid plan](https://www.kimai.cloud/pricing), I will **import your existing Kimai data for free**. 
All I need is the registered cloud and a database dump of your current Kimai installation.
Please [contact me](mailto:support@kimai.cloud) to discuss the details.

## Upgrading Plugins

Old plugins are no longer compatible.
So please [read this post]({% link _posts/2023-05-19-plugin-upgrades-v2.md %}) if you are using Kimai 1 plugins. 
 
Cloud users do not need to worry about this.
