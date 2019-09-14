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

The custom fields data is then available in:
- Export module (spreadsheets and custom renderer show timesheet fields automatically)
- API (collections and entities)
- Invoice templates (custom templates only)

Be aware:

- Restricted fields won't be visible on the create forms, as Kimai initially can't know if the rule will apply. In these cases the form will only be shown in the edit forms.
- Sensitive data can be configured as "invisible", so it will not show up in the above mentioned places.
- User preferences are currently not exposed, don't respect visibility and are always mandatory  

More information about custom fields can be found in the [documentation](https://www.kimai.org/documentation/meta-fields.html).

## Purchase

{% include store-gumroad-and-support.html %}

## Installation

There are compatible plugin versions for the following Kimai releases:
`1.3`, `1.2`, `1.1`, `1.0`

### Database

Create the required tables for your database engine.

Either MySQL / MariaDB:
```sql
CREATE TABLE kimai2_meta_field_rules (id INT AUTO_INCREMENT NOT NULL, customer_id INT DEFAULT NULL, project_id INT DEFAULT NULL, activity_id INT DEFAULT NULL, entity_type VARCHAR(100) NOT NULL, name VARCHAR(50) NOT NULL, value VARCHAR(255) DEFAULT NULL, type VARCHAR(100) NOT NULL, visible TINYINT(1) NOT NULL, required TINYINT(1) NOT NULL, INDEX IDX_C7D8A2619395C3F3 (customer_id), INDEX IDX_C7D8A261166D1F9C (project_id), INDEX IDX_C7D8A26181C06096 (activity_id), INDEX meta_field_rule_entity_type_idx (entity_type), UNIQUE INDEX UNIQ_C7D8A261C412EE025E237E06 (entity_type, name), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB;
ALTER TABLE kimai2_meta_field_rules ADD CONSTRAINT FK_C7D8A2619395C3F3 FOREIGN KEY (customer_id) REFERENCES kimai2_customers (id) ON DELETE CASCADE;
ALTER TABLE kimai2_meta_field_rules ADD CONSTRAINT FK_C7D8A261166D1F9C FOREIGN KEY (project_id) REFERENCES kimai2_projects (id) ON DELETE CASCADE;
ALTER TABLE kimai2_meta_field_rules ADD CONSTRAINT FK_C7D8A26181C06096 FOREIGN KEY (activity_id) REFERENCES kimai2_activities (id) ON DELETE CASCADE;
```

or SQLite:
```sql
CREATE TABLE kimai2_meta_field_rules (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, customer_id INTEGER DEFAULT NULL, project_id INTEGER DEFAULT NULL, activity_id INTEGER DEFAULT NULL, entity_type VARCHAR(100) NOT NULL, name VARCHAR(50) NOT NULL, value VARCHAR(255) DEFAULT NULL, type VARCHAR(100) NOT NULL, visible BOOLEAN NOT NULL, required BOOLEAN NOT NULL);
CREATE INDEX IDX_C7D8A2619395C3F3 ON kimai2_meta_field_rules (customer_id);
CREATE INDEX IDX_C7D8A261166D1F9C ON kimai2_meta_field_rules (project_id);
CREATE INDEX IDX_C7D8A26181C06096 ON kimai2_meta_field_rules (activity_id);
CREATE INDEX meta_field_rule_entity_type_idx ON kimai2_meta_field_rules (entity_type);
CREATE UNIQUE INDEX UNIQ_C7D8A261C412EE025E237E06 ON kimai2_meta_field_rules (entity_type, name);
```

### Files 

Extract the ZIP file and upload the included directory and all files to your Kimai installation to the new directory:  
`var/plugins/MetaFieldsBundle/`

The file structure needs to like like this afterwards:

```
var/plugins/
├── MetaFieldsBundle
│   ├── MetaFieldsBundle.php
|   └ ... more files and directories follow here ... 
```

### Rebuild the cache

After uploading the files, Kimai needs to know about the new plugin. It will be found, when the cache is re-build:

```
cd kimai2/
bin/console cache:clear --env=prod
bin/console cache:warmup --env=prod
```

or when using FTP: delete the folder `var/cache/prod/`.

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
 