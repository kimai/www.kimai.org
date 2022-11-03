---
title: Rates
description: How rates for your timesheet records are calculated
redirect_from: 
  - /manual/rates.html
  - /manual/manual/rates.html
  - /documentation/manual/rates.html
  - /documentation/fees/
  - /documentation/rates/
related:
  - timesheet
  - customer
  - project
  - activity
  - user-preferences
---

Be aware: Rates are always calculated from the duration of a record. 
The duration is often a rounded value and not the real difference between `end` and `begin`.

There are two rate types:

- __Hourly rate__: will be used to calculate the records rate by multiplying it with the duration (see below)
- __Fixed rate__: the value will be used to set the rate for every record, no matter how long the duration is 

If any of the above is set to `0`, the records rate will be set to `0`.
A __fixed rate__ always wins over an __hourly rate__.

## Rate changes

Rate changes always only apply for future entries. If you change e.g. a user's hourly rate, it will be used for all 
timesheet records that will be created from now on. But existing records will not be changed retroactive.

Additionally, if a record already has an hourly or fixed rate set, it will not be changed if you change the customer, project or activity.
So if Project A has a rate of 100 and Project B 120, and you move a record from A to B it will not be automatically changed to 120.

## Rate calculation

The algorithm to calculate a timesheet records rate works by summing up scores, where the highest score wins:

- Activity rate: 5 points
- Project rate: 3 points
- Customer rate: 1 points
- User specific rate: +1 point

This leads to the following decision matrix:

|                | Activity rate | Project rate | Customer rate |
|----------------|---------------|--------------|---------------|
| None-user rule | 5             | 3            | 1             |
| User specific  | 6             | 4            | 2             |

If no rate can be found, the `users hourly-rate preference` will be used to calculate the records rate.
In case that the `users hourly-rate` is not set or equals `0`, the records rate will be set to `0`.

The timesheet rate calculation is based on the following formula:

- __Fixed rate__: `$fixedRate`
- __Hourly rate__: `$hourlyRate * ($durationInSeconds / 3600) * $factor`

## Edit rates

You find more information how and where you can edit the different rates types in these chapters:

- [Users]({% link _documentation/user-preferences.md %})
- [Customers]({% link _documentation/customer.md %})
- [Projects]({% link _documentation/project.md %})
- [Activities]({% link _documentation/activity.md %})
