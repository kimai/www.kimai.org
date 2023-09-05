---
title: Working times
description: Contract management and working times
related:
- absence
- public-holiday
---

{% include youtube-video.html id="workcontract" %}

This screen and the `Contract` menu can be seen by any user that has active contract settings.
Administrators require the `contract_other_profile` permission (see `Permissions` below)

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

## Manual bookings

Manual bookings can be used to increase or reduce the users time account.

Popular examples are:
- adding a positive amount of hours => taking over hours from the last year
- removing a negative amount of hours => payment to compensate for plus hours

## Permissions

The `contract_other_profile` permission is required to see the `Contract` menu. 
This permission also allows to change the contract settings of other users.

| Permission Name            | Description                                                                            |
|----------------------------|----------------------------------------------------------------------------------------|
| view_booking_contract      | View working-time details (PDF, Manual bookings)                                       |
| approve_times_contract     | Approve monthly timesheets.                                                            |
| create_booking_contract    | Allows to create manual time bookings.                                                 |
{: .table }

{% include store-howto-permissions.md %}
