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
- `DATABASE_PREFIX` - precix for any Kimai table in the configured database
- `APP_SECRET` - secret used for hashing user passwords (don't change it, if you have user accounts in your database) 

## Config files

Configuration of Kimai is spread in all files in the `config/`directory but mainly it these files:

- `.env` - environment specific settings
- `config/packages/kimai.yaml` - Kimai specific settings
- `config/packages/admin_lte.yaml` - Kimai base theme
- `config/packages/fos_user.yaml` - user management and email settings
- `config/packages/local.yaml` - your configuration settings (file needs to be created by yourself)

There are several other configurations that could potentially be interesting for you in [config/packages/*.yaml]({{ site.kimai_v2_file }}/config/packages/).

If you want to adjust a setting from any of these files, use `local.yaml` (see below).

## Overwriting local configs (local.yaml)

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

## Reload changed configurations

When you change a configuration file, Kimai will not see this change immediately. 
You can reload the configs after you are done by rebuilding the Symfony cache with:

```bash
bin/console cache:clear --env=prod
bin/console cache:warmup --env=prod
```

Depending on your setup it might be necessary to execute these commands as webserver user, 
please read the [Installation docs]({% link _documentation/installation.md %}) for more details.
