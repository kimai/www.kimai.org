---
title: Task management plugin for Kimai 2
name: Task management plugin
intro: "Create tasks, start/stop/pause them, assign them to users and teams and record times - a todo-list management plugin for Kimai 2 that features two new dashboard widgets"
developer: keleo
date: "2020-01-22 07:00:00 +0200"
icon: fas fa-clipboard-list
demo: true 
price: "49€"
screenshot: 
  - /images/marketplace/tasks-screenshot.png
  - /images/marketplace/tasks-create.png
  - /images/marketplace/tasks-widget.png
gumroad: kimai2-tasks
featured: "Create tasks, start/stop/pause them, assign them to users and teams - a todo-list management plugin that is connected to your time-tracker and features two new dashboard widgets" 
new: true
toc: true
tags:
  - plugin
---

A Kimai plugin, which allows you to plan your work and distribute tasks among your users and teams.
It features two new dashboard widgets, and a new "Task management" view in the left navigation.

## Features

- Add "tasks" which are used to start and group timesheet records
- Each task consists of a 
  - Title
  - End date (optional)
  - User (optional: if left empty, the task can be self-assigned from the "pending tasks" widget)
  - Team (optional: if given, only users from this team see this task and can assign it)
  - Customer (will be copied to the started timesheet)
  - Project (will be copied to the started timesheet)
  - Activity (will be copied to the started timesheet)
  - Description (will be copied to the started timesheet)

With the help of the dashboard widgets every user can manage their work. 

Or you configure the permissions in a way, that the user only see the "My times widget". 
A teamlead can then prepare a list of tasks / work schedule for the users, who then utilize the widget to start/pause/stop the tasks. 
When the work on a task is finished, the user can either close it (if allowed) or the teamlead does it after reviewing the results.  

## Purchase

{% include store-gumroad-and-support.html %}

## New widgets

This bundle introduces two new dashboard widgets

### My times widget

- Displays all tasks that:
    - are not "closed"
    - that are assigned to you

This widget features the following UI elements (if permissions are set for the user):
  - a checkbox to close the task (moving to status done will stop all related timesheet entries)
  - a title (colored "green" if end date is set but not yet reached, colored "red" if end date is overdue)
  - a "Play" or "Pause" button (pause means that you already recorded times for the task) 
  - an "Edit" button to change the task fields
  - an "Unassign" button (will stop all related timesheet entries and move the task to the "Pending tasks widget")
  - a "Delete" button (will remove the task entirely, but keep the related timesheet entries)
  - a "Create" button (create a new task for the currently logged-in user)      

### Pending tasks widget

- Displays all tasks that:
    - that are not assigned to a user
    - that are in "pending" status
    - that can be seen by the user (via team assignment or completely unassigned tasks)

This widget features the following UI elements (if permissions are set for the user):
  - a title (colored "green" if end date is set but not yet reached, colored "red" if end date is overdue)
  - an "Edit" button
  - an "Assign" button (move the task back to the "My times widget")
  - a "Delete" button (will remove the task entirely, but keep the related timesheet entries)
  - a "Create" button (create a new pending task)   

### Compatibility

Please make sure to use the correct version of the plugin, which must be compatible with your Kimai version:

| Bundle version    | Minimum Kimai 2 version   |
| ---               |---                        |
| 1.3               | 1.9                       |
| 1.0 - 1.2         | 1.7                       |
{: .table }

## Installation

{% include store-plugin-installation.md plugin="TaskManagementBundle" command="kimai:bundle:tasks:install" %}

## Permissions

This bundle ships a couple of new permissions, which limits the access to certain functions:

| Permission Name   | Description |
|---                |--- |
| `task_edit_own`   | Create and edit tasks that are assigned to the currently logged-in user. |
| `task_edit_other` | Allows to edit all tasks that are visible to the user. Create new unassigned tasks, assign team and user. |
| `task_assign`     | Self-assign a pending task by the currently logged-in user. Required to see the "Pending tasks" widget on the dashboard. |
| `task_start`      | Start a task. Only possible if task is assigned to the current user. Required to see the "My tasks" widget on the dashboard. |
| `task_close`      | Close a task. Only possible if task is assigned to the current user. The task will be removed from the "My tasks" widget after it is reloaded (until then it could be reopened). |
| `task_delete`     | Delete any existing task. |
| `task_view`       | Gives access to the task administration |
{: .table }

**This bundle ships a pre-configured permission set for all default user roles.**

Access to tasks for other users is also limited by the permission `view_other_timesheet`.
If a user has the `task_view` permission, but NOT `view_other_timesheet`, he will only see own tasks.
Be aware, that the data for non-admin users is additionally limited by the team assignments.
 
{% include store-howto-permissions.md %}

## Updating the plugin

{% include store-plugin-update.md plugin="TaskManagementBundle" command="kimai:bundle:tasks:install" %}

## Screenshots

The overview page of all tasks:

![Screenshot](https://www.kimai.org/images/marketplace/tasks-screenshot.png)

The task widget:

![Screenshot](https://www.kimai.org/images/marketplace/tasks-widget.png)

When creating a new task, you can record the following fields:

![Screenshot](https://www.kimai.org/images/marketplace/tasks-create.png)
