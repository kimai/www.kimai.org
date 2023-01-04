---
title: Audit trail logs
description: Logging entity changes in Kimai 
---

{% include plugins/audit-trail.md %}

## Usage

When logged in as `SUPER_ADMIN`, you will now see the overview page at `/en/audit/` and the items audit log screens
in the "action" dropdown menus of the above items.

## Permissions

This bundle introduces new permissions, which limit access to certain functions:

| Permission Name            | Description                                                                                                                       |
|----------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| `audit_logs`               | see the audit log page with all entries                                                                                           |
| `audit_customer`           | see all changes for the customer objects                                                                                          |
| `audit_project`            | see all changes for the project objects                                                                                           |
| `audit_activity`           | see all changes for the activity objects                                                                                          |
| `audit_own_timesheet`      | see all changes for own timesheet records (only via team timesheets, audit logs are **not** shown in user timesheet panel)        |
| `audit_other_timesheet`    | see all changes in other users timesheet records (only via team timesheets, audit logs are **not** shown in user timesheet panel) |
{: .table }

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include store-howto-permissions.md %}
