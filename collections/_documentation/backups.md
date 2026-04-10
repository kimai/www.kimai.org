---
title: Backups
description: How to backup and restore your Kimai installation
---

You need to back up the following files and directories (not all might exist in your system):

- `.env` and `.env.local`
- `config/packages/local.yaml`
- `var/data/`
- `var/export/`
- `var/invoices/`
- `var/packages/`
- `var/plugins/`

## Database backup

You should always create a **full backup** of the Kimai database. 

I hope you don't share the database with another applications, because the list of tables depends on the used plugins.

The required database tables are at least: 
- All tables with prefix `kimai2_`
- All tables with prefix `bundle_migration_`
- The table `migration_versions`

## Create a database backup

The following command creates a database backup for MySQL/MariaDB:

```
mysqldump --single-transaction -u kimai2 -p -h 127.0.0.1 kimai2 > ~/kimai2-`date +%F_%H-%M`.sql
```

## Restore 

- Install Kimai [as documented]({% link _documentation/installation.md %}) in the **exact same version**, which you used when you created the backup
- Make sure it works
- Restore the database backup in an empty database
- Restore the files: `var/data/`, `.env`, `local.yaml`
- Point `.env` to your imported database

Now refresh your cache:

{% include snippets/cache-refresh.md %}  

Now run the [upgrade commands]({% link _documentation/updates.md %}) and come back.

Run the plugin installation commands. 

## Common mistakes

You restored Kimai (as documented above), but have problems when accessing it?

That's likely because you installed different versions and forgot to execute the [database upgrade]({% link _documentation/updates.md %}).

Please check the [UPGRADING]({{ site.kimai_v2_file }}/UPGRADING.md) guide and make sure you executed all version specific tasks.

### Configuration

You see an error when executing the cache commands?

This problem can happen when a configuration change is necessary in your `local.yaml`. 
Please check the [UPGRADING]({{ site.kimai_v2_file }}/UPGRADING.md) guide. 

## Backup script

The following solution is a very simple, but working way to back up your Kimai installation. 
It will store the database, your environment file, the installed plugins and generated data (e.g. invoice files).

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
mkdir -p $BACKUP_TMP_DIR/var/packages/

mysqldump --defaults-file=$CONNECTION_CONFIG --single-transaction --no-tablespaces -u kimai2 -h 127.0.0.1 kimai2 > $BACKUP_TMP_DIR/kimai2-$DATE.sql

cp $KIMAI_DIR/.env* $BACKUP_TMP_DIR/
cp -R $KIMAI_DIR/var/data/* $BACKUP_TMP_DIR/var/data/
cp -R $KIMAI_DIR/var/plugins/* $BACKUP_TMP_DIR/var/plugins/
cp -R $KIMAI_DIR/var/packages/* $BACKUP_TMP_DIR/var/packages/

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
