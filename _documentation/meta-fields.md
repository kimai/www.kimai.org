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

This example supports all possible entity types adds a new `Location` field.
See in `prepareEntity` what needs to be done to setup new custom fields, which can be edited by the user. 

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
            ->setLabel('Working place')
            ->setName('location')
            ->setType(TextType::class)
            ->addConstraint(new Length(['max' => 255]))
            ->setIsVisible(true);

        $entity->setMetaField($definition);
    }
}
```

Attention: `setLabel()` will be added with 1.4.

### Show meta field columns

With Kimai 1.4 you can display columns in the data-tables for each visible field. 

As Kimai cannot query all existing records for possible custom fields, you need to listen to new events and 
register the desired fields. 

```php
use App\Entity\ActivityMeta;
use App\Entity\CustomerMeta;
use App\Entity\EntityWithMetaFields;
use App\Entity\MetaTableTypeInterface;
use App\Entity\ProjectMeta;
use App\Entity\TimesheetMeta;
use App\Event\ActivityMetaQueryEvent;
use App\Event\CustomerMetaQueryEvent;
use App\Event\ProjectMetaQueryEvent;
use App\Event\TimesheetMetaQueryEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Validator\Constraints\Length;

class MetaFieldColumnSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            TimesheetMetaQueryEvent::class => ['loadTimesheetField', 200],
            CustomerMetaQueryEvent::class => ['loadCustomerField', 200],
            ProjectMetaQueryEvent::class => ['loadProjectField', 200],
            ActivityMetaQueryEvent::class => ['loadActivityField', 200],
        ];
    }

    public function loadTimesheetField(TimesheetMetaQueryEvent $event)
    {
        $event->addField($this->prepareEntity(new TimesheetMeta()));
    }

    public function loadCustomerField(CustomerMetaQueryEvent $event)
    {
        $event->addField($this->prepareEntity(new CustomerMeta()));
    }

    public function loadProjectField(ProjectMetaQueryEvent $event)
    {
        $event->addField($this->prepareEntity(new ProjectMeta()));
    }

    public function loadActivityField(ActivityMetaQueryEvent $event)
    {
        $event->addField($this->prepareEntity(new ActivityMeta()));
    }

    private function prepareEntity(MetaTableTypeInterface $definition)
    {
        $definition
            ->setLabel('Working place')
            ->setName('location')
            ->setType(TextType::class)
            ->addConstraint(new Length(['max' => 255]))
            ->setIsVisible(true);

        return $definition;
    }
}
```

## Visibility

Each meta field has its own visibility, which determines whether the field will be exposed
in the following places:

- Export
- Invoice
- API
- Datatables

The default visibility is `false` (hidden). If you want to use the meta fields value in your invoices or show them in 
the data tables (eg. timesheets), then you have to set its visibility to true (see EventSubscriber example above).

Be aware: the visibility is stored with the meta field, so changing its value via the EventSubscriber 
does NOT change the visibility of already saved meta fields, just for new ones. 
