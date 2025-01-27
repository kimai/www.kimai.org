
Add "tasks" which are used to start and group timesheet records.

Each task has the following fields:
- Title
- Work description
- End date (optional)
- Time estimation (optional: if given, a progressbar for duration vs estimation will be shown in the listing page)
- User (optional: if left empty, the task can be self-assigned from the "pending tasks" widget)
- Team (optional: if given, only users from this team see this task and can assign it)
- Customer (will be copied to the started timesheet)
- Project (will be copied to the started timesheet)
- Activity (will be copied to the started timesheet)
- Description (will be copied to the started timesheet)
- Tags (will be copied to the started timesheet)
- List of comments (to share updates with others)

Ships new reports:
- List all users with the number of assigned tasks and progress (via estimation / logged duration)
- List all teams with the number of assigned tasks and progress (via estimation / logged duration)

Users can log work time for tasks with drag & drop support in the calendar view.

Ships two new dashboard widgets (see screenshots):
- The amount of rows in the dashboard widgets can be configured in the user-preferences
- With the help of the dashboard widgets every user can manage their work

You can configure the permissions in multiple ways:
- First version: allows self-management by the user via the dashboard widgets, by assigning to pending tasks
- Second version: only the "My tasks" widget will be shown, listing page is hidden from "normal users" and teamleads will  plan the work schedule (a list of tasks) for the users, who then use the widget to start/pause/stop their assigned tasks
- Third version: Tasks are shared, pending tasks can be started and stopped by everyone/team members

A task can reach the `overdue` status, which means:
- the task reached its end date without being finished
- or the duration of all logged entries is higher than the estimation of the task

Tasks which are `overdue` will be highlighted by a warning color.

A task can be created from an Activity, pre-setting all possible values from the project and activity.

Task can also be managed via the API. 
