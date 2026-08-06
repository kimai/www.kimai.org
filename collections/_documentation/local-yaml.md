---
title: Configuration files
description: Advanced configuration via filesystem 
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

{% alert danger %}
Don't edit any of the configuration files (eg. `config/packages/kimai.yaml`) directly, as they will be overwritten during an update.
Adjust settings from any configuration file by adding them in your own configuration in `local.yaml` (see below).
{% endalert %}

### .env

These "environment specific settings" are required so Kimai can boot. 
They are stored in the `.env` or `.env.local` file.

- `DATABASE_URL` - database connection for storing all application data (see below)
- `APP_SECRET` - secret used to encrypt e.g. session cookies (**IMPORTANT** this needs to be a long and random string)
- `TRUSTED_HOSTS` - a regexp to match the domain names Kimai can accessed from (e.g. `demo.kimai.org|demo-empty.kimai.org`), see [docs](https://symfony.com/doc/current/reference/configuration/framework.html#trusted-hosts)
- `TRUSTED_PROXIES` - a comma separated list of ID, useful if you are running behind a Proxy, see [docs](https://symfony.com/doc/current/deployment/proxies.html)
- `DEFAULT_URI` - the base URL of your installation, required e.g.for emails
- `MAILER_FROM` - application specific "from" email-address used for all outgoing mails
- `MAILER_URL` - SMTP connection for emails, see [email configuration docs]({% link _documentation/emails.md %}) for more details
- `CORS_ALLOW_ORIGIN` - a regexp to identify frontend hosts that are allowed to communicate with the API, see [docs](https://symfony.com/bundles/NelmioCorsBundle/current/index.html) 
- `APP_ENV` - environment for the runtime (default is `prod` - if you develop use `dev` instead)

{% alert warning %}You don't need a `.env` file, in fact you are advised to configure the environment values via webserver config. Later ones will take precedence over the `.env` entries.{% endalert %}

### DATABASE_URL

The `DATABASE_URL` has the format of `mysql://user:password@host:port/database?charset=utf8mb4&serverVersion=10.5.8-MariaDB`.

Your task is to change the values `user`, `password`, `host`, `port` (default port for MySQL/MariaDB is `3306`), `database` and `serverVersion`:

- the version "10.5.8-MariaDB" (the database server version)
- the database "user"
- the database "password"
- the database schema "database"
- you might have to adapt port "3306" and server IP "127.0.0.1" as well

**Server version**

You fetch the version by connecting to your database (via `mariadb` or `mysql`) and then execute `select VERSION();`: 

```
MariaDB [(none)]> select VERSION();
+------------------+
| VERSION()        |
+------------------+
| 10.11.16-MariaDB |
+------------------+
1 row in set (0.000 sec)
```

The result is then used 1:1 in the URL:

For MySQL that could be "serverVersion=5.7" as in:
```
DATABASE_URL=mysql://user:password@127.0.0.1:3306/database?charset=utf8mb4&serverVersion=5.7
```

For MariaDB it would be "serverVersion=10.11.16-MariaDB":
```
DATABASE_URL=mysql://user:password@127.0.0.1:3306/database?charset=utf8mb4&serverVersion=10.11.16-MariaDB
```

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
```

The `local.yaml` file will be imported as last configuration file, so you can overwrite any setting from the `config/packages/` directory.

Whenever the documentation asks you to edit a yaml file from the `config/packages/` directory, it means you should copy
this specific configuration key to your `local.yaml` in order to overwrite the default configuration.

{% alert warning %}Be consistent with the indentation and don't mix spaces and tabs, YAML is very sensitive about that!{% endalert %}

### Reload configurations

When you change your `local.yaml` configuration file, Kimai will not see this change immediately.
You have to reload the configurations by [rebuilding the cache]({% link _documentation/cache.md %}).

## Available configurations

Many of the available configurations can be configured through [System → Settings]({% link _documentation/configurations.md %}),
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
        gc_maxlifetime: 604800
        cookie_lifetime: 604800

security:
    firewalls:
        secured_area:
            remember_me:
                lifetime: 2419200
```

The values above are seconds, the above configuration would give you a week long full session and a remember me session for 4 weeks.

Another very strict example would be a forced logout after 1 hour, with a session cookie that is deleted upon browser restart (every browser restart forces a new login):

```yaml
framework:
    session:
        gc_maxlifetime: 3600
        cookie_lifetime: ~

security:
    firewalls:
        secured_area:
            remember_me:
                lifetime: 3600
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

### Multiple time-rounding rules

At [System → Settings]({% link _documentation/configurations.md %}) you can configure one rounding rule. 
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
