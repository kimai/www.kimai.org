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

### My tasks

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

### Pending tasks

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

**Start task**

- Starts a timesheet for the current user
- Sets the status to `work in progress`

**Stop task**

- Stops the task related timesheet for the current user
- If no timesheet for the current user is running, nothing will happen

**Complete**

Completing a task signals that the work is finished.

- Completing switches the status to `done`
- It will stop all running timesheets of the task  
- The task will be removed from the `My tasks` widget after the widget was reloaded (until then it can be reopened)
- Completing a task will not remove it from any board

**Reopen task**

- Switches the status from `done` to `work in progress`

**Assign to me**

- Assigns the currently logged-in user to the task
- Sets the status to `work in progress` if not yet `done`

**Release**

- Stops all timesheets for the assigned user
- Removes the assigned user
- Switches the status to `pending` if not yet `done`

## Kanban Boards

The Task management plugin includes Kanban boards, which help you and your team to prioritize and work on tasks in a visual way.

A board displays tasks as cards in columns (by default _To Do_, _Waiting_, _In progress_ and _Done_).
You move a card between columns as its state changes — either by drag & drop or via the card menu.

Boards do not change which tasks exist or who may see them: a board only shows tasks that you are
allowed to see anyway. Two people looking at the same board might therefore see different cards.

### Quick start

1. Open **Tasks > Boards** from the main menu.
2. Your personal board is created automatically the first time you open the page.
3. Click the **+** button of a column to put one of your tasks onto the board.
4. Drag cards between columns as you work — a placeholder shows you exactly where the card will land.

### Your personal board

Every user gets a personal board, created automatically when you first open **Tasks > Boards**.
It is private: only you can see and use it — this includes teamleads and administrators,
who cannot access the private boards of other users. You can rename it, change its columns or delete it.
If you delete your last private board, a fresh one is created the next time you open the page.

You can create up to **3 private boards** (for example one per project or customer).

### Boards overview

All boards you have access to are shown as tabs at the top of the page.
Your private boards are listed first, followed by the global boards, each group sorted by name:

- A **person icon** marks your private boards.
- A **group icon** marks global boards that are limited to one or more of your teams.
- Global boards without an icon are visible to every user.

The last board you opened is remembered and shown again on your next visit.

### Managing boards

All board management happens in the **Boards** dropdown at the top of the page:

- **My boards** lists your private boards.
- **Boards** lists all other boards you may edit.
- Click a board name to open its settings, where you can also **delete** the board (if you are allowed to).
- **Create** at the end of the dropdown adds a new board. It is hidden once you have reached the limit
  of private boards, unless you are allowed to create global boards.

The board settings contain:

- **Name** — between 2 and 100 characters.
- **Private board** — only shown if you may create global boards (see below), otherwise every new board is private.
- **Team** — only for global boards, limits the visibility to the selected teams.
- **Columns** — see [Customizing columns](#customizing-columns).

Deleting a board never deletes tasks — only the board and its card positions are removed.

### Working with cards

Each card shows:

- the task title (struck through if the task is completed)
- the due date badge, if the task has an end date: grey while the task is on time,
  red when it is overdue, orange when it is completed but was overdue
- the first characters of the task text
- the avatar of the assigned user (unassigned tasks show no avatar)
- a row of actions

A card of an open task that is overdue — its end date has passed or the tracked time exceeds
its estimation — is additionally highlighted with a red background.

The action row offers:

| Action            | Description                                                                                                                   |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Start / Stop      | Start or stop time-tracking for this task, see [Time-tracking from cards](#time-tracking-from-cards).                         |
| Comments          | Opens the task detail page at the comment section, the number shows existing comments.                                        |
| Complete / Reopen | Complete an open task, or reopen a completed one. Completed tasks stay on the board, see [Completed tasks](#completed-tasks). |
| **…** (menu)      | Opens the card menu with further actions, see below.                                                                          |
{:.table}

The card menu (**…**) contains, depending on your permissions:

| Entry             | Description                                                                                               |
|-------------------|-----------------------------------------------------------------------------------------------------------|
| Edit              | Edit the task.                                                                                            |
| Assign to me      | Assign an unassigned task to yourself.                                                                    |
| Release           | Remove the assigned user from the task. A running time-tracking of that user for this task is stopped.    |
| Remove from board | Remove the card from this board. The task itself is **not** deleted or changed.                           |
| Move to           | Move the card to the end of another column — useful on touch devices, where drag & drop is not available. |
| Delete            | Permanently delete the task (not only the card).                                                          |
{:.table}

### Time-tracking from cards

- **Start** always tracks the time for **you**, even if the task is assigned to someone else.
- Starting a task that is unassigned or assigned to another user requires the permission `task_start_all`
  (by default only administrators). Without it, use **Assign to me** first.
- Completed tasks cannot be started, and you need access to the task's project and activity.
- **Stop** is always available while you have a running time-tracking for the task and only stops your own record.

### Completed tasks

Completing a task (from the board or the task list) does not remove it from any board:
the card stays in its column with a struck-through title, so you can still see what was done.
Use **Reopen** on the card to continue working on it, or **Remove from board** to clean up the column.

Completed tasks cannot be added to a board.

### Drag & drop

Grab any card and drag it to a new position — within its column to re-prioritize,
or into another column to change its state. While dragging, a dashed placeholder
shows the exact position where the card will land. The whole column area below the
cards is a valid drop target, even when the column is empty.

Cards you cannot see (or that are hidden by a filter) keep their place: the moved card is
always inserted directly in front of the card that follows the placeholder.

On touch devices use the **Move to** entry of the card menu instead.

### Filtering the board

Above the board you find two quick filters (they only hide cards on screen, nothing is changed):

- **Search** — type any text to only show cards whose content matches.
- **Only my tasks** — toggle to only show cards that are assigned to you.

The filters are kept while you work on the board, e.g. after moving or completing a card.

### Adding tasks to a board

Use **Create** at the top of the page to create a new task, it is added to the end of the first column
of the current board. This requires the permission to create tasks.

To put an existing task on the board, click the **+** button of the column you want to add to and pick a task.
The list only offers open (not completed) tasks that you are allowed to see and that are not yet on the board.
New cards are added to the end of that column. The **+** button is hidden when there is no task left that could be added.

### Customizing columns

If you may edit a board (own boards, or global boards if you have the permission),
open it from the **Boards** dropdown and adjust the columns:

- **Rename** a column (up to 30 characters) — cards stay where they are.
  The default columns are translated into your language as long as they are not renamed.
- **Add** columns (up to 8 per board) and **reorder** them with the arrow buttons or by dragging the grip icon.
- **Color** — optionally pick a color, which is shown at the top of every card in that column.
- **Delete** a column — its cards are moved to the end of the first remaining column, nothing is lost.
  A board needs at least one column.
- **WIP limit** — optionally define how many cards (1 to 99) a column should hold at most.
  The limit is a soft limit: the column counter turns red when it is exceeded,
  but moving more cards into the column is still possible.
  The counter only includes the cards you can see.
 
### Global & Team boards

Besides private boards there are **global boards**, which are shared work surfaces.
Creating and editing them requires the permission `task_board_create` (by default granted
to teamleads and administrators). When creating a board, untick **Private board**:

- **Without teams:** the board is visible to every user.
- **With teams:** the board is only visible to members of the selected teams.
  This applies to administrators as well: you only see team boards of teams you are a member of.

Regardless of who can *see* a global board, every viewer only sees the *cards of tasks they may see*
based on the regular task permissions (assignee, team, project access). Every viewer of a global
board may add, move and remove cards — a board is a shared planning tool, not a permission system.

Global boards have no owner. Deleting one requires the permission `task_board_delete`.
Ticking **Private board** on an existing global board turns it into your own private board
(the team assignment is removed), which counts towards your limit of private boards.

**Suggested workflow**

1. Create a (global) board per team, assigned to that team.
2. Define columns matching your process (e.g. _Backlog_, _Ready_, _Doing_, _Review_, _Done_) and set WIP limits on the active columns.
3. Team members pull tasks onto the board and move them as they work, tracking time directly from the cards.
4. Complete tasks in the _Done_ column and remove them from the board once they are no longer needed.

### For administrators

- Deleting a user deletes their private boards. Deleting a task or a team cleans up all related board entries automatically.
- Completing a task does not change any board, completed tasks stay where they are.
- Boards never grant access to tasks: all task visibility rules (assignee, team, project permissions) apply unchanged when a board is rendered.

## Permissions

The following restrictions are in place for accessing another user's data:
- can only be seen by users who own the `view_other_timesheet`
- users that own the `task_view` permission but NOT `view_other_timesheet` will only see own/assigned tasks
- the visible data for non-admin users (permission `view_all_data`) is limited by team assignments

{% include documentation/permissions.md id="tasks" howto=true all_roles=true %}
