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

## Lock a month

After a month is over and the employee working-times were verified for correctness, the month should be "locked".

You can right-click the row or use the action menu at the end of the monthly row to lock the selected month:

{% include docs-image.html src="/images/documentation/contract-lock-month.webp" title="Lock a month by choosing from the context menu" width="700px" %}

Whether a month is locked (closed black lock) or not (open orange lock) is indicated by the icon in front of the row.

Locking a month will lock all days of the year before the chosen date:  
If previous months were not locked, they will be locked automatically as well.

### Unlock a month

Unlocking a month should be avoided in general, but if you have to adjust an already locked month, someone with the permission `unlock_times_contract` can unlock it.

You can right-click the row of the locked month or use the action menu at the end of the monthly row to unlock the selected month.

Unlocking a month will unlock all locked days of the year after the chosen date:  
If later months were locked, they will be unlocked automatically as well.

## Changing a work contract

If you change a users expected hours, it will influence all non-locked times.
It is therefore necessary to lock all months (see above) in which the old employment contract settings were valid BEFORE you change the settings.

After you locked all previous months, you can safely change the expected working time settings.

As you can only lock complete months, it is currently only possible to change the employment contract at the beginning of a month.

## Manual bookings

Attention: perform tests on a separate test account (or the [demo environment]({% link _pages/demo.md %})).

You cannot delete manual bookings, so if you accidentally added wrong values, simply create an opposite booking and add something like "compensation for test booking" in the description.

### Account working times

Manual bookings can be used to increase or reduce the users time account.

Popular examples are:
- adding a positive amount of hours => taking over hours from the last year
- removing a negative amount of hours => payment to compensate for plus hours

### Holidays

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

## Limit timesheets to working days

There is a validation that can be activated in [System > Settings], which helps to restrict timesheets to contractual working days.
Once activated, users cannot create timesheets for days without active contract setting.
So a user who works Monday to Thursday cannot create timesheets for Fridays.

In order to help with exceptions, there is a permission called `workdays_override_timesheet`, which allows to override this validation.
This permission should be granted to employees e.g. from HR department.

## Carry over your time balance to the next year

{% include youtube-video.html id="roll_over_work_balance" %}

At the end of the current year (or begin of the new year) and once you figured out the final balance of an employees time account, 
you have to roll over the hours to the next year:

- Go `Employment contract > Working Times`
- Click on the year dropdown and select the correct entry or click on the {% include demo-action-button.html icon="next" %} button to move to the next year
- Scroll down and create a `Manual booking` (see above)

## Permissions

{% include documentation/permissions.md id="work_contract" howto=true %}
