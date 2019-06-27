---
title: Custom Fields Plugin for Kimai 2
name: Custom fields Plugin
intro: "Create free configurable additional fields for timesheets, customers, projects and activities."
developer: keleo
date: "2019-06-25 20:00:00 +0200"
icon: fas fa-keyboard
price: "100€"
version: 1.0
screenshot: 
  - /images/marketplace/meta-fields-screenshot.jpg
  - /images/marketplace/meta-fields-create.jpg
  - /images/marketplace/meta-fields-example.jpg
  - /images/marketplace/meta-fields-example2.jpg
buy: /documentation/buy-a-plugin.html
featured: Create free configurable additional (optional and mandatory) fields for timesheets, customers, projects and activities in various formats. 
new: true
tags:
  - plugin
  - kimai 2
---

A Kimai 2 plugin, which allows to configure additional fields for timesheets, customers, projects and activities.

You can test the Plugin in the [Plugin demo](https://www.kimai.org/demo/).

## Features

Configure additional fields in various formats for the following data types:

- `Timesheets`
- `Customers`
- `Projects`
- `Activities`

You can create as many fields as you want for each data type:
- each field can be optional or mandatory
- each field has its own visibility (see below)
- each field can be restricted to a certain area (eg. location field only for customer X in project Y)  

The custom fields will be shown on the "create and edit entity" forms and can have the following types:
- `string`
- `integer`
- `number`
- `duration`
- `money`
- `date`
- `checkbox`
- `language`
- `currency`
- `country`
- `color`

The entered values are available in:
- Invoice templates (custom templates only)
- Export module (spreadsheets and custom renderer)
- API (collections and entities)

You can configure sensitive data as "invisible", so it doesnÄt show up in the above mentioned places.

More information about custom fields can be found in the [documentation](https://www.kimai.org/documentation/meta-fields.html).

## Installation

### Database

This bundle stores the rules in a new database table, which needs to be created. Choose the statements for your database:

MySQL:
```sql
CREATE TABLE kimai2_meta_field_rules (id INT AUTO_INCREMENT NOT NULL, customer_id INT DEFAULT NULL, project_id INT DEFAULT NULL, activity_id INT DEFAULT NULL, entity_type VARCHAR(100) NOT NULL, name VARCHAR(50) NOT NULL, value VARCHAR(255) DEFAULT NULL, type VARCHAR(100) NOT NULL, visible TINYINT(1) NOT NULL, required TINYINT(1) NOT NULL, INDEX IDX_C7D8A2619395C3F3 (customer_id), INDEX IDX_C7D8A261166D1F9C (project_id), INDEX IDX_C7D8A26181C06096 (activity_id), INDEX meta_field_rule_entity_type_idx (entity_type), UNIQUE INDEX UNIQ_C7D8A261C412EE025E237E06 (entity_type, name), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB;
ALTER TABLE kimai2_meta_field_rules ADD CONSTRAINT FK_C7D8A2619395C3F3 FOREIGN KEY (customer_id) REFERENCES kimai2_customers (id) ON DELETE CASCADE;
ALTER TABLE kimai2_meta_field_rules ADD CONSTRAINT FK_C7D8A261166D1F9C FOREIGN KEY (project_id) REFERENCES kimai2_projects (id) ON DELETE CASCADE;
ALTER TABLE kimai2_meta_field_rules ADD CONSTRAINT FK_C7D8A26181C06096 FOREIGN KEY (activity_id) REFERENCES kimai2_activities (id) ON DELETE CASCADE;
```

SQLite:
```sql
CREATE TABLE kimai2_meta_field_rules (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, customer_id INTEGER DEFAULT NULL, project_id INTEGER DEFAULT NULL, activity_id INTEGER DEFAULT NULL, entity_type VARCHAR(100) NOT NULL, name VARCHAR(50) NOT NULL, value VARCHAR(255) DEFAULT NULL, type VARCHAR(100) NOT NULL, visible BOOLEAN NOT NULL, required BOOLEAN NOT NULL);
CREATE INDEX IDX_C7D8A2619395C3F3 ON kimai2_meta_field_rules (customer_id);
CREATE INDEX IDX_C7D8A261166D1F9C ON kimai2_meta_field_rules (project_id);
CREATE INDEX IDX_C7D8A26181C06096 ON kimai2_meta_field_rules (activity_id);
CREATE INDEX meta_field_rule_entity_type_idx ON kimai2_meta_field_rules (entity_type);
CREATE UNIQUE INDEX UNIQ_C7D8A261C412EE025E237E06 ON kimai2_meta_field_rules (entity_type, name);
```

### Plugin files 

First clone it to your Kimai installation `plugins` directory:
```
cd /kimai/var/plugins/
git clone https://github.com/kevinpapst/MetaFieldsBundle.git
```

And then rebuild the cache: 
```
cd /kimai/
bin/console cache:clear
bin/console cache:warmup
```

Or [download it as zip](https://github.com/kevinpapst/MetaFieldsBundle/archive/master.zip) and upload the directory to your Kimai installation:

```
kimai/var/plugins/
├── MetaFieldsBundle
│   ├── MetaFieldsBundle.php
|   └ ... more files and directories follow here ... 
```

## Permissions

This bundle ships a new administration screen, which will be available for the following users:

- `ROLE_SUPER_ADMIN` - every super administrator
- `configure_meta_fields` - every use that owns this permission 
 
## Screenshot

![Screenshot](https://www.kimai.org/images/marketplace/meta-fields-screenshot.jpg)

## Uninstall

- Delete the extension directory `var/plugins/MetaFieldsBundle/`
- Remove the database table (create a backup first!):
```sql
DROP TABLE kimai2_meta_field_rules
```
- [Reload your cache](https://www.kimai.org/documentation/configurations.html) with the cache command

Be aware: the stored meta fields and their values are still available in your Kimai database!
