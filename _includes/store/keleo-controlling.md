
## Introduction

{% include youtube-video.html id="workcontract" %}

## Features

**This is a early-access software, certain features are not yet here, but already planned (see Roadmap below). Feedback will be incorporated.**

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
  - Public holidays can be imported automatically (if your country is supported - most are, some holidays might be missing).
- Per user contract settings
  - Expected working hours per day of the week: Monday/Tuesday/Wednesday/Thursday/Friday/Saturday/Sunday
  - Vacation entitlement per user for the calendar year
  - The "starting day" limits the working hours calculation from that date until "now"  
- You can [import data from the MR plugins]({% link _documentation/plugin-contract.md %}) (Controlling, Sickday, Vacation)
- The user calendar will show all absences (sickness, vacation...) and public-holidays

## Roadmap (Planned features)

These features will be added in the future, but there is no guarantee when or in which order (numbers in front are priorities).

```
- Documentation
    - (1) Written
    - (2) Videos
- Approval workflow
    - (1) Allow to "Sent for approval" to Supervisor
    - (1) Allow to "Reject" or "Approve" by Supervisor
    - (1) Only calculate approved or locked absences (new ones are for planning)
    - (3) Allow to export (or print) pending approvals
- Absence calendar
    - (2) Display all users / teams
    - (2) Allow export as ical (or similar format) for use in external calendars (e.g. Outlook)
- Monthly contract PDF
    - (2) Include: total working time sum
    - (2) Include: total holiday sum
    - (3) Include: holidays at start of month sum
    - (3) Include: start of month working-time sum
```

## Ideas 

The next list is a collection of feature wishes from users, which might or might not be added. 
If you need one of these features, do not rely on them being added, but contact me upfront to discuss your needs.
If the above list is empty or I decide to add a feature, it will be moved to the "Planned features" section.

```
- Management view for all users
  - showing statistics for absences
  - pending holidays (approved), used holidays, available
- Monthly approvals
  - Allow to close months partially, in case there is a change in the contract within the month
- Define arbitrary date ranges with attached working-time profiles
  - Allow to attach each user multiple profiles
- Absences
  - Types of absences (Workaround: use comment field)
    - Configurable for sickness and other
    - Show type in PDF
    - paid/not paid
  - Convert holiday to sickness (Workaround: create sickness and delete holiday)
  - Sum of sickness and other days on Absence screen
- Notification
  - Sent notifications to supervisor for new "absences to be approved"
  - Sent notifications to user for approved/rejected absences
- Rules
  - Configure if timesheets should be prohibited during absence (type)
- Breaks (Pause)
  - Support calculation of breaks (e.g. display in calendar)
  - Use all breaks between first entry of the day and last entry of the day as pause
- Add a button to take over values from last year (for all users)
- Show "status" more prominent
  - e.g. Dashboard widgets for total numbers
- Working time requirements (Arbeitszeitvorgaben)
  - Maximum working time (per day, in one session) and breaks
  - Configure fixed rules per country
  - Allow one custom rule
  - Configure default rule (country or custom) per user
- Holidays
  - Take over holidays from last year (like manual bookings)
- Finalize year
  - Auto-adjust time-account of next year
  - Allow to take over and adjust the holidays, which were not yet taken (probably with an expiration date?)
- Configuration for the business year, in case a company is not using the calendar year
- Multiple working contracts (configured with start and end time)
```

## Changelog

```
1.1.0 (18 Sept. 2023)

- Added: data migration from MR plugins
- Added: show absences in calendar
- Added: show public-holidays in calendar
- Added: export absences to excel
- Fixed: possible pagination issue

1.0.3 (11 Sept. 2023)

- Fixed: make sure to redirect to correct screen after create and delete absences

1.0.2 (07 Sept. 2023)

- Added: permission docs
- Fixed: first day of absence ranges is created twice

1.0.1 (31 Aug. 2023)

- Fixed: cannot update existing absences
- Fixed: replaced deprecated code usage

1.0.0 (28 Aug. 2023)

- Added: booking date-ranges for holiday and sickness
- Added: 10 new validations to make sure only valid absences can be booked
- Added: permissions for deleting absences
- Added: batch delete (non-locked) absences
- Added: order absences from highest to lowest date
- Added: support for half-days in public holidays
- Added_ permission for creating absences
- Added: support for half-days in holidays
- Added: support for
- Fixed: editing absences only non-locked absences
- Fixed: several calculations were not correct
- Fixed: adjusting "expected working times" should not change "public holiday calculation" in already locked months
- Fixed: adjusting "expected working times" should not change "absence calculation" in already locked months
- Fixed: removed unused `time_off` permission
```
