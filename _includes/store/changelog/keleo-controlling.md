## Version 1.6.0

Compatibility: requires minimum Kimai 2.9.0

- Fixed: export of absences caused 500
- Changed: replaced DateTime with DateTimeInterface / DateTimeImmutable

## Version 1.5.0

Compatibility: requires minimum Kimai 2.8.0

- Added: new category to book "unpaid holiday" absences
- Added: generic calculation logic to prevent required adjustments for new categories
- Added: different duration limitation for absence types (e.g. 75 days in one booking for parental leave)
- Added: command `bin/console kimai:bundles:workcontract:absence-types` to debug absence types
- Fixed: time calculation for new "child is sick" and "parental leave" categories
- Fixed: deprecation by using DateTimeImmutable

## Version 1.4.0

Compatibility: requires minimum Kimai 2.7.0

- Added: manual adjustments for holidays, e.g. top up available days with remaining days from last year
- Added: added category to book "child is sick" absences
- Added: added category to book "parental leave" absences
- Added: prevent booking absences across a time-range of two years
- Added: limit selectable time-range to selected year
- Fixed: day calculation of vacations with public holidays in between

## Version 1.3.0

Compatibility: requires minimum Kimai 2.5.0

- Fixed: adapted collapsible boxes for Kimai 2.5.0
- Fixed: allow booking holidays with public holidays within the selected date-range

## Version 1.2.0

Compatibility: requires minimum Kimai 2.1.0

- Fixed: some users could not see public holidays in the calendar
- Fixed: route mapping type changed to attribute
- Fixed: Homepage link in extension screen

## Version 1.1.0

Compatibility: requires minimum Kimai 2.0.34

- Added: data migration from MR plugins
- Added: show absences in calendar
- Added: show public-holidays in calendar
- Added: export absences to excel
- Fixed: possible pagination issue

## Version 1.0.3

Compatibility: requires minimum Kimai 2.0.31

- Fixed: make sure to redirect to correct screen after create and delete absences

## Version 1.0.2

Compatibility: requires minimum Kimai 2.0.31

- Added: permission docs
- Fixed: first day of absence ranges is created twice

## Version 1.0.1

Compatibility: requires minimum Kimai 2.0.31

- Fixed: cannot update existing absences
- Fixed: replaced deprecated code usage

## Version 1.0.0

Compatibility: requires minimum Kimai 2.0.31

- Added: booking date-ranges for holiday and sickness
- Added: 10 new validations to make sure only valid absences can be booked
- Added: permissions for deleting absences
- Added: batch delete (non-locked) absences
- Added: order absences from highest to lowest date
- Added: support for half-days in public holidays
- Added: permission for creating absences
- Added: support for half-days in holidays
- Fixed: editing absences only non-locked absences
- Fixed: several calculations were not correct
- Fixed: adjusting "expected working times" should not change "public holiday calculation" in already locked months
- Fixed: adjusting "expected working times" should not change "absence calculation" in already locked months
- Fixed: removed unused `time_off` permission

## Version 0.5.0

Compatibility: requires minimum Kimai 2.0.29

- Added: show year number in import screen
- Added: show new public-holiday group after creation
- Fixed: year switcher in absence screen
- Fixed: limit public-holidays per year

## Version 0.4.0

Compatibility: requires minimum Kimai 2.0.28

- Added: First day of work in user-contract setting
- Added: do not calculate working-times before first day of work
- Added: show absence status icon
- Fixed: use current user for absence calculation
- Fixed: do not add public holiday to working time
- Fixed: calculate absences in working time, so they can be used when month is locked
- Removed: summaries for absences/holidays/sickness/time-off
- Added: create absences for team-member

## Version 0.3.0

Compatibility: requires minimum Kimai 2.0.27

- Improved public holiday management
- First draft supporting absences
    - holiday
    - time-off
    - sickness
    - other absences

## Version 0.2.2

Compatibility: requires minimum Kimai 2.0.26

- Fix: missing "absence" route

## Version 0.2.1

Compatibility: requires minimum Kimai 2.0.26

- Fix: migration and composer version

## Version 0.2

Compatibility: requires minimum Kimai 2.0.26

- Added: Public holiday management and group assignment
- Added: Summary for public holidays
- Added: Include public holiday times in monthly times

## Version 0.1

Compatibility: requires minimum Kimai 2.0.14

Initial draft version:

- Added: Support for manual bookings
- Added: Summary for working times
- Added: Summary for manual bookings
