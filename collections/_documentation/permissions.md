---
title: Roles & Permissions
description: Configure the permission system which is based on user roles 
---

Kimai provides a flexible permission system, which is based on **user roles** and **permissions**, 
which can be turned on and off for these roles. You need the `role_permissions` permission to access the `Roles` screen.

This permission system limits access to the functionality of Kimai. 

{% alert %}
If you are looking for a way to limit access to timesheets, activities, projects and customers read about [Team permissions]({% link _documentation/teams.md %}).
{% endalert %}

## Roles

Access to functions is handled by the [permission system]({% link _documentation/permissions.md %}), which is configurable through user roles.
There are four pre-defined roles in Kimai, which have a customizable set of ACLs/permissions.

| Role name      | Description                                                                                                                                               |
|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| User           | Normal user can track their working times, see basic reports and change their own preferences. Technical name: `ROLE_USER`                                |
| Teamlead       | Manages [teams]({% link _documentation/teams.md %}) with permissions for invoices and access to all **team** timesheets. Technical name: `ROLE_TEAMLEAD`  |
| Administrator  | Can manage all content and timesheet related data, but lack user administration and system privileges. Technical name: `ROLE_ADMIN`                       |
| System-Admin   | Has permissions to manage everything in Kimai, from content to timesheets to users, plugins and system configurations. Technical name: `ROLE_SUPER_ADMIN` |
{: .table }

{% alert danger -%}
Every user is automatically member of the `ROLE_USER` (this cannot be changed), which means that every user owns all permissions from the `ROLE_USER`. 
{%- endalert %}

### Creating roles

If the pre-defined roles are not enough for your use-case, and you need more roles, you can create new ones.

Every user with the permission `role_permissions` can create new user roles. 
There is a button that will open a new modal, to enter a role name. This new role will show up in the table after saving.

Custom role names must start with `ROLE_` and need to be written in uppercase letters, so instead of using `Manager` you have to create `ROLE_MANAGER`. 
This is required if you want to test for role permissions programmatically.

{% alert warning %}Allowed character are: `A-Z` and `_`. If you use different character, you might experience strange bugs.{% endalert %}

## Permissions 

By turning permissions **on** and **off** for specific roles, you widen or limit the access to certain features.
Clicking the {% include badge.html class="success" badge="Yes" %} and {% include badge.html class="secondary" badge="No" %} buttons 
in the table toggles the selected permission for the respective role (column).

If a user has multiple roles, then access is granted as soon as one of these roles own the permission.

A few permissions for system-admins cannot be changed, as they are critical to manage the system. 
Those appear in a warning color as {% include badge.html class="warning" badge="Yes" %}. 

**Be aware**: other business rules might limit access to certain functions, permissions are not the only checks in place.
For example, exported timesheet records cannot be edited, even if a user owns the `edit_own_timesheet` or `edit_other_timesheet` permission.

### Activity

{% include documentation/permissions.md id="activity_admin" title=true %}
{% include documentation/permissions.md id="activity_team_leader" title=true %}
{% include documentation/permissions.md id="activity_team_member" title=true %}

### Customer

{% include documentation/permissions.md id="customer_admin" title=true %}
{% include documentation/permissions.md id="customer_team_leader" title=true %}
{% include documentation/permissions.md id="customer_team_member" title=true %}

### Project

{% include documentation/permissions.md id="project_admin" title=true %}
{% include documentation/permissions.md id="project_team_leader" title=true %}
{% include documentation/permissions.md id="project_team_member" title=true %}

### Timesheet

{% include documentation/permissions.md id="timesheet" title=true %}
{% include documentation/permissions.md id="timesheet_own" title=true %}
{% include documentation/permissions.md id="timesheet_other" title=true %}

### Export

{% include documentation/permissions.md id="export" %}

### User

{% include documentation/permissions.md id="user" title=true %}
{% include documentation/permissions.md id="user_own_profile" title=true %}
{% include documentation/permissions.md id="user_other_profile" title=true %}

### Teams

{% include documentation/permissions.md id="teams" %}

### Tags

{% include documentation/permissions.md id="tags" %}

### Invoice

{% include documentation/permissions.md id="invoice" %}

### Absences

{% include documentation/permissions.md id="absences" %}

### Working times

{% include documentation/permissions.md id="work_contract" %}
 
### Customer portal

{% include documentation/permissions.md id="customer_portal" %}
 
### Custom fields

{% include documentation/permissions.md id="meta_fields" %}
 
### Public holidays

{% include documentation/permissions.md id="public_holidays" %}

### Tasks

{% include documentation/permissions.md id="tasks" %}

### Translations

{% include documentation/permissions.md id="translations" %}

### Audit logs

{% include documentation/permissions.md id="audit" %}

### Custom content

{% include documentation/permissions.md id="custom_content" %}

### Expenses

{% include documentation/permissions.md id="expenses" %}

### Importer

{% include documentation/permissions.md id="importer" %}

### Kiosk

{% include documentation/permissions.md id="kiosk" %}

### Reporting

{% include documentation/permissions.md id="reporting" %}

### Others

{% include documentation/permissions.md id="other" %}
