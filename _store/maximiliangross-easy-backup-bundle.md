---
title: "Backup plugin for Kimai 2"
name: Easy Backup
intro: "A Kimai 2 plugin, which allows you to backup your environment with a single click."
developer: maximiliangross
date: "2019-12-15 10:53:00 +0200"
icon: far fa-hdd
price: "0"
download: https://github.com/mxgross/EasyBackupBundle/archive/master.zip
github: https://github.com/mxgross/EasyBackupBundle
screenshot: 
  - https://raw.githubusercontent.com/mxgross/EasyBackupBundle/master/screenshot.jpg
tags:
  - plugin
  - backup
---

After the installation a new menu entry `EasyBackup` is created. There you can create a new backup
by clicking the `Create Backup` button. Afterwards all created backups will be listet at the page
and you can delete or download the createt backup as zip file.

## Installation

First clone it to your Kimai installation `plugins` directory:
```
cd /kimai/var/plugins/
git clone https://github.com/mxgross/EasyBackupBundle.git
```

And then rebuild the cache:
```
cd /kimai/
bin/console cache:clear
bin/console cache:warmup
```

You could also [download it as zip](https://github.com/mxgross/EasyBackupBundle/archive/master.zip) and upload the directory via FTP:

```
/kimai/var/plugins/
├── EasyBackupBundle
│   ├── EasyBackupBundle.php
|   └ ... more files and directories follow here ...
```

Please contact me via [info@maximiliangross.de](mailto:info@maximiliangross.de) for any inquiry.

## Storage

This bundle stores the backups zipped in the directory `var/easy_backup`.
Make sure its writable by your webserver! We don't use the recommended 
`var/data/` directory, because it will be part of the backuped files!


### What files are backed up?

Currently these directories and files are included in the backup:

```
.env
config/packages/local.yaml
var/data/
var/plugins/
```

According to [the backup docu](https://www.kimai.org/documentation/backups.html) the kimai version should be saved to.
Also the current git head.
Therefor a Readme.txt file with the mentioned information is written and added to the backup.

### What database tables are backuped?

If you use sqlite, the database file is backuped because the `var/data` directory will be backuped by the plugin.

If you use mysql/mariadb the plugin will recognize it by reading the configured database connection url.
Then it will execute a mysqldump command and create a sql dump file which will be added to the backup zip.

**Please note**: Currently the mysqldump command is used as `/usr/bin/mysqldump`. This will only work on systems where
mysqldump is available at this location. I will change it later on, but this should work on most environments.

### Early development phase

If anyone will help me with testing or contributing it would be great.
