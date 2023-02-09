---
title: Updates
description: How to update Kimai to the next release version
redirect_from:
  - /documentation/installation/updates.html
  - /documentation/updates/
  - /v1/updates.html
---

1. Make sure that you have a working [database backup]({% link _documentation/backups.md %}) before you start the update
2. Check [UPGRADING]({{ site.kimai_v2_file }}/UPGRADING.md) for required manual changes between your current and the new version 
3. You can upgrade multiple version at once, eg. from `1.6` to `1.8` while skipping `1.7`

## Updating Kimai 

{% capture alert_note %}
Some tweaks may be necessary to these instructions if you have a developer setup or update on your local computer 
instead of a server. Read the [installation documentation]({% link _documentation/installation.md %}) for more information.
{% endcapture %}
{% assign alert_note = alert_note| markdownify %}
{% include alert.html type="info" alert=alert_note %} 

Change into your Kimai directory, then fetch the latest code and install all dependencies: 
```bash
git fetch --tags
git checkout {{ site.kimai_v2_version }}
```

You might have to prefix the next commands with `sudo` and/or `php` (depends on your environment):

Update all composer dependencies:
```bash
composer install --optimize-autoloader -n
```

And run the Kimai updater:
```bash
bin/console kimai:update
```

If you use redis as cache, dont forget to flush the redis database
```
redis-cli flushall
```

Remember to adjust the file permissions if necessary.
{% include file-permissions.html %} 

{% include upgrading-note.html %} 

That's it, Kimai is running the most current version. Enjoy the latest time-tracking features!

## Troubleshooting

### flex.symfony.com not found

If you see the following error during `composer install`, then you are running a very old installation 😁

```bash
curl error 6 while downloading https://flex.symfony.com/versions.json: Could not resolve host: flex.symfony.com 
```

Great that you like Kimai, but PLEASE: for various reason (like security) you should update more regularly!

Please run `composer install --optimize-autoloader -n --no-plugins --no-scripts` once and then follow the normal update process.

### Changed files

Please check with `git status` if your directory is without changes, to make sure you really can upgrade.
If the following statement looks different for you, keep on reading:
```bash 
$ LANG=en_US git status
Not currently on any branch.
nothing to commit, working tree clean
```

If you experience an issue like this (file name can vary) while performing the `git update`: 

```bash
error: Your local changes to the following files would be overwritten by checkout:
symfony.lock
Please commit your changes or stash them before you switch branches.
```

or

```bash
config/routes/annotations.yaml: needs merge
error: you need to resolve your current index first
```

This means you have changes in at least one of the files in your installation.
This can happen by installing additional packages (e.g. for LDAP), or simply when you changed a configuration file (which was not meant to be changed, read the docs how to apply config changes in a safe manner). 

These changes need to be reverted before the update can be executed. 
One possible solution is to use `git stash`, which will store your changes in a temporary location.
If that fails for some reason, the other (rather extreme) option is to run `git reset --hard`, 
which will wipe all local changes. 

Please read GIT docs on how to fix that, it is NOT related to Kimai.
