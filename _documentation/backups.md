---
title: Backups
description: How to backup and restore your Kimai installation
toc: true
---

## Backup

You need to backup the following files and directories:
- `.env`
- `config/packages/local.yaml`

The following files need your attention as well, backup if necessary:
- all customized files
- the directory `var/data/` if some plugins uses the directory
- all added invoice templates from `var/invoices/`
- all added export templates from `var/export/`
- installed plugins at `var/plugins/`

Database:
- Best option is to backup all tables in the database with all data!
- In detail: 
  - all tables starting with `kimai2_` 
  - all tables starting with `bundle_migration_` 
  - the table `migration_versions`

Write down the exact version of your Kimai installation:
- `bin/console kimai:version`
- `git rev-parse HEAD`

In most cases you don't need these versions. 
But it's good to have the information in the unlikely case of a problem while restoring the backup.  

## Create a database backup

Here is a one liner that creates a database backup for MySQL/MariaDB (adjust connection to your needs):

```
mysqldump --single-transaction -u kimai2 -p -h 127.0.0.1 kimai2 > ~/kimai2-`date +%F_%H-%M`.sql
```

## Restore 

- install Kimai [as documented]({% link _documentation/installation.md %}) in the **exact same version**, which you used when you created the backup
- make sure it works
- restore the database backup in an empty database
- point `.env` to your imported database

Now refresh your cache:

{% include cache-refresh.html %}  

At this step: test Kimai again and don't proceed before it works as expected!

Working properly? If not, check your file permissions:

{% include file-permissions.html %} 

Working now? Fine, then go ahead and restore all other files:

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

You restored Kimai (as documented above), but have problems when accessing it?

Maybe you have missed an upgrade steps, which you would have done when executing a [normal upgrade]({% link _documentation/updates.md %}).

Please check the [UPGRADING]({{ site.kimai_v2_file }}/UPGRADING.md) guide and make sure you executed all version specific tasks.

### Database

If Kimai will not load properly (e.g. you only see a white screen, maybe some pages work) the database could be the reason.
This problem can happen when you install a different (newer) version that has a different database structure then your backup.

Check your database if you have the `migration_versions` table. If not, go back to "Restore". 
If so: try to execute the missing database migrations with `bin/console kimai:update -n`.

### Configuration

You see an error when executing `bin/console cache:clear`.

This problem can happen when a configuration change is necessary in your `local.yaml`. 
Please check the [UPGRADING]({{ site.kimai_v2_file }}/UPGRADING.md) guide. 

## Backup script

The following solution is a very simple, but working way to backup your Kimai installation. It will store the database, your environment file, 
the installed plugins and generated data (eg. invoice files).

I recommend to create a dedicated user on the server that will store the backups:
```bash
useradd -m -s /bin/bash backup
```

Create a MySQL configuration file to store the connection password for the Kimai database user at `/home/backup/.kimai2.cnf`:
```bash
[client]
password=my-super-password
```

Make sure it can only be read by that user:
```bash
chmod 600 /home/backup/.kimai2.cnf
```

Create the backup script at `/home/backup/backup.sh` and adapt to your needs:
```bash
#!/bin/bash

export CONNECTION_CONFIG=/home/backup/.kimai2.cnf
export KIMAI_DIR=/var/www/kimai2
export BACKUP_DIR=/home/backup

export DATE=`date +%F_%H-%M`
export BACKUP_STORAGE_DIR=$BACKUP_DIR/storage
export BACKUP_TMP_DIR=$BACKUP_DIR/temp/$DATE

mkdir -p $BACKUP_STORAGE_DIR
mkdir -p $BACKUP_TMP_DIR
mkdir -p $BACKUP_TMP_DIR/var/data/
mkdir -p $BACKUP_TMP_DIR/var/plugins/

mysqldump --defaults-file=$CONNECTION_CONFIG --single-transaction --no-tablespaces -u kimai2 -h 127.0.0.1 kimai2 > $BACKUP_TMP_DIR/kimai2-$DATE.sql

cp $KIMAI_DIR/.env $BACKUP_TMP_DIR/
cp -R $KIMAI_DIR/var/data/* $BACKUP_TMP_DIR/var/data/
cp -R $KIMAI_DIR/var/plugins/* $BACKUP_TMP_DIR/var/plugins/

if [[ -d "$KIMAI_DIR/var/invoices/" ]];
then
  mkdir -p $BACKUP_TMP_DIR/var/invoices/
 cp -R $KIMAI_DIR/var/invoices/* $BACKUP_TMP_DIR/var/invoices/
fi

if [[ -d "$KIMAI_DIR/var/export/" ]];
then
  mkdir -p $BACKUP_TMP_DIR/var/export/
 cp -R $KIMAI_DIR/var/export/* $BACKUP_TMP_DIR/var/export/
fi

pushd $BACKUP_TMP_DIR
zip -r $BACKUP_STORAGE_DIR/$DATE.zip * .env
popd
```

Now edit the servers crontab with `crontab -e` and add the following lines: 

```bash
10 1 * * * /home/backup/backup.sh >> /var/log/kimai-backup.log 2>&1
20 2 * * * find /home/backup/storage/* -atime +60 -type f -delete
```
