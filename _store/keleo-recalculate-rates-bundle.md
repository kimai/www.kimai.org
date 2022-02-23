---
title: Recalculate rates plugin for Kimai
name: Recalculate rates plugin
intro: "A plugin which forces to recalculate the hourly/fixed rate on every timesheet update"
developer: keleo
date: "2019-06-16 12:00:00 +0200"
icon: far fa-money-bill-alt
price: "0"
download: https://github.com/Keleo/RecalculateRatesBundle/archive/master.zip
github: https://github.com/Keleo/RecalculateRatesBundle
redirect_from: /store/recalculate-rates-bundle.html
type: plugin
tags:
  - plugin
bundle:
    name: "RecalculateRatesBundle"
    clone: "https://github.com/Keleo/RecalculateRatesBundle.git"
    versions: 
      - ["0.2", "1.9"]
      - ["0.1", "0.9"]
---

A Kimai plugin, which forces a recalculation of the hourly and fixed rates for timesheet records on every update.

By default, Kimai will use the hourly/fixed rate which was initially found.

## How it works

The good part is: you can change customer/project and activity and be sure, that the correct rate will be used.

The bad part: a manually entered hourly/fixed rate will be overwritten. You HAVE to work with the pre-configured rates on your activities/projects/customers always.  
