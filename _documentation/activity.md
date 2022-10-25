---
title: Activities
description: Activities in Kimai
toc: true
---

Activities in Kimai are meant to explain the kind of work done for a specific task/timesheet.

## Activity types

Activities can have two different types: `global` and `project specific`.  

### Project specific 

Activities can be assigned to a project, which means you can only choose them if the linked project is active.

### Global activities

Activities can be global, meaning they are not linked to a project and can be used in combination with every project.

Examples for global activities could be:
- meetings
- phone calls
- administrative tasks

These examples might vary heavily between different industries, the main usage are recurring tasks throughout all of your projects.

### Changing the activity type

After an activity was created it cannot be re-assigned to (another) project.

The only change that is possible: project specific activities can be made global by selecting the empty option from the project dropdown.
This change is not reversible.

Global activities cannot be assigned to a project.

The reason for all above restrictions are existing timesheets, which would result in wrong assignments and/or wrong rates otherwise.

Here is the solution/workaround that you have to apply for wrongly assigned activities:

- Create the new activity
- Go to the timesheet section for all users
- Filter all timesheet for the old activity (increase the page size if there are more than 50 results)
- Click the checkbox in the upper left of the result table to check all timesheet rows
- Now choose "Edit" from the dropdown below the table for batch-update mode
- In the batch-update screen: choose the project and new activity and save
- After there is no more timesheet with the old activity you can safely delete it


## Managing activities

### Colors

Each activity can be assigned its own color, for easier identification in various screens.

If no color has been selected, the project color will be used. 
If that is not defined as well, Kimai will fall back to the customer color and finally to the [default color]({% link _documentation/customer.md %}).

### Billable

{% include contents/billable.md entity="Activity" %}

### Budgets

{% include contents/budgets.md permission="activity" %} 

### Rates

{% include contents/rates.md permission="activity" %}

### Visibility
 
By toggling the visibility on an activity, you:
- hide the activity from all drop-downs, regardless of their visibility state
- hide the activity from the default list in the activities administration

Please note:
- all currently linked objects will still show the activity in the dropdown as pre-selected option
  - you can still change the activity on timesheet record, which used it before
  - you cannot create new timesheet records for this activity 
- you can still access the hidden entries by changing the visibility filter on the toolbars

The visibility filter in the toolbar has three state: 
- Visible: Yes (all activities that are "really" visible, meaning: the activity, linked project and customer are visible)
- Visible: No (all activities that are exclusively invisible by their own visibility state)
- Visible "empty" (all activities: not filtering on their own, the projects or customers visibility)

## Filter and search 

The search supports filtering by the fields:
- `customer`
- `project`
- `global` / `non-global`
- `visibility`

Besides these filters, you can query for a free search term, which will be searched in the fields:
- `name`
- `comment`

{% include search-custom-field.md %}
