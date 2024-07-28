---
title: Billable
description: How billable times are configured and what they do
related: 
  - timesheet
  - customer
  - project
  - activity
---

The `billable` field is used to determine if timesheet entries should be included in [invoices]({% link _documentation/invoices.md %}), 
budget calculations and certain statistics. The [API]({% link _documentation/developer/rest-api.md %}) supports filtering for the `billable` field as well. 

The following [permissions]({% link _documentation/permissions.md %}) define if a user is allowed to set the timesheet field: 
- `edit_billable_own_timesheet` - for own timesheet, by default assigned to: Teamlead, Administrator and System-Admin.
- `edit_billable_other_timesheet` - for timesheet of other users. By default, assigned to: Teamlead, Administrator and System-Admin.

## Timesheet 

Users with the billable permissions will see a dropdown (select-box) with 3 entries: `Automatic`, `Yes` and `No`.

- `Yes`: timesheet is billable
- `No`: timesheet is not billable
- `Automatic` (default): will lead to a detection of the billable state (explained below)  

## The billable configuration

Each of the 3 level entities `Activity`, `Project` and `Customer` have a billable flag, which defines whether a timesheet for it should be billable or not.

By default, each existing and new entity is billable. If you have certain entities that cannot be billed to customers (e.g. an Activity for internal work), 
then the `billable` checkbox on that entity should be deactivated. All new timesheet using this internal activity will then not be billable, if they were 
created with the `Automatic` billable mode.

## Automatic detection 

By default, every new timesheet uses the `Automatic` billable detection mode. 
That means: after saving the entry, the billable field will be detected by the settings in the timesheet linked `Activity`, `Project` and `Customer`.

If any of those is not billable, the timesheet is not billable as well.

In other words: in order for a timesheet to be detected as billable, the `Activity`, `Project` and `Customer` needs to be billable as well.

Users owning the `edit_billable_own_timesheet` permission can always manually override the `Automatic` mode and choose directly whether the 

## Hiding the billable field

Hiding the `billable` form field with CSS is **NOT** recommended. To remove the field, you should instead remove the permission for the user group.

