---
title: Tags
description: Using tags to group timesheet entries
---

## Tagging timesheet records

Kimai supports tagging timesheet records, which allows you to create arbitrary logical structures, 
which can be used to filter records in exports/invoices and reports.

{% include youtube-video.html id="timesheets" chapter="tagging" %}

### Tagging modes

Kimai supports two tagging modes: 

- free tagging: users can assign any number of tags to each timesheet entry
- predefined: users can only select tags from a pre-defined list

The mode can be switched in the `Theme` section at [System → Settings]({% link _documentation/configurations.md %}).

## Tag administration

The tag administration screen can be found at `Administration → Tags`. 
It displays all available tags including an counter how often they it is used.

The action menu for each tag allows you to filter all records for the chosen tag, 
by linking to the team timesheet page with a preset tag filter.

### Deleting a tag

When a tag is deleted, only the tag and all links to it are deleted.
The linked timesheet records are NOT touched. 

## Filter and search 

You can query for a free search term, which will be searched in the fields:
- `name`

## Permissions

Users always have access to the list of all existing tags (in forms and with the API). 
Tags cannot be restricted in their visibility. 
The existing permissions all handle administrative tasks.

{% include documentation/permissions.md id="tags" howto=true %}
