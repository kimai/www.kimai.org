**Version 2.22.1**

Compatibility: requires minimum Kimai 2.36.0

- Better theme support with Kimai 2.49
- Fix deprecations

**Version 2.22.0**

Compatibility: requires minimum Kimai 2.36.0

- Skip unsupported array values during project/customer JSON import

**Version 2.21.0**

Compatibility: requires minimum Kimai 2.36.0

- Show correct filesize and row limitation in help label and error message

**Version 2.20.0**

Compatibility: requires minimum Kimai 2.36.0

- Switch default separator to comma `,`
- Support `e-mail` in addition to `email` as column name
- Use `User` column for `User identifier`
- Use `Username` and `Name` columns for `User alias`
- Support `break` column
- Fix invalid reported plugin version (previous 2.35)

**Version 2.19.0**

Compatibility: requires minimum Kimai 2.35.0

- Timesheet importer: support custom-field import
- Customer importer: update existing customers instead of creating duplicates (identify by name)
- Project importer: update existing customers and projects instead of creating duplicates (identify by name)

**Version 2.18.0**

Compatibility: requires minimum Kimai 2.21.0

- Support: Project number via `projectnumber` for Project importer
- Support: Customer number via `customernumber` for Customer importer (also possible via `account`)

**Version 2.17.0**

Compatibility: requires minimum Kimai 2.21.0

- Fixed: missing `duration` caused 0 duration
- Fixed: missing `duration` caused "undefined index"
- Fixed: missing `description` caused "undefined index"

**Version 2.16.0**

Compatibility: requires minimum Kimai 2.21.0

- Removed "end date" from project import example
- PHPStan v2 with strict and deprecation rules
- Updated documentation

**Version 2.15.0**

Compatibility: requires minimum Kimai 2.21.0

- Refactoring: Use attributes for importer service injection
- Refactoring: Use new repository and query methods
- Refactoring: Activate PHPStan bleeding edge rules

**Version 2.14.0**

Compatibility: requires minimum Kimai 2.17.0

- Allow 4MB upload file size and 5000 rows per file
- Deactivate timesheet validators during Kimai1 import: TimesheetLockdown, TimesheetLongRunning, TimesheetZeroDuration

**Version 2.13.0**

Compatibility: requires minimum Kimai 2.17.0

- Support importing seconds
- Fixed Clockify duration import rounding issue (see #4838)
- Added quick links from Customer and Project listing

**Version 2.12.0**

Compatibility: requires minimum Kimai 2.11.0

- Added: toggl timesheet importer
- Added: format a few value types in preview
- Added: internal API improvements
- Fixed: user column name detection in timesheet importer
- Fixed: removed translated column header detection in timesheet importer (caused too many problems)


**Version 2.11.0**

Compatibility: requires minimum Kimai 2.11.0

- Added: Validate Hourly/Internal/Fixed rate
- Changed: Translate detected column headers

**Version 2.10.0**

Compatibility: requires minimum Kimai 2.11.0

- Simplify timesheet example data to prevent confusion
- Fix Doctrine deprecations

**Version 2.9.0**

Compatibility: requires minimum Kimai 2.5.0

- Fixed: timesheet importer created project multiple times (if it existed under the same name multiple times)
- Change: import route annotation from correct namespace

**Version 2.8.0**

Compatibility: requires minimum Kimai 2.5.0

- Added: new created users during import require to change password
- Changed: Improved error message upon wrong mimetype

**Version 2.7.0**

Compatibility: requires minimum Kimai 2.5.0

- Changed: moved some translations to core, allowing more languages
- Fixed: column "Rate" is not required for timesheets

**Version 2.6.0**

Compatibility: requires minimum Kimai 2.4.0

- Improved importing visible flags for customers and projects
- Support Kimai Export CSV for import
- Improve user mapping (and support setting the Alias during import)
- Added logging for simpler debugging

**Version 2.5.1**

Compatibility: requires minimum Kimai 2.1.0

Fixed: Column "Billable" is not correctly imported

**Version 2.5.0**

Compatibility: requires minimum Kimai 2.1.0

Use annotation type for routes

**Version 2.4.0**

Compatibility: requires minimum Kimai 2.0.30

Added: skip some validations during timesheet import


