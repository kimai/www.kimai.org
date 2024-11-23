---
title: Activities
description: Activities in Kimai
---

Activities describe the type of work performed during a time-record.

## Activity types

Kimai supports two activity types: `global` and `project specific`.

### Project specific activities

These activities are linked to one project and can only be selected when working on that specific project.

### Global activities

Global activities are available for all projects. They typically represent common tasks that occur across different projects, such as:
- Meetings
- Phone calls
- Administration

The choice of activities depends on your industry and workflow requirements.

Projects have a configuration flag to disallow global activity usage. 

### Changing the activity type

Once created, activities have limited type modification options:
- Project specific activities can be converted to global by clearing the project dropdown
- Global activities cannot be assigned to projects
- Converting global to project specific is not possible
- Re-assigning to different projects is not possible

These restrictions protect timesheet integrity and prevent incorrect rate calculations.

If you need to change an activity's assignment nevertheless, follow these steps:
1. Create a new activity with correct assignment
2. Open timesheet section and filter for the old activity
3. Select all relevant timesheet entries
4. Use batch-update to assign the new activity
5. Delete the old activity once no timesheets use it

## Managing activities

### Colors

Activities can have individual colors for better visual identification. The color hierarchy is:
1. Activity color
2. Project color
3. Customer color
4. System default color

### Billable

{% include snippets/billable.md entity="Activity" %}

### Budgets

{% include snippets/budgets.md permission="activity" %}

### Prices

{% include snippets/rates.md permission="activity" %}

### Visibility

Visibility settings control activity access:
- Hidden activities are removed from all dropdowns
- Existing links retain the activity as pre-selected option
- New timesheet records cannot use hidden activities

The visibility filter has three states:
- Yes: Shows visible activities (including project and customer visibility)
- No: Shows activities hidden by their visibility setting
- Empty: Shows all activities regardless of visibility

## Filter and search

Available filters:
- `customer`
- `project`
- `global` / `non-global`
- `visibility`

Free text search applies to:
- `name`
- `comment`

{% include snippets/search-custom-field.md %}

## Deleting an activity

Delete activities via `Administration > Activities`. Consider using visibility settings instead of deletion for used activities.

Use the row context menu to access the delete option. The system will either:
- Confirm safe deletion for unused activities
- Show activity statistics and prompt for timesheet reassignment
