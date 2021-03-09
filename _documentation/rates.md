---
title: Rates
description: Managing rates for your timesheet records
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

## Rate calculation

There are two rate types:

- __Hourly rate__: will be used to calculate the records rate by multiplying it with the duration (see below)
- __Fixed rate__: the value will be used to set the rate for every record, no matter how long the duration is 

If any of the above is set to `0`, the records rate will be set to `0`.
A __fixed rate__ always wins over an __hourly rate__.

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

Please see below to see how you can apply configurable multiplying factors based on day and time.

## Rate multiplier for specific weekdays

If you want to apply different hourly rates multiplication `factor` for specific weekdays, you can use this `rates` configuration.

1. You can define as many rules as you want ("workdays" and "weekend" are only examples)
2. Every matching rule will be applied, so be careful with overlapping rules
3. The end_date of timesheet records will be used to match the day (think about entries which are recorded overnight)
4. "days" is an array of weekdays, where the days need to be written in english and in lowercase
5. "factor" will be used as multiplier for the applied hourly rate
6. Rate rules will be applied on stopped timesheet records only, as it can't be calculated before
7. There is no default rule active, by default the users hourly-rate is used for calculation

You can configure the `hourly_rate` rules by changing the configuration file [local.yaml]({% link _documentation/configurations.md %}).

### Examples

1. The "workdays" rule will use the default "hourly rate" for each timesheet entry recorded between "monday" to "friday" as a multiplication with 1 will not change the result
2. The "weekend" rule will add 50% to each timesheet entry that will be recorded on "saturdays" or "sundays"

```yaml
kimai:
    timesheet:
        rates:
            workdays:
                days: ['monday','tuesday','wednesday','thursday','friday']
                factor: 1
            weekend:
                days: ['saturday','sunday']
                factor: 1.5
```
