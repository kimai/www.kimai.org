---
title: Backups
description: How to backup and restore a Kimai 2 installation
toc: true
---

## Backup

You have to backup the following files:
- `.env`
- `config/packages/local.yaml`
- the directory `var/data/`

The following stuff needs attention as well, backup if necessary:
- all customized files
- all added invoice templates
- installed plugins at `var/plugins/`

Database:
- All tables starting with `kimai2_`
- The table `migration_versions`
- Best is to backup all tables in the database with all data!

Write down the exact version of your Kimai installation:
- `bin/console kimai:version`
- `git rev-parse HEAD`

## Restore 

The easiest way:
- install Kimai [as documented]({% link _documentation/installation.md %})
- restore the database backup
- restore `.env` (adjust it to match the new database) 

At this step: test Kimai and don't proceed before it works as expected!

Working properly? Fine, then go ahead and restore all other files:
- invoice templates
- plugins
- `local.yaml`

## Pitfall version change

You restored Kimai as documented above, but have problems when accessing it?

The reason: you missed upgrade steps, which you would have done when executing a [normal upgrade]({% link _documentation/updates.md %}).

Please check the [UPGRADING]({{ site.kimai_v2_file }}/UPGRADING.md) guide for version specific tasks that you might have missed.

### Database

If Kimai will not load properly (e.g. you only see a white screen, maybe some pages work) the database could be the reason.

This problem can happen when you install a different (newer) version that has a different database structure then your backup. 

Solution 1: execute the missing database migrations with `bin/console doctrine:migrations:migrate`.

### Configuration

You see an error when executing `bin/console cache:clear`.

This problem can happen when a configuration change is necessary in your `local.yaml`. 
Please check the [UPGRADING]({{ site.kimai_v2_file }}/UPGRADING.md) guide. 
