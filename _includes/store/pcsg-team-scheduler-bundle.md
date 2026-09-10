# Team Scheduler Bundle
The Team Scheduler Bundle extends Kimai with a central duty roster that makes team availability, absences, and capacity limits transparent while helping you detect conflicts early.

## Feature overview
- **Calendar-based duty roster**
  - Weekly view showing employee, team and activity info per shift plus absence badges and visual patterns for vacation/sickness.
- **Automatic schedule generation**
  - Creates shifts for all active users from their standard working times, skips overlapping entries and reports missing master data.
- **Manual schedule entries**
  - Form for employee, team, activity, date/time, description and absence (half-day fields included) with save/delete actions.
- **Validations & absence rules**
  - Prevents double bookings, enforces proper time ranges and requires consistent half-day absences within the shift.
- **Notifications & monitoring**
  - Planner bar with checks for missing timesheets, outside standard hours, weekly hours over/under target, overtime limits, missing standard schedules and unmet daily/weekly staffing levels.
- **Translations**
  - German and English (based on your Kimai UI language)

## Installation (step by step)

### 1) Requirements
- **Kimai version**
  - Minimum version: **2.20** (plugin metadata: `require: 22000`)
- **Server access**
  - Access to the Kimai filesystem (to place/extract into `var/plugins/`)
- **Composer** (manual installs only)
  - `composer` available on the shell

### 2) Place the plugin in the plugin directory
Kimai loads plugins automatically from:

`/path/to/kimai/var/plugins/`

Important:
- The directory name must be **exactly** `TeamSchedulerBundle`.
- The folder must be located directly inside `var/plugins/` (no extra nesting).
- Make sure there is no `.disabled` file inside the plugin folder.

### 3) Install via ZIP archive

1. Copy the ZIP into `/path/to/kimai/var/plugins/`.
2. Extract it so the final path looks like:

   `/path/to/kimai/var/plugins/TeamSchedulerBundle/`

3. If the ZIP creates a different folder name (e.g. `TeamSchedulerBundle-1.0.0`): rename it to `TeamSchedulerBundle`.

### 4) Clear Kimai cache (prod)
After placing/updating the plugin, clear and warm up the cache:
```bash
cd /path/to/kimai
bin/console cache:clear --env=prod
bin/console cache:warmup --env=prod
```

### 5) Plugin Installation (Database)

The plugin includes its own entities (including `SchedulerEntry` and `WorkScheduleConfig`).  
The required database tables are created or updated using the installer command:

```bash
cd /path/to/kimai
bin/console kimai:bundle:teamschedulerbundle:install
```

Optional: install assets (only if the plugin UI is displayed incorrectly)

```bash
bin/console assets:install
```

Typical signs that this is needed:
- Plugin pages appear without proper styling (missing CSS)
- Buttons, calendar views, or other UI elements do not respond
- The browser (Developer Tools) shows 404 errors for files under `bundles/...`

If any of these issues occur, run `assets:install` and then reload the page.

### 6) Verify the plugin is loaded
1. Reload Kimai.
2. Verify the plugin menu entry is available.

### 7) Permissions & configuration
1. **Permissions**
   - Configure roles/permissions in Kimai so the intended users can access the scheduler.
2. **Configure the plugin**
   - Under **System → Settings → Scheduler Configuration**
     - minimum staffing
     - weekdays
     - excluded activities
     - planning period
3. **Ask staff to maintain their scheduler profiles**
   - This is required for auto-generation and validations to work properly.

## Troubleshooting
- **Plugin does not show up**
  - Check the folder name: must be `TeamSchedulerBundle`
  - Is it located directly under `var/plugins/`?
  - Is there a `var/plugins/TeamSchedulerBundle/.disabled` file?
  - Did you clear the `prod` cache and reload Kimai?
- **Composer errors on manual install**
  - Run `composer install` again inside the plugin directory

---
