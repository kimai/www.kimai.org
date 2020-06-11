---
title: Reloading cache
description: How to reload the Kimai cache system
toc: false
---

When running in the `prod` environment (which is always true unless you want to develop with Kimai) and you executed one 
of the following tasks within Kimai you need to reload its cache:

- [installed Kimai]({% link _documentation/installation.md %})
- [updated Kimai]({% link _documentation/updates.md %})
- [updated a configuration]({% link _documentation/configurations.md %})
- [installed a bundle]({% link _documentation/plugins.md %})
- [updated a bundle]({% link _documentation/plugins.md %})

Kimai not only caches configuration files, but also the list of installed bundles and many other informations which are 
time consuming to calculate and which should not be evaluated on every request.

{% include cache-refresh.html %} 

It might be necessary to execute these commands as webserver user, 
read the [Installation docs]({% link _documentation/installation.md %}) for more details.

Depending on your setup and the way you call the cache command, you have to fix directory permissions afterwards. 
 
{% include file-permissions.html %} 

### Something went wrong / 500 error

This is very often caused by rebuilding the cache without fixing the file permissions.

Please check your logs at `var/log/prod.log` - if you can't find that file it is even more likely that you have a permission problem!  
