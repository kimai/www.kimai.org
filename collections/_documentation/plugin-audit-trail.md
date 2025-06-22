---
title: Audit logs
description: Logging entity changes in Kimai 
---

{% include plugins/audit-trail.md %}

## Usage

When logged in as `SUPER_ADMIN`, you will now see the overview page at `/en/audit/` and the items audit log screens
in the "action" dropdown menus of the above items.

Please note: own timesheet via `audit_own_timesheet` are only available in the `All times` page, audit logs **cannot** be accessed via `My times`.

## Permissions

{% include documentation/permissions.md id="audit" howto=true super_admin=true %}
