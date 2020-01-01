---
title: Custom-fields plugin for Kimai 2
name: Custom-fields plugin
intro: "Create free configurable additional fields for timesheets, customers, projects, activities and users."
developer: keleo
date: "2019-06-25 20:00:00 +0200"
icon: fas fa-keyboard
price: "49€"
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
- has its own visibility, so the access can be restricted:
    - to certain customer/project/activity combinations (eg. a "location" field will only be shown for customer X and project Y)
    - to users with certain permissions or roles
- can be described with a name and help text  
- has a maximum length of 255 character

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
- `boolean` (use: 1 = checked/true or 0 = unchecked/false)
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

More information about custom fields can be found in the [documentation](https://www.kimai.org/documentation/meta-fields.html).

## Purchase

{% include store-gumroad-and-support.html %}

## Installation

This plugin is compatible with the following Kimai releases:

| Bundle version    | Kimai 2 version           |
| ---               |---                        |
| 1.7               | 1.6.2                     |
| 1.6               | 1.6.2                     |
| 1.5               | 1.6                       |
| 1.4.1             | 1.4                       |
| 1.4               | 1.6 (due to a mistake)    |
| 1.3.2             | 1.4                       |
| 1.2               | 1.1, 1.2, 1.3             |
| 1.1.1             | 1.1                       |
| 1.0               | 1.0, 1.0.1                |
{: .table }

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

This bundle ships a new permission, which limit access to certain functions:

- `configure_meta_fields` - allows to administrate the custom field definitions

By default, it is assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include alert.html icon="fas fa-exclamation" type="warning" alert="You don't need the following since Kimai 1.6. Please adjust all permission settings in your administration." %}

Read how to assign these permission to your user roles in the [permission documentation](https://www.kimai.org/documentation/permissions.html).

This is a proposal if you use the bundle in a multi-user environment:
```yaml
kimai:
    permissions:
        roles:
            ROLE_SUPER_ADMIN: ['configure_meta_fields']
            ROLE_ADMIN: ['configure_meta_fields']
```

After changing the permissions in local.yaml, you need to clear the application cache.

## Screenshot

![Screenshot](https://www.kimai.org/images/marketplace/meta-fields-screenshot.png)
 
