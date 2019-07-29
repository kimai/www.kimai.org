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

{% include time_budget.md %}

## Visibility

By toggling the visibility on a customer, you:
- hide the customer from all drop-downs
- hide the customer from the default list in the customer administration
- hide all projects for this customer from all drop-downs, regardless of their visibility state
- hide all projects for this customer from the default list in the projects administration
- hide the activities for all customer projects from all drop-downs, regardless of their visibility state
- hide the activities for all customer projects from the default list in the activities administration

Please note:
- all currently linked objects will still show the customer in the dropdown as pre-selected option
  - you can still change the customer on timesheet records and projects, which used it before
  - you cannot create new projects for this customer
  - you cannot create new timesheet records for this customer 
- you can still access the hidden entries by changing the visibility filter on the the toolbars 

The visibility filter in the toolbar has three state: 
- Visible: Yes (all customers that are visible)
- Visible: No (all customers that are invisible)
- Visible "empty" (all customers, not filtering on their visibility)
