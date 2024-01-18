
## Introduction

{% include youtube-video.html id="workcontract" %}

## Features

**Certain features are not yet here, but already planned (see Roadmap below). Your feedback will be incorporated.**

- It enhances the [Working times]({% link _documentation/contract.md %}) view with 
  - Manual bookings (adjust the time account with plus or minus hours)
  - Overview of the entire year with results per day, the ability to close a month, download result PDF and more
  - See if a user has overtimes or minus hours (since first day in company, per year/month/day)
  - Monthly approvals (per user) with PDF handouts that contain the working-hour details for the entire month
  - See if your users have missing days (no times entered on days where they had to work)
- It adds the [Absence]({% link _documentation/absence.md %}) view, which allows to
  - Create holidays (half-days possible)
  - Take time-off (if account has overtime)
  - Create sickness days
  - Create other absences (e.g. unpaid leave)
  - Automatically adds the times absent to the user's timesheet based on their daily working time
  - Export absences per user to Excel
- And it adds the new [Public holiday]({% link _documentation/public-holiday.md %}) management view
  - Allows to create different groups (e.g. for different countries or states) and add public holidays to each of them 
  - Import and manual creation of public (local) holidays
  - Public holidays will automatically be added to the user's timesheet (a user can only be in one public-holiday group)
  - Public holidays can be imported automatically (check if your [country is supported](https://www.yasumi.dev/docs/providers/)).
- Per user contract settings
  - Expected working hours per day of the week: Monday/Tuesday/Wednesday/Thursday/Friday/Saturday/Sunday
  - Vacation entitlement per user for the calendar year
  - The "starting day" limits the working hours calculation from that date until "now"  
- You can [import data from the MR plugins]({% link _documentation/plugin-contract.md %}) (Controlling, Sickday, Vacation)
- The user calendar will show all absences (sickness, vacation...) and public-holidays

## Roadmap

These features will be added in the future, but there is no guarantee when or in which order.

```
- Notification
  - Sent notifications to supervisor for new "absences to be approved"
  - Sent notifications to user for approved/rejected absences
- Approval workflow for Absences 
    - Allow to "Sent for approval" to Supervisor
    - Allow to "Reject" or "Approve" by Supervisor
    - Only calculate approved or locked absences (new ones are for planning)
- Absence calendar
    - Display all users / teams
    - Allow export as ical (or similar format) for use in external calendars (e.g. Outlook)
- Monthly contract PDF
    - Include: total working time sum
    - Include: total holiday sum
    - Include: holidays at start of month sum
    - Include: start of month working-time sum
    - Include: manual bookings
- Finalize year
  - Allow automatic adjustments of time and holiday account of next year, e.g. from a list-overview
- Settings
  - Last day of work for a user, to stop calculating afterwards
- Working Times
  - Different colors for holiday / sickness / PTO
- API 
    - methods to read absences (date-range, user, absence type)
```

## Ideas 

This list is a collection of feature wishes from users, which might or might not be added. 
If you need one of these features, do not rely on them being added, but contact me upfront to discuss your needs.
If I decide to add one of these feature, it will be moved to the "Roadmap" section.

```
- Support for employees without expected working hours (e.g. hourly-based freelancers, who cannot used fixed working days) 
- Working times
  - Allow to configure a [dedicated project](https://github.com/kevinpapst/kimai-plugins/discussions/112) that will be exclusively used for calculating attendance time 
  - Allow to configure a dedicated project that will be ignored when calculating the attendance time
- Validations
  - Configure if timesheets should be prohibited during absence (type)
  - Configurable rule to deactivate time-records on public holidays
- API 
  - Methods to read absences
  - Methods to write absences (e.g. when using a HR tool for holiday planning)
- Approval workflow
  - Allow to export (or print) pending approvals
- Management view for all users
  - showing statistics for absences
  - pending holidays (approved), used holidays, available
- Monthly approvals
  - Allow to close months partially, in case there is a change in the contract within the month
- Absences
  - Add holiday for multiple users (e.g. for forced company vacations)
  - Types of absences (Workaround: use comment field)
    - Configurable for sickness and other
    - Show type in PDF
    - paid/not paid
  - Sum of sickness and other days on Absence screen
- Breaks (Pause)
  - Support calculation of breaks (e.g. display in calendar)
  - Use all breaks between first entry of the day and last entry of the day as pause
- Dashboard
  - Existing widgets do not show public holidays, sickness, vacation ... make it configurable or create new widgets that include these hours/days
  - Widgets for total numbers, to show "status" more prominent
- Working time requirements (Arbeitszeitvorgaben)
  - Maximum working time (per day, in one session) and breaks
  - Configure fixed rules per country
  - Allow one custom rule
  - Configure default rule (country or custom) per user
- Holidays
  - Lockdown method for vacations (define periods where no vacations can be booked)
  - Automatic calculation of holidays according to the working-time duration (e.g. 30 days per year for a 40h week) 
- Contracts 
  - Multiple working contracts per user (configured with start and end time)
- Define arbitrary date ranges with attached working-time profiles
  - Allow to attach each user multiple profiles
```

**Other requests and solutions**

```
- Convert holiday to sickness. Solution: create sickness and delete holiday
```
