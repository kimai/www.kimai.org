---
title: Audit trail logs
description: Logging entity changes in Kimai 
---

{% include plugins/audit-trail.md %}

## Usage

When logged in as `SUPER_ADMIN`, you will now see the overview page at `/en/audit/` and the items audit log screens
in the "action" dropdown menus of the above items.

## Permissions

| Permission Name          | Description                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| `audit_logs`             | see the audit log page with all entries                                     |
| `audit_customer`         | see all changes for customers                                               |
| `audit_project`          | see all changes for projects                                                |
| `audit_activity`         | see all changes for activities                                              |
| `audit_user`             | see all changes for users                                                   |
| `audit_configuration`    | see all changes for system configurations                                   |
| `audit_invoice`          | see all changes for invoices                                                |
| `audit_own_timesheet`    | see all changes for own timesheet records                                   |
| `audit_other_timesheet`  | see all changes in other users timesheet records (only via team timesheets) |
{: .table }

Please note: `audit_own_timesheet` are only available via team timesheets, audit logs are **not** shown in user timesheet panel

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include snippets/store-howto-permissions.md %}
