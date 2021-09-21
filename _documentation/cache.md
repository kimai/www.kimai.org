---
title: Reloading cache
description: How to reload the Kimai cache system
toc: false
related:
  - local-yaml
---

When running in the `prod` environment (which is always true unless you want to develop with Kimai) and you executed one 
of the following tasks within Kimai you need to reload its cache:

- [installed Kimai]({% link _documentation/installation.md %})
- [updated Kimai]({% link _documentation/updates.md %})
- [updated a configuration]({% link _documentation/local-yaml.md %})
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


### Helper script

This little script can simplify the cache rebuilding task. **Be careful if you don't understand what it does!**

- Adjust the line `chgrp -R www-data .` and replace `www-data` with the username for your webserver
- Create the file `cache.sh` in the Kimai base directory
- Allow to execute the file with `chmod +x cache.sh`
- Run the script `./cache.sh`

```bash
#!/bin/bash

if [[ ! -d "var/" || ! -d "var/cache/prod/" ]];
then
 echo "Cache directory does not exist at: var/cache/prod/"
 exit 1
fi

if [[ ! -f "bin/console" ]];
then
 echo "Kimai console does not exist at: bin/console"
 exit 1
fi

rm -r var/cache/prod/*
bin/console kimai:reload --env=prod
chgrp -R www-data .
chmod -R g+r .
chmod -R 775 var/
chmod -R g+rw public/avatars/
```
