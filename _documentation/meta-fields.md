---
title: Custom fields
description: Use your own custom/meta fields 
toc: true
since_version: 1.0
---

Kimai supports custom fields for the following object types:

- `User` via `UserPreference` (see [user preferences]({% link _documentation/user-preferences.md %}))
- `Timesheet` via `TimesheetMeta` 
- `Customer` via `CustomerMeta` 
- `Project` via `ProjectMeta` 
- `Activity` via `ActivityMeta`

## Custom fields

Using the fields for internal reasons (eg. importing and linking to IDs of external apps) is simple.
You can add these fields programmatically at any time:
```php
$externalId = (new TimesheetMeta())->setName('externalID')->setValue(1);
$timesheet = new Timesheet();
$timesheet->setMetaField($externalId);
``` 

But what if you want the field to be editable by users?

Well, this is possible through the registration via an EventSubscriber, where you add your custom fields.

## Add editable custom fields

The following example adds a custom fields to each entity types "edit" and "create" forms:
- `Timesheet` via `TimesheetMeta` 
- `Customer` via `CustomerMeta` 
- `Project` via `ProjectMeta` 
- `Activity` via `ActivityMeta`

This example might seem a little awkward first, as I wanted to add only one example for all 
possible entity types and that definitely doesn't make the code prettier ;-)
But I hope you get the point and see in `prepareEntity` what needs to be done to setup new 
custom fields, which can be edited by the user. 

```php
use App\Entity\ActivityMeta;
use App\Entity\CustomerMeta;
use App\Entity\EntityWithMetaFields;
use App\Entity\MetaTableTypeInterface;
use App\Entity\ProjectMeta;
use App\Entity\TimesheetMeta;
use App\Event\ActivityMetaDefinitionEvent;
use App\Event\CustomerMetaDefinitionEvent;
use App\Event\ProjectMetaDefinitionEvent;
use App\Event\TimesheetMetaDefinitionEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Validator\Constraints\Length;

class MetaFieldSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            TimesheetMetaDefinitionEvent::class => ['loadTimesheetMeta', 200],
            CustomerMetaDefinitionEvent::class => ['loadCustomerMeta', 200],
            ProjectMetaDefinitionEvent::class => ['loadProjectMeta', 200],
            ActivityMetaDefinitionEvent::class => ['loadActivityMeta', 200],
        ];
    }

    public function loadTimesheetMeta(TimesheetMetaDefinitionEvent $event)
    {
        $this->prepareEntity($event->getEntity(), new TimesheetMeta());
    }

    public function loadCustomerMeta(CustomerMetaDefinitionEvent $event)
    {
        $this->prepareEntity($event->getEntity(), new CustomerMeta());
    }

    public function loadProjectMeta(ProjectMetaDefinitionEvent $event)
    {
        $this->prepareEntity($event->getEntity(), new ProjectMeta());
    }

    public function loadActivityMeta(ActivityMetaDefinitionEvent $event)
    {
        $this->prepareEntity($event->getEntity(), new ActivityMeta());
    }

    private function prepareEntity(EntityWithMetaFields $entity, MetaTableTypeInterface $definition)
    {
        $definition
            ->setName('Location')
            ->setType(TextType::class)
            ->addConstraint(new Length(['max' => 255]))
            ->setIsVisible(true);

        $entity->setMetaField($definition);
    }
}
```

## Visibility

Each meta field has its own visibility, which determines whether the field will be exposed
in the following places:

- Export
- Invoice
- API

The default visibility is `false` (hidden). If you want to use the meta fields value 
in your invoices, then you have to set its visibility to true (see EventSubscriber example above).

Be aware: the visibility is stored with the meta field, so changing its value via the EventSubscriber 
does NOT change the visibility of already saved meta fields, just for new ones. 
