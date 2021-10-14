---
layout: post
title: "PHP 8 Support added, PHP 7.2 dropped"
date: "2021-05-31 10:00:00 +0200"
author: kevinpapst
tags: [Announcement]
---

After working on PHP 8 Support for a couple of months, which was more complicated than expected because 
of all the dependencies, it is now done and available in master.

**Attention**
Previous versions were officially compatible with PHP >= 7.2.9.
This has been dropped in favor of PHP 7.3 for maximum compatibility.

BEFORE you update the next time, make sure that your system is running PHP 7.3!

And read [https://www.php.net/supported-versions.php](https://www.php.net/supported-versions.php).

Make sure that your production systems NEVER run on outdated PHP versions, which do not receive security updates!
PHP 7.2 security update phase ended in Nov 2020, you had half a year for updating your systems. 

### The future

I guess that PHP 7.3 as minimum required version will stick until 2.0. 
If you update your systems now, make sure that you install minimum PHP 7.4. 

The end of 7.3 is already on the horizon, and I won't promise anything... so better safe than sorry: go with 7.4!
