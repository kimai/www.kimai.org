**Version 2.13.1**

Compatibility: requires minimum Kimai 2.25.0

Fix: storing custom-fields via API failed with missing permission

**Version 2.13.0**

Compatibility: requires minimum Kimai 2.25.0

- Use translations from Kimai core
- Rename migration config for compatibility with new plugin installer
- Code improvement: PHPStan 2 with strict and deprecation rules activated

**Version 2.12.0**

Compatibility: requires minimum Kimai 2.21.0

- Improve: create Task from Customer detail page
- Fixed deep link pagination
- Always attach first team when creating task from project or activity
- Using new repository features, saving at least one query per page load

**Version 2.11.0**

Compatibility: requires minimum Kimai 2.17.0

- Fixed tag column length
- Refactoring: new repository access

**Version 2.10.0**

Compatibility: requires minimum Kimai 2.17.0

- Fixed CSRF token refresh when deleting comments
- Compatibility with composer installation
- Inline Nelmio API Doc configuration
- Inline JMS Serializer configuration

**Version 2.9.0**

Compatibility: requires minimum Kimai 2.17.0

Added API endpoint to fetch all timesheets for one task

**Version 2.8.0**

Compatibility: requires minimum Kimai 2.17.0

Deprecated "pageSize" API parameter in favor of "size"

**Version 2.7.0**

Compatibility: requires minimum Kimai 2.15.0

Added: support for custom fields for Tasks

**Version 2.6.0**

Compatibility: requires minimum Kimai 2.1.0

Added: allow to filter tasks from detail page listing

**Version 2.5.0**

Compatibility: requires minimum Kimai 2.1.0

Changed: support attribute caching in Voter

**Version 2.4.2**

Compatibility: requires minimum Kimai 2.1.0

- Changed: import Route attribute from correct namespace
- Changed: removed API security definition

**Version 2.4.1**

Compatibility: requires minimum Kimai 2.1.0

Fix SQL problem on listing page for users with team assignment

**Version 2.4.0**

Compatibility: requires minimum Kimai 2.1.0

- Improved: replaced up to 1 DB query call per Task on listing page with 1 query in total
- Improved: stopping a task multiple times will not raise an error anymore

**Version 2.3.0**

Compatibility: requires minimum Kimai 2.1.0

- Fixed: route mapping type changed to attribute
- Fixed: removed sticky table header in detail page for timesheet list

**Version 2.2.0**

Compatibility: requires minimum Kimai 2.0.33

- Fixed: API param `pageSize` did not allow arbitrary values
- Fixed: API pagination compatibility with Kimai 2.0.33

