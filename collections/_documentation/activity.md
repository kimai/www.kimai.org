---
title: Activities
description: Activities in Kimai
---

Activities (usually) describe the type of work performed.

The activity administration can be found at `Administration > Activities`.

## Create an activity

You can create activities from the `activity listing` page or from a `project detail` page.

Kimai supports two activity types: `global` and `project specific` activities.

### Project specific

Project specific activities are linked to one project and can only be selected when working on that specific project.

### Global activities

Global activities are available for all projects. They typically represent common tasks that occur across different projects, such as:
- Meetings
- Phone calls
- Administration

The choice of activities depends on your industry and workflow requirements.

Projects have a configuration flag to disallow global activity usage. 

### Change activity type

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

## Manage activities

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

### Access permissions

Activities follow a hierarchical permission model:

**Global activities**
- Available to all users when no team is assigned
- Only accessible by team members when a team is assigned

**Project-specific activities**
- Inherit permissions from their linked project and customer
- Accessible to all users if no teams are assigned at any level (activity, project, customer)
- When a team is assigned to the activity, only team members can use it, while also respecting the project and customer teams

## Activity listing

{% include docs-image.html src="/images/documentation/activity-filter.webp" title="Activity toolbar filter" width="700px" %}

The **Visible** filter in the toolbar has three states:
- `Yes` - all visible activities: the activity itself and (if non-global) its project and customer are visible
- `No` - all activities that are exclusively invisible by their own visibility state
- `Both` - all activities: not filtering on their own or its project and customer visibility

### Invisible activities

Activities can be invisible. By default, only visible activities will be shown.
But you can use the activity filter to show all or only invisible activities.

Invisible activity will be highlighted in the listing table:

{% include docs-image.html src="/images/documentation/listing-invisible-entry.webp" title="Visible and invisible activities in the activity listing" width="700px" %}

### Filter and search

Available filters:
- `customer`
- `project`
- `global` / `non-global`
- `visibility`

Free text search applies to:
- `name`
- `comment`

{% include snippets/search-custom-field.md %}

### Delete an activity

Activities can be deleted from the `Activity listing` view.

{% alert danger %}Usually it is not a good idea to delete an activity that was used before, as all linked timesheets will be deleted as well. Consider to switch the visibility instead to hide it.{% endalert %}

Use the row context menu to access the delete option. The system will either:
- Confirm safe deletion for unused activities
- Show activity statistics and prompt for timesheet reassignment
