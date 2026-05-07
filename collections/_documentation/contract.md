---
title: Working times
description: Contract management and working times
related:
- absence
- public-holiday
---

This screen and the `Contract` menu can be seen by any user that has active contract settings and the ones that own the `contract_other_profile` permission (see `Permissions` below).

{% include youtube-video.html id="working_contracts_setup_and_absences" %}

## User interface

- Summary: summary of your working times and the manual bookings
- Target-hours: the list of the expected working hours for each day of the week
- Working times: the entire working year
- Manual bookings

{% include youtube-video.html id="working_contract_overview" %}

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

{% include docs-image.html src="/images/documentation/contract-lock-month.webp" title="Lock a month by choosing from the context menu" %}

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

Attention: perform tests on a separate test account (or the [demo environment]({% link _pages/{{ page.lang }}/demo.md %})).

You cannot delete manual bookings, so if you accidentally added wrong values, simply create an opposite booking and add something like "compensation for test booking" in the description.

### Account working times

Manual bookings can be used to increase or reduce the users time account.

Popular examples are:
- adding a positive amount of hours => taking over hours from the last year
- removing a negative amount of hours => payment to compensate for plus hours

### Holidays

Manual bookings can be used to increase or reduce the users available holidays.

Examples are:
- adding a positive amount of days => taking over holiday from the last year
- removing a negative amount of days => old holidays which were not taken on time expired

## How calculations work

Kimai only calculates working time up to the current moment.
This means that adding a holiday for tomorrow, or any other future absence, will not affect your hour balance yet.

Please read the chapter ["How absences affect expected working time"]({% link _documentation/absence.md %}) to understand why the `Working times` view may show different totals than `My times` for the same year.

In short: depending on the configured absence calculation mode, the reported annual working time can be significantly higher than the hours recorded in timesheets.

### Absences compensate expected working time

- **Public holidays** — The configured working time for that day is added as worked time. If you create a timesheet on the same day, it is counted as overtime.
- **Vacation** — The configured working time for that day is added as worked time. If you create a timesheet on the same day, it is counted as overtime.
- **Sickness** — Fills up the remaining working time for the day until the expected duration is reached. For example, if the expected time is 8 hours and 2 hours have already been recorded, the sickness absence adds 6 hours.
- **Other** — The configured absence duration is added as worked time.
- **Time-Off** — Does not affect working time calculations. This entry is for informational purposes only.

### Absences reduce expected working time

- **Public holidays** — Reduces the expected working time for that day to 0. If you create a timesheet on the same day, it is counted as overtime.
- **Vacation** — Reduces the expected working time by the duration of the absence. A full-day vacation reduces it to 0. A half-day vacation reduces it accordingly. If you create a timesheet on the same day, it is counted as overtime.
- **Sickness** — Reduces the remaining expected working time for that day. Either to 0 or for example, if the expected time is 8 hours and 2 hours have already been recorded, the remaining 6 hours are removed from the expected time.
- **Other** — Reduces the expected working time by the configured absence duration.
- **Time-Off** — Does not affect working time calculations. This entry is for informational purposes only.

## Limit timesheets to working days

There is a validation that can be activated in [System → Settings]({% link _documentation/configurations.md %}), which helps to restrict timesheets to contractual working days.
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

## Video

There is older video available, explaining more details, but be warned: it also has a few outdated information bits.

{% include youtube-video.html id="workcontract" %}

## Settings

{% include documentation/configurations.md id="controlling" howto=true %}

## Permissions

{% include documentation/permissions.md id="work_contract" howto=true %}
