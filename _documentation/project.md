---
title: Projects
description: Projects in Kimai
toc: true
---

Projects in Kimai are assigned to customers and are linked to activities, which are then used for time-records.

## Project colors

Each project can be assigned its own color, for easier identification in many places throughout Kimai.

If no color is applied, Kimai will fallback to the customers color and finally to the [default color]({% link _documentation/customer.md %}). 

## Project start date / end date 

Having a project start and end date is optional, but it can help you to limit the project visibility in the "edit timesheet record" screen.

Setting a date for project start or end will place an implicit restriction for project selection when creating a timesheet record. 
If the date of the record falls before the project start or after the project end the project will not be listed in the dropdown menu. 

This behavior is intended to avoid ghost bookings on not yet started or already finished projects. 
If the booking of records is necessary, the team lead or admin can remove the date restriction in the project settings.

## Budgets

{% include budgets.md permission="project" %} 

## Rates

{% include rates.md permission="project" %}

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
- you can still access the hidden entries by changing the visibility filter on the toolbars

The visibility filter in the toolbar has three state: 
- Visible: Yes (all projects that are "really" visible, meaning: the project and linked customer are visible)
- Visible: No (all projects that are exclusively invisible by their own visibility state)
- Visible "empty" (all projects: not filtering on their own or the customers visibility)

## Filter and search 

The search drop-down supports filtering by the fields:
- `customer`
- `visibility`

Besides these filters, you can query for a free search term, which will be searched in the fields:
- `name`
- `comment`
- `orderNumber`

Additionally you can filter for [custom fields]({% link _documentation/meta-fields.md %}) by using a search phrase like `location:homeoffice`.
This would find all projects with the custom field `location` matching the term `homeoffice`.

The search terms will be found within the full value, so searching for `office` would find:
- `I love working in my office`
- `Office` 
- `This office is beautiful`
- `Our offices are very noisy`

You can mix the search term and use multiple meta-field queries:
- `location:homeoffice projectname foo` - find all projects matching the search term `projectname foo` with the custom field `location` matching the term `homeoffice` 
- `location:homeoffice contract:foo projectname` - find all projects matching the search term `projectname` with the custom field combination: `location` matching the term `homeoffice` and `contract` matching the term `foo` 
- `location:homeoffice contract:foo` - find all projects with the custom field combination: `location` matching the term `homeoffice` and `contract` matching the term `foo`
