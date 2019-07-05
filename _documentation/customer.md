---
title: Customer
description: Customers in Kimai
toc: true
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

These settings can also be configured directly at `System / Settings` within Kimai.

## Customer colors

Each customer can be assigned its own color, for easier identification in the timesheets.

If a project or an activity linked to the customer does not have its own color, the customers color will be used.
The default color code is `#d2d6de`.

## Currency

The customers currency is used when displaying the recorded entries in the timesheets.

It is also used for printing invoices, which is the reason while the invoice screen needs one applied customer filter 
before any data will be shown. 

## Time budget
{% include new_since.html version="1.0" %}

{% include time_budget.md %}
