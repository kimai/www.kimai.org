---
title: Tags
description: Using tags to group timesheet entries
toc: true
---

## Tagging timesheet records

Kimai supports tagging timesheet records, which allows you to create arbitrary logical structures, 
which can be used to filter records in exports/invoices and reports.

### Tagging modes

Kimai supports two tagging modes: 

- free tagging: users can assign any number of tags to each timesheet entry
- predefined: users can only select tags from a pre-defined list (since 1.8)

The mode can be switched in the `Theme` section at [System > Settings]({% link _documentation/configurations.md %}).

## Tag administration

There is a tag administration screen, which displays all available tags including the counter how often they are used.

The action menu for each tag allows you to filter all records for the chosen tag, by linking to the team timesheet with 
a preset tag filter.

### Deleting a tag

When a tag is deleted, only the tag and all links to it are deleted.
The linked timesheet records are NOT touched. 

## Filter and search 

You can query for a free search term, which will be searched in the fields:
- `name`
