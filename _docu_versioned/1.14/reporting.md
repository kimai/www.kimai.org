---
title: Reporting
description: Reporting feature of Kimai
toc: true
canonical: /documentation/reporting.html
---

Access to the reporting screens has every user with the `view_reporting` permission.
Each user can configure a personal default reporting screen (since Kimai 1.14) in their user preferences (default: `Weekly view for one user`).

There are two kind of report types:
- `Rounded times` - uses the (rounded) duration, which will be used in invoice and exports as well
- `Real times` - displays the real tracked times (like the dashboard working time widget) and NOT the rounded times, records which are passing midnight will be split into the two entries 
- `Working times` - Like `Real times` with the difference that entries will not be split at midnight, but calculated for the day of the start time

## Permissions 

The following [permissions]({% link _documentation/permissions.md %}) are generally relevant for all reporting views:
 
- `view_reporting` - to be able to see the report menu
- `view_other_timesheet` - for choosing users
- `view_other_reporting` - for seeing reports with other users  
- `view_all_data` - see all user (otherwise team member)

If the current user owns the `view_other_timesheet` permission the displayed username will be replaced by a user select box.
The available users to choose from are either all (if the user owns the permission `view_all_data`) or all his team member (if he is a team leader).

## Available reports

The following reports exist in Kimai. Your installation might have more, as plugins can ship their own reports. 

### Weekly view for one user

Displays the working times for a week for one user. 

You can change the displayed calendar week and (if the user owns the `view_other_timesheet` permissions) the user to display the report for.

- Required permission: `view_reporting`
- Type of report: `Real times`  

### Monthly view for one user

Displays a full month of working times for one user. 

You can change the displayed month and (if the user owns the `view_other_timesheet` permissions) the user to display the report for.

- Required permission: `view_reporting`
- Type of report: `Real times`  

### Weekly view for all users

 Displays a full week of working times for all users (that you have access to, see "Permissions").

 You can change the displayed week.

 - Required permission: `view_reporting` and `view_other_timesheet` and `view_other_reporting`
 - Type of report: `Real times`  
 
### Monthly view for all users

Displays a full month of working times for all users (that you have access to, see "Permissions").

You can change the displayed month.

- Required permission: `view_reporting` and `view_other_timesheet` and `view_other_reporting`
- Type of report: `Real times`  

### Project overview

Display a reporting of all projects (you have access to) which summed up times and money, budget and time-budget progress bars, 
links to invoice and export screen.

You can change the customer to filter the project list and decide to include projects without budgets and projects without recorded times.

- Required permission: `view_reporting` and `budget_project`
- Type of report: `Rounded times`  

### Inactive projects

Display a reporting of all inactive projects, layout is the same as the `Project overview` report.

You can change the date that is used to filter inactive projects (date since last timesheet was recorded).

- Required permission: `view_reporting` and `budget_project`
- Type of report: `Rounded times`  

## Extending the reports

You can add your own views to the reporting panel by listening to the `ReportingEvent`:

```php
namespace KimaiPlugin\DemoBundle\EventSubscriber;

use App\Event\ReportingEvent;
use App\Reporting\Report;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

final class ReportingEventSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            ReportingEvent::class => ['onReportingMenu', 100],
        ];
    }

    public function onReportingMenu(ReportingEvent $event)
    {
        // add a report to the menu: unique id,      the route name,     the label to be translated
        $event->addReport(new Report('week_by_user', 'report_user_week', 'report_user_week'));
    }
}
```
Now all you need to do: create a controller that renders your report.
Make sure to include an `@Security("is_granted('view_reporting')")` permission check.
