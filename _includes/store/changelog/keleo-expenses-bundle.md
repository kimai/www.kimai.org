## Version 2.11.0

Compatibility: requires minimum Kimai 2.10.0

- Changed: cache permissions in view
- Changed: support attribute caching in Voter

## Version 2.10.0

Compatibility: requires minimum Kimai 2.10.0

- Fixed: use correct base class for migration - removes Doctrine deprecation warning

## Version 2.9.0

Compatibility: requires minimum Kimai 2.10.0

- Added: System-Configuration to disable time field

## Version 2.8.0

Compatibility: requires minimum Kimai 2.9.0 (but 2.10 is recommended)

- Changed: remove time field and set to 12:00:00 internally
- Changed: set "now" as pre-filled default value for an expense date
- Changed: more DateTime to DateTimeImmutable refactorings
- Fixed: "not null" category validator does not highlight correct field

## Version 2.7.0

Compatibility: requires minimum Kimai 2.9.0

- Changed: internal DateTime to DateTimeImmutable refactoring
- Changed: replace deprecated RestRoute attribute with SF native one
- Changed: replace deprecated Route vs Attribute annotations

## Version 2.6.0

Compatibility: requires minimum Kimai 2.6.0

- Added: calculate "exported" vs. "not exported" statistics and provide for several statistics
- Added: sort invoice entries if "expense category project" grouping is activated
- Changed: re-use "Expenses" translation for configuration
- Fixed: broken "category" translation

## Version 2.5.0

Compatibility: requires minimum Kimai 2.5.0

- Changed: create default category if none is existing yet
- Changed: moved some translations to core allowing more languages

## Version 2.4.0

Compatibility: requires minimum Kimai 2.1.0

- Use annotation type for routes

## Version 2.3.0

Compatibility: requires minimum Kimai 2.0.33

- Fixed: API pagination compatibility with Kimai 2.0.33

## Version 2.2.3

Compatibility: requires minimum Kimai 2.0.26

- Added: simplify API form setup (no visible changes)
- Fixed: "extended settings" on edit screen collapses on clicking anywhere in the title
- Fixed: compatibility check for Kimai version

## Version 2.2.2

Compatibility: requires minimum Kimai 2.0.9

- Added: upgrade item actions to use v2 API.
- Fixed: locale-switching problem in context menu of calendar (only with Kimai 2.0.19)

## Version 2.2.1

Compatibility: requires minimum Kimai 2.0.9

- Fixed: Teamleads could not limit entries to selected teams

## Version 2.2.0

Compatibility: requires minimum Kimai 2.0.9

- Added: normal users do not see a sub-menu anymore
- Added: Batch delete expenses
- Fixed: 500 error on searches with meta field
- Fixed: Excel export did not respect the current user

## Version 2.1.6

Compatibility: requires minimum Kimai 2.0.9

- Fixed: export query did not respect selected teams
- Fixed: missing closing HTML tag
- Added: improved code style

## Version 2.1.5

Compatibility: requires minimum Kimai 2.0.9

- Fixed: reactivate DataFixtures as service, so they can be used (fixes all demos as well)

## Version 2.1.4

Compatibility: requires minimum Kimai 2.0.9

- Added: identify listener for auto-deactivation during batch imports

## Version 2.1.3

Compatibility: requires minimum Kimai 2.0

- Cleanup PDF export template

## Version 2.1.2

Compatibility: requires minimum Kimai 2.0

- Cleanup translation files

## Version 2.1.1

Compatibility: requires minimum Kimai 2.0

- API: simplified usage of "billableMode" and added description

## Version 2.1.0

Compatibility: requires minimum Kimai 2.0

- API: added route to fetch categories
- API: export "cost" and "description" fields with categories

## Version 2.0.3

Compatibility: requires minimum Kimai 2.0

- Fixed: remove customer from API
- Fixed: API returns 500 on missing user field

## Version 2.0.2

Compatibility: requires minimum Kimai 2.0

- Fixed: enable fields for API, added API description

## Version 2.0.1

Compatibility: requires minimum Kimai 2.0

- Fixed: Duplicate Menu-Subscriber ID

## Version 2.0

Compatibility: requires minimum Kimai 2.0

- Fixed: compatibility with Kimai 2.0
- Added: move expenses to replacement user upon user deletion #99
- Added: dashboard widgets for total expenses of the current user for today/week/month/year
- Added: basic statistics in listing page
- Added: Expenses has it's own top-level-menu with items `Expenses`, `Categories`
- Fixed: clarify API docs

## Version 1.33.0

Compatibility: requires minimum Kimai 1.28.0

- Added: Pre-fill create form via URL (date, project & activity, description, user, metaFields)

## Version 1.32.0

Compatibility: requires minimum Kimai 1.28.0

- Added: Cleanup logic for installations where user count < 2 or team count < 2

## Version 1.31.0

Compatibility: requires minimum Kimai 1.20.2

- Added: Team filter in expense form and query
- Added: Support team filter in invoice query
- Added: Support team filter in export query

## Version 1.30.1

Compatibility: requires minimum Kimai 1.20.2

- Updated/Improved dutch translations - thanks Edward

## Version 1.30

Compatibility: requires minimum Kimai 1.20.2

- Added: NL translations - thanks Edward

## Version 1.29

Compatibility: requires minimum Kimai 1.20.2

- Added: PL translations - thanks @KonradMazur

## Version 1.28

Compatibility: requires minimum Kimai 1.20.2

- Added: Support for invoice text field in project and activity

## Version 1.27

Compatibility: requires minimum Kimai 1.19

- Added: CSS classes in edit form to allow customizations

## Version 1.26

Compatibility: requires minimum Kimai 1.19

- Added: create expense from project detail page
- Added: create expense from activity detail page

## Version 1.25

Compatibility: requires minimum Kimai 1.19

- Added: add expense sums to revenue on dashboard
- Added: show amount/cost/refundable statistics on customer/project/activity detail pages
- Added: pagination support for category page
- Added: description column in category table
- Added: copy category description into expense description upon selection
- Fixed: migration wasn't executed due to invalid namespace

## Version 1.24

Compatibility: requires minimum Kimai 1.15

- Added: allow negative costs
- Added: support for modernized search with filter count and reset action
- Fixed: exporting PDF with many entries/pages
- Fixed: Excel exporter now exposes the correct columns
- Removed: Broken CSV exporter that exposed too many and invalid columns

## Version 1.23

Compatibility: requires minimum Kimai 1.15

- Fixed: emptying the cost field for existing expenses (as admin) caused an error

## Version 1.22

Compatibility: requires minimum Kimai 1.15

- Added: option to customize PDF and HTML export templates by creating new files
- Added: open dialog upon "create copy" (expense duplication), instead of hard copy in list view
- Fixed: removed duplicated date-time from PDF export template
- Fixed: budget/statistic calculation only used cost (without multiplier)

## Version 1.21.1

Compatibility: requires minimum Kimai 1.15

- Fixed: billable state should be ignored in query (expenses were missing in export)
- Fixed: PDF title

## Version 1.21

Compatibility: requires minimum Kimai 1.15

- Added: support 65535 character per custom field value (previously 256 chars)
- Added: color for categories
- Added: use rounding rules for minute dropdown
- Added: configure if expenses should be included in budgets
- Added: include expenses in monthly budget statistics
- Fixed: definitions for new Kimai version

## Version 1.20

Compatibility: requires minimum Kimai 1.14.1

- Added: Include refundable expenses in used customer budget
- Added: Include refundable expenses in used project budget
- Added: Include refundable expenses in used activity budget

## Version 1.19.1

Compatibility: requires minimum Kimai 1.14

- Fixed: Open "create expense from timesheet" dialog in modal

## Version 1.19

Compatibility: requires minimum Kimai 1.14

- Added: Support for bookmarking default search options
- Added: German translations for validation error
- Added: Validation for project begin & end date vs. expense date
- Fixed: Required changes for full compatibility with Kimai 1.14 (broken page-action links in detail pages)
- Fixed: Order of page-action buttons in line with other screens
- Fixed: Allow to import expenses from Kimai 1 into deactivated activities/projects/customers

## Version 1.18.1

Compatibility: requires minimum Kimai 1.12

- Fixed: API datetime expected localized datetime format

## Version 1.18

Compatibility: requires minimum Kimai 1.12

- Fixed: duplicating expenses will duplicate meta-fields as well
- Fixed: API pagination parameters were ignored (size & page)

## Version 1.17

Compatibility: requires minimum Kimai 1.12

- Added: invoice calculator to group expenses by category and timesheets by project
- Fixed: exporting expenses could fail, as the current time was used for start and end date
- Fixed: housekeeping - keep code clean and up2date

## Version 1.16

Compatibility: requires minimum Kimai 1.12

- Added: Include expense items in Kimai export module
- Added: Duplicate expense action in dropdown

## Version 1.15

Compatibility: requires minimum Kimai 1.11

- Added: Display custom-fields sorted by configured internal order
- Added: Export expense custom fields in Excel
- Added: Using bundle installer for unified workflow
- Fixed: Team permission check improvements
- Fixed: Composer 2 compatibility

## Version 1.14

Compatibility: requires minimum Kimai 1.10

- Fixes action dropdown links to filter expenses (multi-select support)
- Changed UI labels from "refundable" to "billable" (to match Kimai wording)
- Fixed group_by problem on some databases including pagination result size
- Use `view_all_data` permission instead of Admin assignment

## Version 1.13

Compatibility: requires minimum Kimai 1.9

- **Activates `view_expense` permission by default for user and teamleads** - if you don't want that: deactivate the permission before upgrading!
- Creates a default "Demo" category if none is existing yet (for new installations only)
- Allow to delete expense categories
    - Re-assign expenses to other category while deleting a category
- Reload list for first expense (on empty list)
- Added Hebrew translation - thanks @eransurg

## Version 1.12

Compatibility: requires minimum Kimai 1.9

- Support custom-fields for expenses
- Added checkbox for "exported" flag for users with `edit_exported_expense` permission
- Added phpstan for static code analysis (internal: no user feature)
- Fixed directory separator for installer on Windows
- Improved API definition (BC break: removed unused `end` field)

Database was changed, you need to run `bin/console kimai:bundle:expenses:install`.

## Version 1.11

Compatibility: requires minimum Kimai 1.9

- Support multi-select in search for: customer, project, activity
- Fix timezone issue in expenses listing
- Use same styles for pdf export than kimai core and fixed UTF-8 issue
- Added `edit_exported_expense` permission check to prevent unallowed edits/deletes of already exported expenses

## Version 1.10

Compatibility: requires minimum Kimai 1.7

- Allow empty activities in "grouped by activity" invoice calculator
- Fix permission issue for non-admins
- Optional display export column in listing

## Version 1.9

Compatibility: requires minimum Kimai 1.7

- Added "grouped by activity" invoice calculator that renders the description for expenses, instead of the activity name
- Fixed translation file names (plugin needs to be deleted before update!)

## Version 1.8.1

Compatibility: requires minimum Kimai 1.7

- Bugfix: cannot change start to a later date

Database columns are changed, you need to run `bin/console kimai:bundle:expenses:install`.

## Version 1.8

Compatibility: requires minimum Kimai 1.7

- Applying default permissions for all roles (check them if you update from a previous version)
- Added field for a "category help text" (which will be displayed behind the category name in the "edit/create expense" form)
- Bugfix: Always set the cost from the category, if the user is not allowed to set it manually (allows switching the category)
- Bugfix: Allow API usage from the docs page

## Version 1.7

Compatibility: requires minimum Kimai 1.7

- Required code changes to be compatible with Kimai 1.7
- Added export functionality in listing page for: PDF, HTML, CSV, Excel
- Added own permission section for "user roles & permission screen"

## Version 1.6

Compatibility: requires minimum Kimai 1.6.2

- Added command to import expenses from Kimai v1
- Removed end field, expenses have a fixed datetime only
- Activity field is now optional

## Version 1.5

Compatibility: requires minimum Kimai 1.6.2

- Support data limitation via getUser() for invoice data filter
- Replaced permission `view_expense_other` by `view_other_timesheet` (check your permission settings after update)
- Fix access for regular user with `view_other_timsheet` permission
- Invoices templates can distinguish between expenses and timesheets via `${entry.type}` (contains `expense`)
- Invoices templates can display the expense catgeory name via `${entry.category}`

## Version 1.4

Compatibility: requires minimum Kimai 1.6.1

- Show multiplier as amount (instead of 1) on invoices

## Version 1.3

Compatibility: requires minimum Kimai 1.6

- Support free search term
- Added API functions:
    - Get expense collection
    - Get expense entity
    - Create expense
    - Update expense
    - Delete expense
- Improve permission handling (auto register for ROLE_SUPER_ADMIN, as preparation for Kimai 1.6)

## Version 1.2

Compatibility: requires minimum Kimai 1.4

**ATTENTION** - when upgrading, you need to configure the new permissions!

- Respect team permissions
- Added new permissions: view_expense_other and edit_expense_cost
- Allow to set default cost on category
- Allow to hide entry based cost field to use only the pre-configured

## Version 1.1

Compatibility: requires minimum Kimai 1.4

- End-date is now optional
- Fixed duplicate index
- Fixed wrong version number
- API changes for Kimai 1.4

## Version 1.0

Compatibility: requires minimum Kimai 1.3

Initial release
