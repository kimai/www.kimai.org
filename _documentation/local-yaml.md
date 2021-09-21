---
title: Configuration files
description: Advanced configuration via filesystem 
toc: true
related:
  - configurations
  - cache
---

This is an introduction into the configuration files used by Kimai, and an explanation on how to change them.

Specific configuration settings are explained in the respective documentation chapters.

## Configuration files

The most important configuration files of Kimai are:

- `.env` - your environment and connection settings
- `config/packages/kimai.yaml` - examples for Kimai settings
- `config/packages/local.yaml` - **configure your own Kimai settings (does not exist by default)**

There are several other configurations that could potentially be interesting for you in [config/packages/*.yaml]({{ site.kimai_v2_file }}/config/packages/).

{% capture dont_edit_configs %}
Don't edit any of the configuration files (eg. `config/packages/kimai.yaml`) directly, as they will be overwritten during an update.
Adjust settings from any configuration file by adding them in your own configuration in `local.yaml` (see below).
{% endcapture %}
{% assign dont_edit_configs = dont_edit_configs|markdownify %}

{% include alert.html icon="fas fa-exclamation" type="danger" alert=dont_edit_configs %}

### .env

These "environment specific settings" are required so Kimai can boot. They are stored in the `.env` file:

- `MAILER_URL` - smtp connection for emails
- `MAILER_FROM` - application specific "from" address for all emails
- `APP_ENV` - environment for the runtime (always use `prod` unless you want to develop for Kimai)
- `DATABASE_URL` - database connection for storing all application data
- `APP_SECRET` - secret used to encrypt session cookies (users will be logged out if you change it)

{% include alert.html icon="fas fa-exclamation" type="warning" alert="You don't need a .env file, but can set these environment values via webserver config as well. Later ones will take precedence over the .env entries." %}

### local.yaml

The configuration file `config/packages/local.yaml` will NEVER be shipped with Kimai,
you have to create it before you change settings the first time (eg. `touch config/packages/local.yaml`).
Having your custom settings in `local.yaml` allows you to easily update Kimai.
This is the same concept which is used for the `.env` file.

An example `config/packages/local.yaml` file might look like this:

```yaml
kimai:
    timesheet:
        rounding:
            default:
                begin: 15
                end: 15

admin_lte:
    options:
        default_avatar: build/apple-touch-icon.png
```

The `local.yaml` file will be imported as last configuration file, so you can overwrite any setting from the `config/packages/` directory.

Whenever the documentation asks you to edit a yaml file from the `config/packages/` directory, it means you should copy
this specific configuration key to your `local.yaml` in order to overwrite the default configuration.

{% include alert.html icon="fas fa-exclamation" type="warning" alert="Be consistent with the indentation and don't mix spaces and tabs, YAML is very sensitive about that!" %}

### Reload configurations

When you change your `local.yaml` configuration file, Kimai will not see this change immediately.
You have to reload the configurations by [rebuilding the cache]({% link _documentation/cache.md %}).

## Available configurations

Many of the available configurations can be configured through [System > Settings]({% link _documentation/configurations.md %}),
all configuration which can be set through the UI will not be described here.

Examples for all available configuration can be found in `config/packages/kimai.yaml`. 

### Data directory

Inside the `data` directory Kimai and plugins will store newly created files.
This location is by default `var/data/`, while files will be managed in sub-directories: e.g. `var/data/invoices/` for generated invoices.

The data directory can be changed by adapting the config key `data_dir`:

```yaml
kimai:
    data_dir: "/home/kimai/safe-place/"
```

After changing the data directory, you should move all existing data to the new location and then reload the cache.

### Session lifetime

By default, Kimai uses the PHP session lifetime configured on your server (normally in `php.ini`).

If you want to change the session lifetime (eg. to prevent automatic logout during the workday or to prevent CSRF errors),
you can either adjust the settings for PHP directly ([see PHP docs](https://www.php.net/manual/en/session.configuration.php))
or you can explicitly set it for Kimai:

```yaml
framework:
    session:
        gc_maxlifetime: 3600
        cookie_lifetime: 3600
```

The values above (here `3600`) are seconds, the above configuration would be rather strict and automatically logout the user after 1 hour.

Another example, where the session should last 10 hours with a session cookie that is deleted upon browser restart (every browser restart forces a new login):

```yaml
framework:
    session:
        gc_maxlifetime: 36000
        cookie_lifetime: ~
```

More infos in the [Symfony docs](https://symfony.com/doc/current/reference/configuration/framework.html#session) and [PHP documentation](https://www.php.net/manual/en/session.configuration.php).

### Invoice template search path

If you want to store your invoice templates in another location add this:

```yaml
kimai:
    invoice:
        # add a new search location
        documents:
            - 'var/my_invoices/'
```

You could even deactivate all default templates and only show your own ones (this shouldn't be necessary in 99% of all use-cases):

```yaml
kimai:
    invoice:
        # disable the default locations 
        defaults: ~
        # add a new search location
        documents:
            - 'var/my_invoices/'
```

### Changing translations

If you want/need to replace some default translations (e.g. they don't reflect your industry), then you can add a translation file
which will used as first translation source.

First you create a file `my-company.en.xlf` either in the `translations/` directory or in
the translation directory of your custom plugin at `Resources/translations/`.

You activate the new translation file with:

```yaml
kimai:
    theme:
        branding:
            translation: my-company
```

### Multiple time-rounding rules

At [System > Settings]({% link _documentation/configurations.md %}) you can configure one rounding rule. 
The local.yaml allows adding multiple rules (e.g. weekend has different rounding rules).
You can define as many rules as you want ("default" is only an example) and every matching rule will be applied (be careful with overlapping rules).

This examples rounds any weekend work up to 1 hour, while normal weekday work will round the end up to the next full 10 minutes slot:

```yaml
kimai:
    timesheet:
        rounding:
            weekend:
                days: ['saturday','sunday']
                begin: 1
                end: 1
                duration: 60
                mode: closest
            workdays:
                days: ['monday','tuesday','wednesday','thursday','friday','saturday','sunday']
                begin: 10
                end: 10
                duration: 0
                mode: default
```

### Rate multiplier for specific weekdays

If you want to apply different hourly rates multiplication `factor` for specific weekdays, you can use this `rates` configuration.

1. You can define as many rules as you want ("workdays" and "weekend" are only examples)
2. Every matching rule will be applied, so be careful with overlapping rules
3. The end_date of timesheet records will be used to match the day (think about entries which are recorded overnight)
4. "days" is an array of weekdays, where the days need to be written in english and in lowercase
5. "factor" will be used as multiplier for the applied hourly rate
6. Rate rules will be applied on stopped timesheet records only, as it can't be calculated before
7. There is no default rule active, by default the users hourly-rate is used for calculation

#### Example

1. The "workdays" rule will use the default "hourly rate" for each timesheet entry recorded between "monday" to "friday" as a multiplication with 1 will not change the result
2. The "weekend" rule will add 50% to each timesheet entry that will be recorded on "saturdays" or "sundays"

```yaml
kimai:
    timesheet:
        rates:
            workdays:
                days: ['monday','tuesday','wednesday','thursday','friday']
                factor: 1
            weekend:
                days: ['saturday','sunday']
                factor: 1.5
```

### Integrating google calender

If you want to embed Google calendars e.g. to display regional holidays or company events you can import (multiple) Google calendars, 
which will be displayed in each of the [user calendar]({% link _documentation/calendar.md %}).

- read how to obtain your [Google API key and find the Calender ID](https://fullcalendar.io/docs/v3/google-calendar)
- add the optional `kimai.calendar.google` configuration
- you can add any number of sources under the `kimai.calendar.google.sources` node, each must have its own name (like `holidays` and `company` in this example)

```yaml
kimai:
    calendar:
        google:
            api_key: 'your-restricted-google-api-key'
            sources:
                holidays:
                    id: 'de.german#holiday@group.v.calendar.google.com'
                    color: '#ccc'
                company:
                    id: 'de.german#holiday@group.v.calendar.google.com'
                    color: '#cc0000'
```
