
## Features

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
- And it adds the new [Public holiday]({% link _documentation/public-holiday.md %}) management view
  - Allows to create different groups (e.g. for different countries or states) and add public holidays to each of them 
  - Import and manual creation of public (local) holidays
  - Public holidays will automatically be added to the user's timesheet (a user can only be in one public-holiday group)
  - Public holidays can be imported automatically (if your country is supported - most are, some holidays might be missing).
- Per user contract settings
  - Expected working hours per day of the week: Monday/Tuesday/Wednesday/Thursday/Friday/Saturday/Sunday
  - Vacation entitlement per user for the calendar year
  - The "starting day" limits the working hours calculation from that date until "now"  

## Roadmap

This is a work-in-progress software, certain features are not yet here, but already planned or at least considered.

### Planned features

Thise features will be added in the future, but there is no guarantee when or in which order (numbers in front are priorities).

- Documentation
    - (1) Improve this store page 
    - (1) Written
    - (1) Videos
- Calendar integration
    - (1) Show absences
    - (1) Show public holidays in calendar
- Migrate from MR Plugins
    - (1) Convert configurations (and remove unused?)
    - (2) Import holidays
    - (2) Import absences
    - (3) Import public holidays
- Absences
  - (2) Export to Excel
- Approval workflow
    - (2) Allow to "Sent for approval" to Supervisor
    - (2) Allow to "Reject" or "Approve" by Supervisor
    - (2) Only calculate approved or locked absences (new ones are for planning)
- Monthly contract PDF
    - (2) Include: total working time sum
    - (2) Include: total holiday sum
    - (3) Include: holidays at start of month sum
    - (3) Include: start of month working-time sum
- Absence calendar
    - (2) Display all users / teams
    - (2) Allow export as ical (or similar format) for use in external calendars (e.g. Outlook)

### Ideas 

These points are collections that come from user feedback. Those might or might not be added. 
If you need one of these features, do not rely on them being added, but contact me to discuss your needs.

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
- Working time requirements (Arbeitszeitvorgaben)
    - Maximum working time (per day, in one session) and breaks
    - Configure fixed rules per country
    - Allow one custom rule
    - Configure default rule (country or custom) per user
