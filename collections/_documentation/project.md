---
title: Projects
description: Projects are assigned to customers and are linked to activities
---

The project administration can be found at `Administration > Projects`.

## Create a project

There is a configuration (can be configured at [System → Settings]({% link _documentation/configurations.md %})), which allows to copy teams of the current user to newly created projects. 
This is mostly useful when teamleads manage their own projects and should have immediate access to them after creation.

## Copy a project

In the listing page you can open the context menu of any project and click "Create copy".

By copying a project, you will create a new project, whose name is applied the string ` [COPY]` and in addition to that, the following happens:

- A new project number will be created
- The start of the project is set to the end of the copied project
- The end of the new project is empty
- Assigned teams will be assigned to new the project 
- Rates for the project will be created and attached to the new project
- Custom field content will be duplicated and saved for the new project
- ALL project specific activities will be copied and linked to the new project (their names will not be changed)
- Activity specific rates will be applied to the new activities

## Manage projects

### Colors

Each project can be assigned its own color, for easier identification in many places throughout Kimai.

If no color is applied, Kimai will fall back to the customers color and finally to the [default color]({% link _documentation/customer.md %}). 

### Start date / end date 

Both dates are optional and define the time range in which times can be booked on this project.

If a date is set, the project is only offered in the project dropdown when the date of the record falls inside that range. 
Records outside the range are rejected when saving as well, so the restriction also applies to the API and to imports.

Both dates are inclusive: a record on the start date or on the end date is still allowed.

This avoids ghost bookings on projects that have not started yet or are already finished. 
If a booking outside the range is necessary, a teamlead or admin can widen or remove the dates in the project settings.

Existing records are not changed when you set these dates. 
They stay visible in all listings, reports and invoices, but a record that now lies outside the range can only be saved 
again after it was moved back into the range. Use `Times locked until` if you want to freeze records instead of restricting new ones.

### Times locked until

This optional date closes a project period: all times up to and including this date are frozen and can no longer be created, edited, deleted, copied or stopped (this applies to every user, including administrators).

The project itself is not affected. It stays visible in listings, reports and invoices, and its settings (name, budget, rates, 
end date, customer, ...) can still be changed - the lock only protects the timesheet records. Locking a period therefore does 
not stop you from exporting or invoicing it, which is the main reason to use this field instead of hiding the project.

To reopen a period, clear the date or move it further into the past.

{% alert warning %}
A timesheet that is still running and was started before the lock date cannot be stopped, because that would write into a closed period. 
Such a record can still be edited, so you can move it to a date after the lock and stop it there. 
{% endalert %}

The `Time-clock` and `Duration` [time-tracking modes]({% link _documentation/configurations.md %}) do not offer the begin date
in the users edit form - an administrator has to move the record or clear/move the lock date to release the record.

This field locks one project at a time. To close a period for the whole installation, use the `Lockdown period` setting under 
[System → Settings]({% link _documentation/configurations.md %}) instead - unlike this field, the lockdown period can be bypassed 
by users with the according permissions.

### Billable

{% include snippets/billable.md entity="Project" %} 

### Budgets

{% include documentation/budgets.md permission="project" %} 

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

### Project number

{% include snippets/number-format.md entity="project" entities="projects" Entity="Project" article="a" counter="{pc}" section="Project" setting="Project number format" length="10" creation_hint=" or when an existing project is copied" %}

### Access permissions

- Inherit permissions from their linked customer
- Accessible to all users if no teams are assigned at customer and project level
- If one or more teams are assigned to the project, only members of these teams can use it, while also respecting the customer teams

## Project listing

{% include docs-image.html src="/images/documentation/project-filter.webp" title="Project toolbar filter" %}

The **Visible** filter in the toolbar has three states:
- `Yes` - all visible projects: the project itself and its customer are visible
- `No` - all projects that are exclusively invisible by their own visibility state
- `Both` - all projects: not filtering on their own or the customer visibility

### Invisible projects

Projects can be invisible or inactive (due to end or start date). By default, only visible projects will be shown.
But you can use the project filter to show all or only invisible projects.

Invisible projects will be highlighted in the listing table:

{% include docs-image.html src="/images/documentation/project-listing-visibility.webp" title="Visible and invisible projects in the project listing" %}

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
