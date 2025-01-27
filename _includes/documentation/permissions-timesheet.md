
| Permission Name               | Description                                                                                  |
|-------------------------------|----------------------------------------------------------------------------------------------|
| **Timesheet**                 |                                                                                              |
| edit_exported_timesheet       | Edit and delete timesheet records which were exported                                        |
| lockdown_grace_timesheet      | All records in the last lockdown period can be edited, even after the grace period ended     |
| lockdown_override_timesheet   | None of the lockdown rules apply                                                             |
| **Timesheet (other)**         |                                                                                              |
| create_other_timesheet        | Create a new timesheet record in the name of another user                                    |
| delete_other_timesheet        | Delete timesheets of other users                                                             |
| edit_export_other_timesheet   | Set the export state for other users timesheet records                                       |
| edit_billable_other_timesheet | Set the billable state for other users timesheet record (since 1.18.3)                       |
| edit_other_timesheet          | Edit existing records of other users                                                         |
| edit_rate_other_timesheet     | Edit the rates for other users timesheet records (fixed, hourly and total)                   |
| export_other_timesheet        | Export timesheet in the timesheet admin panel                                                |
| start_other_timesheet         | Start _running_ timesheet records for other users                                            |
| stop_other_timesheet          | Stop _running_ timesheet records of other users                                              |
| view_other_timesheet          | Allows access to the timesheet admin panel, listing records for all users                    |
| view_rate_other_timesheet     | View the rates for other users timesheet records (fixed, hourly and total)                   |
| **Timesheet (own)**           |                                                                                              |
| create_own_timesheet          | Create a new timesheet record with the dialog                                                |
| delete_own_timesheet          | Delete own timesheet records                                                                 |
| edit_export_own_timesheet     | Set the export state for your own timesheet record                                           |
| edit_billable_own_timesheet   | Set the billable state for your own timesheet record (since 1.18.3)                          |
| edit_own_timesheet            | Edit own timesheet records                                                                   |
| edit_rate_own_timesheet       | Edit the rates for own timesheet records (fixed, hourly and total)                           |
| export_own_timesheet          | Export your own timesheet in the timesheet panel                                             |
| start_own_timesheet           | Create a running timesheet record (restart and create)                                       |
| stop_own_timesheet            | Stop the own running timesheets records                                                      |
| view_own_timesheet            | Allows access to the own timesheet views                                                     |
| view_rate_own_timesheet       | View the rates for own timesheet records (fixed, hourly and total)                           |
| weekly_own_timesheet          | Gives access to the [weekly working hours]({% link _documentation/weekly-times.md %}) screen |
{: .table .permissions }
