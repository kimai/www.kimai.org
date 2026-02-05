**Version 1.30.1**

Compatibility: requires minimum Kimai 2.48.0

- Fix "monthly timesheet PDF" has a closing parenthesis after the personnel number

**Version 1.30.0**

Compatibility: requires minimum Kimai 2.48.0

- Configure if absences/sickness/vacation/public holidays count toward or reduce the expected working-time
- Use new styles and icons from core
- New API endpoint: check if a date is locked

**Version 1.29.0**

Compatibility: requires minimum Kimai 2.32.0

- New configuration to deactivate half-day vacation bookings
- New API endpoint to lock months
- Absence form: remove all fields except comment when editing an existing entry
- Fix: editing a vacation comment failed, if all holidays were taken
- Use HttpClient to read public holidays from Google (fixes calls behind proxies)

**Version 1.28.0**

Compatibility: requires minimum Kimai 2.32.0

- Allow to request an absence again for the same day, if it was rejected before
- Count planned/future time-offs, to show the correct amount in the overtime account
- Do not count rejected entries for any absence type statistic

**Version 1.27.0**

Compatibility: requires minimum Kimai 2.32.0

- Fix: Absences on the last day of the month weren't approved
- Fix: Public holidays on the last day of the month were ignored in calculation

**Version 1.26.0**

Compatibility: requires minimum Kimai 2.32.0

- Fix a timezone issue in approval dialog
- Unlock absences in combination with the month

**Version 1.25.0**

Compatibility: requires minimum Kimai 2.32.0

- Do not allow importing empty public holiday selection

**Version 1.24.0**

Compatibility: requires minimum Kimai 2.32.0

- Added API endpoint to create absences
- Improved API documentation

**Version 1.23.1**

Compatibility: requires minimum Kimai 2.32.0

- Fix API absence calendar call

**Version 1.23.0**

Compatibility: requires minimum Kimai 2.32.0

- Added API parameter to fetch all/open/approved absences

**Version 1.22.0**

Compatibility: requires minimum Kimai 2.32.0

- Unlock approved months (with new permission `unlock_times_contract`)
- Fix: Validate entire lock period for pending absences

**Version 1.21.0**

Compatibility: requires minimum Kimai 2.30.0

- Fix timezone issue in approvals and PDF

**Version 1.20.0**

Compatibility: requires minimum Kimai 2.30.0

- Configure a project, which is exclusively used for attendance tracking

**Version 1.19.0**

Compatibility: requires minimum Kimai 2.28.0

- Allow to switch between Google and Yasumi provider for public holidays
- Do not send emails to deactivated users (both user and supervisor)
- Link from user profile to absence screen

**Version 1.18.0**

Compatibility: requires minimum Kimai 2.28.0

- Remove the `New` state from approval workflow for new entries
- Auto approve `sickness`
- Pre-check all absences in `new` and `requested` state, so people find the batch-actions easier

**Version 1.17.0**

Compatibility: requires minimum Kimai 2.25.0

- API: 
  - [BC break] fix route names for /request/approve/reject (added /absences prefix)
  - [BC break] new calendar route for absences and public-holidays (those were previously the main routes)
  - [BC break] new return structure for GET /absences and /public-holidays
  - added route to fetch all registered absence types
- Fix multiple redirects in public holiday management
- Fallback: "Import from Google public holiday calendar" if `Yasumi` is not available (caused by a timezone error on some PHP installations)

**Version 1.16.2**

Compatibility: requires minimum Kimai 2.25.0

- Fix: only the first 10 absences were shown
- Fix: statistics were calculated from approved absences only

**Version 1.16.1**

Compatibility: requires minimum Kimai 2.25.0

- Fix: approvals without date

**Version 1.16.0**

Compatibility: requires minimum Kimai 2.25.0

- Added Approval workflow for absences
  - All existing absences will be automatically set to "approved" during update
- Added `Absence` column to Monthly Approval PDF
- Moved `Public holidays` menu to `Administration`
- New API methods:
    - delete absence
    - delete public holiday
    - delete public holiday group
- Use translations from Kimai core
- Use faster API on `All times` listing (save many DB queries)
- Fix "last half day of vacation" could not be booked 
- Fix jumping back to current year, if changing absences in other year
- Internal: PHPStan 2 with strict and deprecation rules activated

**Version 1.15.0**

Compatibility: requires minimum Kimai 2.24.0

- Configure the users last working day
- Preview the "Monthly approval PDF" before locking the month
- Rename migration config for compatibility with new plugin installer

**ATTENTION**: Incompatible with Kimai 2.25.0. Please wait for the next plugin release before updating Kimai!

**Version 1.14.0**

Compatibility: requires minimum Kimai 2.22.0

- New working-hours calculation modes: "Hours per month" and "Hours per week"
- Fixed: using an Absence with duration caused plus hours

**Version 1.13.0**

Compatibility: requires minimum Kimai 2.21.0

- Allow to define a duration for "other" absences
- Improved responsiveness on public-holiday screen
- Fixed: last half-day of vacation can't be booked
- Refactoring: namespaces, unused services, repository methods

**Version 1.12.0**

Compatibility: requires minimum Kimai 2.19.0

- Fixed: booking vacation on "half-day" public holidays wasn't possible
- Fixed: raise max vacation days from 20 to 30
- Fixed: approved timesheets can be deleted
- Fixed: edit dialog for approved timesheets can be opened
- Added: new configuration to disable timesheet booking on non-working days
- Added: new permission `workdays_override_timesheet` to skip the above validation, e.g. for admins

**Version 1.11.0**

Compatibility: requires minimum Kimai 2.17.0

- Added: new API methods to fetch public holidays
- Removed: public holidays from Absence API 
- Fixed: showing own absences in other users calendar
- Fixed: use new `hours_other_profile` permission from core 

**Version 1.10.0**

Compatibility: requires minimum Kimai 2.12.0

- Changed: support attribute caching in Voter
- Fixed: permission check for PDF download
- Fixed: public holidays in calendar missing

**Version 1.9.0**

Compatibility: requires minimum Kimai 2.12.0

- Added: system configuration to set absence comment-field optional
- Added: allow to assign half days for user contract "holidays per year"
- Added: allow to use half days in "manual bookings"
- Added: allow to set duration for "sickness" 
- Added: auto-approve all open days of the year before the lock date
- Changed: single line comment field for "manual bookings" form 
- Fixed: use correct base class for migration - removes Doctrine deprecation warning

**Version 1.8.0**

Compatibility: requires minimum Kimai 2.11.0

- Added: absence types have a color
- Added: use type colors on absence screen and for calendar entries
- Fixed: translate calendar entries in current locale, instead of absence users locale
- Fixed: do not show error on calendar if `absences` permission is deactivated for a user
- Changed: use refactored language vs locale from user for email generation

**Version 1.7.0**

Compatibility: requires minimum Kimai 2.10.0

- Added: send notification email to supervisor for new absences
- Added: cross-link absence and work-contract page
- Added: trigger event when absences are created
- Fixed: editing absences could show fields (like "half day" for sickness) that should not be there 

**Version 1.6.0**

Compatibility: requires minimum Kimai 2.9.0

- Fixed: export of absences caused 500
- Changed: replaced DateTime with DateTimeInterface / DateTimeImmutable

**Version 1.5.0**

Compatibility: requires minimum Kimai 2.8.0

- Added: new category to book "unpaid holiday" absences
- Added: generic calculation logic to prevent required adjustments for new categories
- Added: different duration limitation for absence types (e.g. 75 days in one booking for parental leave)
- Added: command `bin/console kimai:bundles:workcontract:absence-types` to debug absence types
- Fixed: time calculation for new "child is sick" and "parental leave" categories
- Fixed: deprecation by using DateTimeImmutable

**Version 1.4.0**

Compatibility: requires minimum Kimai 2.7.0

- Added: manual adjustments for holidays, e.g. top up available days with remaining days from last year
- Added: added category to book "child is sick" absences
- Added: added category to book "parental leave" absences
- Added: prevent booking absences across a time-range of two years
- Added: limit selectable time-range to selected year
- Fixed: day calculation of vacations with public holidays in between 

**Version 1.3.0**

Compatibility: requires minimum Kimai 2.5.0

- Fixed: adapted collapsible boxes for Kimai 2.5.0
- Fixed: allow booking holidays with public holidays within the selected date-range

**Version 1.2.0**

Compatibility: requires minimum Kimai 2.1.0

- Fixed: some users could not see public holidays in the calendar
- Fixed: route mapping type changed to attribute
- Fixed: Homepage link in extension screen

**Version 1.1.0**

Compatibility: requires minimum Kimai 2.0.34

- Added: data migration from MR plugins
- Added: show absences in calendar
- Added: show public-holidays in calendar
- Added: export absences to excel
- Fix: possible pagination issue

