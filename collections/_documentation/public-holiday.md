---
title: Public holiday
description: Configure public holidays for your employees with working contracts.
related:
- absence
- contract
---

{% include youtube-video.html id="public_holiday" %}

Public holidays are considered in employee working time calculations:

- If a public holiday falls on a weekday that is a regular working day for the employee, their expected working hours for that day are fulfilled automatically
- Any timesheet entries recorded on a public holiday are counted as overtime

## Public holiday groups

Public holiday groups help manage location-specific holidays for organizations with employees in different regions.

### Default group 

The 'Standard' group is shown by default in the public holiday administration. This group applies to all employees without a specific group assignment.

### Multiple locations

For organizations with employees in different locations:

1. Create location-specific groups using the {% include demo-action-button.html icon="create" title="Create" %} button
2. Assign the relevant public holidays to each group

## Managing public holidays

Select your desired group from the dropdown menu. If you have a single location, use the 'Standard' group.

### Creating holidays

You have two options to add public holidays to the selected year:

The {% include demo-action-button.html icon="create" %} button for adding single holidays.

The {% include demo-action-button.html icon="import" %} button for bulk importing pre-defined holidays.

### Import feature

The import dialog provides a worldwide location database (in English only):
- Search for countries (e.g. `Germany`)
- Search for regions (e.g. `NorthRhineWestphalia`)
- Review and import all holidays for the selected region

{% alert warning %}The imported data has been calculated automatically, is not subject to any liability and needs to be verified after import.{% endalert %}

## Manual editing public holidays

By editing single public holidays you can:
- Change full-day to half-day or vice-versa
- Delete unwanted holidays
- Add new custom holidays

## Permissions

The `contract_other_profile` permission is required to see the `Contract` menu, which includes the `Public holiday` management view. 

| Permission Name       | Description                                                                                        |
|-----------------------|----------------------------------------------------------------------------------------------------|
| edit_public_holidays  | Allows to configure public holidays. By default given to `Administrator` and `Super Administrator` |
{: .table }

{% include snippets/store-howto-permissions.md %}
