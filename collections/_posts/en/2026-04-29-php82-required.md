---
title: "Kimai 2.56.0: A Step Forward for Security and Performance"
date: "2026-04-13 12:00:00 +0200"
image: /images/blog/sunset-php-81.webp
author: kevinpapst
tags: [on-premise]
excerpt: "The latest release of Kimai, our open-source time-tracking app, is here — and it's a meaningful one."
---

The latest release of Kimai, our open-source time-tracking app, is here. 
**Kimai 2.56.0** brings new API capabilities, smarter team-based permissions, an improved management script, fresh translations, and — most importantly — a bumped minimum PHP version that sets your installation up for better security and better performance going forward.

If you're self-hosting Kimai, this post walks you through what's new, why the PHP requirement changed, and how to make the upgrade as painless as possible.

## The headline change: PHP 8.2 is now the minimum

Starting with 2.56.0, **Kimai requires PHP 8.2 or newer**. Officially, the release is compatible with PHP 8.2 through 8.5.

We know "minimum version bumps" can sound like extra work for self-hosters, so let's be upfront about why this is genuinely good news:

- **Security**: PHP 8.1 [reached end-of-life](https://www.php.net/eol.php) and no longer receives security updates from the PHP project. Running an unsupported PHP version means any newly discovered vulnerability stays unpatched on your server. Moving to a supported branch closes that gap.
- **Performance**: Every modern PHP release has brought meaningful runtime improvements. Newer versions are faster, use memory more efficiently, and handle modern workloads better — your Kimai instance should feel snappier as a direct result.
- **A healthier ecosystem**: Many of the libraries Kimai depends on have already moved to PHP 8.2 as their baseline. By following along, Kimai can keep pulling in upstream improvements and security fixes instead of getting stuck on aging dependencies.

In short: this change is what lets us keep delivering a fast, secure, well-maintained product.

Using the official `kimai/kimai2:stable` Docker image? We take care of everything, you are safe. 

## Our recommendation: skip ahead to PHP 8.5

Here's a friendly tip for self-hosters planning the upgrade.

The 8.2 requirement is an **intermediate step**. We'll be raising the minimum to PHP 8.5 sooner rather than later. So if you're already setting aside time to upgrade, **upgrade straight to PHP 8.5** and save yourself a second round of work down the line.

PHP 8.5 was released in November 2025 and has active support until the end of 2027, with security support running through 2029. It's the most modern and longest-supported branch you can move to today.

## What else is new in 2.56.0

Beyond the PHP bump, this release packs a handful of useful improvements:

**New API endpoints for invoices.** You can now download invoices via the API, and there's a new endpoint for saving invoice meta-fields. If you've been building integrations or automating billing workflows, you've got more to work with.

**Smarter team-based permissions.** Access control checks on teams have been refactored to be reusable, and the `xxx_other_timesheet` permissions now properly respect team boundaries. This is a quiet but important improvement for organizations where users belong to multiple teams and you want clean separation of who can see and edit whose time entries.

**Hardened PDF generation.** PDF context options are now whitelisted — a small but worthwhile defense-in-depth change for anyone generating invoices, exports, or reports.

**Twig configuration improvements.** Behind the scenes, the templating layer got some attention, which translates into a more robust foundation for the UI you see every day.

**Improved `kimai.sh` management script.** The CLI script that helps you administer your Kimai installation has been polished. We are explicitly asking you for feedback on this one — if you use it, give it a spin and report back.

**A new Catalan translation**, plus the usual round of translation updates from Hosted Weblate. Big thanks to the contributors keeping Kimai accessible in dozens of languages.
Oh, and the website is also [available in Catalan]({% include link-language-domain.html language="ca" url="/ca/" %}) now. 

## How to prepare for the upgrade

If you're still on PHP 8.1, here's a sensible playbook:

1. **Back up your database.** Always step one, no exceptions.
2. **Check your current PHP version.** Run `php -v` on your server to confirm where you stand.
3. **Plan for PHP 8.5, not just 8.2.** Most Linux distributions and hosting control panels offer PHP 8.5 packages or repositories at this point. Going straight to 8.5 means one upgrade window instead of two.
4. **Verify required PHP extensions.** Kimai's documentation lists what it needs — make sure your new PHP version has them all enabled.
5. **Test in staging if you can.** A quick run-through on a non-production copy catches surprises before they hit your live instance.
6. **Then update Kimai itself** to 2.56.0 following the standard upgrade procedure for your installation method (Git, release archive, or Docker).

If you're on a managed host, your provider likely already offers a one-click PHP version switch. 

If you're using our Docker image, you can skip step 2 - 5.


## Thank you to the contributors

This release was shaped by the work of [@kevinpapst](https://github.com/kevinpapst), [@ntrpc-tech](https://github.com/ntrpc-tech), [@nullvector1](https://github.com/nullvector1), [@melnicek](https://github.com/melnicek), and [@fg0x0](https://github.com/fg0x0), along with the translators contributing through Weblate. Open source thrives because of people like them.

## Get the release

The full release notes, changelog, and upgrade details are on GitHub:

👉 [Kimai 2.56.0 release notes](https://github.com/kimai/kimai/releases/tag/2.56.0)

If you run into issues [during the upgrade]({% link _documentation/updates.md%}), the GitHub Discussions and issue tracker are the best places to get help — and if you've got feedback on the improved `kimai.sh` script in particular, we want to hear from you.

Happy tracking, and happy upgrading.
