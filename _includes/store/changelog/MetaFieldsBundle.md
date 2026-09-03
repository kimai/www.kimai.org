**Version 2.14.0**

Compatibility: requires minimum Kimai 2.62.0

- Improved: new `Dependent dropdown` custom-field type for activities, see 2.13.0

**Version 2.13.0**

Compatibility: requires minimum Kimai 2.62.0

- Added: new `Dependent dropdown` custom-field type for activities
- Use "primary" button class for creating fields
- Bump minimum required PHP version to 8.2

This new field type lets you attach a list of choices to each activity (for example a list of tasks).
When creating or editing a timesheet, a dropdown appears whose available options depend on the selected activity:
choosing an activity automatically loads that activity's list of choices into the dropdown.
This works just like the project dropdown, which updates its options based on the selected customer.

To use it: create a custom-field of type "Dependent dropdown" for activities, then open an activity and enter the
choices (one per line). Those choices become selectable on the timesheet once that activity is picked.

The `Dependent dropdown` type is in beta right now, feedback is appreciated.

**Version 2.12.0**

Compatibility: requires minimum Kimai 2.34.0

- Improve API docs

**Version 2.11.0**

Compatibility: requires minimum Kimai 2.34.0

- Support meta-fields for the `Weekly hours` screen

**Version 2.10.0**

Compatibility: requires minimum Kimai 2.25.0

- Fix default value for boolean values of user-preferences 
- Use translations from Kimai core
- Rename migration config for compatibility with new plugin installer
- Code improvement: PHPStan 2 with strict and deprecation rules activated

**Version 2.9.0**

Compatibility: requires minimum Kimai 2.15.0

- Inline Nelmio API Doc configuration

**Version 2.8.0**

Compatibility: requires minimum Kimai 2.15.0

<div>Fixed auto-tags handling on systems with less than 500 tags</div>

**Version 2.7.0**

Compatibility: requires minimum Kimai 2.15.0

- Improved internal API
- Fixed translation issues with Task fields

**Version 2.6.0**

Compatibility: requires minimum Kimai 2.15.0

Added: support for custom fields with the Task-Management bundle (needs Task Management version 2.7.0)

**Version 2.5.0**

Compatibility: requires minimum Kimai 2.5.0

Fixed: auto-tags support in detail pages (in cases where many tags already exist)

**Version 2.4.1**

Compatibility: requires minimum Kimai 2.5.0

- Changed: import Route attribute from correct namespace
- Changed: removed API security definition

**Version 2.4.0**

Compatibility: requires minimum Kimai 2.5.0

Changed: do not load all meta-fields from database on every page load

**Version 2.3.0**

Compatibility: requires minimum Kimai 2.5.0

Changed: moved some translations to core, allowing more languages

**Version 2.2.0**

Compatibility: requires minimum Kimai 2.1.0

Use annotation type for routes

**Version 2.1.0**

Compatibility: requires minimum Kimai 2.0.0

Simplified listing view

**Version 2.0.7**

Compatibility: requires minimum Kimai 2.0.0

Fixed: prevent error if tag name exceeds 100 character

