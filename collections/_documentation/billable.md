---
title: Billable
description: How billable times are configured and what they do
related: 
  - timesheet
  - customer
  - project
  - activity
---

The `billable` field determines if timesheet entries are included in [invoices]({% link _documentation/invoices.md %}), budget calculations and statistics. 
The [API]({% link _documentation/developer/rest-api.md %}) supports filtering by this field.

## Permissions

Two permissions control the billable field access:
- `edit_billable_own_timesheet` - allows editing own timesheets (default: Teamlead, Administrator, System-Admin)
- `edit_billable_other_timesheet` - allows editing other users' timesheets (default: Teamlead, Administrator, System-Admin)

To hide the billable field, remove the corresponding permission from the user group.

## Timesheet options

Users with billable permissions can choose between:
- `Yes` - timesheet is billable
- `No` - timesheet is not billable
- `Automatic` (default) - billable state is detected automatically

## Configuration

The billable flag exists on three levels:
- Activity
- Project
- Customer

New entities are billable by default. Deactivate the `billable` checkbox for non-billable entities (e.g. internal activities).

## Automatic detection

New timesheets use `Automatic` detection by default. The billable state is determined by checking:
- Activity billable flag
- Project billable flag
- Customer billable flag

A timesheet is only billable if all three entities are marked as billable. Users with `edit_billable_own_timesheet` permission can manually override this.
