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