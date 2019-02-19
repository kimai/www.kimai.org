---
layout: post
title: "Kimai v2 - Release 0.7"
date: "2019-01-28 02:00:00 +0200"
author: kevinpapst
---
Sorry for the long period of silence! The release of this version took a longer then expected, 
as I moved to a new city and had troubles getting my provider to setup the internet connection. 

[Full Changelog]({{ site.kimai_v2_repo }}/compare/0.6.1...0.7)

**The release main topic was "permissions". Most notable changes:**

- Configurable permission system
- Limit the amount of active time records per user
- Export team timesheets
- A lot of form and UI improvements (e.g. entry order and icons)
- Load filtered data via toolbar without page reload

**Upgrade from 0.6:**

Don't forget to execute the database migrations! Read more about upgrading Kimai in [UPGRADING]({{ site.kimai_v2_repo }}/blob/master/UPGRADING.md).

**Implemented enhancements:**

- Editing from calendar view will return to my times table instead of calendar [\#515]({{ site.kimai_v2_repo }}/issues/515)
- Timesheet Export for Admins [\#503]({{ site.kimai_v2_repo }}/issues/503)
- Customer List Not Alphabetic [\#499]({{ site.kimai_v2_repo }}/issues/499)
- sorting of ${entry.X} values [\#487]({{ site.kimai_v2_repo }}/issues/487)
- ${entry.description} needed in Word-Docx [\#485]({{ site.kimai_v2_repo }}/issues/485)
- Automatic sort for activities, customers, etc. [\#477]({{ site.kimai_v2_repo }}/issues/477)
- User title in the timesheet invoice [\#461]({{ site.kimai_v2_repo }}/issues/461)
- global variables for reports/invoices [\#438]({{ site.kimai_v2_repo }}/issues/438)
- Configuration option: Only one active record for each user [\#427]({{ site.kimai_v2_repo }}/issues/427)
- User creating activity and projects [\#393]({{ site.kimai_v2_repo }}/issues/393)
- Configuration option to disable fixed rate and hourly rate from "edit timesheet" [\#330]({{ site.kimai_v2_repo }}/issues/330)
- Set other users hourly rate [\#303]({{ site.kimai_v2_repo }}/issues/303)
- Feature request - Make "Rate" hideable [\#217]({{ site.kimai_v2_repo }}/issues/217)
- fixed null project for advanced invoice calculator [\#462]({{ site.kimai_v2_repo }}/pull/462) ([kevinpapst](https://github.com/kevinpapst))

**Fixed bugs:**

- This value should be greater than or equal to zero [\#511]({{ site.kimai_v2_repo }}/issues/511)
- Timesheet Export for Admins [\#503]({{ site.kimai_v2_repo }}/issues/503)
- admin activity: visibility "none" \(no filter\) causes sql-error [\#491]({{ site.kimai_v2_repo }}/issues/491)
- login-screen optimizations [\#483]({{ site.kimai_v2_repo }}/issues/483)
- Configuration of roles to add/edit customers, projects, activities... [\#479]({{ site.kimai_v2_repo }}/issues/479)
- Line breaks for address and payment information fields [\#464]({{ site.kimai_v2_repo }}/issues/464)
- Possible to use a decimal in hourly rate field? [\#458]({{ site.kimai_v2_repo }}/issues/458)
- Invoice Number Generator possibly not compatible  [\#454]({{ site.kimai_v2_repo }}/issues/454)
- users can change their role to system-admin [\#440]({{ site.kimai_v2_repo }}/issues/440)
- fix wrong include filename in user registration [\#520]({{ site.kimai_v2_repo }}/pull/520) ([kevinpapst](https://github.com/kevinpapst))
- fix segmentation fault - rollback composer dependencies [\#463]({{ site.kimai_v2_repo }}/pull/463) ([kevinpapst](https://github.com/kevinpapst))
-  fixed null project for advanced invoice calculator [\#462]({{ site.kimai_v2_repo }}/pull/462) ([kevinpapst](https://github.com/kevinpapst))
- fix the restart timesheet button [\#436]({{ site.kimai_v2_repo }}/pull/436) ([kevinpapst](https://github.com/kevinpapst))

**Closed issues:**

- Redirecting when using Kimai on a subdirectory + reverse proxy [\#492]({{ site.kimai_v2_repo }}/issues/492)
- Installation \(Cannot declare.... in use\) [\#455]({{ site.kimai_v2_repo }}/issues/455)
- New Number Generator not recognized [\#453]({{ site.kimai_v2_repo }}/issues/453)
- de/help/invoices returns 404 error [\#452]({{ site.kimai_v2_repo }}/issues/452)
- Can you Add Brazilian Portuguese Translation? I can help it.. [\#444]({{ site.kimai_v2_repo }}/issues/444)
- replace all selects with smart-selects and live-search [\#441]({{ site.kimai_v2_repo }}/issues/441)
- use parsedown-extra for rendering markdown [\#388]({{ site.kimai_v2_repo }}/issues/388)
- Think about a cooler name [\#133]({{ site.kimai_v2_repo }}/issues/133)

**Merged pull requests:**

- pagination without reload while keeping filters applied [\#521]({{ site.kimai_v2_repo }}/pull/521) ([kevinpapst](https://github.com/kevinpapst))
- go back to calendar after editing and creation of time-records [\#519]({{ site.kimai_v2_repo }}/pull/519) ([kevinpapst](https://github.com/kevinpapst))
- fetch toolbar results without page reload [\#518]({{ site.kimai_v2_repo }}/pull/518) ([kevinpapst](https://github.com/kevinpapst))
- Form and theme improvements [\#513]({{ site.kimai_v2_repo }}/pull/513) ([kevinpapst](https://github.com/kevinpapst))
- validation for future and negative times [\#512]({{ site.kimai_v2_repo }}/pull/512) ([kevinpapst](https://github.com/kevinpapst))
- alphabetical order for selectboxes [\#510]({{ site.kimai_v2_repo }}/pull/510) ([kevinpapst](https://github.com/kevinpapst))
- Export team timesheets [\#508]({{ site.kimai_v2_repo }}/pull/508) ([kevinpapst](https://github.com/kevinpapst))
- fix broken sql in activity admin [\#506]({{ site.kimai_v2_repo }}/pull/506) ([kevinpapst](https://github.com/kevinpapst))
- display invoice entries in ascending order [\#505]({{ site.kimai_v2_repo }}/pull/505) ([kevinpapst](https://github.com/kevinpapst))
- Improve DOCX template row [\#504]({{ site.kimai_v2_repo }}/pull/504) ([kevinpapst](https://github.com/kevinpapst))
- do not display admin menu if it has no children [\#500]({{ site.kimai_v2_repo }}/pull/500) ([kevinpapst](https://github.com/kevinpapst))
- login-screen optimizations [\#493]({{ site.kimai_v2_repo }}/pull/493) ([lduer](https://github.com/lduer))
- preg\_replace for md-file-extensions when rendering correct link… [\#482]({{ site.kimai_v2_repo }}/pull/482) ([lduer](https://github.com/lduer))
- Better composer install in the docker [\#481]({{ site.kimai_v2_repo }}/pull/481) ([tobybatch](https://github.com/tobybatch))
- Update dockerfile for https in composer installer [\#478]({{ site.kimai_v2_repo }}/pull/478) ([scolson](https://github.com/scolson))
- support line breaks in docx [\#466]({{ site.kimai_v2_repo }}/pull/466) ([kevinpapst](https://github.com/kevinpapst))
- updated README and docu [\#465]({{ site.kimai_v2_repo }}/pull/465) ([kevinpapst](https://github.com/kevinpapst))
- allow decimals in users hourly rate [\#460]({{ site.kimai_v2_repo }}/pull/460) ([kevinpapst](https://github.com/kevinpapst))
- updated all composer packages [\#459]({{ site.kimai_v2_repo }}/pull/459) ([kevinpapst](https://github.com/kevinpapst))
- moved some packages to dev requirements [\#456]({{ site.kimai_v2_repo }}/pull/456) ([kevinpapst](https://github.com/kevinpapst))
- Added portuguese translations [\#446]({{ site.kimai_v2_repo }}/pull/446) ([marquesmatheus](https://github.com/marquesmatheus))
- Simplify timesheet edit form if only one customer is existing [\#443]({{ site.kimai_v2_repo }}/pull/443) ([kevinpapst](https://github.com/kevinpapst))
- added project variables for invoice templates [\#439]({{ site.kimai_v2_repo }}/pull/439) ([kevinpapst](https://github.com/kevinpapst))
- added configurable permission system [\#424]({{ site.kimai_v2_repo }}/pull/424) ([kevinpapst](https://github.com/kevinpapst))
- Only one running timesheet: automatically stop others [\#386]({{ site.kimai_v2_repo }}/pull/386) ([lduer](https://github.com/lduer))
