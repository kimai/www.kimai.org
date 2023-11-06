---
title: Plugin management
navigation: Plugins
description: Installation, deactivating and uninstalling plugins 
redirect_from: /documentation/extensions/
---

Kimai plugins are stored in `var/plugins/`, for example `var/plugins/CustomCSSBundle/`.

## Plugin installation

Installation should be done with `git clone` or with a copy task.

Make sure that you copy it into the appropriate subdirectory in `var/plugins/`. 
For the plugin `CustomCSSBundle` this would be `var/plugins/CustomCSSBundle/` (there should be a file `var/plugins/CustomCSSBundle/CustomCSSBundle.php`).

After installing the plugin, you will need to [clear the cache]({% link _documentation/cache.md %}) (see below).

{% include alert.html icon="fas fa-exclamation" type="warning" alert="Additional installation steps might be required (eg. database creation). Please read the specific plugin docs!" %}

## Deactivate plugins

You can disable plugins by creating a file called `.disabled` in the plugin directory, e.g. `var/plugins/CustomCSSBundle/.disabled`.

You will then need to [clear the cache]({% link _documentation/cache.md %}) (see below). 

## Plugin deinstallation

To uninstall a plugin, you simply have to delete the directory, e.g. `var/plugins/CustomCSSBundle/`.

Now [clear the cache]({% link _documentation/cache.md %}) (see below).

## Troubleshooting

There are three main reasons, why you might experience a 500 error after plugin installation:

- You installed a plugin that is not compatible with your Kimai version
- You forgot to change the file permissions after reloading the cache
- You did not execute the necessary step to install the plugins database tables, the command is usually called `bin/console kimai:bundle:example:install` 

### Reload cache

{% include cache-refresh.html %}

Depending on your setup, the cache flush will create directories which cannot be written by your webserver:
{% include documentation/file-permissions.html %}
