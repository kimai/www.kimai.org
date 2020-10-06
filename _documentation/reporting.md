---
title: Reporting
description: Reporting feature of Kimai
since_version: "1.10"
toc: true
---

Access to the reporting screens has every user with the `view_reporting` permission.

A general note: the reporting extension displays (like the dashboard working time widget) the real tracked times and 
NOT the rounded times that are used in the duration field of each record.

The (rounded) duration will be used in invoice and exports, while the reporting uses the true logged times. 

## Weekly view for one user

The default view that will be loaded when clicking the "Reporting" menu icon. 
It displays the working times for a week for one user. 

You can change the displayed calendar week and (if you have the correct permissions) the user to display the report for.

## Monthly view for one user

Display a full month of working times for one user.

You can change the displayed month and (in case you have the correct permissions) the user to display the report for.

## Weekly view for all users

Display a full week of working times for all users.
All here doesn't mean "all users", but only "all users that you have access to" (see below in "Choosing a user").

You can change the displayed week.

## Monthly view for all users

Display a full month of working times for all users.
All here doesn't mean "all users", but only "all users that you have access to" (see below in "Choosing a user").

You can change the displayed month.

## Permissions 

The following permissions are relevant for the reporting view: 
- `view_reporting`
- `view_other_timesheet`
- `view_all_data`

Read more about the meaning of [these permissions]({% link _documentation/permissions.md %}).

### Choosing a user 

If the current user owns the `view_other_timesheet` permission the displayed username will be replaced by a user select box.
The available users to choose from are either all (if the user owns the permission `view_all_data`) or all his team member (if he is a team leader).

## Extending the reports

You can add your own views to the reporting panel by listening to the `ReportingEvent`:

```php
namespace KimaiPlugin\DemoBundle\EventSubscriber;

use App\Event\ReportingEvent;
use App\Reporting\Report;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Security\Core\Authorization\AuthorizationCheckerInterface;

final class ReportingEventSubscriber implements EventSubscriberInterface
{
    private $security;

    public function __construct(AuthorizationCheckerInterface $security)
    {
        $this->security = $security;
    }

    public static function getSubscribedEvents(): array
    {
        return [
            ReportingEvent::class => ['onReportingMenu', 100],
        ];
    }

    public function onReportingMenu(ReportingEvent $event)
    {
        // perform your necessary permission checks
        if (!$this->security->isGranted('view_reporting')) {
            return;
        }
        // add a report to the menu: unique id,      the route name,     the label to be translated
        $event->addReport(new Report('week_by_user', 'report_user_week', 'report_user_week'));
    }
}
```
Now all you need to do: create a controller that renders your report.
