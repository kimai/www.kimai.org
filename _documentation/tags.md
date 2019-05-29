---
title: Tags
description: Using tags to group timesheet entries
since_version: 1.0
toc: true
---

## Tagging timesheet records

Kimai supports tagging timesheet records, which allows you to create arbitrary logical structures.

Users can assign any number of tags to each timesheet entry, which you can use to filter records in exports/invoices and reports.

## Tag administration

There is a tag administration screen, which displays all available tags and the counter how often they are used.

The action menu for each tag allows you to filter all records for the choosen tag, by linking to the team timesheet with 
a preset tag filter.

### Deleting a tag

When a tag is deleted, only the tag and all links to it are deleted.
The linked timesheet records are NOT touched. 

## Permissions

There are two tag related [permissions available]({% link _documentation/permissions.md %}):

- `view_tag` - users with a role owning this permission can see the tag administration
- `delete_tag` - users with a role owning this permission can delete existing tags
 
