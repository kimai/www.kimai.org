---
title: Planner
description: Weekly team capacity planner for Kimai
plugin: happiness-planner
---

**PlannerBundle** is a lightweight weekly team capacity planner plugin for [Kimai](https://www.kimai.org/), inspired by tools like Forecastapp. It allows teams and team leaders to visually plan and balance workloads on a weekly timeline. Every planned activity is linked to a customer and, optionally, a project.

## Features

- **Weekly Matrix Grid**: Clear team overview showing planned workload across the week (Monday through Sunday).
- **Capacity & Workload Balancing**:
  - Automatically calculates expected capacity from each user's working time contracts.
  - Highlights over-allocated, under-allocated, and balanced days with clear visual badges.
- **Actual vs Planned Hours**: Directly compares planned allocations against actual recorded timesheet hours.
- **Lightweight Scheduling**: Plan time blocks for a customer (and optionally a project) with daily hours, date ranges, comments, and color badges.
- **Drag to Plan**: Drag across empty day cells of a row to create a planning spanning several days. A transparent preview block is shown while dragging and stays visible while the dialog is open.
- **Shortcuts**: Frequently used customers and projects are offered as shortcuts when creating a planning.
- **Multiple Weeks**: Show 1, 2, 4 (default) or 8 weeks at once; capacity is summarized per week.
- **REST API**: Create, read, update and delete planned activities via `/api/planner/activities` (see the Kimai API docs under the "Planner" tag).
- **Quick Modal Editing**: Create, update, or delete planned blocks seamlessly via modal dialogs.
- **Date Navigation**: Fast week switcher controls (`Previous Week`, `Today`, `Next Week`, and date picker jump).
- **Fine-Grained Permissions**: Full role-based access control supporting self-planning and team lead management.

## Requirements

- Kimai `>= 2.60.0`
- PHP `>= 8.2`

## Installation

### Standard Installation

1. **Clone or copy** the plugin into Kimai's plugin directory:
   ```bash
   # Destination folder: var/plugins/PlannerBundle
   cd /path/to/kimai/var/plugins
   git clone https://github.com/happiness/PlannerBundle.git PlannerBundle
   ```

2. **Run database migrations**:
   ```bash
   bin/console kimai:plugins --install
   ```
   *Alternative direct migration command:*
   ```bash
   bin/console doctrine:migrations:migrate --configuration=var/plugins/PlannerBundle/Migrations/doctrine_migrations.yaml --no-interaction
   ```

3. **Clear the cache**:
   ```bash
   bin/console cache:clear
   ```

### Docker & DDEV Installation

If you are running Kimai inside a Docker / DDEV environment:

1. **Copy the plugin files** into `var/plugins/PlannerBundle`.

2. **Execute migrations inside the container**:
   ```bash
   ddev exec bin/console kimai:plugins --install
   ```

3. **Clear container cache**:
   ```bash
   ddev exec bin/console cache:clear
   ```

## Permissions & Roles

The plugin registers dedicated permissions that integrate seamlessly into Kimai's role and permission management:

| Permission | Description | Default Roles |
| :--- | :--- | :--- |
| `view_planner` | View the weekly planner menu and page | `ROLE_USER`, `ROLE_TEAMLEAD`, `ROLE_ADMIN`, `ROLE_SUPER_ADMIN` |
| `create_planner` | Create planned activities for self | `ROLE_USER`, `ROLE_TEAMLEAD`, `ROLE_ADMIN`, `ROLE_SUPER_ADMIN` |
| `edit_planner` | Edit own planned activities | `ROLE_USER`, `ROLE_TEAMLEAD`, `ROLE_ADMIN`, `ROLE_SUPER_ADMIN` |
| `delete_planner` | Delete own planned activities | `ROLE_USER`, `ROLE_TEAMLEAD`, `ROLE_ADMIN`, `ROLE_SUPER_ADMIN` |
| `view_other_planner` | View other team members in the weekly planner | `ROLE_TEAMLEAD`, `ROLE_ADMIN`, `ROLE_SUPER_ADMIN` |
| `edit_other_planner` | Create, edit, and delete activities for other users | `ROLE_TEAMLEAD`, `ROLE_ADMIN`, `ROLE_SUPER_ADMIN` |

Permissions can be customized anytime via the Kimai UI under **System > Role permissions**.

## REST API

All endpoints require an API token and the `view_planner` permission; write operations additionally respect `create_planner`, `edit_planner` and `delete_planner` as well as the `*_other_planner` permissions for other users' plans.

| Method | Path | Description |
| :--- | :--- | :--- |
| `GET` | `/api/planner/activities` | List activities. Filters: `user`, `customers[]`, `projects[]`, `begin`, `end` (`Y-m-d`) |
| `GET` | `/api/planner/activities/{id}` | Fetch one activity |
| `POST` | `/api/planner/activities` | Create. Body: `customer` (required), `project`, `user` (defaults to you), `begin`, `end`, `hoursPerDay`, `color`, `comment`, `recurrentWeeks` |
| `PATCH` | `/api/planner/activities/{id}` | Update any subset of fields; `edit_mode: "future"` also updates later activities of a recurring series |
| `DELETE` | `/api/planner/activities/{id}` | Delete; `?mode=future` also deletes later activities of a recurring series |

## Upgrading

### From 1.x to 2.0.0

Version 2.0.0 contains a breaking change: planned activities are now linked to a customer and optionally a project instead of carrying a free-text title.

What changed:

- **Customers and projects**: Every planned activity belongs to a customer and optionally a project. The free-text title is legacy and optional.
- **New migration**: `Version20261019000000` adds `customer_id` and `project_id` to `kimai2_planned_activities` and makes `title` nullable. Run it after updating (see [Installation](#installation)).
- **REST API**: New endpoints under `/api/planner/activities` (see below). `customer` is required when creating an activity.
- **Multi-week grid**: The planner shows 1, 2, 4 (default) or 8 weeks, with capacity summarized per week. Activities of the same customer/project are grouped in sub-rows per user, and consecutive days are merged into one block.
- **Always an empty row per user**, so new plannings can be dragged out even when a user has no activities.
- **Drag to plan**: Dragging over empty days opens the create dialog with the whole date range, showing a transparent preview of the planning.
- **Shortcuts** for frequently used customers and projects when creating a planning; they no longer depend on HappinessBundle.
- **Recurring activities**: Edit or delete only one instance or all upcoming activities of a series.
- **Compact header** with the current day highlighted.

Existing data is kept. Activities created before customers were introduced keep their old free-text title and have no customer. They are still shown (using the old title) but must be given a customer the next time they are edited.
