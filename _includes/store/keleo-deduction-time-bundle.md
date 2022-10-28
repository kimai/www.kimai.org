Allows to configure activities as being a "deduction time". A deduction time means that the timesheet duration will be negative.

Deduction times can be edited, but the negative duration is not used in the UI and not saved!

It is always the calculated duration of end - start, which is then converted to the negative value.

### Configure an activity

When editing any activity, you will see a new checkbox `Deduction time`.
If this is checked, every future timesheet using this activity, will have negative durations.

### When to use this plugin

If you are too lazy to create multiple records per day, but instead want to record entire days (attendance) and use those to create invoices/exports,
you find yourself with too many hours on the clock.

You could manually subtract breaks from every day OR you use this plugin.

1. Allow overlapping records in System > Configuration
2. Create a global activity "break time" and activate the `Deduction time` checkbox
3. Use that new activity to record your employees break times, e.g. via calendar
4. Safely export or invoice your times: due to the negative duration the break times will be subtracted from the attendance time


