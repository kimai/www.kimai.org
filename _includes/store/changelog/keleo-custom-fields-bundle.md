## Version 2.5.0

Compatibility: requires minimum Kimai 2.5.0

- Fixed: auto-tags support in detail pages (in cases where many tags already exist)

## Version 2.4.1

Compatibility: requires minimum Kimai 2.5.0

- Changed: import Route attribute from correct namespace
- Changed: removed API security definition

## Version 2.4.0

Compatibility: requires minimum Kimai 2.5.0

- Changed: do not load all meta-fields from database on every page load

## Version 2.3.0

Compatibility: requires minimum Kimai 2.5.0

- Changed: moved some translations to core allowing more languages

## Version 2.2.0

Compatibility: requires minimum Kimai 2.1.0

- Use annotation type for routes

## Version 2.1.0

Compatibility: requires minimum Kimai 2.0

- Simplified listing view

## Version 2.0.7

Compatibility: requires minimum Kimai 2.0

- Fixed: prevent error if tag name exceeds 100 character

## Version 2.0.6

Compatibility: requires minimum Kimai 2.0

- Added: support to display "order" column

## Version 2.0.5

Compatibility: requires minimum Kimai 2.0

- Fixed: date-time picker

## Version 2.0.4

Compatibility: requires minimum Kimai 2.0

- Fixed: default value field for new entities

## Version 2.0.3

Compatibility: requires minimum Kimai 2.0

- Added: Hide "visibility" fieldset in a collapsible box
- Fixed: Hide "default value" field for new rules, as this could cause transformation issues
- Fixed: Using InvoiceTemplate field caused a 500 error

## Version 2.0.2

Compatibility: requires minimum Kimai 2.0

- Fixed: always preload all rules, reducing SQL count by one for most pages

## Version 2.0.1

Compatibility: requires minimum Kimai 2.0

- Fixed: auto-tagging creates tag with empty string
- Fixed: code-style for PHPStan on level 9
- Fixed: checking visibility rules on search requests

## Version 2.0

Compatibility: requires minimum Kimai 2.0

- Fixed: compatibility with Kimai 2.0
- Added: Tags-autotype to force tags upon timesheets depending on Customer/Project/Activity

## Version 1.24.4

Compatibility: requires minimum Kimai 1.17

- Fix: 500 upon edge case permission checks for expense meta-fields

## Version 1.24.3

Compatibility: requires minimum Kimai 1.17

- Added: per request caching of rules

## Version 1.24.2

Compatibility: requires minimum Kimai 1.17

- Fixed: deprecation with PHP 8.1

## Version 1.24.1

Compatibility: requires minimum Kimai 1.17

- Fixed: allow usage in commands (invoices/exports => all protected fields will be visible)

## Version 1.24

Compatibility: requires minimum Kimai 1.17

- Added: new choice (drop-down) field with filter / inline search for large datasets
- Added: Use field type translation in index / listing page

## Version 1.23

Compatibility: requires minimum Kimai 1.17

- Fix: permission checks for expense meta-fields

## Version 1.22

Compatibility: requires minimum Kimai 1.17

- Translated field types

## Version 1.21

Compatibility: requires minimum Kimai 1.17

- Added support for Invoices

## Version 1.20

Compatibility: requires minimum Kimai 1.15

- Added French translations

## Version 1.19

Compatibility: requires minimum Kimai 1.15

- Fix API call with entityType
- Change translation file extension from .xliff to .xlf

## Version 1.18

Compatibility: requires minimum Kimai 1.15

- Added: support 65535 character per custom field value (previously 256 chars)
- Fixed: definitions for new Kimai version

## Version 1.17

Compatibility: requires Kimai 1.14

- Added: column toggle dialog
- Added: url field
- Added: improved form layout and usability
- Added: translations for form
- Fixed: deprecation warnings about controller config
- Fixed: better internal API (technical debt)
- Fixed: 500 error when saving empty label
- Fixed: custom fields for expenses being displayed even with deactivated expense bundle

## Version 1.16

Compatibility: requires Kimai 1.11

- Added: define key and title independently for choice lists
- Fixed: allow longer default values (eg. for long choice-lists)

## Version 1.15

Compatibility: requires Kimai 1.11

- Added: Using new core installer to prevent not-found migrations
- Added: Default visibility changed to `true`
- Fixed: Composer 2 compatibility

## Version 1.14

Compatibility: requires Kimai 1.10.2

- Added sorting of custom-fields (only works reliable with Kimai 1.10.2)
- Configure "section name" for user-preferences (to separate groups of preferences)
- Improved responsiveness for small screens
- Added help link

## Version 1.13

Compatibility: requires Kimai 1.9

- Fixed translation in overview
- Updated documentation

## Version 1.12

Compatibility: requires Kimai 1.9

- Added API to fetch available meta fields (eg. to support apps)
- Allow to use meta-fields in subclass of base entities (for devs only)
- Fix validation bug when updating user meta field #48

## Version 1.11

Compatibility: requires Kimai 1.9

- Support custom-fields with expenses
- Added phpstan for static code analysis (internal: no user feature)
- Fixed directory separator for installer on Windows
- Disallow to change field-type after it was created (changing the type causes bugs if the field was already used)

## Version 1.10

Compatibility: requires Kimai 1.9

- Allow digits in internal name
- Allow invoice template as meta-field (mainly to be used with projects or customers)
- Bugfix: prevent creation of user-preferences with already existing names
- Bugfix: allow empty help text

## Version 1.9

Compatibility: requires Kimai 1.7

- Added "email" type
- Added "textarea" type
- Bugfix: protected fields which were saved, became visible to all users

## Version 1.8

Compatibility: requires Kimai 1.7

- Added own permission section for "user roles & permission screen"
- Force strict rules on internal field name: allowed are lower case character and underscore
- Fix reload bug for first time users

## 1.7

Compatibility: requires Kimai 1.6.2

- New config, which allows to add a permission/user-role to limit access to a custom field for certain users

## 1.6

Compatibility: requires Kimai 1.6.2

- Allow to order user preferences

## 1.5

Compatibility: requires Kimai 1.6

- Improve permission handling (auto register for ROLE_SUPER_ADMIN, as preparation for Kimai 1.6)

## 1.4.1

Compatibility: requires Kimai 1.4

- Fix compatibility with Kimai 1.4

## 1.4

Compatibility: requires Kimai 1.6 (by accident)

- Fix editing checkbox (boolean) fields
- Fix default values for custom fields
- Allow optional user preferences
- Format date/datetime and boolean values in admin list
- Fix problems with invalid date and datetime default values

## 1.3

Compatibility: requires Kimai 1.4

- Support for showing all visible fields and user preferences
- Support for exporting all visible fields and user preferences
- Support to set a label for each field
- Added support for help labels
- Added new database columns (run the update: `bin/console kimai:bundle:metafields:install`)

## 1.2

- Allow date and datetime as input fields
- Added installer command (+ migration support)

## 1.1.1

- Support default value for user-preferences

## 1.1

- Support for adding user preferences

## 1.0

- Initial release
