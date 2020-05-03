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

The following example adds a custom field to each entity type, which can be edited in the "edit" and "create" forms:

- `Timesheet` via `TimesheetMeta` 
- `Customer` via `CustomerMeta` 
- `Project` via `ProjectMeta` 
- `Activity` via `ActivityMeta`

This example supports all possible entity types and adds the new `Location` field.
See in `prepareEntity()` what needs to be done to setup new custom fields, which can be edited by the user. 

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
            ->setOptions(['help' => 'Enter the place you work from here'])
            ->setName('location')
            ->setType(TextType::class)
            ->addConstraint(new Length(['max' => 255]))
            ->setIsVisible(true);

        $entity->setMetaField($definition);
    }
}
```

Attention: `setLabel()` and `setOptions()` will be added with 1.4.

### Displaying and exporting custom fields

With Kimai 1.4 you can display and export custom fields. 
Supported fields will be shown as new columns in the data-tables for timesheets, customers, projects and activities.
Additionally these fields will be added to HTML and Spreadsheet exports. 

As Kimai cannot query all existing records for possible custom fields, you need to listen to new events and 
register the desired fields. 

```php
use App\Entity\ActivityMeta;
use App\Entity\CustomerMeta;
use App\Entity\EntityWithMetaFields;
use App\Entity\MetaTableTypeInterface;
use App\Entity\ProjectMeta;
use App\Entity\TimesheetMeta;
use App\Event\ActivityMetaDisplayEvent;
use App\Event\CustomerMetaDisplayEvent;
use App\Event\ProjectMetaDisplayEvent;
use App\Event\TimesheetMetaDisplayEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Validator\Constraints\Length;

class MetaFieldDisplaySubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            TimesheetMetaDisplayEvent::class => ['loadTimesheetField', 200],
            CustomerMetaDisplayEvent::class => ['loadCustomerField', 200],
            ProjectMetaDisplayEvent::class => ['loadProjectField', 200],
            ActivityMetaDisplayEvent::class => ['loadActivityField', 200],
        ];
    }

    public function loadTimesheetField(TimesheetMetaDisplayEvent $event)
    {
        $event->addField($this->prepareField(new TimesheetMeta()));
    }

    public function loadCustomerField(CustomerMetaDisplayEvent $event)
    {
        $event->addField($this->prepareField(new CustomerMeta()));
    }

    public function loadProjectField(ProjectMetaDisplayEvent $event)
    {
        $event->addField($this->prepareField(new ProjectMeta()));
    }

    public function loadActivityField(ActivityMetaDisplayEvent $event)
    {
        $event->addField($this->prepareField(new ActivityMeta()));
    }

    private function prepareField(MetaTableTypeInterface $definition)
    {
        $definition
            ->setLabel('Working place')
            ->setName('location')
            ->setType(TextType::class);

        return $definition;
    }
}
```

## Visibility

Each meta field has its own visibility, which determines whether the field will be exposed
in the following places:

- Export
- API
- Datatables

The default visibility is `false` (hidden). If you want to show the meta fields in the datatables (eg. timesheets), 
then you have to set `visibility` to `true` (see EventSubscriber example above).

Be aware: the visibility is stored with the meta field, so changing its value via the EventSubscriber 
does NOT change the visibility of already saved meta fields, just for new ones. 
