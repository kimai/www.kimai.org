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

## Troubleshooting
- **Plugin does not show up**
  - Check the folder name: must be `TeamSchedulerBundle`
  - Is it located directly under `var/plugins/`?
  - Is there a `var/plugins/TeamSchedulerBundle/.disabled` file?
  - Did you clear the `prod` cache and reload Kimai?
- **Composer errors on manual install**
  - Run `composer install` again inside the plugin directory

## Requirements

* Kimai 2.20 or higher

## Configuration

1. Configure roles and permissions in Kimai so the intended users can access the scheduler.
2. Go to **System → Settings → Scheduler Configuration** and configure:
   * Minimum staffing
   * Weekdays
   * Excluded activities
   * Planning period
3. Ask staff to maintain their scheduler profiles. These are required for automatic schedule generation and validations.

## Support

If you require support for the usage or setup of this plugin or find any bugs please contact [support@pcsg.de](mailto:support@pcsg.de)!

---
