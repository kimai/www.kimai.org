
## Introduction

Please read the documentation pages! We have created many videos about the usage of this plugin:
- [Working times]({% link _documentation/contract.md %})
- [Absence]({% link _documentation/absence.md %})
- [Public holiday]({% link _documentation/public-holiday.md %})

### Working contract 

This plugin enhances the [Working times]({% link _documentation/contract.md %}) view with:

- Manual bookings (adjust the time account with plus or minus hours)
- Overview of the entire year with results per day, the ability to close a month, download result PDF and more
- See if a user has overtimes or minus hours (since first day in company, per year/month/day)
- Monthly approvals (per user) with PDF handouts that contain the working-hour details for the entire month (lock and unlock months)
- See if your users have missing days (no times entered on days where they had to work)

{% include youtube-video.html id="working_contract_overview" %}

### Absence management

This plugin adds the [Absence]({% link _documentation/absence.md %}) management view, which allows to
- Create holidays (half-days possible)
- Take time-off (if account has overtime)
- Create sickness days
- Create other absences (e.g. unpaid leave)
- Automatically adds the times absent to the user's timesheet based on their daily working time
- Export absences per user to Excel

{% include youtube-video.html id="absence_approval_workflow" %}

### Absence calendar

It adds a new Absence calendar (under Reporting) for all users or selected teams in a monthly grid:
- Show absences
- Shows available users
- Shows both approved and requested absences

{% include youtube-video.html id="absence_calendar" %}

### Public holidays

It also adds the new [Public holiday]({% link _documentation/public-holiday.md %}) management view:
- Allows to create different groups (e.g. for different countries or states) and add public holidays to each of them 
- Import and manual creation of public (local) holidays
- Public holidays will automatically be added to the user's timesheet (a user can only be in one public-holiday group)
- Public holidays can be imported for each year (check if your [country is supported](https://www.yasumi.dev/docs/providers/)).

{% include youtube-video.html id="public_holiday" %}

### User contract settings

- Expected working hours per day of the week: Monday/Tuesday/Wednesday/Thursday/Friday/Saturday/Sunday
- Vacation entitlement per user for the calendar year
- The `starting` and `ending` day, limits the working hours calculation to the real contract start and end dates

### Other features

- The timesheet calendar shows all absences (sickness, vacation...) and public-holidays.
- You can [import data from the MR plugins]({% link _documentation/plugin-contract.md %}) (Controlling, Sickday, Vacation)

## Roadmap

{% include roadmap-items.html roadmap_category="working-times" %}
