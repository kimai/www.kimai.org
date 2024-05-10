---
title: Prices (rates)
description: How rates for your timesheet records are calculated
related:
  - timesheet
  - customer
  - project
  - activity
  - user-preferences
---

Be aware: Prices (also called rates, both are used as synonyms in this article) are always calculated from the duration of a record. 
The duration is often a rounded value and not the real difference between `end` and `begin`.

There are two price types:

- __Hourly price__: will be used to calculate the records price by multiplying it with the duration (see below)
- __Fixed price__: the value will be used to set the price for every record, no matter how long the duration is 

If any of the above is set to `0`, the records price will be set to `0`.
A __fixed price__ always wins over an __hourly price__.

And there are two different rates for each time-record:

- The __regular hourly price__ defines the external costs for yor customer (what actually goes on an invoice)
- And the __internal price__ defines your costs for the accounted work (what your employees costs you) 

## Defining prices

Prices can be defined in 4 different places;

- on the user level (in the user preferences)
- on the customer level
- on a project level
- and on the activity level

The values on the **user level** should always be filled, as they are the last place where Kimai always looks for a rate, if no other could be found.

The other rate settings (customer, project, activity) allow to define multiple rates.
Each customer/project/activity can have one rate setting, that acts as global fallback (if the username is not chosen) for every user, who has no dedicated rate for this object. 
For example: a customer gets a global rate of 10€, and you additionally create one rate for user A for 20€. Now that means A will have the rate of 20€, but user B and C and D will have a rate to 10€. 

### Internal price

If you leave the `internal price` empty on customer/project/activity level, the `internal price user-preference` will be used as fallback.  

## Changing prices

Rate changes always only apply for future entries. If you change e.g. a user's hourly rate, it will be used for all 
timesheet records that will be created from now on. But existing records will not be changed retroactive.

### Price changes upon item changes 

If a record already has an hourly or fixed rate set, it will be re-calculated if you change one of these fields:

- Customer
- Project
- Activity
- User

As all of these fields can have different rate settings. the time-records rate will be recalculated as well.

So if Project A has a rate of 100 and Project B a rate of 120, and you move a time-record from A to B it will automatically be changed from 100 to 120.

## Price calculation

The algorithm to calculate a timesheet records price works by summing up scores, where the highest score wins:

- Activity price: 5 points
- Project price: 3 points
- Customer price: 1 points
- User specific price: +1 point

This leads to the following decision matrix:

|                | Activity  | Project | Customer |
|----------------|-----------|---------|----------|
| None-user rule | 5         | 3       | 1        |
| User specific  | 6         | 4       | 2        |
{: .table }

If no price can be found, the `users hourly-price preference` will be used to calculate the records rate.
In case that the `users hourly-price` is not set or equals `0`, the records rate will be set to `0`.

The timesheet price calculation is based on the following formula:

- __Fixed price__: `$fixedRate`
- __Hourly price__: `$hourlyRate * ($durationInSeconds / 3600) * $factor`


You find more information how and where you can edit the different rates types in the following chapters.
