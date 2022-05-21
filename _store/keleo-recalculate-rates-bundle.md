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
      - ["1.0", "1.20.1"]
      - ["0.2", "1.9"]
      - ["0.1", "0.9"]
---

A Kimai plugin, which forces a recalculation of the hourly and fixed rates for timesheet records on certain updates.

There are two possible modes in which this plugin can work:

1. Recalculate prices if certain fields were changed
2. Recalculate prices on every update

The first mode is the better one, but only available from Kimai 1.20.1 on.

You can configure the mode, by default mode 1 is used, unless your Kimai version is too old, then 2 is used.

## Recalculate prices if certain fields were changed

This mode should be preferred.

A timesheet record rate will be recalculated if it was changed in one of these fields: Customer, Project, Activity, User, Price

This still might overwrite custom rates, which were applied to single timesheets.
But this case is very rare and using custom rates for single entries should be avoided anyway.
If you find yourself using this workflow often, consider using the [Expense plugin]({% link _store/keleo-expenses-bundle.md %}).

## Recalculate prices on every update

The good part is:
- you can change customer/project and activity and be sure, that the correct rate is used.

The bad part:
- even setting the export field might change the hourly rate and render your history invalid
- a manually entered hourly/fixed rate will be overwritten
- you HAVE to work with the pre-configured rates on your activities/projects/customers.  
