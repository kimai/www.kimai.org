---
title: Task management plugin for Kimai 2
name: Task management plugin
intro: "Create tasks, start/stop/pause them, assign them to users and teams and record times - a todo-list management plugin for Kimai 2 that adds two new dashboard widgets"
developer: keleo
date: "2020-01-22 07:00:00 +0200"
icon: fas fa-clipboard-list
demo: true 
price: "49€"
gumroad: kimai2-tasks
featured: "Create tasks, start/stop/pause them, assign them to users and teams - a todo-list management plugin that is connected to your time-tracker and adds two new dashboard widgets" 
toc: false
tags:
  - plugin
bundle:
    name: "TaskManagementBundle"
    command: "kimai:bundle:tasks:install"
    purchase: true
    versions: 
      - ["1.4", "1.10"]
      - ["1.3", "1.9"]
      - ["1.0 - 1.2", "1.7"]
    screenshots:
      - 
        src: "/images/marketplace/tasks-screenshot.png"
        title: "Task administration"
        description: "The new administration page with an overview of all tasks with tracked times, status and assignments"
      - 
        src: "/images/marketplace/tasks-create.png"
        title: Task widgets
        description: "The new dashboard widgets for assigned and pending tasks"
      - 
        src: "/images/marketplace/tasks-widget.png"
        title: "Edit a task"
        description: "When creating or updating a task, you can record these fields"
---

A Kimai plugin, which allows you to plan your work and distribute tasks among your users and teams.
It features two new dashboard widgets and a new "Task management" administration view.

## Features

Add "tasks" which are used to start and group timesheet records.

Each task has the following fields:
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

The amount of rows in the dashboard widgets can be configured in the user-preferences. 

## Dashboard widgets

This bundle ships two new dashboard widgets (see screenshots).

### My times widget

Displays all tasks which:
  - are not "closed"
  - are assigned to you

This widget has the following UI elements (if permissions are set for the user):
  - a checkbox to close the task (moving to status done will stop all related timesheet entries)
  - a title (colored "green" if end date is set but not yet reached, colored "red" if end date is overdue)
  - a "Play" or "Pause" button (pause means that you already recorded times for the task) 
  - an "Edit" button to change the task fields
  - an "Unassign" button (will stop all related timesheet entries and move the task to the "Pending tasks widget")
  - a "Delete" button (will remove the task entirely, but keep the related timesheet entries)
  - a "Create" button (create a new task for the currently logged-in user)      

### Pending tasks widget

Displays all tasks which:
  - have the "pending" status
  - are not assigned to a user
  - can be seen by the user (via team assignment or completely unassigned tasks)
 
This widget has the following UI elements (if permissions are set for the user):
  - a title (colored "green" if end date is set but not yet reached, colored "red" if end date is overdue)
  - an "Edit" button
  - an "Assign" button (move the task back to the "My times widget")
  - a "Delete" button (will remove the task entirely, but keep the related timesheet entries)
  - a "Create" button (create a new pending task)   

## Permissions

This bundle introduces new permissions, which limit access to certain functions:

| Permission        | Description |
|---                |--- |
| `task_edit_own`   | Create and edit tasks that are assigned to the currently logged-in user. |
| `task_edit_other` | Allows to edit all tasks that are visible to the user. Create new unassigned tasks, assign team and user. |
| `task_assign`     | Self-assign a pending task by the currently logged-in user. Required to see the "Pending tasks" widget on the dashboard. |
| `task_start`      | Start a task. Only possible if task is assigned to the current user. Required to see the "My tasks" widget on the dashboard. |
| `task_close`      | Close a task. Only possible if task is assigned to the current user. The task will be removed from the "My tasks" widget after it is reloaded (until then it could be reopened). |
| `task_delete`     | Delete any existing task. |
| `task_view`       | Gives access to the task administration |
{: .table }

A pre-configured permission set for all default user roles is applied by the plugin, please adjust them to your needs.
 
{% include store-howto-permissions.md %}


The following restrictions are in place for accessing other user's data:
 - can only be seen by users who own the `view_other_timesheet` 
 - users that own the `task_view` permission but NOT `view_other_timesheet` will only see own/assigned tasks
 - the visible data for non-admin users (permission `view_all_data`) is limited by team assignments 
