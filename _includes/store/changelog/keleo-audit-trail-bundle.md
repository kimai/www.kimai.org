## Version 2.6.0

Compatibility: requires minimum Kimai 2.5.0

- Changed: support attribute caching in Voter

## Version 2.5.0

Compatibility: requires minimum Kimai 2.5.0

- Fixed: use correct base class for migration - removes Doctrine deprecation warning

## Version 2.4.0

Compatibility: requires minimum Kimai 2.5.0

- Changed: moved some translations to core allowing more languages
- Changed: replaced most Gedmo code with own implementation
- Changed: bump PHPStan from level 7 to level 9

## Version 2.3.0

Compatibility: requires minimum Kimai 2.3.0

- Fixed: date formatting failed for timesheets
- Fixed: accessing entries without object ids
- Fixed: added missing listener calls

## Version 2.2.0

Compatibility: requires minimum Kimai 2.1.0

- Changed: use annotation type for routes (deprecation)
- Changed: convert to Doctrine listener (deprecation)

## Version 2.1.0

Compatibility: requires minimum Kimai 2.0.33

- Fixed: possible pagination issue

## Version 2.0.6

Compatibility: requires minimum Kimai 2.0.20

- Added: Hint in README about batch updates
- Fixed: removed "plugin" from permission header

## Version 2.0.5

Compatibility: requires minimum Kimai 2.0.20

- Fixed: compatibility with Kimai 2.0.20 and Tabler Beta 19
- Added: title for Audit screen of invoices

## Version 2.0.4

Compatibility: requires minimum Kimai 2.0.9

- Added: upgrade item actions to use v2 API

## Version 2.0.3

Compatibility: requires minimum Kimai 2.0.9

- Fixed: possible error for deleted users in timesheet listing

## Version 2.0.2

Compatibility: requires minimum Kimai 2.0.9

- Added: identify listener for auto-deactivation during batch imports

## Version 2.0.1

Compatibility: requires minimum Kimai 2.0

- Fixed: deprecations with Kimai 2.0.2

## Version 2.0

Compatibility: requires minimum Kimai 2.0

- Fixed: compatibility with Kimai 2.0

## Version 1.18

Compatibility: requires minimum Kimai 1.16.10

- Added: Polish translations - thanks @KonradMazur

## Version 1.17

Compatibility: requires minimum Kimai 1.16.10

- Fixed: query speed for entries with multiple parallel changes

## Version 1.16

Compatibility: requires minimum Kimai 1.16.10

- Added: new fields
    - Customer: `billable`
    - Project: `billable` and `invoiceText`
    - Activity: `billable` and `invoiceText`
- Fixed: activity details for global activity cause a 500 error

## Version 1.15

Compatibility: requires minimum Kimai 1.16.10

- changed translation for next kimai release
- added comment field to invoice

## Version 1.14

Compatibility: requires minimum Kimai 1.16.7

- Fixed: missing token in invoice audit log screen
- Changed: Using changed translation keys

If you install this on earlier Kimai versions, you will experience missing translations in Audit-Log screens.

## Version 1.13

Compatibility: requires minimum Kimai 1.15

- Added: access audit logs for own timesheet via `audit_own_timesheet` from "my timesheet" view

## Version 1.12

Compatibility: requires minimum Kimai 1.15

- Added: record User columns: `color`, `accountNumber`
- Added: record Customer column: `budgetType`
- Added: record Project column: `budgetType`
- Added: record Activity column: `budgetType`
- Fixed: definitions for new Kimai version

## Version 1.11.1

Compatibility: requires minimum Kimai 1.14

- Fixed: Cache clear problem during update
- Fixed: Added missing translations
- Fixed: Display deleted users
- Fixed: Page actions

## Version 1.11

Compatibility: requires minimum Kimai 1.14

**Database changes! Execute the installer with `bin/console kimai:bundle:audittrail:install`**

- Added: Keep audit log of custom-fields: Timesheets, Customer, Project, Activity
- Added: Keep audit log of user-preferences
- Added: Cross-linking changes which were executed at the same time (eg. link custom-fields to entities)
- Fixed: Compatibility with entity actions in Kimai 1.14
- Fixed: PHP 8 compatibility

## Version 1.10

Compatibility: requires minimum Kimai 1.11

- Added: Using bundle installer to unify workflow
- Added: More documentation
- Fixed: Composer 2 compatibility

## Version 1.9

Compatibility: requires Kimai 1.10

- Unified audit log detail pages and titles
- Highlight Audit-Log menu when opening detail page
- Added search filter for action (create, update, delete)
- New tracked fields:
    - Timesheet: `category`, `billable`, `internalRate`
    - User: `auth`, `password_requested_at`
- New tracked entity:
    - Invoice: `customer`, `user`, `invoiceNumber`, `createdAt`, `timezone`, `total`, `tax`, `currency`, `status`, `dueDays`, `vat`, `invoiceFilename`
- Fixed: opening the detail page for a deleted item resulted in a 500 error
    - Removed action links from detail pages for deleted items
- Fixed: directory separator for Windows installer
- Fixed: translation issue
- Fixed: Deprecation in Pagerfanta

## Version 1.8

Compatibility: requires Kimai 1.7

**Database changes! Execute the installer again**

- record the timezone of a change, to exactly show when a change happened
- added support to see changed configurations
- fix row click in overview opens wrong item
- fix search query

## Version 1.7

Compatibility: requires Kimai 1.7

- display audit logs for deleted items
- new permission `audit_user`
- record `vatId` for customer
- record `start`, `end`, `timezone`,  for projects
- record `user` object changes
- record `system configuration` changes (no display yet)

## Version 1.6

Compatibility: requires Kimai 1.7

- added own permission section for "user roles & permission screen"
- added click handler to table, to directly open one audit log without using the actions menu

## Version 1.5

- Improve permission handling (auto register for ROLE_SUPER_ADMIN, as preparation for Kimai 1.6)

## Version 1.4.2

- Fix version numbers
- Updated changelog

## Version 1.4.1

- Fix overview page for empty logs

## Version 1.4

- Fix column visibility
- Updated docs
- API changes for Kimai 1.4

## Version 1.3

- Code style formattings
- Changes for Kimai 1.3
- Added Audit log page with overview of all entries

## Version 1.2

- Improved change time display
- Added installation command

## Version 1.1.1

- Changes required for Kimai 1.1

## Version 1.0

- First release for Kimai 1.0
