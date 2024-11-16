---
title: FAQ (On-Premise Kimai)
navigation: FAQ
description: FAQ for the self-hosted version of Kimai
---

## I have a problem

Please check your logfile at `var/log/prod.log`. Many problems reveal themselves after checking it.

If that doesn't help, open a new discussion at [GitHub]({{ site.kimai_v2_repo }}/discussions/) and we try to find a solution.
Please include the last ~ 20-50 lines of the log file, which were written around the time the error happened.

## Kimai is slow

There are many factors that influence the performance of Kimai, the most important one is the server Kimai runs on.
Shared hosts aren't known for their good performance, especially running modern PHP projects like Kimai that load a large amount of files per request.

The second factor is your PHP configuration, which can lead to massively decreased performance when not tuned for production usage.

Please [read this issue]({{ site.kimai_v2_repo }}/issues/1584#issuecomment-604048869).

## Changed configs/templates do not load

Kimai is built on top of Symfony, a framework that optimizes its speed by caching most files.
Therefor, if you are running Kimai in `production`, you have to [clear the cache]({% link _documentation/cache.md %}) before changes will show up.

## I have only FTP available

Sorry, no chance. You either have to find a hoster that offers SSH access, or you use the [SaaS version of Kimai]({{ site.cloud.url }}).
