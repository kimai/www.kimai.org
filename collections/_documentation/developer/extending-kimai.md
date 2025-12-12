---
title: Extending Kimai 
description: The most common interfaces, events and other options to hook into the flow of Kimai core
---

## Extending the navigation bar

If you want to add your own entries in the navigation bar, you can subscribe to these events:

- `App\Event\ConfigureMainMenuEvent::CONFIGURE`
- `App\Event\ConfigureAdminMenuEvent::CONFIGURE`

And that's how to use it:

```php
use App\Event\ConfigureMainMenuEvent;
use App\Event\ConfigureAdminMenuEvent;
use Avanzu\AdminThemeBundle\Model\MenuItemModel;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class MyMenuSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            ConfigureMainMenuEvent::CONFIGURE => ['onMainMenuConfigure', 100],
            ConfigureAdminMenuEvent::CONFIGURE => ['onAdminMenuConfigure', 100],
        ];
    }

    public function onMainMenuConfigure(ConfigureMainMenuEvent $event)
    {
        $event->getMenu()->addItem(
            new MenuItemModel('timesheet', 'menu.timesheet', 'timesheet', [], 'fa fa-clock-o')
        );
    }

    public function onAdminMenuConfigure(ConfigureAdminMenuEvent $event)
    {
        $event->getAdminMenu()->addChild(
            new MenuItemModel('timesheet_admin', 'menu.admin_timesheet', 'admin_timesheet', [], 'fa fa-clock-o')
        );
    }    
}
```

For more details check the [official menu subscriber]({{ site.kimai_v2_file }}/src/EventSubscriber/MenuSubscriber.php).

## Extending the dashboard with widgets

If you want to add your own widget rows to the dashboard, you can subscribe to the event:

- `App\Event\DashboardEvent::DASHBOARD`

And that's how to use it:

```php
use App\Event\DashboardEvent;
use App\Model\Widget;
use App\Widget\Type\CompoundRow;
use KimaiPlugin\YourCustomBundle\Widget\Type\CustomWidget;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class MyDashboardSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [DashboardEvent::DASHBOARD => ['onDashboardEvent', 200]];
    }

    public function onDashboardEvent(DashboardEvent $event)
    {
        $section = new CompoundRow();
        $section->setTitle('Section title');
        $section->setOrder(1);

        $section->addWidget(
            (new CustomWidget())
                ->setId('custom-widget-id')
                ->setTitle('Custom widget title')
                ->setData(['foo' => 'bar'])
                ->setOptions([])
        );

       $event->addSection($section);
    }
}
```

For more details check this [dashboard subscriber](https://github.com/kimai/DemoBundle/blob/main/EventSubscriber/DashboardSubscriber.php).

### Adding new widget types

You can add your own widgets via plugin by adding two classes:

- a widget implementing `\App\Widget\WidgetInterface`
    - or for the lazy folks extending `\App\Widget\Type\AbstractWidgetType`
- a widget renderer implementing `\App\Widget\WidgetRendererInterface`
    - if you want to use twig to render your widget, extend `\App\Widget\Renderer\AbstractTwigRenderer`

These widgets can now be injected to the Dashboard as explained above with the `MyDashboardSubscriber`.

### Display widgets in your template

You can also use widgets in your twig templates like this:
{% raw %}

```twig
{{ render_widget('DailyWorkingTimeChart', {'type': 'line', 'begin': 'monday this week 00:00:00', 'end': 'friday this week 23:59:59'}) }}
{{ render_widget('userAmountMonth', {'color': 'blue', 'icon': 'user'}) }}
```

{% endraw %}

Widgets are referenced by their ID.

## Invoices

### Adding documents for invoice rendering

In the config `kimai.invoice.documents`, you can add a list of directories with the locations of your invoice templates ([read more]({% link _documentation/invoice-templates.md %})).

### Adding invoice calculator

An invoice calculator is a class implementing `App\Invoice\CalculatorInterface` and it is responsible for calculating
invoice rates, taxes and taking care to aggregate all timesheet entries that should be displayed.

Every invoice calculator class will be automatically available, after refreshing the application cache with `bin/console cache:clear`.
This "magic" happens in the [InvoiceServiceCompilerPass]({{ site.kimai_v2_file }}/src/DependencyInjection/Compiler/InvoiceServiceCompilerPass.php),
which finds the classes by the interface `CalculatorInterface`.

The ID of the calculator must be unique, please prefix it with your vendor or bundle name and make sure it only contains
alpha-numeric characters, as it will be stored in a database column.

Translations are stored in the `invoice-calculator.xx.xlf`.

### Adding invoice-number generator

An invoice-number generator is a class implementing `App\Invoice\NumberGeneratorInterface` and its only task is to generate
a number for the invoice. In most cases you do not want to mix multiple invoice-number generators throughout your invoices.

Every invoice number-generator class will be automatically available, after refreshing the application cache with `bin/console cache:clear`.
This "magic" happens in the [InvoiceServiceCompilerPass]({{ site.kimai_v2_file }}/src/DependencyInjection/Compiler/InvoiceServiceCompilerPass.php),
which finds the classes by the interface `NumberGeneratorInterface`.

The ID of the number generator must be unique, please prefix it with your vendor or bundle name and make sure it only contains
alpha-numeric characters, as it will be stored in a database column.

Translations are stored in the `invoice-numbergenerator.xx.xlf`.

### Adding invoice renderer

An invoice renderer is a class implementing `App\Invoice\RendererInterface` and it is responsible to convert an `InvoiceModel` (the actual data)
with the use of an `InvoiceDocument` (the template file) into a downloadable/printable document.

Every invoice renderer class will be automatically available, after refreshing the application cache with `bin/console cache:clear`.
This "magic" happens in the [InvoiceServiceCompilerPass]({{ site.kimai_v2_file }}/src/DependencyInjection/Compiler/InvoiceServiceCompilerPass.php),
which finds the classes by the interface `RendererInterface`.

## Export templates

Export documents are searched in two locations:

- `var/export/` - does not exist by default, please create it when you add a new template
- `templates/export/renderer/` - don't change files in here, will be overwritten with the next update

If you create customer templates, beware of these rules:

- You should store your templates in `var/export/`, as this directory is not shipped with Kimai and not touched during updates (instead of `templates/export/renderer/`)
- You can configure different search directories through the config key `kimai.export.documents` if you want to add additional template source directories
- You can hide the default templates by setting the key `kimai.export.defaults` to an empty array / null
- You can translate the button for your template, by adding its name to the export translation file, eg. `translations/export.en.xlf`

## Adding export renderer

An export renderer is a class implementing `App\Export\RendererInterface` and it is responsible to convert an array of
`Timesheet` objects into a downloadable/printable document.

Every export renderer class will be automatically available when refreshing the application cache, thanks to the  
[ExportServiceCompilerPass]({{ site.kimai_v2_file }}/src/DependencyInjection/Compiler/ExportServiceCompilerPass.php).

Each renderer is represented by a "button" below the datatable on the export screen.

A simple example, which only shows the IDs of the included timesheet records could look like this:

```php
use App\Entity\Timesheet;
use App\Export\RendererInterface;
use App\Repository\Query\TimesheetQuery;
use Symfony\Component\HttpFoundation\Response;

final class TimesheetIdRenderer implements RendererInterface
{
    public function render(array $timesheets, TimesheetQuery $query): Response
    {
        $ids = array_map(function(Timesheet $timesheet) {
            return $timesheet->getId();
        }, $timesheets);

        $response = new Response();
        $response->setContent(sprintf('Included IDs: %s', implode(', ', $ids)));

        return $response;
    }

    public function getId(): string
    {
        return 'ext_array_dump';
    }

    public function getIcon(): string
    {
        return 'fas fa-file-code';
    }

    public function getTitle(): string
    {
        return 'Show IDs';
    }
}
```

All you need to do is to register it as a service in the Symfony DI container.

Internally for each template a new ExportRenderer service is registered, called `exporter_renderer.filename_EXT_twig` (see `ExportServiceCompilerPass`).

### Adding timesheet export renderer

Timesheet exporter (implementing the interface `App\Export\TimesheetExportInterface`) are almost the same as export renderer,
except that they don't have the methods `getIcon()` and `getTitle()`.

If you already wrote an export renderer, all you need to add is the second interface and you can export the filtered data
from the user and admin timesheet screen.

Be aware, that you should add more permission (eg. `view_rate_own_timesheet`) checks to these renderer, as they are available for every user!

## Adding timesheet calculator

A timesheet calculator will be called on stopped timesheet records. It can rewrite all values but will normally take care
of the columns `begin`, `end`, `duration` and `rate` but could also be used to apply a default `description`.

Timesheet calculator need to implement the interface `App\Timesheet\CalculatorInterface` and will be automatically tagged
as `timesheet.calculator` in the service container. They will be found and used *only* if you add them to the service container.

The configuration for "rounding rules" can be fetched from the container parameter `kimai.timesheet.rounding`.

The configuration for "hourly-rates multiplication factors" can be fetched from the container parameter `kimai.timesheet.rates`.

## Adding custom fields (meta fields)

See [meta fields]({% link _documentation/developer/meta-fields.md %}) documentation.

## Adding UserPreference

Developers can register new user preferences from within [their plugin]({% link _documentation/developer/plugins.md %}) as easy as that:

```php
use App\Entity\UserPreference;
use App\Event\UserPreferenceEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;

class UserProfileSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            UserPreferenceEvent::CONFIGURE => ['loadUserPreferences', 200]
        ];
    }

    public function loadUserPreferences(UserPreferenceEvent $event)
    {
        if (null === ($user = $event->getUser())) {
            return;
        }

        // You attach every field to the event and all the heavy lifting is done by Kimai.
        // The value is the default as long as the user has not yet updated his preferences,
        // otherwise it will be overwritten with the users choice, stored in the database.
        $event->addPreference(
            (new UserPreference())
                ->setName('fooooo-bar')
                ->setValue(false)
                ->setType(CheckboxType::class)
        );
    }
}
```

### Displaying and exporting UserPreferences

With Kimai 1.4 you can display and export user preferences.
Supported fields will be shown as new columns in the data-table for users.
Additionally these preferences will be added to HTML and Spreadsheet exports.

As Kimai cannot query all existing users for possible preferences, you need to listen to a new event and register the desired preference.


```php
use App\Entity\UserPreference;
use App\Event\UserPreferenceDisplayEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;

class UserProfileSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            UserPreferenceDisplayEvent::class => ['loadUserPreferences', 200]
        ];
    }

    public function loadUserPreferences(UserPreferenceDisplayEvent $event)
    {

        // You attach every field to the event and all the heavy lifting is done by Kimai.
        // The value is the default as long as the user has not yet updated his preferences,
        // otherwise it will be overwritten with the users choice, stored in the database.
        $event->addPreference(
            (new UserPreference())
                ->setName('fooooo-bar')
                ->setValue(false)
                ->setType(CheckboxType::class)
        );
    }
}
```

## Adding custom meta tags, stylesheets or javascript

There are three available events which can be used to add your custom output to the rendered HTML:

- App\Event\ThemeEvent::HTML_HEAD
- App\Event\ThemeEvent::STYLESHEET
- App\Event\ThemeEvent::JAVASCRIPT

```php
class ThemeEventSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            ThemeEvent::STYLESHEET => ['renderStylesheet', 100],
        ];
    }

    public function renderStylesheet(ThemeEvent $event)
    {
        $css = '<style type="text/css">body.login-page h3 { color:red !important; }</style>';
        $event->addContent($css);
    }
}
```

These events are trigger on all pages, including the security layout.

## Adding permissions

New plugins usually ship with a set of own permissions. 
You should always assign these permissions at least to the `ROLE_SUPER_ADMIN`.
By doing so, you register the permission in the system and they become available in the [permission administration]({% link _documentation/permissions.md %}).

You register new permission through your [plugins extension class]({% link _documentation/developer/plugins.md %}), by using the `PrependExtensionInterface`:

```php
namespace KimaiPlugin\YourBundle\DependencyInjection;

use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Extension\PrependExtensionInterface;
use Symfony\Component\HttpKernel\DependencyInjection\Extension;

class YourExtension extends Extension implements PrependExtensionInterface
{
    // ... other methods .... 

    public function prepend(ContainerBuilder $container)
    {
        $container->prependExtensionConfig('kimai', [
            'permissions' => [
                'roles' => [
                    'ROLE_SUPER_ADMIN' => [
                        'my_awesomer_permission',
                    ],
                ],
            ],
        ]);
    }
}
```

If you don't register your permissions, your users will not be able to change them [via the UI]({% link _documentation/permissions.md %}).

There is an introduction available, if you want to understand the [permission structure]({% link _documentation/developer/permission-structure.md %}).

## Adding system configuration

As plugin developer you can add your own sections to the system configuration screen by using a code like this:

```php
namespace KimaiPlugin\YourBundle\EventSubscriber;

use App\Event\SystemConfigurationEvent;
use App\Form\Model\Configuration;
use App\Form\Model\SystemConfiguration as SystemConfigurationModel;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class MySubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents()
    {
        return [
            SystemConfigurationEvent::class => ['onSystemConfiguration', 100],
        ];
    }

    public function onSystemConfiguration(SystemConfigurationEvent $event)
    {
        $event->addConfiguration((new SystemConfigurationModel('your_bundle'))
            ->setConfiguration([
                (new Configuration())
                    ->setName('your.setting')
                    ->setTranslationDomain('your')
                    ->setRequired(false)
                    ->setType(TextType::class),
            ])
        );
    }
}
```

This assumes that your bundle uses its own Configuration (class) and registers its configs with
`\App\Plugin\AbstractPluginExtension::registerBundleConfiguration()`:

```php
namespace KimaiPlugin\YourBundle\DependencyInjection;

use App\Plugin\AbstractPluginExtension;
use Symfony\Component\DependencyInjection\ContainerBuilder;

class YourExtension extends AbstractPluginExtension
{
    public function load(array $configs, ContainerBuilder $container)
    {
        $configuration = new Configuration();
        $config = $this->processConfiguration($configuration, $configs);
        $this->registerBundleConfiguration($container, $config);
    }
}
```

And your configuration class looking like this:

```php
namespace KimaiPlugin\YourBundle\DependencyInjection;

use Symfony\Component\Config\Definition\Builder\ArrayNodeDefinition;
use Symfony\Component\Config\Definition\Builder\TreeBuilder;
use Symfony\Component\Config\Definition\ConfigurationInterface;

class Configuration implements ConfigurationInterface
{
    public function getConfigTreeBuilder()
    {
        $treeBuilder = new TreeBuilder('your');
        /** @var ArrayNodeDefinition $rootNode */
        $rootNode = $treeBuilder->getRootNode();

        $rootNode
            ->addDefaultsIfNotSet()
            ->children()
                ->scalarNode('setting')
                    ->defaultValue('foo')
                ->end()
            ->end()
        ->end();

        return $treeBuilder;
    }
}
```

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

## JSON API (REST)

## Adding API methods

Please have a look at the [DemoBundle](https://github.com/kimai/DemoBundle), it includes examples for an API controller with serialization.

There is also a (german) blog post that discuss the basics of adding a FOSRestBundle controller to your bundle:
[https://www.kevinpapst.de/blog/fosrestbundle-via-bundle.html](https://www.kevinpapst.de/blog/fosrestbundle-via-bundle.html)

## Using the Swagger UI

When you want to use the interactive functions of the Swagger UI, you will probably notice that it's not working due to a wrong URL being used.
The Swagger UI currently doesn't use the current hostname, but always points to `localhost` on port 80.
Therefor you have to configure the values used manually.

Please add these lines to your local.yaml (adapt them to your needs):
```yaml
parameters:
    router.request_context.host: '127.0.0.1'
    router.request_context.port: '8050'
    router.request_context.scheme: 'http'
    router.request_context.base_url: ''

# the next lines are only necessary, if you use a port other than 80
nelmio_api_doc:
    documentation:
        host: '%router.request_context.host%:%router.request_context.port%'
```  

## Swagger file and Postman

You could change your [local.yaml]({% link _documentation/local-yaml.md %}) and add this, which will cause the generated Swagger file to contain a variable instead of the hostname URL: 

```yaml
nelmio_api_doc:
    documentation:
        host: '{%raw%}{{hostname}}{%endraw%}'
        schemes: ['https']
```

The variable `hostname` can then be changed for the complete collection in Postman.
Using Postman environments, you can even switch the API location via a simple change of the environments drop-down.
