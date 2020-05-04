---
title: Audit-Trail plugin for Kimai 2
name: Audit-Trail plugin
intro: "Records detailed change/audit logs for timesheets, customers, projects and activities and displays them in a per-item timeline."
developer: keleo
date: "2019-05-21 20:00:00 +0200"
icon: fas fa-history
demo: true 
price: "29€"
screenshot: 
  - /images/marketplace/audit-trail-screenshot.jpg
  - /images/marketplace/audit-trail-screenshot-2.png
  - /images/marketplace/audit-trail-button.jpg
gumroad: kimai2-audit-trail
featured: "Records detailed change/audit logs for timesheets, customers, projects and activities and displays them in a per-item timeline."
new: false
toc: true
tags:
  - plugin
---

Find out who changed their records, what and when: a Kimai 2 plugin to record and visualize the changes on `timesheets`, `customers`, `projects` and `activities`.

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

### Compatibility

This plugin is compatible with the following Kimai releases:

| Bundle version    | Kimai 2 version   |
| ---               |---                |
| 1.6 - 1.8         | 1.7               |
| 1.5               | 1.6               |
| 1.4               | 1.4               |
| 1.3               | 1.3               |
| 1.2               | 1.2               |
| 1.1.1             | 1.1               |
| 1.0               | 1.0, 1.0.1        |
{: .table }

## Installation

{% include store-plugin-installation.md plugin="AuditTrailBundle" %}

### Database

Run the following command:

```bash
bin/console kimai:bundle:audittrail:install
```

This will install all required databases.

## Usage

When logged in as `SUPER_ADMIN`, you will now see the overview page at `/en/audit/` and the items audit log screens in the "action" dropdown menus.

If this was successful, you can now think about giving permissions to other users as well.

### Permissions

This bundle ships a couple of new permissions, which limits the access to certain functions:

| Permission Name           | Description |
|---                        |--- |
| `audit_logs`              | see the audit log page with all entries |
| `audit_customer`          | see all changes for the customer objects |
| `audit_project`           |  see all changes for the project objects |
| `audit_activity`          |  see all changes for the activity objects |
| `audit_own_timesheet`     |  see all changes for own timesheet records (only via team timesheets, audit logs are **not** shown in user timesheet panel) |
| `audit_other_timesheet`   |  see all changes in other users timesheet records (only via team timesheets, audit logs are **not** shown in user timesheet panel) |
{: .table }

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include store-howto-permissions.md %}
 
## Screenshots

The overview page of all audit trail logs:

![Screenshot](https://www.kimai.org/images/marketplace/audit-trail-screenshot-2.png)

A audit trail can look like this, but each change will be recorded and you might see more entries in a object timeline:

![Screenshot](https://www.kimai.org/images/marketplace/audit-trail-screenshot.jpg)

You access an objects audit trail either via the overview page or the data-table "Actions" dropdown of each item:

![Screenshot](https://www.kimai.org/images/marketplace/audit-trail-button.jpg)
