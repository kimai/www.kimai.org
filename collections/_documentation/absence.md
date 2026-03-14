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

When managing absences, emails including the type of absence/comment/action/username/date-range will be sent out.

Notification emails will be sent to the user and the supervisor (if one is configured).
The supervisor is a setting in the [users profile]({% link _documentation/users.md %}).

### Setup your teams 

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

Kimai supports two calculation modes:
1. Absences count as worked time and compensate the expected working time for the day (default setting)
2. Absences reduce the expected working time for the day

The mode can be configured individually for each absence type in [System → Settings]({% link _documentation/configurations.md %}), depending on your industry requirements.

The selected mode affects the calculation of total expected and worked hours for each month, which can be relevant for payroll or PTO calculations.

**1. Absences compensate expected working time for the day**

In this mode, every configured working day is calculated with its full expected hours.
This means Kimai assumes that hours must be accounted for on every day, regardless of whether the day is a public holiday, sick leave, or vacation.

The duration of the absence is then counted as worked time and offsets the expected time.
For example: if a working day has 8 expected hours, a full vacation day will count as 8 hours worked.

**2. Absences reduce the expected working time for the day**

In this mode, an absence reduces the expected working time for the day by the duration of the absence.

For example: a full vacation day reduces the expected working time for that day to 0, and the worked time will also be 0.

## Holiday

When you are eligible for holidays, meaning that your contract settings have a value for `Holidays per year`, you can schedule your vacations here.

- Vacation days need to be approved
- Vacation days can be full days or half-days
- Vacation days count as working time, so they will be added to your daily working time
- Your daily working time depends on the expected working hours for that day
- You can book ranges of holidays
- Days without expected working hours will be ignored when creating ranges

## Sickness

Everyone can enter sickness entries. 

- Sickness days are auto-approved
- Sickness days can be entered as date-range
- A sickness entry will always fill up the daily working time
- If you have already entered working-time the same day, sickness will fill up the remaining open time
- There are no "half-day" entries available, because a half-day of sickness means, that there needs to at least one time-entry with 50% of the expected working-time. Example:
  - The expected working-time for the day is 8h
  - The users entered a timesheet of 4h
  - The user now adds a sickness entry: this will fill up the remaining 4h

### My child is sick

Use the drop-down next to the "Report sickness" button and select the "Sickness of a child" category.

## Time-Off

PTO (personal time-off) entries are for informational purpose, they do NOT influence your daily time by themselves.

- Time-Off need to be approved
- Kimai automatically reduces your working time account for that period (because you do not record working-time during your PTO)

## Other absences

Other absences could be all kinds of reasons that do not fit into any other absence category. 

- Other absences need to be approved
- Always entered as a duration  

### Parental leave

This fills up entire days and can be entered as date-range.

### Unpaid holiday

This fills up entire days and can be entered as date-range.

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

## Permissions

{% include documentation/permissions.md id="absences" howto=true %}
