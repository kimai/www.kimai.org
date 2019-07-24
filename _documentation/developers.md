---
title: Developers
description: Developer documentation - run, develop, extend and build for Kimai 
toc: true
---

This page is dedicated to all developers who want to contribute to Kimai. You are the best!

# Setting up your environment

All you need is:
- PHP >= 7.1.3
- PHP extensions: `PDO-SQLite`, `intl`, `zip`, `gd`, `mbstring`, `xml`

You can install php 7.2 and all dependencies on debian based linux with this command: 
```bash
apt install php7.2 php7.2-sqlite3 php7.2-intl php7.2-zip php7.2-gd php7.2-mbstring php7.2-xml
```

Optional requirement:
- a MySQL/MariaDB instance
- PHP extension: `PDO-MySQL` enabled

Read how to [install Kimai v2 in your dev environment]({% link _documentation/installation.md %}). 

## Frontend dependencies 

If you want to make changes to CSS / Javascript, you need:

- [NodeJS](https://www.npmjs.com/)
- [Yarn Package Manager](https://yarnpkg.com/en/)
- [Webpack](https://webpack.js.org/)
- [Webpack Encore](https://github.com/symfony/webpack-encore)

Please [install Yarn for your OS](https://yarnpkg.com/lang/en/docs/install/) and then:

```bash
yarn install
```

To rebuild all assets you have to execute:
```bash
yarn run prod
```

You can find more information [here](https://symfony.com/doc/current/frontend/encore/installation.html) and [here](https://symfony.com/doc/current/frontend.html).

## local.yaml

Beware: if you use the `local.yaml` (as proposed in [configurations]({% link _documentation/configurations.md %})) then don't put it 
in `config/packages/` as all configs in there are used when running the PHPUnit testsuite.

The (integration) tests are written to work with the default configuration of Kimai and locally changed configs might unexpectedly break the tests.

Therefor put your `local.yaml` into the `dev/` folder: `config/packages/dev/local.yaml`.

## Tests suites with PHPUnit

Kimai tries to adopt a high test and code coverage. Whenever changing code, you have to make sure 
that the tests are still running. New code needs additional tests, otherwise your pull request might be declined. 

You can run the unit and integration tests with built-in commands:

```bash
composer kimai:tests-unit
composer kimai:tests-integration
```

Or you simply run all tests with one of: 
- `composer kimai:tests`
- `vendor/bin/phpunit`

## Static code analysis via PHPStan

Besides automated tests Kimai relies on PHPStan to detect code problems.

```bash
composer kimai:phpstan
```
## Coding styles

You can run the code sniffer with the built-in command like that:

```bash
composer kimai:codestyle
```

And you can also automatically fix the violations by running: 

 ```bash
composer kimai:codestyle-fix
```

Be aware that this command will modify all files with violations in the directories `src/` and `tests/`, so its a good idea to commit first.

Kimai code-styles are configured in [.php_cs.dist]({{ site.kimai_v2_file }}/.php_cs.dist).

## Translations 

Read more about [languages and translations]({% link _documentation/translations.md %}).

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
For more details check this [dashboard subscriber]({{ site.kimai_v2_file }}/src/EventSubscriber/DashboardSubscriber.php).

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

In the config `kimai.invoice.documents`, you can add a list of directories with the locations of your invoice document templates ([read more]({% link _documentation/invoices.md %})).

### Adding invoice calculator

An invoice calculator is a class implementing `App\Invoice\CalculatorInterface` and it is responsible for calculating 
invoice rates, taxes and taking care to aggregate all timesheet entries that should be displayed.   

Every invoice calculator class will be automatically available, after refreshing the application cache with `bin/console cache:clear`.
This "magic" happens in the [InvoiceServiceCompilerPass]({{ site.kimai_v2_file }}/src/DependencyInjection/Compiler/InvoiceServiceCompilerPass.php), 
which finds the classes by the interface `CalculatorInterface`.

The ID of the calculator must be unique, please prefix it with your vendor or bundle name and make sure it only contains
alpha-numeric characters, as it will be stored in a database column.

Translations are stored in the `invoice-calculator.xx.xliff`.

### Adding invoice-number generator

An invoice-number generator is a class implementing `App\Invoice\NumberGeneratorInterface` and its only task is to generate 
a number for the invoice. In most cases you do not want to mix multiple invoice-number generators throughout your invoices.   

Every invoice number-generator class will be automatically available, after refreshing the application cache with `bin/console cache:clear`.
This "magic" happens in the [InvoiceServiceCompilerPass]({{ site.kimai_v2_file }}/src/DependencyInjection/Compiler/InvoiceServiceCompilerPass.php), 
which finds the classes by the interface `NumberGeneratorInterface`.

The ID of the number generator must be unique, please prefix it with your vendor or bundle name and make sure it only contains
alpha-numeric characters, as it will be stored in a database column.

Translations are stored in the `invoice-numbergenerator.xx.xliff`.

### Adding invoice renderer

An invoice renderer is a class implementing `App\Invoice\RendererInterface` and it is responsible to convert an `InvoiceModel` (the actual data) 
with the use of an `InvoiceDocument` (the template file) into a downloadable/printable document. 

Every invoice renderer class will be automatically available, after refreshing the application cache with `bin/console cache:clear`.
This "magic" happens in the [InvoiceServiceCompilerPass]({{ site.kimai_v2_file }}/src/DependencyInjection/Compiler/InvoiceServiceCompilerPass.php), 
which finds the classes by the interface `RendererInterface`.

## Adding export renderer

See [export]({% link _documentation/export.md %}) documentation.

## Adding timesheet calculator

A timesheet calculator will be called on stopped timesheet records. It can rewrite all values but will normally take care 
of the columns `begin`, `end`, `duration` and `rate` but could also be used to apply a default `description`.

Timesheet calculator need to implement the interface `App\Timesheet\CalculatorInterface` and will be automatically tagged 
as `timesheet.calculator` in the service container. They will be found and used *only* if you add them to the service container.

You can apply several rules in your config file [local.yaml]({% link _documentation/configurations.md %}) for the existing 
`DurationCalculator` and `RateCalculator` implementations.  Please read the [configurations chapter]({% link _documentation/configurations.md %}) to find out more. 

The configuration for "rounding rules" can be fetched from the container parameter `kimai.timesheet.rounding`.

The configuration for "hourly-rates multiplication factors" can be fetched from the container parameter `kimai.timesheet.rates`.

## Adding custom fields (meta fields)

See [meta fields]({% link _documentation/meta-fields.md %}) documentation.

## Adding UserPreference

See [user preferences]({% link _documentation/user-preferences.md %}) documentation.

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