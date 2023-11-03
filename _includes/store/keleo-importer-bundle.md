
{% include plugins/importer.md %}

## Changelog

```
## Version 2.5.1 (03.11.2023)

Compatibility: requires minimum Kimai 2.1.0

- Fixed: Column "Billable" is not correctly imported

## Version 2.5.0

Compatibility: requires minimum Kimai 2.1.0

- Use annotation type for routes

## 2.4.0

Compatibility: requires minimum Kimai 2.0.30

- Added: skip some validations during timesheet import

## 2.3.0

Compatibility: requires minimum Kimai 2.0.9

- Added: support for meta-fields via column "meta.XXX" for customers
- Added: support for meta-fields via column "meta.XXX" for projects
- Added: support for column "name" for customer
- Added: support for column "name" for project
- Added: importer highlights invalid column mapping
- Removed: "(plugin)" from permission header

## 2.2.3

Compatibility: requires minimum Kimai 2.0.9

- Fixed: System-Menu is not highlighted on tabs

## 2.2.2

Compatibility: requires minimum Kimai 2.0.9

- Added: hint for Clockify imports, that rate configurations are not imported
- Added: deactivate certain validation rules in "Import from Kimai v1" command
- Removed: use `Import` validator group

## 2.2.1

Compatibility: requires minimum Kimai 2.0.9 

- Fixed: detect invalid encoding for fields Activity, Project, Description
- Added: better preview and import result status

## 2.2.0

Compatibility: requires minimum Kimai 2.0.9 

Better use with Kimai 2.0.15 to utilize new `Import` validator group.

- Added: command option `skip-teams` to prevent team sync
- Added: command option `check-already-imported` to prevent duplicate database entries
- Fixed: `string` vs `int` comparison 
- Fixed: `isset` vs `array_key_exists`
- Fixed: `is_int` vs `is_numeric`

## 2.1.6

Compatibility: requires minimum Kimai 2.0.9

- Fixed: prevent error if tag name exceeds 500 character

## 2.1.5

Compatibility: requires minimum Kimai 2.0.9

- Fixed: duration parsing

## 2.1.4

Compatibility: requires minimum Kimai 2.0.9

- Added: identify auto-deactivation during batch imports

## 2.1.3

Compatible with Kimai 2.0

- Fixed: deactivate listener for import, reducing extra DB queries (now 1k imported rows = ~7k queries, instead of 22k before)
- Fixed: improved boolean parsing
  - strings `yes`, `true`, `1` = true
  - everything else (e.g. `no`, `false`, `0`, empty string) = false

## 2.1.2

Compatible with Kimai 2.0

- Fixed: catch any Exception during CSV import

## 2.1.1

Compatible with Kimai 2.0

- Fixed: use UserService to create new user with default settings

## 2.1.0

Compatible with Kimai 2.0

- Added: new tabs for different importer
- Added: support creating user during import
- Added: new importer for Clockify migrations
- Added: option to choose between global and project-specific activities
- Fixed: Highlight errors

## 2.0.2

Compatible with Kimai 2.0

- Fixed: proper error handling for invalid date-times
- Fixed: proper error handling for unknown users

## 2.0.1

Compatible with Kimai 2.0

- Fixed: fixed import form validation
- Fixed: replaced "Sensio-FrameworkExtraBundle" with Symfony attribute

## 2.0

Compatible with Kimai 2.0

- Fixed: compatibility with 2.0
- Added: moved Kimai 1 import command from core to plugin 

## 1.2

Compatible with Kimai 1.22.0

- Fixed: import of float values for "rate", "hourly rate", "fixed rate" and "internal rate"

## 1.0

Compatible with Kimai 1.21.0

- Initial version with support for:
  - Customer
  - Project
```
