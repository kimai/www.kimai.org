---
title: Audit-Trail plugin for Kimai 2
name: Audit-Trail plugin
intro: "Record all changes of timesheets, customers, projects and activities."
developer: keleo
date: "2019-05-21 20:00:00 +0200"
icon: fas fa-history
price: "29€"
version: 1.0
screenshot: 
  - /images/marketplace/audit-trail-screenshot.jpg
  - /images/marketplace/audit-trail-screenshot-2.png
  - /images/marketplace/audit-trail-button.jpg
gumroad: kimai2-audit-trail
featured: Records detailed change/audit logs for timesheets, customers, projects and activities and displays them in a per-item timeline. 
new: true
tags:
  - plugin
---

Find out who changed their records, what and when: a Kimai 2 plugin to record and visualize the changes on `timesheets`, `customers`, `projects` and `activities`.

You can test it in the ["Plugins" demo](https://www.kimai.org/demo/).

## Features

Adds a global audit-trail page, listing all recorded changes with username, change datetime, item type and link to detail page.

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

The following features are planned for the future:

- Revert to a revision
- Record timezone of change
- Support for showing deleted items
- Record changes for more objects:
  - System configurations
  - Custom fields
  - User and preferences
- Remove old revisions to limit database size
- Notification emails on timesheet changes

## Installation

There are compatible AuditTrailBundle version for the following Kimai releases:
`1.3`, `1.2`, `1.1`, `1.0`

### Files

Extract the ZIP file and upload the included directory and all files to your Kimai installation to the new directory:  
`var/plugins/AuditTrailBundle/`

The file structure needs to look like this afterwards:

```
var/plugins/
├── AuditTrailBundle
│   ├── AuditTrailBundle.php
|   └ ... more files and directories follow here ... 
```

### Cache

After uploading the files, Kimai needs to know about the new plugin. It will be found, when the cache is re-build:

```
cd kimai2/
bin/console cache:clear --env=prod
bin/console cache:warmup --env=prod
```

or when using FTP: delete the folder `var/cache/prod/`.

### Database

Run the following command:

```bash
bin/console kimai:bundle:audittrail:install
```

This will install all required databases.

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

The overview page of all audit trail logs:

![Screenshot](https://www.kimai.org/images/marketplace/audit-trail-screenshot-2.png)

A audit trail can look like this, but each change will be recorded and you might see more entries in a object timeline:

![Screenshot](https://www.kimai.org/images/marketplace/audit-trail-screenshot.jpg)

You access an objects audit trail via the data-table "Actions" dropdown:

![Screenshot](https://www.kimai.org/images/marketplace/audit-trail-button.jpg)
