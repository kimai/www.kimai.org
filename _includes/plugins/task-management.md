
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
- Tags (will be copied to the started timesheet)
- Time estimation (optional: if given, a progressbar for duration vs estimation will be shown in the listing page)

Ships a new report, which lists all users with the number of assigned tasks and the progress (via estimation or duration).

You can configure the permissions in multiple ways:
- First version: allows self-management by the user via the dashboard widgets, by assigning to pending tasks
- Second version: only the "My tasks" widget will be shown, listing page is hidden from "normal users" and teamleads will
  plan the work schedule (a list of tasks) for the users, who then use the widget to start/pause/stop their assigned tasks.

A task can reach the "overdue" status, which means:
- the task reached its end date without being finished
- the duration of all logged entries is higher than the estimation of the task

Task can also be managed via the API. 
