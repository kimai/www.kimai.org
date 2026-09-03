---
title: Custom fields
description: Add free configurable custom fields to your Kimai installation
plugin: custom-fields-bundle
cloud: pro
---

{% include plugins/custom-fields.md %}  

## Field types
 
The custom fields will be shown on the "create and edit entity" forms and can have the following types:

| Input field type   | Description                                                                         |
|--------------------|-------------------------------------------------------------------------------------|
| `string`           | simple text field                                                                   |
| `integer`          | number without decimal point                                                        |
| `number`           | number with decimal places                                                          |
| `duration`         | enter a duration in [various formats]({% link _documentation/duration-format.md %}) |
| `money`            | text-field for entering a monetary value                                            |
| `language`         | dropdown of languages, shown in the user language                                   |
| `currency`         | dropdown of currencies, shown in the user language                                  |
| `country`          | dropdown of countries, shown in the user language                                   |
| `color`            | browser specific input element to select a color                                    |
| `date`             | type a date or select it from the datepicker                                        |
| `datetime`         | type a date and time or select it from the picker                                   |
| `email`            | enter an email address (with basic validation)                                      |
| `url`              | URL field                                                                           |
| `textarea`         | multi-line text field                                                               |
| `invoice template` | a dropdown to select one of the invoice template names                              |
| `checkbox`         | an on/off switch: if mandatory, the user has to activate it to submit the form      |
| `choice-list`      | drop-down with custom entries                                                       |
| `auto-tags`        | automatic timesheet tagging through assignment on activities/projects/custo mers    |
| `activity-choices` | adds a fourth level below the activity, which users select when they track time     |
{: .table }

### Default value

Many fields support setting a `Default value`.

As the type of the `default value` and therefor the input field depends on the selected `Field type`,
this input field only appears after saving the new custom-field and then re-opening its configuration.

## Choice-list

"Choice-list" is a different word for "Select-box" or "Drop-down".
You have to add the entries as comma-separated list in the `Default value` field.
For example a list consisting of fruits would look like this: `Banana,Apple,Orange,Pineapple,Peach`.

As the first entry is pre-selected, you can add an empty field to the dropdown by starting the list
with a leading `,` like this: `,Banana,Apple,Orange,Pineapple,Peach`.
Combined with the mandatory flag, this will force your users to select an entry from the list to be able to submit the form.

Choice list is also capable to configure title and values independently.
Let's assume you have non-human friendly IDs for the value, but want to show a human friendly text, you can separate
each value from its title by using a pipe `|` character: `,01|Banana,02|Apple,Orange,foo|Pineapple,0815|Peach`.

## Auto-Tags

This advanced feature allows to assign certain tags to Activity, Project and Customer.

Once you assigned such an `auto-tag` e.g to a Project, each future timesheet that is linked to the selected `Project` will be assigned the selected `auto-tags`. 
A user cannot remove these tags, they are automatically assigned after the form (to save the timesheet) was submitted.
 
## Activity-Choices (4 level) 

Kimai organizes your data in three levels: `Customer`, `Project` and `Activity`.
The field type `Activity-Choices (4 level)` adds a fourth level below the activity.

You define the name of that fourth level yourself, so you can adapt it to the words your team already uses,
for example "Tasks", "Work packages", "Steps" or "Phases". Typical examples:

- A construction company tracks the activity "Electrical installation" and needs to know whether the time was
  spent on "Cabling", "Sockets" or "Testing"
- An agency tracks the activity "Website relaunch" and wants to split it into "Concept", "Design", "Development" and "Review"
- A university tracks the activity "Research project" and splits it into the work packages defined in the funding contract

### How it works

The entries of the fourth level are maintained per activity. Every activity has its own list, so the choices a user
sees always depend on the activity they selected.

- The list is stored on the activity, one entry per line
- An activity can have up to 50 entries, each with a maximum of 100 characters
- The characters `<`, `>` and `"` aren't allowed, and an entry name can only be used once per activity
- The order of the lines defines the order of the dropdown when tracking time

When a user creates or edits a timesheet, the field is shown below the activity:

- As long as no activity is selected, the field is disabled
- After an activity was selected, Kimai loads the entries of that activity
- If the activity has at least one entry, the field becomes active and the user has to select one of them
- If the activity has no entries, the field is empty and can be ignored

The selected entry is stored as text in a custom-field of the timesheet. Later changes to the underlying list
(renaming or deleting entries) don't change existing timesheets: the value that was chosen at
booking time stays as it is.

If someone edits an old timesheet whose stored value isn't part of the current list anymore, that value can't be
selected again. They have to choose one of the current entries before they can save the record.

### Create the custom field

Open the custom field administration, switch to the `Activity` section and create a new field.
The type `Activity-Choices (4 level)` is only available for activities.

{% include docs-image.html src="/images/documentation/custom-fields-activity-choices-type.webp" title="Select the field type" width="400px" %}

Fill in the form as you would for any other custom field:

- `Internal title` is the technical name, for example `tasks`
- `Name` is the label your users see in the forms, for example `Tasks`
- `Documentation` is an optional help text below the field

{% include docs-image.html src="/images/documentation/custom-fields-activity-choices-create.webp" title="Create the custom field" width="600px" %}

You only need one field of this type. As soon as it exists, Kimai registers it for activities (to maintain the list)
and for timesheets (to select a value) with the same internal name.

The `Mandatory field` setting applies to the activity form: turn it on if every activity has to define entries.
It doesn't control whether users have to select a value when tracking time — that's decided per activity,
based on whether the activity has entries or not.

### Maintain the activity entries

Now open an activity in the administration. The new field is shown as a multi-line text field.
Add one entry per line and save the activity.

{% include docs-image.html src="/images/documentation/custom-fields-activity-choices-activity.webp" title="Maintain the entries of an activity" width="600px" %}

Repeat this for every activity that needs the fourth level. Activities where you leave the field empty keep working
exactly as before, their users don't have to select anything.

## Visibility

You can limit visibility to one [user role]({% link _documentation/permissions.md %}). 

If you want to use a custom role, you have to follow the documented rules for role naming:
- Completely uppercase
- Starting with `ROLE_`
- For the default roles, you have to use the technical name, e.g. `ROLE_TEAMLEAD` instead of the translated name `Teamlead`

So a role name like `Manager` does not work, it must be `ROLE_MANAGER`.

### Customer, Project and Activity

You cannot limit the visibility of fields by `Customer`, `Project` or `Activity` when creating a new timesheet.
Because at the moment the form is opened, it is unknown which `Customer`, `Project` and `Activity` the user chooses.

The same can applies to the custom fields:
- `Project`, if there is no pre-selection (e.g. creation with the `Customer` detail screen)
- `Activity`, if there is no pre-selection (e.g. creation with the `Project` detail screen) 

Once you open an existing record, you can now see the custom field, as its visibility can be detected.

## Permissions

{% include documentation/permissions.md id="meta_fields" howto=true super_admin=true %}
