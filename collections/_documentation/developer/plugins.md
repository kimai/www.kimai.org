---
title: Create plugins
description: How to create a Kimai plugin 
---

A Kimai plugin is from a technical perspective _only_ a Symfony bundle, with some minor modifications.

Within the external communication it is called **plugin** instead of **bundle**, as this is the wording most users know. 

Kimai plugins are stored in `var/plugins/`, for example `var/plugins/YourBundle/`.
The contents in `var/plugins/*` are listed in the [.gitignore]({{ site.kimai_v2_file }}/.gitignore) file to prevent update problems.

## Plugin management (install, uninstall & deactivate) 

Read the chapter [Plugin management]({% link _documentation/plugin-management.md %}).

## Kimai plugins vs. pure Symfony bundles

The reason for using a slightly different approach than the proposed Symfony way is the recommended way 
to install and update Kimai with Git and Composer.

If you would install a bundle using composer, you would end up with a "dirty git status" and run 
into problems when performing the next update (with changes in: `bundles.php`, `composer.json`, `composer.lock`, `symfony.lock`).

The application Kernel was slightly modified to allow dynamic plugin and route loading, to prevent this from happening.

There are some differences to Symfony bundles, which were added to prevent problems during core updates:

- Kimai plugins are stored in `var/plugins/` instead of `vendor/`
- Kimai plugins are loaded automatically in **each** environment (no need to modify `config/bundles.php`)
- Routes are automatically loaded with the search pattern:  
`var/plugins/YourBundle/Resources/config/routes.{php,yaml}`
- Your Bundle class needs to be namespaced with the vendor segment `KimaiPlugin`
- Your Bundle must implement `App\Plugin\PluginInterface` 

The namespace is pre-registered in composer with the vendor segment locked to `KimaiPlugin`, 
pointing to `var/plugins/` to prevent that users have to dump a new autoloader after installing a plugin. 

## Directory structure

The minimal directory structure must look like this:

```
var/plugins/YourBundle
├── DependencyInjection
│   └── YourExtension.php
├── Resources
│   └── config
│       └── services.yaml
├── YourBundle.php
├── composer.json
└ ... more files and directories follow here ... 
```

Even though its called **plugin** in Kimai, the namespace and classes still need to follow the official 
[Symfony bundle naming conventions](https://symfony.com/doc/current/bundles/best_practices.html#bundles-naming-conventions). 

### YourBundle.php

```php
namespace KimaiPlugin\YourBundle;

use App\Plugin\PluginInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\HttpKernel\Bundle\Bundle;

class YourBundle extends Bundle implements PluginInterface
{
}
```

### DependencyInjection/YourExtension.php

```php
namespace KimaiPlugin\YourBundle\DependencyInjection;

use Symfony\Component\Config\FileLocator;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Loader;
use Symfony\Component\HttpKernel\DependencyInjection\Extension;

class YourExtension extends Extension
{
    public function load(array $configs, ContainerBuilder $container)
    {
        $loader = new Loader\YamlFileLoader(
            $container, 
            new FileLocator(__DIR__ . '/../Resources/config')
        );

        $loader->load('services.yaml');
    }
}
```

### Resources/config/services.yaml

```yaml
services:
    _defaults:
        autowire: true
        autoconfigure: true
        public: false
        bind:

    KimaiPlugin\YourBundle\:
        resource: '../../*'
        exclude: '../../{Resources}'
```

### composer.json

Your plugin needs to ship a composer.json, even if it is not used for installation.
Kimai will read values from it for extended information in the plugins admin panel.

A minimal `composer.json` could look like this:

```json
{
    "name": "foo/your-bundle",
    "description": "A simple demo plugin for Kimai, which actually does nothing",
    "homepage": "https://www.kimai.org/",
    "type": "kimai-plugin",
    "version": "0.1",
    "license": "MIT",
    "authors": [
        {
            "name": "Kevin Papst",
            "email": "kpapst@gmx.net",
            "homepage": "https://www.kimai.org"
        }
    ],
    "extra": {
        "kimai": {
            "require": 20000,
            "name": "Your awesome bundle"
        }
    }
}
```

The `type` (kimai-plugin)is required for proper installation if composer is used.
The `homepage` will be used for a backlink in the plugin admin panel. 
The `version` will be shown in the plugin admin panel.

The values in the `extra.kimai` section are mandatory and used for:

- `require` - the required (minimal) Kimai which is needed for this plugin as int (calculate like that: major * 10000 + minor * 100 + patch, e.g. 2.1.7 = 20107) 
- `name` - the name of the plugin, as shown in the administration

## Data storage

When your plugin wants to store files, don't use your plugin directory or concat the directory yourself, but 
use the global directory configured for Kimai. 

Please use `App\Utils\FileHelper` to access files in the data directory


## Example plugin

There is an [official demo bundle](https://github.com/kimai/DemoBundle) which has many code examples for extension points.

You can also have a look at the [CustomCSSBundle](https://github.com/Keleo/CustomCSSBundle) which serves as bundle demo:
- A bundle with an extension to load service definitions
- Additional routes
- An admin controller with form usage, flash messages and an additional view
- EventSubscriber to extend the navigation
- Translations
- Data storage in `%kimai.data_dir%`

## List your plugin

If you created a plugin or any other kind of software around Kimai which you want to see listed in the Store, head over 
to the [documentation]({% link _documentation/developer/store.md %}) to find out how.

## Links

- Check out the [Store]({% link _pages/store.html %}) to find out more free plugins for code demonstrations
- Read the [Symfony bundle documentation](https://symfony.com/doc/current/bundles.html) if this is your first time writing a Symfony bundle
 
