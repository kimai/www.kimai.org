---
title: Audit Trail Plugin for Kimai 2
name: Audit Trail Plugin
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

You can test the Plugin in the [Plugin demo](https://www.kimai.org/demo/).

## Features

- Adds new actions to each of the following items in the admin section:
  - Timesheets
  - Customers
  - Projects
  - Activities
- A new screen with the Audit log including all changes for the selected item
- Each log entry contains: the username, date-time and type of change

The following fields are recorded for changes:
- Timesheet: `begin`, `end`, `duration`, `timezone`, `user`, `activity`, `project`, `description`, `rate`, `fixedRate`, `hourlyRate`, `exported` 
- Activity: `project`, `name`, `comment`, `visible`, `fixedRate`, `hourlyRate`, `color`
- Project: `customer`, `name`, `orderNumber`, `comment`, `visible`, `budget`, `fixedRate`, `hourlyRate`, `color`
- Customer: `name`, `number`, `comment`, `visible`, `company`, `contact`, `address`, `country`, `currency`, `phone`, `fax`, `mobile`, `email`, `homepage`, `timezone`, `fixedRate`, `color` 

**Be aware**:
History is only available for all changes from the moment on when this bundle was installed, previous changes are not available.

## Roadmap

The following features will be added in the future:

- Record changes on System configurations
- Global audit log page using datatables (list user, date-time, item type, link to detail page)
- Revert to a revision
- Command or admin screen to install databases

**Further ideas**

- Notification emails on timesheet changes after entry was stopped
- Show deleted items
- Support to revert deleted items
- Remove old revisions to limit database size

## Installation

### Database

Create the required tables for your database engine.

Either MySQL / MariaDB:
```
CREATE TABLE kimai2_ext_log_entries (id INT AUTO_INCREMENT NOT NULL, action VARCHAR(8) NOT NULL, logged_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime)\', object_id VARCHAR(64) DEFAULT NULL, object_class VARCHAR(255) NOT NULL, version INT NOT NULL, data LONGTEXT DEFAULT NULL COMMENT \'(DC2Type:array)\', username VARCHAR(255) DEFAULT NULL, INDEX log_class_lookup_idx (object_class), INDEX log_date_lookup_idx (logged_at), INDEX log_user_lookup_idx (username), INDEX log_version_lookup_idx (object_id, object_class, version), PRIMARY KEY(id));
```

or SQLite:
```
CREATE TABLE kimai2_ext_log_entries (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "action" VARCHAR(8) NOT NULL, logged_at DATETIME NOT NULL, object_id VARCHAR(64) DEFAULT NULL, object_class VARCHAR(255) NOT NULL, version INTEGER NOT NULL, data CLOB DEFAULT NULL, username VARCHAR(255) DEFAULT NULL);
CREATE INDEX log_class_lookup_idx ON kimai2_ext_log_entries (object_class);
CREATE INDEX log_date_lookup_idx ON kimai2_ext_log_entries (logged_at);
CREATE INDEX log_user_lookup_idx ON kimai2_ext_log_entries (username);
CREATE INDEX log_version_lookup_idx ON kimai2_ext_log_entries (object_id, object_class, version);
```

## Permissions

This bundle ships new administration sections, which are available for the following users:

- `ROLE_SUPER_ADMIN` - every super administrator has access to all audit logs
- `audit_customer` - everyone with this permission can see all changes for the customer objects
- `audit_project` -  everyone with this permission can see all changes for the project objects
- `audit_activity` -  everyone with this permission can see all changes for the activity objects
- `audit_own_timesheet` -  everyone with this permission can see all changes for his own timesheets (only via team timesheets)
- `audit_other_timesheet` -  everyone with this permission can see all changes of other users timesheets (only via team timesheets)

You can add the new permissions to your `local.yml` [as described in the documentation](https://www.kimai.org/documentation/configurations.html):

```yaml
kimai:
    permissions:
        sets:
            AUDIT: [audit_customer,audit_project,audit_activity,audit_own_timesheet,audit_other_timesheet]
        maps:
            ROLE_ADMIN: [...,AUDIT]
            ROLE_SUPER_ADMIN: [...,AUDIT]
```

### Files

Extract the ZIP file and upload the included directory and all files to your Kimai installation. 
The file structure needs to like like this afterwards:

```
kimai2/var/plugins/
├── AuditTrailBundle
│   ├── AuditTrailBundle.php
|   └ ... more files and directories follow here ... 
```

### Rebuild the cache

```
cd kimai2/
bin/console cache:clear
bin/console cache:warmup
```

## Screenshot

A audit trail can look like this, but each change will be recorded and you might see more entries in a object timeline:

![Screenshot](https://www.kimai.org/images/marketplace/audit-trail-screenshot.jpg)

You access an objects audit trail via the data-table "Actions" dropdown:

![Screenshot](https://www.kimai.org/images/marketplace/audit-trail-button.jpg)


## Uninstall

Delete the package:
```bash
cd kimai2/
rm -r var/plugins/AuditTrailBundle
```

Rebuild the cache:
```
cd kimai2/
bin/console cache:clear
bin/console cache:warmup
```

If you don't want to keep the audit history, you can remove the database table:
```
DROP TABLE kimai2_ext_log_entries;
```
