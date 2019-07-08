---
title: Projects
description: Projects in Kimai 2
---

Projects in Kimai are assigned to customers and are linked to activities, which are then used for time-records.

## Project colors

Each project can be assigned its own color, for easier identification in the timesheets.

If no color is applied, the customers color will be used.

If an activity linked to the project does not have its own color, the projects color will be used (and as fallback again the customers color).

See [customer documentation]({% link _documentation/customer.md %}) for the default color.

## Time budget
{% include new_since.html version="1.0" %}

{% include time_budget.md %}

## Visibility

By toggling the visibility on a project, you:
- hide the project from all drop-downs
- hide the project from the default list in the project administration
- hide the activities for this project from all drop-downs, regardless of their visibility state
- hide the activities for this project from the default list in the activities administration

Please note:
- all currently linked objects will still show the project in the dropdown as pre-selected option
  - you can still change the project on timesheet records and activities, which used it before
  - you cannot create new activities for this project
  - you cannot create new timesheet records for this project 
- you can still access the hidden entries by changing the visibility filter on the the toolbars 

The visibility filter in the toolbar has three state: 
- Visible: Yes (all projects that are "really" visible, meaning: the project and linked customer are visible)
- Visible: No (all projects that are exclusively invisible by their own visibility state)
- Visible "empty" (all projects: not filtering on their own or the customers visibility)
