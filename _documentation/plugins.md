---
title: Plugins
description: How to create a Kimai plugin 
toc: true
---

A Kimai plugin is from a technical perspective _only_ a Symfony bundle, with some minor modifications.

Within the external communication it is called **plugin** instead of **bundle**, as this is the wording most users know. 

## Kimai plugins vs. pure Symfony bundles

The reason or motivation for using a slightly different approach than the proposed Symfony way is the recommended way 
to install and update Kimai with  Git and Composer.

If you would install a bundle with the "regular" way using composer, you would end up with a "dirty git status" and run 
into problems when performing the next update (at least changes in: `bundles.php`, `composer.json`, `composer.lock`, `symfony.lock`).

The application Kernel was slightly modified to allow dynamic plugin and route loading, to prevent this from happening.

## Plugin location

Kimai plugins are stored in `var/plugins/`, for example `var/plugins/YourBundle/`.

The contents in `var/plugins/*` are listed in the [.gitignore]({{ site.kimai_v2_file }}/.gitignore) file to prevent update problems.

## Difference between Kimai plugin and Symfony bundle

There are some minor differences to Symfony bundles, which were added to prevent the above mentioned update problems:

- Kimai plugins are stored in `var/plugins/` instead of `vendor/`
- Kimai plugins are loaded automatically in **each** environment (don't modify `config/bundles.php`)
- Routes are automatically loaded with the search pattern:  
`var/plugins/YourBundle/Resources/config/routes.{php,xml,yaml,yml}`
- Your Bundle class need to be namespaced with the vendor segment `KimaiPlugin`

The namespace is pre-registered in composer and the Kimai autoloader (PSR-4) with the vendor segment locked to `KimaiPlugin`, 
pointing to `var/plugins/` to prevent that users have to dump a new autoloader after installing a plugin. 

### Plugin installation

Due to the changed plugin location, installation is not done with composer but with `git clone` (recommended way) or with a copy task.

### Directory and class structure

The final directory structure should look like this:

```
/kimai/var/plugins/
├── YourBundle
│   ├── YourBundle.php
|   └ ... more files and directories follow here ... 
```

And the bundle class looking like this:

```php
namespace KimaiPlugin\YourBundle;

use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\HttpKernel\Bundle\Bundle;

class YourBundle extends Bundle
{
    public function build(ContainerBuilder $container)
    {
        parent::build($container);
    }
}
```

Even though its called **plugin**, you can clearly see that the namespace and classes still need to follow the official 
[Symfony bundle naming conventions](https://symfony.com/doc/current/bundles/best_practices.html#bundles-naming-conventions). 

## Data storage

When your plugin wants to store files, don't use your plugin directory or concat the directory yourself, but 
use the ServiceContainer parameter `%kimai.data_dir%`. This is currently pointing to `var/data/` and also protected 
from the above mentioned update problems via [.gitignore]({{ site.kimai_v2_file }}/.gitignore). 

As this could change in the future, always inject the data directory instead of finding a place yourself:   

```yaml
services:
    KimaiPlugin\YourBundle\MyController:
        arguments:
            $dataDirectory: "%kimai.data_dir%"
```

There is another parameter called `%kimai.plugin_dir%`, which is pointing to the base directory of all plugins.

## Example plugin

Please have a look at the repository [https://github.com/keleo/CustomCSSBundle](https://github.com/keleo/CustomCSSBundle), 
which serves as demo with:
- A bundle with an extension to load service definitions
- Additional routes
- An admin controller with form usage, flash messages and an additional view
- EventSubscriber to extend the navigation
- Translations
- Data storage in `%kimai.data_dir%`

## List your plugin in the {{ site.data.menu.store.name }}

If you created a plugin or any other kind of software around Kimai 2 which you want to see listed in the {{ site.data.menu.store.name }}, head over 
to the [{{ site.data.menu.store.name }} documentation]({% link _documentation/store.md %}) to find out how.

## Links

- Check out the [{{ site.data.menu.store.name }}]({% link _pages/store.html %}) to find out more free plugins for code demonstrations
- Read the [Symfony bundle documentation](https://symfony.com/doc/current/bundles.html) if this is your first time writing a Symfony bundle
 