---
title: Absence
description: Managing absences
related:
- contract
- public-holiday
plugin: controlling
cloud: pro
---

This screen and the `Contract` menu can be seen by any user that has active contract settings.
The `Absence` screen can be seen by any user that has the `absence` permission.

## Email notification

When managing absences, emails including the type of absence/comment/action/username/date-range will be sent out.

Notification emails will be sent to the user and the supervisor (if one is configured).
The supervisor is a setting in the [users profile]({% link _documentation/users.md %}).

### Set up your teams 

To ensure the workflow functions properly, you need to set up your teams in a specific way.

Create a team for each department or organisational unit.
- Add the supervisor as the team lead.
- Add each subordinate as a team lead.

This setup is required because otherwise the supervisor might not be able to see the user in the dropdown menu.

## Approval workflow

{% include youtube-video.html id="absence_approval_workflow" %}

There are 2 phases that each absence has to go through:

- New absence: moves the absence to the `Requested` list and sends an email to the supervisor to ask for confirmation
  - Approval by the supervisor: the absence will be moved to the `Approved` list and an email is sent to the user to confirm the approval 
  - Rejection by the supervisor: the absence will be moved back to the `New` list and an email is sent to the user to inform about the rejection 
- Approved absences: can still be deleted, until they are locked 

## How absences affect expected working time

Kimai supports two calculation modes for absences:

1. **Absences count as worked time and compensate the expected working time for the day** (default)
2. **Absences reduce the expected working time for the day**

The selected mode affects how total expected hours and worked hours are calculated for each month. This can be relevant for payroll, overtime, and PTO calculations.

You can configure the mode individually for each absence type in [System → Settings]({% link _documentation/configurations.md %}), depending on your company rules and industry requirements.

{% include youtube-video.html id="working_contract_overview" chapter="absence_calculation_mode" %}

### 1. Absences compensate expected working time for the day

In this mode, every scheduled working day keeps its full expected number of hours.

This means Kimai assumes that time must be accounted for on every working day, regardless of whether the employee is working, on vacation, sick, or absent due to a public holiday.

The absence duration is then counted as worked time and offsets the expected time.

Example: if a working day has **8 expected hours**, a full vacation day will count as **8 worked hours**.

### 2. Absences reduce the expected working time for the day

In this mode, an absence reduces the expected working time for the affected day by the duration of the absence.

Example: if a working day has **8 expected hours**, a full vacation day reduces the expected working time for that day to **0 hours**, and the worked time will also be **0 hours**.

## Absence types

Please read the chapter ["How calculations work"]({% link _documentation/contract.md %}) to understand how your `Working times` are calculated.

### Holiday / Vacation

When you are eligible for holidays, meaning that your contract settings have a value for `Holidays per year`, you can schedule your vacations here.

- Vacation days need to be approved
- Vacation days can be full days or half-days
- You can book ranges of holidays
- Days without expected working hours will be ignored when creating vacations

### Sickness

Everyone can enter sickness entries. 

- Sickness days are auto-approved
- Sickness days can be entered as date-range
- Sickness entries will always account for the (remaining) daily working time
- If you have already entered working-time the same day, sickness will fill up the remaining open time
- There are no "half-day" entries available, because a half-day of sickness means, that there needs to at least one time-entry with 50% of the expected working-time. Example:
  - The expected working-time for the day is 8h
  - The users entered a timesheet of 4h
  - The user now adds a sickness entry: this will fill up the remaining 4h

**My child is sick**

Use the drop-down next to the "Report sickness" button and select the `Sickness of a relative` category.

### Time-Off

PTO (personal time-off) entries are for informational purpose, they do NOT influence your actual workimg time by themselves.

- Time-Off needs to be approved
- Kimai reduces your working time account for that period, because you do not record working-time during your PTO

### Other absences

Please add everything that does not fit the other categories in `Other absences`. 

- The type `Other absences` needs to be approved
- Can be a date range or a duration  

**Parental leave**

Parental leaves always cover a date-range of full days.

**Unpaid holidays**

Unpaid holidays cover a date-range of full days.

## Absence calendar

The absence calendar is a monthly report at [Report → Absence calendar]({% link _documentation/reporting.md %}).
It shows one row per user and one column per day of the selected month, so you can see at a glance who is absent and when.

{% include docs-image.html src="/images/documentation/absence-calendar.webp" title="Absence calendar" %}

Typical use cases are planning team capacity, checking whether a requested vacation collides with another team member, or getting an overview of the current month before approving new requests.

### Permissions

The [permission]({% link _documentation/permissions.md %}) `absence` is required to open the report.
With that permission alone, you only see your own row.

To see the absences of other users, you need one of these permissions:

- `view_other_absence` by default set for the `Teamlead` role
- `view_team_absence` this can be safely assigned to the normal `User` role

Both permissions unlock the same rows in this report and additionally show the team dropdown.
The difference: only with `view_other_absence` the usernames become links to the absence screen of that user, as it gives access to other features as well.

### Which users are shown

- Without one of the above permissions, only your own row is shown
- With one of them, you see all members of your own teams
- Admins see all users, including users that are not assigned to any team
- Deactivated users and system accounts are never shown

By default, only users with an approved absence in the selected month are listed.
Use the chevron button next to the filter to toggle the rows of users without absences.
Showing all users turns the report from an **absence calendar** into an **availability calendar**.

If you select a team from the dropdown, all members of that team are shown right away, no matter whether they have absences in that period.
The toggle works the same way and lets you reduce the list to members with absence entries again.

### What the calendar shows

- Only **approved** absences are displayed - requested and rejected entries are not part of this report
- Each absence type has its own color and icon, hover a day to see the type as tooltip
- Public holidays of the user are highlighted with their own color and icon
- Days that are not working days for that user (for example weekends or days without expected working time) are shown in a different shade

{% alert info %}
The calendar shows one entry per day.
Half-days look exactly like full days, and if a user has multiple absences on the same day, only one of them is displayed.
For the exact durations and the remaining vacation days, open the `Absence` screen of that user.
{% endalert %}

## Creating absences for next year

{% include youtube-video.html id="vacation_next_year" %}

You can always only select absences for the currently selected year. 
If you want to create absence requests in advance for next year, you have to change the selected year by:
- clicking on the year dropdown and selecting the correct entry
- clicking on the {% include demo-action-button.html icon="next" %} button to move to the next year

## Carry over absences into the new year

While this video talks about your time balance, the workflow is the same.

{% include youtube-video.html id="roll_over_work_balance" %}

- Switch to the next year
- Go to "Manual bookings: Holiday"
- Open it and click "Create"
  - Select the 01. January and
  - Enter the remaining days from the previous year  
  - Enter a comment like "Remaining vacations from previous year"
  - Save

Switch back to the previous year and remember to lock the entire year. 

Read more about manual bookings in the [Working times]({% link _documentation/contract.md %}) chapter. 

## Settings

Settings for Absences can be found under "Employment contract".

{% include documentation/configurations.md id="controlling" howto=true %}

## Permissions

{% include documentation/permissions.md id="absences" howto=true %}
