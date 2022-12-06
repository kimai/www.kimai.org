---
title: Upgrade your Plugin to v2
navigation: Migrate plugins to v2
description: How to migrate your plugins from Kimai 1.x to Kimai 2.x
canonical: /documentation/migration-v2.html
---

This documentation covers the required steps to [migrate your plugin to the upcoming Kimai 2.x](https://github.com/kevinpapst/kimai2/pull/2902).

There are likely steps missing, so if you encounter any issue, please post them at GitHub, so we can adjust this documentation.

What needs to be done?

- Upgrade to PHP >= 8.1 if not yet done
- Install Kimai 2.0 and install your plugin as usual in `var/plugins/`
- Adapt composer.json to the new format
- Upgrade your code (see below)
- Test your plugin

Required code adjustments:

- All deprecated code was removed
- Code base uses a much stricter syntax now and thus introduced a lof of tiny and sometimes larger BC breaks  
- Switched from annotations to attributes everywhere (controller/entities/api), plugins need to be made compatible
- Doctrine Entities: Attributes instead of Annotations (see the rector migration below)
- New frontend needs code adjustments (compare with demo plugin and core templates)
- API: upgraded to [Open API specification v3](https://blog.readme.com/an-example-filled-guide-to-swagger-3-2/) - require use of new attributes/annotations
- User preference names cannot contain dots `.` anymore (you might need migrations to adapt existing ones!)
- Removed Twig filters. You have to replace them in your custom export/invoice templates:
    - `date_full` => `date_time`
    - `duration_decimal` => `duration(true)`
    - `currency` => `currency_name`
    - `country` => `country_name`
    - `language` => `language_name`
- Switch from `createForm()` to `createFormForGetRequest()` for toolbar forms

## API changes 

- API: config/timesheet removed `activeEntriesSoftLimit`
- API: removed route `config/i18n`
- API: removed several fields from `/api/version`
- API: Team removed `teamlead` and `users` - access `members` instead
- API: GET `/timesheets/` collection - replaced comma separated IDs with arrays[] (customers, projects, activities, tags), throws Exception on unknown IDs
- API: GET `/activities/` collection - replaced comma separated IDs with arrays[] (projects), throws Exception on unknown IDs
- API: GET `/projects/` collection - replaced comma separated IDs with arrays[] (customers), throws Exception on unknown IDs
- API: Project start/end/order dates are now plain dates without time (start and order are set to 00:00:00 and end is set to 23:59:59, filter expect 2022-02-20 instead of 2022-02-20T00:00:00)

## Manual changes

Below follows a list of how I did migrate my own plugins.

## Adjust composer

A big difference between 1.x and 2.x is that Kimai now checks the minimum requirement of a plugin and rejects 
reloading the cache if those do not align. The check is done by comparing `Constants::VERSION_ID`  and the key at `extra.key.require`, 
which needs to be formatted as integer instead of a string (like `1.20.2` in 1.x releases):

```json
    "extra": {
        "kimai": {
            "require": 20000,
            "name": "Some plugin"
        }
    },
```

## Adjust templates

Change includes, mostly from `{% raw %}{% embed '@AdminLTE/Widgets/box-widget.html.twig' %}{% endraw %}` to `{% raw %}{% embed '@theme/embeds/card.html.twig' %}{% endraw %}`.

Replaces css classes
- `no-padding` to `p-0`

## Use Rector to migrate your code 

- Install `composer require --dev rector/rector`
- Create a file called `rector.php` at the root of the library with the following contents:  

```php
<?php

use Rector\Config\RectorConfig;
use Rector\Php80\Rector\Class_\AnnotationToAttributeRector;
use Rector\Php80\ValueObject\AnnotationToAttribute;

return function (RectorConfig $rectorConfig): void {
    $rectorConfig->paths([
        //__DIR__ . '/tests/',
        //__DIR__ . '/src/',
        __DIR__ . '/var/plugins/AuditTrailBundle/',
        __DIR__ . '/var/plugins/CodeweaversBundle/',
        __DIR__ . '/var/plugins/CubewerkBundle/',
        __DIR__ . '/var/plugins/CustomContentBundle/',
        __DIR__ . '/var/plugins/CustomCSSBundle/',
        __DIR__ . '/var/plugins/DeductionTimeBundle/',
        __DIR__ . '/var/plugins/DemoBundle/',
        __DIR__ . '/var/plugins/DigipolisBundle/',
        __DIR__ . '/var/plugins/ExpensesBundle/',
        __DIR__ . '/var/plugins/Fail2BanBundle/',
        __DIR__ . '/var/plugins/GoekeDesignBundle/',
        __DIR__ . '/var/plugins/ImportBundle/',
        __DIR__ . '/var/plugins/InvoiceBundle/',
        __DIR__ . '/var/plugins/InvoiceFormatFixationBundle/',
        __DIR__ . '/var/plugins/KioskBundle/',
        __DIR__ . '/var/plugins/LockdownPerUserBundle/',
        __DIR__ . '/var/plugins/MetaFieldsBundle/',
        __DIR__ . '/var/plugins/TaskManagementBundle/',
        __DIR__ . '/var/plugins/TranslationBundle/',

    ]);

    $rectorConfig->ruleWithConfiguration(AnnotationToAttributeRector::class, [
        // Annotations from Kimai core
        new AnnotationToAttribute('App\\Export\\Annotation\\Expose'),
        new AnnotationToAttribute('App\\Export\\Annotation\\Order'),

        // For custom APIs
        new AnnotationToAttribute('Nelmio\\ApiDocBundle\\Annotation\\Security'),
        new AnnotationToAttribute('FOS\\RestBundle\\Controller\\Annotations\\Post'),
        new AnnotationToAttribute('FOS\\RestBundle\\Controller\\Annotations\\Get'),
        new AnnotationToAttribute('FOS\\RestBundle\\Controller\\Annotations\\Patch'),
        new AnnotationToAttribute('FOS\\RestBundle\\Controller\\Annotations\\Delete'),
        new AnnotationToAttribute('FOS\\RestBundle\\Controller\\Annotations\\QueryParam'),
        new AnnotationToAttribute('FOS\\RestBundle\\Controller\\Annotations\\RequestParam'),

        new AnnotationToAttribute('OpenApi\\Annotations\\AdditionalProperties', 'OpenApi\\Attributes\\AdditionalProperties'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Attachable', 'OpenApi\\Attributes\\Attachable'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Components', 'OpenApi\\Attributes\\Components'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Contact', 'OpenApi\\Attributes\\Contact'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Delete', 'OpenApi\\Attributes\\Delete'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Discriminator', 'OpenApi\\Attributes\\Discriminator'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Examples', 'OpenApi\\Attributes\\Examples'),
        new AnnotationToAttribute('OpenApi\\Annotations\\ExternalDocumentation', 'OpenApi\\Attributes\\ExternalDocumentation'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Flow', 'OpenApi\\Attributes\\Flow'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Get', 'OpenApi\\Attributes\\Get'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Head', 'OpenApi\\Attributes\\Head'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Header', 'OpenApi\\Attributes\\Header'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Info', 'OpenApi\\Attributes\\Info'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Items', 'OpenApi\\Attributes\\Items'),
        new AnnotationToAttribute('OpenApi\\Annotations\\JsonContent', 'OpenApi\\Attributes\\JsonContent'),
        new AnnotationToAttribute('OpenApi\\Annotations\\License', 'OpenApi\\Attributes\\License'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Link', 'OpenApi\\Attributes\\Link'),
        new AnnotationToAttribute('OpenApi\\Annotations\\MediaType', 'OpenApi\\Attributes\\MediaType'),
        new AnnotationToAttribute('OpenApi\\Annotations\\OpenApi', 'OpenApi\\Attributes\\OpenApi'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Operation', 'OpenApi\\Attributes\\Operation'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Options', 'OpenApi\\Attributes\\Options'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Parameter', 'OpenApi\\Attributes\\Parameter'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Patch', 'OpenApi\\Attributes\\Patch'),
        new AnnotationToAttribute('OpenApi\\Annotations\\PatchItem', 'OpenApi\\Attributes\\PatchItem'),
        new AnnotationToAttribute('OpenApi\\Annotations\\PathParameter', 'OpenApi\\Attributes\\PathParameter'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Post', 'OpenApi\\Attributes\\Post'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Property', 'OpenApi\\Attributes\\Property'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Put', 'OpenApi\\Attributes\\Put'),
        new AnnotationToAttribute('OpenApi\\Annotations\\RequestBody', 'OpenApi\\Attributes\\RequestBody'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Response', 'OpenApi\\Attributes\\Response'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Schema', 'OpenApi\\Attributes\\Schema'),
        new AnnotationToAttribute('OpenApi\\Annotations\\SecurityScheme', 'OpenApi\\Attributes\\SecurityScheme'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Server', 'OpenApi\\Attributes\\Server'),
        new AnnotationToAttribute('OpenApi\\Annotations\\ServerVariable', 'OpenApi\\Attributes\\ServerVariable'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Tag', 'OpenApi\\Attributes\\Tag'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Trace', 'OpenApi\\Attributes\\Trace'),
        new AnnotationToAttribute('OpenApi\\Annotations\\Xml', 'OpenApi\\Attributes\\Xml'),
        new AnnotationToAttribute('OpenApi\\Annotations\\XmlContent', 'OpenApi\\Attributes\\XmlContent'),
    ]);

    $rectorConfig->rules([
        \Rector\TypeDeclaration\Rector\ClassMethod\ReturnTypeFromStrictNativeCallRector::class,
        \Rector\CodeQuality\Rector\ClassMethod\ReturnTypeFromStrictScalarReturnExprRector::class,
        \Rector\TypeDeclaration\Rector\ClassMethod\ReturnTypeFromStrictNewArrayRector::class,
        \Rector\TypeDeclaration\Rector\ClassMethod\ReturnTypeFromStrictBoolReturnExprRector::class,
    ]);

    $rectorConfig->sets([
        \Rector\Symfony\Set\SymfonySetList::ANNOTATIONS_TO_ATTRIBUTES,
        \Rector\Symfony\Set\SensiolabsSetList::FRAMEWORK_EXTRA_61,
        \Rector\Symfony\Set\SymfonyLevelSetList::UP_TO_SYMFONY_60,
        \Rector\Symfony\Set\JMSSetList::ANNOTATIONS_TO_ATTRIBUTES,
        \Rector\Symfony\Set\JMSSetList::REMOVE_JMS_INJECT,
        \Rector\Doctrine\Set\DoctrineSetList::ANNOTATIONS_TO_ATTRIBUTES,
        \Rector\Doctrine\Set\DoctrineSetList::GEDMO_ANNOTATIONS_TO_ATTRIBUTES,
        \Rector\PHPUnit\Set\PHPUnitSetList::PHPUNIT_80,
    ]);
};  
```

- Run `vendor/bin/rector`, which will use the above configuration
- Uninstall Rector: `composer remove rector/rector && rm rector.php`
- Fix code-styles by running `composer codestyle-fix`

## Single fixes

### OpenApi

From:

```php
#[OA\Property(type: 'array', new OA\Items(ref: '#/components/schemas/Team'))]
```

to:

```php
#[OA\Property(type: 'array', items: new OA\Items(ref: '#/components/schemas/Team'))]
```

Search for `#\[Security\("(.*)\n(.*)#\[Security\("` and combine multiple attributes into one with "and" e.g.:

```php
#[Security("is_granted('access', customer)")]
#[Security("is_granted('view_invoice')")]
```

to:

```php
#[Security("is_granted('access', customer) and is_granted('view_invoice')")]
```

## Related articles

- [https://www.doctrine-project.org/2022/11/04/annotations-to-attributes.html](https://www.doctrine-project.org/2022/11/04/annotations-to-attributes.html)
- [https://tomasvotruba.com/blog/how-to-refactor-custom-doctrine-annotations-to-attributes/](https://tomasvotruba.com/blog/how-to-refactor-custom-doctrine-annotations-to-attributes/)
