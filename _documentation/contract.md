---
title: Working times
description: Contract management and working times
related:
- absence
- public-holiday
---

{% include youtube-video.html id="workcontract" %}

This screen and the `Contract` menu can be seen by any user that has active contract settings and the ones that own the `contract_other_profile` permission (see `Permissions` below).

## User interface

- Summary: summary of your working times and the manual bookings
- Target-hours: the list of the expected working hours for each day of the week
- Working times: the entire working year
- Manual bookings

## Summary
 
The summary contains the following information (where each column is one month):
- one row for working times
- one row for manual bookings, requires the `view_booking_contract` permission

## Working times

Contains the entire year with the following information:
- the expected working time for each day of the week
- the actual working time for each day of the week
- the difference between expected and actual working time
- the total working time for each month
- the total working time for the entire year
- blue dots for days with either
  - a public holiday 
  - any kind of absence

## Manual bookings: Account working times

Manual bookings can be used to increase or reduce the users time account.

Popular examples are:
- adding a positive amount of hours => taking over hours from the last year
- removing a negative amount of hours => payment to compensate for plus hours

## Manual bookings: Holidays

Manual bookings can be used to increase or reduce the users available holidays.

Popular examples are:
- adding a positive amount of days => taking over holiday from the last year
- removing a negative amount of days => old holidays which were not taken on time expired

## How calculations work

All calculations are only done up until NOW.
That means adding a holiday tomorrow will not change your hour account.

### Public holidays

Adds the amount of configured working time as working time.
If you add a timesheet on the same day, it calculates as overtime.

### Holidays

Adds the amount of configured working time as working time.
If you add a timesheet on the same day, it calculates as overtime.

### Sickness

Fills up the working day to match the expected working time.

Examples:
- 8 hours are expected and you already logged 2 hours, then 6 hours will be filled-up
- 8 hours are expected and no time is logged, then 8 hours will be added

### Other

Adds the amount of configured hours as working time.

### Time-Off

Will not influence the working time in any way.
This booking is only there for information purposes.

## Permissions

| Permission Name         | Description                                                                            |
|-------------------------|----------------------------------------------------------------------------------------|
| contract_other_profile  | Allow to see and change the contract settings of other users.                          |
| hours_other_profile     | View the `Employment contract` menu. Switch the user in the `Working Contract` screen. |
| view_booking_contract   | View working-time details (PDF, Manual bookings)                                       |
| approve_times_contract  | Approve monthly timesheets.                                                            |
| create_booking_contract | Allows to create manual time bookings.                                                 |
{: .table }

{% include store-howto-permissions.md %}
