The Planner plugin adds a lightweight weekly capacity planner to Kimai. Teams and team leads plan workloads on a weekly timeline, and every planned activity is linked to a customer and, optionally, a project.

## Features

- **Weekly matrix grid**: team overview of the planned workload from Monday to Sunday
- **Capacity balancing**: the expected capacity is calculated from each user's working time contract, over-allocated, under-allocated and balanced days are highlighted
- **Planned vs. actual**: compares planned hours with the hours recorded in timesheets
- **Drag to plan**: drag across empty day cells to create a planning that spans several days
- **Shortcuts**: frequently used customers and projects are offered when creating a planning
- **Multiple weeks**: show 1, 2, 4 (default) or 8 weeks at once, with the capacity summarized per week
- **Recurring plans**: plan activities for several weeks and update a whole series at once
- **Quick editing**: create, update and delete plannings in modal dialogs
- **Date navigation**: previous week, today, next week and a date picker
- **REST API**: manage planned activities via `/api/planner/activities`
- **Permissions**: role based access for self-planning and for team leads

## Requirements

- Kimai 2.60.0 or newer
- PHP 8.2 or newer

## Installation

1. Copy or clone the plugin into `var/plugins/PlannerBundle`:

```bash
cd /path/to/kimai/var/plugins
git clone https://github.com/happiness/PlannerBundle.git
```

2. Run the database migrations and clear the cache:

```bash
bin/console kimai:plugins --install
bin/console cache:clear
```

## Permissions

| Permission | Description | Default roles |
|---|---|---|
| `view_planner` | View the planner | User, Teamlead, Admin, Super-Admin |
| `create_planner` | Create plannings for yourself | User, Teamlead, Admin, Super-Admin |
| `edit_planner` | Edit your own plannings | User, Teamlead, Admin, Super-Admin |
| `delete_planner` | Delete your own plannings | User, Teamlead, Admin, Super-Admin |
| `view_other_planner` | View other team members | Teamlead, Admin, Super-Admin |
| `edit_other_planner` | Create, edit and delete plannings for other users | Teamlead, Admin, Super-Admin |

Permissions can be adjusted under **System > Role permissions**.

## Support

Please report bugs and feature requests at [github.com/happiness/PlannerBundle](https://github.com/happiness/PlannerBundle/issues) or contact [info@happiness.se](mailto:info@happiness.se).
