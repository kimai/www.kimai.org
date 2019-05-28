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

- install Kimai [as documented]({% link _documentation/installation.md %}) in the **exact same version**, which you used when you created the backup
- make sure it works
- restore the database backup in an empty database
- point `.env` to your imported database
- execute `bin/console cache:clear` 

At this step: test Kimai again and don't proceed before it works as expected!

Working properly? Fine, then go ahead and restore all other files:

- invoice templates
- plugins
- `local.yaml`

Still not satisfied and want to upgrade to the latest version?

Great! Make sure you have the `migration_versions` table in your database backup, 
before you upgrade. If not, execute `bin/console doctrine:migrations:version --add --all` 
beforehand and read the [installation docs]({% link _documentation/installation.md %}) again, 
if you might have missed other points as well.

Now you [can upgrade]({% link _documentation/updates.md %}) :-)

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
