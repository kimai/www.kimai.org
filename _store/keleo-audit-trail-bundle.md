---
title: Audit-Trail plugin for Kimai
name: Audit-Trail plugin
intro: "Records detailed change/audit logs for timesheets, customers, projects and activities and displays them in a per-item timeline."
slug: audit-trail-bundle
developer: kevinpapst
date: "2019-05-21 20:00:00 +0200"
icon: fas fa-history
demo: true 
price: "39€"
gumroad: kimai2-audit-trail
featured: "Records detailed change/audit logs for timesheets, customers, projects and activities and displays them in a per-item timeline."
new: false
type: featured
tags:
  - plugin
bundle:
  name: "AuditTrailBundle"
  command: "kimai:bundle:audittrail:install"
  purchase: true
  versions:
    - ["1.12", "1.15"]
    - ["1.11 - 1.11.1", "1.14"]
    - ["1.10", "1.11"]
    - ["1.9", "1.10"]
    - ["1.6 - 1.8", "1.7"]
    - ["1.5", "1.6"]
    - ["1.4", "1.4"]
    - ["1.3", "1.3"]
    - ["1.2", "1.2"]
    - ["1.1.1", "1.1"]
    - ["1.0", "1.0"]
screenshots:
  - 
    src: '/images/marketplace/audit-listing.png'
    title: Audit-logs
    description: The overview page of all audit trail logs
  -
    src: '/images/marketplace/audit-details.png'
    title: Audit detail view
    description: An audit trail can look like this, each change will be recorded and you might see more entries in a object timeline
  - 
    src: '/images/marketplace/audit-action.png'
    title: Access change history
    description: You access a detailed audit log from the listing page or from the data-table "Actions" dropdown of each item
---
 
Find out who changed what and when: a Kimai plugin to record and visualize the changes on `timesheets`, `customers`, `projects`, `activities`, `users`, `system configurations` and `invoices`.

## Features

Adds a global audit-trail page, listing all recorded changes with username, change datetime, item type and link to detail page.

Adds new actions to each of the following items in the admin section:
- Timesheets
- Customers
- Projects
- Activities
- Invoices

Introduces a new screen for each of the above items, with all recorded changes and each log entry containing the following information:

- username
- date-time
- type of change (create, update, delete)
- changed fields (see list below)
 
The change history will be recorded for the following fields:
- Timesheet: `begin`, `end`, `duration`, `timezone`, `user`, `activity`, `project`, `description`, `rate`, `fixedRate`, `hourlyRate`, `exported`, `billable`, `internalRate`, `category`, `modifiedAt` 
- Customer: `name`, `number`, `comment`, `visible`, `company`, `contact`, `address`, `country`, `currency`, `phone`, `fax`, `mobile`, `email`, `homepage`, `timezone`, `fixedRate`, `color`, `budget`, `timeBudget`, `vatId` 
- Project: `customer`, `name`, `orderNumber`, `comment`, `visible`, `budget`, `fixedRate`, `hourlyRate`, `color`, `budget`, `timeBudget`, `start`, `end`, `timezone`
- Activity: `project`, `name`, `comment`, `visible`, `fixedRate`, `hourlyRate`, `color`, `budget`, `timeBudget`
- User: `username`, `email`, `enabled`', `roles`, `alias`, `title`, `avatar`, `password_requested_at`, `auth`, `registration_date` 
- System configuration: `name`, `value`
- Invoice: `customer`, `user`, `invoiceNumber`, `createdAt`, `timezone`, `total`, `tax`, `currency`, `status`, `dueDays`, `vat`, `invoiceFilename`

**Be aware**:
- This bundle needs to be installed and activated to keep track of the change history, previous changes are not available.
- Not all entities and fields will be recorded, please read the above list carefully.
- The "Audit logs" link is not available under "My timsheets" to prevent potential information leaks.

### Usage

When logged in as `SUPER_ADMIN`, you will now see the overview page at `/en/audit/` and the items audit log screens 
in the "action" dropdown menus of the above items.

### Permissions

This bundle introduces new permissions, which limit access to certain functions:

| Permission Name           | Description |
|---                        |--- |
| `audit_logs`              | see the audit log page with all entries |
| `audit_customer`          | see all changes for the customer objects |
| `audit_project`           | see all changes for the project objects |
| `audit_activity`          | see all changes for the activity objects |
| `audit_own_timesheet`     | see all changes for own timesheet records (only via team timesheets, audit logs are **not** shown in user timesheet panel) |
| `audit_other_timesheet`   | see all changes in other users timesheet records (only via team timesheets, audit logs are **not** shown in user timesheet panel) |
{: .table }

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include store-howto-permissions.md %}
 
