---
title: Audit-Trail plugin for Kimai 2
name: Audit-Trail plugin
intro: "Record all changes of timesheets, customers, projects and activities."
developer: keleo
date: "2019-05-21 20:00:00 +0200"
icon: fas fa-history
price: "29€"
screenshot: 
  - /images/marketplace/audit-trail-screenshot.jpg
  - /images/marketplace/audit-trail-screenshot-2.png
  - /images/marketplace/audit-trail-button.jpg
gumroad: kimai2-audit-trail
featured: Records detailed change/audit logs for timesheets, customers, projects and activities and displays them in a per-item timeline. 
new: false
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

## Purchase

{% include store-gumroad-and-support.html %}

## Installation

This plugin is compatible with the following Kimai releases:

| Bundle version    | Kimai 2 version               |
| ---               |---                            |
| 1.5               | 1.6                           |
| 1.4               | 1.4                           |
| 1.3               | 1.3                           |
| 1.2               | 1.2                           |
| 1.1.1             | 1.1                           |
| 1.0               | 1.0, 1.0.1                    |
{: .table }

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

This bundle ships a couple of new permissions, which limit access to certain functionalities:

- `audit_logs` - see the audit log page with all entries
- `audit_customer` - see all changes for the customer objects
- `audit_project` -  see all changes for the project objects
- `audit_activity` -  see all changes for the activity objects
- `audit_own_timesheet` -  see all changes for own timesheet records (only via team timesheets, audit logs are **not** shown in user timesheet panel)
- `audit_other_timesheet` -  see all changes in other users timesheet records (only via team timesheets, audit logs are **not** shown in user timesheet panel)

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include alert.html icon="fas fa-exclamation" type="warning" alert="You don't need the following since Kimai 1.6. Please adjust all permission settings in your administration." %}

Read how to assign these permission to your user roles in the [permission documentation](https://www.kimai.org/documentation/permissions.html).

This is a proposal if you use the bundle in a multi-user environment:
```yaml
kimai:
    permissions:
        roles:
            ROLE_SUPER_ADMIN: ['audit_logs','audit_customer','audit_project','audit_activity','audit_own_timesheet','audit_other_timesheet']
            ROLE_ADMIN: ['audit_logs','audit_customer','audit_project','audit_activity','audit_own_timesheet','audit_other_timesheet']
```

After changing the permissions in local.yaml, you need to clear the application cache.

## Screenshots

The overview page of all audit trail logs:

![Screenshot](https://www.kimai.org/images/marketplace/audit-trail-screenshot-2.png)

A audit trail can look like this, but each change will be recorded and you might see more entries in a object timeline:

![Screenshot](https://www.kimai.org/images/marketplace/audit-trail-screenshot.jpg)

You access an objects audit trail either via the overview page or the data-table "Actions" dropdown of each item:

![Screenshot](https://www.kimai.org/images/marketplace/audit-trail-button.jpg)
