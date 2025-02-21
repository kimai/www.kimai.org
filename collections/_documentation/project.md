---
title: Projects
description: Projects in Kimai
---

Projects in Kimai are assigned to customers and are linked to activities, which are then used for time-records.

The project administration can be found at `Administration > Projects`.

## Create a project

There is a configuration (can be configured at [System > Settings]({% link _documentation/configurations.md %})), which allows to copy teams of the current user to newly created projects. 
This is mostly useful when teamleads manage their own projects and should have immediate access to them after creation.

## Manage projects

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

{% include snippets/billable.md entity="Project" %} 

### Budgets

{% include snippets/budgets.md permission="project" %} 

### Prices

{% include snippets/rates.md permission="project" %}

### Visibility

By toggling the visibility on a project, you:
- hide the project from all drop-downs
- hide the project from the default list in the project administration
- hide the activities for this project from all drop-downs, regardless of their visibility state
- hide the activities for this project from the default list in the activities administration

Please note:
- All currently linked objects will still show the project in the dropdown as pre-selected option
  - You can still change the project on timesheet records and activities, which used it before
  - You cannot create new activities for this project
  - You cannot create new timesheet records for this project 
- You can still access invisible projects by changing the visibility filter on the listing view

### Permissions

- Inherit permissions from their linked customer
- Accessible to all users if no teams are assigned at customer and project level
- If a team is assigned to the project, only team members can use it, while also respecting the customer teams

## Project listing

{% include docs-image.html src="/images/documentation/project-filter.webp" title="Project toolbar filter" width="700px" %}

The **Visible** filter in the toolbar has three states:
- `Yes` - all visible projects: the project itself and its customer are visible
- `No` - all projects that are exclusively invisible by their own visibility state
- `Both` - all projects: not filtering on their own or the customer visibility

### Invisible projects

Projects can be invisible or inactive (due to end or start date). By default, only visible projects will be shown.
But you can use the project filter to show all or only invisible projects.

Invisible projects will be highlighted in the listing table:

{% include docs-image.html src="/images/documentation/project-listing-visibility.webp" title="Visible and invisible projects in the project listing" width="700px" %}

### Filter and search 

The search supports filtering by the fields:
- `customer`
- `visibility`

Besides these filters, you can query for a free search term, which will be searched in the fields:
- `name`
- `comment`
- `orderNumber`

{% include snippets/search-custom-field.md %}

### Delete a project

Projects can be deleted from the `Project listing` view.

{% alert danger %}Usually it is not a good idea to delete a project that was used before, as all linked activities and especially timesheets will be deleted as well. Consider to switch the visibility instead to hide it.{% endalert %}

Right-click on a row (or open the action dropdown at the end of it) to see all available actions for the selected project.
The last action in the list is `Delete` - once you click it you wil get a feedback screen which either tells you that the
project is unused and can be safely deleted, or it will show you quick stats of the project and then ask you to re-assign
the attached timesheets to another project.  
