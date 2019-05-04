---
title: Customer
description: Customers in Kimai
---

Customers in Kimai are used to manage project and activities, which are then used for time-records.

It is very common to have one _customer_ for your own company, to track times for administration and other internal work.
 
## Creating customer

You can configure default values for new customers in your [local.yaml]({% link _documentation/configurations.md %}) like this: 
```yaml
kimai:
    defaults:
        customer:
            timezone: Europe/London
            country: GB
            currency: GBP
```

This can also be configured directly in the System configuration within Kimai.

## Customer colors

Each customer can be assigned its own color, for easier identification in the timesheets.

If a project or an activity linked to the customer does not have its own color, the customers color will be used.
The default color code is `#d2d6de`.
