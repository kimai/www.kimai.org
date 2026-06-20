---
title: Public holiday
description: Configure public holidays for your employees with working contracts.
related:
- absence
- contract
---

{% include youtube-video.html id="public_holiday" %}

Public holidays can be edited at `Administration > Public holidays`.

Public holidays can are considered in employee working time calculations:

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

The import dialog provides a worldwide location database. 

- Names of public holidays are not translated: switch Kimai to the language that you want to import
- Search for your country: the database uses all names in English, do you would type `germany` instead of `Deutschland` to find it
- Search for the region: e.g. `NorthRhineWestphalia` (not `Nordrhein-Westfalen`)
- Review and import all holidays for the selected region

{% alert warning %}The imported data has been calculated automatically, is not subject to any liability and needs to be verified after import.{% endalert %}

## Editing public holidays

By editing single public holidays you can:
- Change full-day to half-day or vice-versa
- Delete unwanted holidays
- Add new custom holidays

## Permissions
 
{% include documentation/permissions.md id="public_holidays" howto=true %}
