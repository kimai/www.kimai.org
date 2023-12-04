## Version 2.3.0

Compatibility: requires minimum Kimai 2.1.0

- Fixed: route mapping type changed to attribute
- Fixed: removed sticky table header in detail page for timesheet list

## Version 2.2.0

Compatibility: requires minimum Kimai 2.0.33

- Fixed: API param `pageSize` did not allow arbitrary values
- Fixed: API pagination compatibility with Kimai 2.0.33

## Version 2.1.8

Compatibility: requires minimum Kimai 2.0.26

- Added: simplify API form setup (no visible change)
- Fixed: compatibility check for Kimai version

## Version 2.1.7

Compatibility: requires minimum Kimai 2.0.26

- Fixed: removed empty footer on detail pages
- Fixed: use collapsible element with wide header for extended settings

## Version 2.1.6

Compatibility: requires minimum Kimai 2.0.20

- Fixed: removed unused API definition TaskQuery

## Version 2.1.5

Compatibility: requires minimum Kimai 2.0.20

- Fixed: compatibility with Kimai 2.0.20 and Tabler Beta 19

## Version 2.1.4

Compatibility: requires minimum Kimai 2.0.6

- Added: added "create task" actions to detail pages

## Version 2.1.3

Compatibility: requires minimum Kimai 2.0.6

- Added: upgrade item actions to use v2 API
- Added: allow to import single fixture, reduce max tasks

## Version 2.1.2

Compatibility: requires minimum Kimai 2.0.6

- Fixed: reactivate DataFixtures as service, so they can be used (fixes all demos as well)

## Version 2.1.1

Compatibility: requires minimum Kimai 2.0.6

- Fixed: using translations for widget title

## Version 2.1.0

Compatibility: requires minimum Kimai 2.0.5

- Translation cleanup
- Moved translations to main application, thus making them available via Weblate

## Version 2.0.1

Compatibility: requires minimum Kimai 2.0

- Fixed: moved "Task Management" to top-level menu

## Version 2.0

Compatibility: requires minimum Kimai 2.0

- Fixed: compatibility with Kimai 2.0

## Version 1.16

Compatibility: requires minimum Kimai 1.19

- Added: allow time logging to any task with `task_start_all` permission

## Version 1.15

Compatibility: requires minimum Kimai 1.19

- Added: added duration select (dropdown) to estimation field
- Added: loosen strict format for estimation field (allow to enter a duration like `2.5` and `5h`)
- Added: moved fields of the form

## Version 1.14

Compatibility: requires minimum Kimai 1.19

- Added: task list to customer/project/activity detail pages

## Version 1.13

Compatibility: requires minimum Kimai 1.15

- Added: French translations

## Version 1.12

Compatibility: requires minimum Kimai 1.15

- Fixed: compatibility with Kimai 1.16

## Version 1.11

Compatibility: requires minimum Kimai 1.15

- Added: New permission `task_team_view` allowing to see the tasks of all team members (assigned to all default roles)
- Fixed: limited task visibility for regular users on listing page

## Version 1.10

Compatibility: requires minimum Kimai 1.15

- Added: Support configurable amount of calendar drag&drop items
- Added: API method to fetch Task collection with search filter
- Added: API method to fetch one Task by ID
- Added: API method to create a new Task
- Added: API method to update an existing Task
- Added: Duplicate task action (#38)
- Fixed: definitions for new Kimai version

## Version 1.9

Compatibility: requires minimum Kimai 1.14

- Added: Support for bookmarking default search options
- Added: Button to create Task from Activity
- Fixed: Reload details page after editing task
- Fixed: Full compatibility with Kimai 1.14
- Fixed: Better responsiveness on task reports

## Version 1.8

Compatibility: requires minimum Kimai 1.11

- Added: Detail page (needs `task_details` permission) with
    - List of comments
    - List of all timesheets
- Added: New "work description" field to define the real task todos
- Added: New permission `task_start_all` (by default assigned to `ROLE_SUPER_ADMIN` and `ROLE_ADMIN`)
- Added: New permission `task_details` (by default assigned to all roles)
- Added: Duplicated timesheets will be linked to the Task as well
- Added: Start pending tasks (also from dashboard widgets)
- Added: Export of Tasks as XLSX
- Changed: Clicks in widgets open detail page
- Changed: Permission `task_assign` now assigned to `ROLE_USER` by default

## Version 1.7.2

Compatibility: requires minimum Kimai 1.11

- Added: Finnish translations - thanks @NikoGrano

## Version 1.7.1

Compatibility: requires minimum Kimai 1.11

- Fixed: Task form breaks API documentation

## Version 1.7

Compatibility: requires minimum Kimai 1.11

- Added: activity column to listing page (hidden by default)
- Added: times for "restarted activities" will now be counted for the task (see #16)
- Added: API endpoint to log working times for a task
- Added: Drag and Drop support for logging task work via calendar
- Added: Report for all teams with their assigned tasks
- Added: Using Kimai bundle installer for unified workflow
- Fixed: Composer 2 compatibility

## Version 1.6

Compatibility: requires minimum Kimai 1.10

- Added: Support for tags
- Fixed: Icons and active state in "My tasks" widget (see #14)
- Added: Permission `task_edit_other` allows to unassign and close tasks for other users (see #22)
- Added: Time estimation for tasks with progressbar in listing page (see #3)
- Added: Report for all users with their assigned tasks

## Version 1.5

Compatibility: requires minimum Kimai 1.10

- Fixed: Pagination on Dashboard
- Added: User preference panel with own section
- Added: Highlight menu when opening edit/create screens in new tab

## Version 1.4

Compatibility: requires minimum Kimai 1.10

- Click on widget row opens edit dialog
- Added CI for static analysis and code linting workflows
- Use `view_all_data` permission instead of Admin assignment
- Fixed: directory separator for Windows installer
- Fixed: deprecation warnings for 1.10

## Version 1.3

Compatibility: requires minimum Kimai 1.9

- Show color dots with tooltips (project name /customer name) in dashboard widgets
- Support multi-selects in filter for customer/project/activity

## Version 1.2

Compatibility: requires minimum Kimai 1.7

- Bugfix: admins without teams cannot select user [issue #11](https://github.com/kevinpapst/TaskManagementBundle/pull/11)

## Version 1.1

Compatibility: requires minimum Kimai 1.7

- Added user-preference to configure the amount of rows in the dashboard widgets
- Bugfix: edit form for normal users removed team, see [issue #6](https://github.com/kevinpapst/TaskManagementBundle/issues/6)
- Bugfix: admins do not see all tasks in dashboard, see [issue #8](https://github.com/kevinpapst/TaskManagementBundle/issues/8)

## Version 1.0

Compatibility: requires minimum Kimai 1.7

- Initial release
