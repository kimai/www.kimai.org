---
title: Tags
description: Using tags to group timesheet entries
related:
  - timesheet
  - permissions
  - configurations
last_check: 2026-08-12
---

## Tagging timesheet records

Kimai supports tagging of timesheet records, which allows you to create arbitrary logical structures.

Unlike customer, project and activity, tags are not hierarchical: every timesheet record can have any number of tags
and every tag can be used by any number of records. They are the right tool whenever you need a second dimension
besides your project structure, e.g. to mark records as `travel`, `onsite`, `bugfix` or with a sprint name.

Tags can be used to filter records in the timesheet screens, exports, invoices and reports.

{% include youtube-video.html id="timesheets" chapter="tagging" %}

### Assigning tags

Tags are assigned in the timesheet form (and in the batch-update form when editing multiple records at once).
Only `visible` tags are offered for selection.

The tag field adapts to the amount of existing tags:

- up to 500 visible tags: a dropdown with search and multi-select
- more than 500 visible tags: a text field with auto-completion

### Tagging modes

Kimai supports two tagging modes, which are controlled by the `create_tag` permission:

- **Free tagging**: users with the `create_tag` permission can enter arbitrary tags in the timesheet form.
  Unknown tags are created automatically when the form is saved. This permission is assigned to `ROLE_USER` by default.
- **Predefined tags**: if you remove the `create_tag` permission at `System → Roles`, users can only select from
  the tags that were created before in the tag administration.

{% alert info %}Removing `create_tag` does not delete existing tags, it only prevents the creation of new ones.{% endalert %}

### Tag names

A couple of rules apply to tag names:

- they have to be unique
- they must be between 2 and 100 characters long
- leading and trailing whitespaces are removed automatically
- these characters are not allowed: `,` `"` `<` `>` `=`

## Tag administration

The tag administration screen can be found at `Administration → Tags` and requires the `view_tag` permission.
It lists all tags (including the hidden ones) with:

- the tag `name`, rendered in the tags color
- an `amount` counter, which shows how often the tag is used in timesheet records
- the `visibility` state

The listing can be sorted by each of these columns.

### Create and edit a tag

Creating and editing tags requires the `manage_tag` permission. A tag has these attributes:

- `Name` - see the naming rules above
- `Visible` - whether the tag can still be assigned to timesheet records
- `Color` - used to highlight the tag in listings, e.g. in the timesheet tables

The available colors can be configured with the `Allowed colors` setting in the
`Theme` section at [System → Settings]({% link _documentation/configurations.md %}).
If no color is chosen, Kimai calculates one from the tag name.

### Visibility

Hiding a tag is the recommended way to retire a keyword that should no longer be used:

- hidden tags are not offered in the tag dropdowns any longer
- existing timesheet records keep their tag and are still exported, filtered and invoiced as before

### Batch actions

Select multiple rows with the checkboxes in the first column to apply one of these actions to all of them at once:

- set visible / set invisible (requires `manage_tag`)
- delete (requires `delete_tag`)

### Row actions

The action menu of each tag allows you to:

- edit the tag (requires `manage_tag`)
- filter all records for the chosen tag, by linking to the team timesheet page with a preset tag filter
  (requires `view_other_timesheet`)
- delete the tag (requires `delete_tag`)

### Deleting a tag

When a tag is deleted, only the tag and all links to it are deleted.
The linked timesheet records are NOT touched.

{% alert warning %}Deleting a tag cannot be undone: the tag assignments of all timesheet records are lost.
If you only want to stop the further usage of a tag, set it to invisible instead.{% endalert %}

## Filter and search

The tag administration can be filtered by `visibility` and you can query for a free search term,
which will be searched in the fields:

- `name`

Timesheet records can be filtered by tags in `My times`, `Administration → Timesheets`, in the export
and when creating invoices.

## Tags in other features

- **Invoices**: the placeholder `${entry.tags}` prints a comma separated list of all tags of a timesheet record,
  see [invoice templates]({% link _documentation/invoice-templates.md %})
- **Import**: timesheets can be imported with a `Tags` column (comma separated list of tag names),
  see [Import]({% link _documentation/plugin-import.md %})
- **Auto-tags**: tags can be assigned automatically through customer, project and activity,
  see [Custom-Fields plugin]({% link _documentation/plugin-custom-fields.md %})
- **API**: tags can be read and created through the [API]({% link _documentation/user-api.md %})

## Permissions

Users always have access to the list of all existing tags (in forms and with the API).
Tags cannot be restricted in their visibility for certain users or teams.
The existing permissions all handle administrative tasks.

{% include documentation/permissions.md id="tags" howto=true %}
