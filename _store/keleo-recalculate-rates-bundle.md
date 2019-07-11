---
title: Recalculate rates plugin for Kimai 2
name: Recalculate rates plugin
intro: "A Kimai 2 plugin, which forces to recalculate the hourly/fixed rate on every timesheet update"
developer: keleo
date: "2019-06-16 12:00:00 +0200"
icon: far fa-money-bill-alt
price: "0"
download: https://github.com/Keleo/RecalculateRatesBundle/archive/master.zip
github: https://github.com/Keleo/RecalculateRatesBundle
tags:
  - plugin
---

A Kimai 2 plugin, which forces a recalculation of the hourly and fixed rates for timesheet records on every update.

By default, Kimai will use the hourly/fixed rate which was initially found.

## Warning

The good part is: you can change customer/project and activity and be sure, that the correct rate is used.

The bad part: a manually entered hourly/fixed rate will be overwritten. You HAVE to work with the pre-configured rates on your activities/projects/customers.  

## Installation

First clone it to your Kimai installation `plugins` directory:
```
cd /kimai/var/plugins/
git clone https://github.com/Keleo/RecalculateRatesBundle.git
```

And then rebuild the cache: 
```
cd /kimai/
bin/console cache:clear
bin/console cache:warmup
```

You could also [download it as zip](https://github.com/keleo/RecalculateRatesBundle/archive/master.zip) and upload the directory via FTP:

```
/kimai/var/plugins/
├── RecalculateRatesBundle
│   ├── RecalculateRatesBundle.php
|   └ ... more files and directories follow here ... 
```
