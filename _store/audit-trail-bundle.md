---
title: Audit-Trail plugin for Kimai 2
name: Audit-Trail plugin
intro: "A Kimai 2 plugin, which records all changes of timesheets, customers, projects and activities."
developer: keleo
date: "2019-05-21 20:00:00 +0200"
icon: fas fa-history
price: "40€"
version: 1.0
screenshot: 
  - /images/marketplace/audit-trail-screenshot.jpg
  - /images/marketplace/audit-trail-button.jpg
buy: /documentation/buy-a-plugin.html
featured: Records detailed change/audit logs for timesheets, customers, projects and activities and displays them in a per-item timeline. 
new: true
tags:
  - plugin
  - kimai 2
---

A Kimai 2 plugin to record and visualize the changes on `timesheets`, `customers`, `projects` and `activities`.

You can test it in the ["Plugins" demo](https://www.kimai.org/demo/).

## Features

Adds new actions to each of the following items in the admin section:
  - Timesheets
  - Customers
  - Projects
  - Activities

Introduces a new screen for each of the above items, with all recorded changes and each log entry containing the following information:

- username
- date-time
- type of change (create, update)
- changed fields (see list below)

The following fields are recorded for changes:
- Timesheet: `begin`, `end`, `duration`, `timezone`, `user`, `activity`, `project`, `description`, `rate`, `fixedRate`, `hourlyRate`, `exported` 
- Activity: `project`, `name`, `comment`, `visible`, `fixedRate`, `hourlyRate`, `color`, `budget`, `timeBudget`
- Project: `customer`, `name`, `orderNumber`, `comment`, `visible`, `budget`, `fixedRate`, `hourlyRate`, `color`, `budget`, `timeBudget`
- Customer: `name`, `number`, `comment`, `visible`, `company`, `contact`, `address`, `country`, `currency`, `phone`, `fax`, `mobile`, `email`, `homepage`, `timezone`, `fixedRate`, `color`, `budget`, `timeBudget` 

**Be aware**:
- History is only available for all changes from the moment on when this bundle was installed, previous changes are not available.
- Not all fields (eg. tags and custom fields) are recorded, please read the above list carefully.

### Roadmap

The following features will be added in the future:

- Global audit log page using datatables (list user, date-time, item type, link to detail page)
- Record changes on System configurations
- Revert to a revision
- Record changes for custom fields

Further ideas:

- Notification emails on timesheet changes after entry was changed
- Remove old revisions to limit database size
- Show deleted items
- Support to revert deleted items

## Installation

### Database

Create the required tables for your database engine.

Either MySQL / MariaDB:
```sql
CREATE TABLE kimai2_ext_log_entries (id INT AUTO_INCREMENT NOT NULL, action VARCHAR(8) NOT NULL, logged_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime)\', object_id VARCHAR(64) DEFAULT NULL, object_class VARCHAR(255) NOT NULL, version INT NOT NULL, data LONGTEXT DEFAULT NULL COMMENT \'(DC2Type:array)\', username VARCHAR(255) DEFAULT NULL, INDEX log_class_lookup_idx (object_class), INDEX log_date_lookup_idx (logged_at), INDEX log_user_lookup_idx (username), INDEX log_version_lookup_idx (object_id, object_class, version), PRIMARY KEY(id));
```

or SQLite:
```sql
CREATE TABLE kimai2_ext_log_entries (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "action" VARCHAR(8) NOT NULL, logged_at DATETIME NOT NULL, object_id VARCHAR(64) DEFAULT NULL, object_class VARCHAR(255) NOT NULL, version INTEGER NOT NULL, data CLOB DEFAULT NULL, username VARCHAR(255) DEFAULT NULL);
CREATE INDEX log_class_lookup_idx ON kimai2_ext_log_entries (object_class);
CREATE INDEX log_date_lookup_idx ON kimai2_ext_log_entries (logged_at);
CREATE INDEX log_user_lookup_idx ON kimai2_ext_log_entries (username);
CREATE INDEX log_version_lookup_idx ON kimai2_ext_log_entries (object_id, object_class, version);
```

### Files

Extract the ZIP file and upload the included directory and all files to your Kimai installation to the new directory:  
`var/plugins/AuditTrailBundle/`

The file structure needs to like like this afterwards:

```
var/plugins/
├── AuditTrailBundle
│   ├── AuditTrailBundle.php
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

When logged in as `SUPER_ADMIN`, you should now see the audit log screens (find the links in the "actions" dropdown menus).

If this was successful, you can now think about giving permissions to other users as well.

### Permissions

This bundle ships new administration screens, which are available for the following users:

- `ROLE_SUPER_ADMIN` - every super administrator has access to all audit logs
- `audit_customer` - everyone with this permission can see all changes for the customer objects
- `audit_project` -  everyone with this permission can see all changes for the project objects
- `audit_activity` -  everyone with this permission can see all changes for the activity objects
- `audit_own_timesheet` -  everyone with this permission can see all changes for his own timesheets (only via team timesheets)
- `audit_other_timesheet` -  everyone with this permission can see all changes of other users timesheets (only via team timesheets)

You can add the new permissions to your [local.yml](https://www.kimai.org/documentation/configurations.html). 
For more information, read the [permissions](https://www.kimai.org/documentation/permissions.html) documentation.

```yaml
kimai:
    permissions:
        sets:
            AUDIT: [audit_customer,audit_project,audit_activity,audit_own_timesheet,audit_other_timesheet]
        maps:
            ROLE_ADMIN: [...,AUDIT]
            ROLE_SUPER_ADMIN: [...,AUDIT]
```

After changing the permissions, you need to clear the cache one more time.

## Screenshots

A audit trail can look like this, but each change will be recorded and you might see more entries in a object timeline:

![Screenshot](https://www.kimai.org/images/marketplace/audit-trail-screenshot.jpg)

You access an objects audit trail via the data-table "Actions" dropdown:

![Screenshot](https://www.kimai.org/images/marketplace/audit-trail-button.jpg)
