---
title: Activities
description: Activities in Kimai 2
toc: true
---

Activities in Kimai are defining the current task you are working on.

## Global activities vs project activities

Activities can be assigned to a project, which means you can only choose them if the linked project was chosen before.
But activities can also be global, meaning they are not linked to a project and can be re-used with EVERY project and customer.

Examples for global activities are things like:
- meetings
- phone calls
- administrative tasks

So tasks which repeat in each of your projects.

## Activity colors

Each activity can be assigned its own color, for easier identification in the timesheets.

If no color is applied, the project color will be used.

See [customer documentation]({% link _documentation/customer.md %}) for the default color.

## Time budget

{% include time_budget.md %}

## Visibility

By toggling the visibility on a activity, you:
- hide the activity from all drop-downs, regardless of their visibility state
- hide the activity from the default list in the activities administration

Please note:
- all currently linked objects will still show the activity in the dropdown as pre-selected option
  - you can still change the activity on timesheet record, which used it before
  - you cannot create new timesheet records for this activity 
- you can still access the hidden entries by changing the visibility filter on the the toolbars 

The visibility filter in the toolbar has three state: 
- Visible: Yes (all activities that are "really" visible, meaning: the activity, linked project and customer are visible)
- Visible: No (all activities that are exclusively invisible by their own visibility state)
- Visible "empty" (all activities: not filtering on their own, the projects or customers visibility)

## Filter and search 

The search drop-down supports filtering by the fields:
- `customer`
- `project`
- `global` / `non-global`
- `visibility`

Besides these filters, you can query for a free search term, which will be searched in the fields:
- `name`
- `comment`

Additionally you can filter for [custom fields]({% link _documentation/meta-fields.md %}) by using a search phrase like `location:homeoffice`.
This would find all activities with the custom field `location` matching the term `homeoffice`.

The search terms will be found within the full value, so searching for `office` would find:
- `I love working in my office`
- `Office` 
- `This office is beautiful`
- `Our offices are very noisy`

You can mix the search term and use multiple meta-field queries:
- `location:homeoffice activityname foo` - find all activities matching the search term `activityname foo` with the custom field `location` matching the term `homeoffice` 
- `location:homeoffice contract:foo activityname` - find all activities matching the search term `activityname` with the custom field combination: `location` matching the term `homeoffice` and `contract` matching the term `foo` 
- `location:homeoffice contract:foo` - find all activities with the custom field combination: `location` matching the term `homeoffice` and `contract` matching the term `foo`
