---
title: Install and update Kimai plugins
navigation: Plugins
description: How to install, update, deactivate and uninstall Kimai plugins 
---

Kimai plugins are stored in `var/plugins/`.

For the sake of this documentation, we use a plugin called `FooBar`. 
This plugin lives in the directory called `FooBarBundle`, the full directory name is therefor `var/plugins/FooBarBundle/`.

## Download licensed plugins

In case you bought a license for one of the Kimai plugins, you can get your latest update at:

- [Kimai License-Manager](https://license.kimai.org/)

## Plugin installation

You copy the ZIP file to your server, e.g. into `var/plugins/` and then unzip it in:
```bash
cd var/plugins/
unzip FooBarBundle-1.0.zip
```

If the plugin ZIP contained a version number, as in the above example the `-1.0`, you often end with a directory 
called `var/plugins/FooBarBundle-1.0/` instead of what we need, so you have to rename it:
```bash
mv FooBarBundle-1.0 FooBarBundle
```

The final location for the plugin `FooBarBundle` must be `var/plugins/FooBarBundle/` and there needs to be a file called `var/plugins/FooBarBundle/FooBarBundle.php`.

After installing the plugin, you will need to [clear the cache]({% link _documentation/cache.md %}).

In case your plugin comes with a database, you might have to call something like `bin/console kimai:bundle:foobar:install`.

{% include alert.html icon="alarm-exclamation" type="success" alert="Additional installation steps might be required (like the database creation step above). The plugin specific docs will explain that." %}

## Updating plugins

The update procedure is the same as the installation produce. First delete the existing plugin directory, then repeat the installation:

```bash
cd vsr/plugins/
rm -r FooBarBundle
unzip FooBarBundle-1.1.zip
mv FooBarBundle-1.1 FooBarBundle
```

You will then need to [clear the cache]({% link _documentation/cache.md %}). 

In case your plugin comes with a database, you might have to call something like `bin/console kimai:bundle:foobar:install`.

## Deactivate plugins

You can disable plugins by creating a file called `.disabled` in the plugin directory, e.g. `var/plugins/FooBarBundle/.disabled`.

You will then need to [clear the cache]({% link _documentation/cache.md %}).

## Remove Plugin

To uninstall a plugin, you simply have to delete the directory, e.g. `var/plugins/FooBarBundle/`.

Now [clear the cache]({% link _documentation/cache.md %}).

## Troubleshooting

There are three main reasons, why you might experience a 500 error after plugin installation:

- You installed a plugin that is not compatible with your Kimai version
- You forgot to change the file permissions after reloading the cache
- You did not execute the necessary step to install the plugins database tables, the command is usually called `bin/console kimai:bundle:example:install` 
