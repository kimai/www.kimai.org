---
title: Logging
description: Configure logging in Kimai
toc: true
---

By default, Kimai logs to a file at `var/log/prod.log`. 
The contents of the log file can also be seen in the `Doctor` screen in Kimai, which is available for super-admin users 
with the `ROLE_SUPER_ADMIN` role.

The log mechanism is configured to collect, but not write logs. 
Only in the case of an error, all collected logs for the request will be dumped to the logfile.  

The logfile is not rotated, which is critical to understand: even if only errors are logged, the filesize will increase over time.

To flush the logfile from time to time, you have several options:
- you can create a cronjob to delete the file
- you can configure log rotation via your OS
- you can empty the file from the `Doctor` screen 
- or you can reconfigure the logger

## Changing the logging

Be aware, changing the logging will lead to a non-functional "logging" section in the `Doctor` screen.  

### Log rotation

The simplest way to achieve log-rotation by changing the logger config in your [local.yaml]({% link _documentation/local-yaml.md %}).
Afterwards you need to [reload the cache]({% link _documentation/cache.md %}). 

```
monolog:
    handlers:
        nested:
            type:  rotating_file
            path:  '%kernel.logs_dir%/%kernel.environment%.foooooo.log'
            max_files: 10
```

### Logging to stderr

The configuration process is the same as above:

- Change the logger config in your [local.yaml]({% link _documentation/local-yaml.md %})
- Then [reload the cache]({% link _documentation/cache.md %}) 

```
monolog:
    handlers:
        main:
            path: php://stderr
```

You can read [this article](https://symfony.com/blog/logging-in-symfony-and-the-cloud) to understand more.
