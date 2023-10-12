---
title: Projects
description: Projects in Kimai
toc: true
redirect_from:
- /documentation/manual/projects.html
- /documentation/manual/administration/projects.html
- /documentation/2.0/project.html
---

Projects in Kimai are assigned to customers and are linked to activities, which are then used for time-records.

## Creating a project

There is a configuration (can be configured at [System > Settings]({% link _documentation/configurations.md %})), which allows to copy teams of the current user to newly created projects. 
This is mostly useful when teamleads manage their own projects and should have immediate access to them after creation.

## Managing projects

### Colors

Each project can be assigned its own color, for easier identification in many places throughout Kimai.

If no color is applied, Kimai will fall back to the customers color and finally to the [default color]({% link _documentation/customer.md %}). 

### Start date / end date 

Having a project start and end date is optional, but it can help you to limit the project visibility in the "edit timesheet record" screen.

Setting a date for project start or end will place an implicit restriction for project selection when creating a timesheet record. 
If the date of the record falls before the project start or after the project end the project will not be listed in the dropdown menu. 

This behavior is intended to avoid ghost bookings on not yet started or already finished projects. 
If the booking of records is necessary, the team lead or admin can remove the date restriction in the project settings.

Start and end-date are inclusive, so both dates will be included when filtering any data.

### Billable

{% include contents/billable.md entity="Project" %} 

### Budgets

{% include contents/budgets.md permission="project" %} 

### Prices

{% include contents/rates.md permission="project" %}

### Visibility

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
- you can still access the hidden entries by changing the visibility filter on the toolbars

The visibility filter in the toolbar has three state: 
- Visible: Yes (all projects that are "really" visible, meaning: the project and linked customer are visible)
- Visible: No (all projects that are exclusively invisible by their own visibility state)
- Visible "empty" (all projects: not filtering on their own or the customers visibility)

## Filter and search 

The search supports filtering by the fields:
- `customer`
- `visibility`

Besides these filters, you can query for a free search term, which will be searched in the fields:
- `name`
- `comment`
- `orderNumber`

{% include documentation/search-custom-field.md %}

## Deleting a project

Projects can be deleted from the Project listing view via `Administration > Projects`.

Usually it is not a good idea to delete a used project, consider to switch the visibility instead to hide it.

Right-click on a row (or open the action dropdown at the end of it) to see all available actions for the selected project.
The last action in the list is `Delete` - once you click it you wil get a feedback screen which either tells you that the
project is unused and can be safely deleted, or it will show you quick stats of the project and then ask you to re-assign
the attached timesheets to another project.  
