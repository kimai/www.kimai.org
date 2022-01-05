---
title: Rates
description: How rates for your timesheet records are calculated
toc: true
redirect_from: 
  - /manual/rates.html
  - /manual/manual/rates.html
  - /documentation/manual/rates.html
  - /documentation/fees/
  - /documentation/rates/
---

Be aware: Rates are always calculated from the duration of a record. 
The duration is often a rounded value and not the real difference between `end` and `begin`.

There are two rate types:

- __Hourly rate__: will be used to calculate the records rate by multiplying it with the duration (see below)
- __Fixed rate__: the value will be used to set the rate for every record, no matter how long the duration is 

If any of the above is set to `0`, the records rate will be set to `0`.
A __fixed rate__ always wins over an __hourly rate__.

## Rate calculation

The algorithm to calculate a timesheet records rate works by summing up scores, where the highest score wins:

- Activity rate: 5 points
- Project rate: 3 points
- Customer rate: 1 points
- User specific rate: +1 point

This leads to the following decision matrix:

|                           | Activity rate | Project rate  | Customer rate |
|---                        |---            |---            |---            |
| None-user rule            | 5             | 3             | 1             |
| User specific             | 6             | 4             | 2             |

If no rate can be found, the `users hourly-rate preference` will be used to calculate the records rate.
In case that the `users hourly-rate` is not set or equals `0`, the records rate will be set to `0`.

The timesheet rate calculation is based on the following formula:

- __Fixed rate__: `$fixedRate`
- __Hourly rate__: `$hourlyRate * ($durationInSeconds / 3600) * $factor`

Please read the [rate multiplier]({% link _documentation/local-yaml.md %}#rate-multiplier-for-specific-weekdays) documentation to see how you can apply configurable multiplying factors based on the day.

## Edit rates

You find more information how and where you can edit the different rates types in these chapters:

- [Users]({% link _documentation/user-preferences.md %})
- [Customers]({% link _documentation/customer.md %})
- [Projects]({% link _documentation/project.md %})
- [Activities]({% link _documentation/activity.md %})
