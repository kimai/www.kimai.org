## Version 2.12.0

Compatibility: requires minimum Kimai 2.11.0

- Added toggl timesheet importer
- Format certain values in preview
- Fixed user column name detection in timesheet import
- Removed support for translated column headers (caused too many problems)

## Version 2.11.0

Compatibility: requires minimum Kimai 2.11.0

- Validate Hourly/Internal/Fixed rate
- Translate detected column headers (removed in 2.12)

## Version 2.10.0

Compatibility: requires minimum Kimai 2.11.0

- Simplify timesheet example data to prevent confusion
- Fix Doctrine deprecations

## Version 2.9.0

Compatibility: requires minimum Kimai 2.5.0

- Fixed: timesheet importer created project multiple times (if many projects used the same name)
- Change: import route annotation from correct namespace

## Version 2.8.0

Compatibility: requires minimum Kimai 2.5.0

- Added: new created users during import require to change password
- Changed: Improved error message upon wrong mimetype

## Version 2.7.0

Compatibility: requires minimum Kimai 2.5.0

- Changed: moved some translations to core, allowing more languages
- Fixed: column "Rate" is not required for timesheets

## Version 2.6.0

Compatibility: requires minimum Kimai 2.4.0

- Added: support Kimai Export CSV for import
- Added: logging for simpler debugging
- Changed: improved importing visible flags for customers and projects
- Changed: improve user mapping (and support setting the Alias during import)

## Version 2.5.1

Compatibility: requires minimum Kimai 2.1.0

- Fixed: column "Billable" is not correctly imported

## Version 2.5.0

Compatibility: requires minimum Kimai 2.1.0

- Changed: use annotation type for routes

## Version 2.4.0

Compatibility: requires minimum Kimai 2.0.30

- Added: skip some validations during timesheet import

## Version 2.3.0

Compatibility: requires minimum Kimai 2.0.9

- Added: support for meta-fields via column "meta.XXX" for customers
- Added: support for meta-fields via column "meta.XXX" for projects
- Added: support for column "name" for customer
- Added: support for column "name" for project
- Added: importer highlights invalid column mapping
- Removed: "(plugin)" from permission header

## Version 2.2.3

Compatibility: requires minimum Kimai 2.0.9

- Fixed: System-Menu is not highlighted on tabs

## Version 2.2.2

Compatibility: requires minimum Kimai 2.0.9

- Added: hint for Clockify imports, that rate configurations are not imported
- Added: deactivate certain validation rules in "Import from Kimai v1" command
- Removed: use `Import` validator group

## Version 2.2.1

Compatibility: requires minimum Kimai 2.0.9

- Fixed: detect invalid encoding for fields Activity, Project, Description
- Added: better preview and import result status

## Version 2.2.0

Compatibility: requires minimum Kimai 2.0.9

Better use with Kimai 2.0.15 to utilize new `Import` validator group.

- Added: command option `skip-teams` to prevent team sync
- Added: command option `check-already-imported` to prevent duplicate database entries
- Fixed: `string` vs `int` comparison
- Fixed: `isset` vs `array_key_exists`
- Fixed: `is_int` vs `is_numeric`

## Version 2.1.6

Compatibility: requires minimum Kimai 2.0.9

- Fixed: prevent error if tag name exceeds 500 character

## Version 2.1.5

Compatibility: requires minimum Kimai 2.0.9

- Fixed: duration parsing

## Version 2.1.4

Compatibility: requires minimum Kimai 2.0.9

- Added: identify auto-deactivation during batch imports

## Version 2.1.3

Compatible with Kimai 2.0

- Fixed: deactivate listener for import, reducing extra DB queries (now 1k imported rows = ~7k queries, instead of 22k before)
- Fixed: improved boolean parsing
    - strings `yes`, `true`, `1` = true
    - everything else (e.g. `no`, `false`, `0`, empty string) = false

## Version 2.1.2

Compatible with Kimai 2.0

- Fixed: catch any Exception during CSV import

## Version 2.1.1

Compatible with Kimai 2.0

- Fixed: use UserService to create new user with default settings

## Version 2.1.0

Compatible with Kimai 2.0

- Added: new tabs for different importer
- Added: support creating user during import
- Added: new importer for Clockify migrations
- Added: option to choose between global and project-specific activities
- Fixed: Highlight errors

## Version 2.0.2

Compatible with Kimai 2.0

- Fixed: proper error handling for invalid date-times
- Fixed: proper error handling for unknown users

## Version 2.0.1

Compatible with Kimai 2.0

- Fixed: fixed import form validation
- Fixed: replaced "Sensio-FrameworkExtraBundle" with Symfony attribute

## Version 2.0

Compatible with Kimai 2.0

- Fixed: compatibility with 2.0
- Added: moved Kimai 1 import command from core to plugin

## Version 1.2

Compatible with Kimai 1.22.0

- Fixed: import of float values for "rate", "hourly rate", "fixed rate" and "internal rate"

## Version 1.0

Compatible with Kimai 1.21.0

- Initial version with support for:
    - Customer
    - Project
