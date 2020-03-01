---
title: Configurations
description: Kimai configurations files and basic setup, local overwrites and the cache
toc: true
---

This is an introduction into the configuration options and files, which are used by Kimai and an explanation on how to change them. 
 
Specific configuration settings are explained in the respective documentation chapters.

## Environment specific settings (.env)

The basic settings, which are required for Kimai to work are stored in the `.env` file:
 
- `MAILER_URL` - smtp connection for emails
- `MAILER_FROM` - application specific "from" address for all emails
- `APP_ENV` - environment for the runtime (use `prod` if you are unsure)
- `DATABASE_URL` - database connection for storing all application data
- `APP_SECRET` - secret used when encrypting data  (don't change it after initial setup!) 

## Config files

Configuration of Kimai is spread in all files in the `config/`directory but mainly it these files:

- `.env` - environment specific settings
- `config/packages/kimai.yaml` - Kimai specific settings
- `config/packages/admin_lte.yaml` - Kimai base theme
- `config/packages/fos_user.yaml` - user management and email settings
- `config/packages/local.yaml` - your configuration settings (file needs to be created by yourself)

There are several other configurations that could potentially be interesting for you in [config/packages/*.yaml]({{ site.kimai_v2_file }}/config/packages/).

If you want to adjust a setting from any of these files, use `local.yaml` (see below).

### Changing configurations

You should NOT edit the file `config/packages/kimai.yaml` directly, as it contains default settings and will be overwritten during an update.
Instead create the file `config/packages/local.yaml` and save your own settings in there. This file will NEVER be shipped with Kimai.
Having your custom settings in `local.yaml` allows you to easily update Kimai. This is the same concept which is used for the `.env` file.

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

### Reload changed configurations

When you change a configuration file, Kimai will not see this change immediately. 
You can reload the configs after you are done by rebuilding the cache with:

{% include cache-refresh.html %} 

Depending on your setup it might be necessary to execute these commands as webserver user, 
please read the [Installation docs]({% link _documentation/installation.md %}) for more details.

#### Fix file permissions

Depending on your setup and the way you call the command, you have to allow the webserver to write to 
`var/cache/prod/` and its subdirectories afterwards.

{% include file-permissions.html %} 

## System-configuration screen

You can edit most of the configurations from the Kimai UI directly.

This screen is only visible to users with the permission `system_configuration` which is by default given to `ROLE_SUPER_ADMIN`.

Each setting in this screen is also available in the config file (`config/packages/kimai.yaml`) where you might find 
additional information or links to the correct documentation chapter.

## User preferences vs. system settings

A user has several preferences, which change the behaviour how he interacts with Kimai.

Check out the [user preferences documentation]({% link _documentation/user-preferences.md %}) to find out more.

## Adding system configuration

As plugin developer you can add your own sections to the system configuration screen, see [developer documentation]({% link _documentation/developers.md %}).
