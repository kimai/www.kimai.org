---
title: Custom-fields plugin for Kimai 2
name: Custom-fields plugin
intro: "Create free configurable additional fields for timesheets, customers, projects, activities and users."
developer: keleo
date: "2019-06-25 20:00:00 +0200"
icon: fas fa-keyboard
price: "49€"
version: 1.1
screenshot: 
  - /images/marketplace/meta-fields-screenshot.png
  - /images/marketplace/meta-fields-create.jpg
  - /images/marketplace/meta-fields-example.jpg
  - /images/marketplace/meta-fields-example2.jpg
gumroad: kimai2-custom-fields
featured: Create free configurable additional (optional and mandatory) fields for timesheets, customers, projects and activities in various formats. 
new: false
tags:
  - plugin
---

A Kimai 2 plugin, which allows to configure additional fields for timesheets, customers, projects and activities.

You can test it in the ["Plugins" demo](https://www.kimai.org/demo/).

## Features

Configure additional fields in various formats for the following data types:

- `Timesheets`
- `Customers`
- `Projects`
- `Activities`
- `User`

You can create as many fields as you want for each data type, where each field:

- is either optional or mandatory
- has its own visibility (see below)
- can be restricted to certain combinations (eg. a "location" field will only be shown for customer X and project Y)
- can be described with a name and help text  

The custom fields will be shown on the "create and edit entity" forms and can have the following types:

- `string`
- `integer`
- `number`
- `duration`
- `money`
- `checkbox`
- `language`
- `currency`
- `country`
- `color`
- `date`
- `datetime`
- `choice-list` (add entries comma separated into default-value field)

The custom-field data is then available in:

- Data-tables will display all visible fields
- Exports (HTML and Spreadsheets include all visible fields)
- Timesheet exports (include visible timesheet fields)
- API (collections and entities)
- Invoice templates (custom templates only)

Be aware:

- Restricted fields won't be visible on the create forms, as Kimai initially can't know if the rule will apply. In these cases the form will only be shown in the edit forms.
- Sensitive data can be configured as "invisible", so it will not show up in the above mentioned places.
- User preferences are currently not exposed (don't support the visibility flag) and are always mandatory

More information about custom fields can be found in the [documentation](https://www.kimai.org/documentation/meta-fields.html).

## Purchase

{% include store-gumroad-and-support.html %}

## Installation

This plugin is compatible with Kimai 2, v1.0 and higher.

### Copy files

Extract the ZIP file and upload the included directory and all files to your Kimai installation to the new directory:  
`var/plugins/MetaFieldsBundle/`

The file structure needs to like like this afterwards:

```
var/plugins/
├── MetaFieldsBundle
│   ├── MetaFieldsBundle.php
|   └ ... more files and directories follow here ... 
```

### Clear cache

After uploading the files, Kimai needs to know about the new plugin. It will be found, once the cache was re-built:

```
cd kimai2/
bin/console cache:clear --env=prod
bin/console cache:warmup --env=prod
```

### Create database

Run the following command:

```bash
bin/console kimai:bundle:metafields:install
```

This will install all required databases.

### First test

When logged in as `SUPER_ADMIN`, you should now see the custom-fields administration screen.

If this was successful, you can now think about giving permissions to other users as well.

## Permissions

This bundle ships a new administration screen, which will be available for the following users:

- `ROLE_SUPER_ADMIN` - every super administrator
- `configure_meta_fields` - allows to adminstrate the custom field definitions
 
You can add the new permissions to your [local.yml](https://www.kimai.org/documentation/configurations.html). 
For more information, read the [permissions](https://www.kimai.org/documentation/permissions.html) documentation.

```yaml
    permissions:
        roles:
            ROLE_ADMIN: ['configure_meta_fields']
```
 
After changing the permissions, you need to clear the cache one more time.

## Screenshot

![Screenshot](https://www.kimai.org/images/marketplace/meta-fields-screenshot.png)
 