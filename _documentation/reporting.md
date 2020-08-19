---
title: Reporting
description: Reporting feature of Kimai
toc: true
---

## Weekly view for one user

Description is following soon ...

## Monthly view for one user

Description is following soon ...

## Monthly view for all users

Description is following soon ...

## Extending the reports

You can add your own views to the reporting panel by listening to the `ReportingEvent`:

```php

use App\Event\ReportingEvent;
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

    public function onMainMenuConfigure(ReportingEvent $event)
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
