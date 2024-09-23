---
title: Absence
description: Managing absences
related:
- contract
- public-holiday
---

This screen and the `Contract` menu can be seen by any user that has active contract settings.
The `Absence` screen can be seen by any user that has the `absence` permission.

## Email notification

When creating a new absence, an email including the type of absence, comment and duration/date-range will be sent to the users supervisor.

This email will not be sent if the user has no configured supervisor.
The supervisor is a setting in the [users profile]({% link _documentation/users.md %}).

## Approval workflow

**Right now, there is no Approval workflow for absences.**

But any time an absence is created, the system will email the users supervisor.
The supervisor is a setting in the [users profile]({% link _documentation/users.md %}).

## Holiday

When you are eligible for holidays, meaning that your contract settings have a value for `holidays`, you can add holidays here.

- Vacation days can be full days or half days
- Vacation days count as working time, so they will be added to your daily working time
- The time to you daily working time depends on the expected working hours for that day
- You can book ranges of holidays
- Days without expected working hours will be ignored when creating ranges

## Sickness

Everyone can enter sickness entries. 

- Sickness days can be enetred as date-range
- A sickness entry will always fill up the daily working time
- If you already entered working-time the same day, sickness will fill up the remaining open time
- There are no "half-day" entries available, because a half-day of sickness means: there needs to at least one time-entry with 50% of the expected working-time
  - example: 8h are expected, the users enters a timesheet of 4h, the user adds a sickness entry, this entry will fill up the remaining 4h

### My child is sick

Use the drop-down next to the "Report sickness" button and select the "Sickness of a child" category.

## Time-Off

PTO (personal time-off) entries are for informational purpose, they do NOT influence your daily time by themselves.

As you are not tracking any working-time during your PTO, Kimai automatically reduces your working time account for that period.

## Other absences

Other absences are all kind of reasons, that do not fit into any other absence category. 

- Always entered as a duration  

### Parental leave

This fills up entire days and can be entered as date-range.

### Unpaid holiday

This fills up entire days and can be entered as date-range.

## Permissions

{% include documentation/permissions-absence.md %}

{% include snippets/store-howto-permissions.md %}
