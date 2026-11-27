---
title: Tasks
description: Manage your tasks / todo lists, use user and team assignments and track times for them
plugin: task-management-bundle
cloud: pro
---

{% include plugins/task-management.md %}  

## Detail pages

Open tasks will also be shown on Customer/Project/Activity detail pages.

## Dashboard widgets

Two new dashboard widgets belong to the `Task management`.

The amount of rows in the dashboard widgets can be configured in the user-preferences.

### My tasks widget

Displays all tasks which:
- are not "closed"
- are assigned to you

This widget has the following UI elements (if permissions are set for the user):
- a checkbox to close the task (moving to status done will stop all related timesheet entries)
- a title
- a status indicator (colored "red" if the task is `overdue`, otherwise green)
- a "Play" or "Pause" button (pause means that you already recorded times for the task)
- an "Edit" button to change the task fields
- an "Unassign" button (will stop all related timesheet entries and move the task to the "Pending tasks widget")
- a "Delete" button (will remove the task entirely, but keep the related timesheet entries)
- a "Create" button (create a new task for the currently logged-in user)

Visible for all user with `task_start` permission.

### Pending tasks widget

Displays all tasks which:
- have the "pending" status
- are not assigned to a user
- and are either
    - not assigned to a team
    - or are assigned to the users team
    - or the current user owns the `view_all_data` permission (like admins)

This widget has the following UI elements (if permissions are set for the user):
- a title
- a status indicator (colored "red" if the task is `overdue`, otherwise green)
- an "Edit" button
- an "Assign" button (move the task back to the "My tasks widget")
- a "Delete" button (will remove the task entirely, but keep the related timesheet entries)
- a "Create" button (create a new pending task)

Visible for all user with `task_start` and either one of `task_assign` or `task_team_view` permission.

## Task status

A task is always in one of the following states:

- `pending`
- `work in progress`
- `done`
 
## Task actions

### Start a task

- Starts a timesheet for the assigned user (or the current user if no user is assigned)
- Sets the status to `work in progress`

### Stop a task

- Stop a timesheet for the assigned user (or the current user if no user is assigned)
- Sets the status to `work in progress`

### Close a task

Closing a task means the work is finished.

- Closing switches the status to `done`
- Closing will stop all running timesheets of the task  
- The task will be removed from the `My tasks` widget after the widget was reloaded (until then it can be reopened)

### Reopen a task

- Switches the status from `done` to `work in progress`

### Assign a task

- Assigns the currently logged-in user to the task
- Sets the status to `work in progress` if not yet `done`

### Unassign a task

- Stops all timesheets for previously assigned user
- Removes the previously assigned user
- Switches the status to `pending` if not yet `done`

## Permissions

The following restrictions are in place for accessing another user's data:
- can only be seen by users who own the `view_other_timesheet`
- users that own the `task_view` permission but NOT `view_other_timesheet` will only see own/assigned tasks
- the visible data for non-admin users (permission `view_all_data`) is limited by team assignments

{% include documentation/permissions.md id="tasks" howto=true all_roles=true %}
