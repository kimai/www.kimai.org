---
layout: kimai
title: Documentation for Kimai
description: Documentation for Kimai Time-Tracking
redirect_from:
  - /documentation/installation/updates.html
---
# Updates

## Step 1

**Create a full backup!** 

You need to backup both: your **database** and your file system, especially the file **includes/autoconf.php**.

## Step 2

To install a new version just replace the entire directory with the new package and **KEEP** the file **autoconf.php** which can be found inside the /includes folder.

Additionally you have to set write permissions to the **temporary/** folder.

Attention: Kimai will NOT work with wrong permissions!

For Linux that could be:

```
chmod -R 777 temporary/
```
It would be even better, if you give writing permission to your PHP or Webserver user only, instead of making it world writable. The last can be or is a risk, especially in shared hosting environments.

## Step 3

Ready for update:

Visit your Kimai installation with your web browser and the auto update process will perform all necessary tasks
(eg. http://www.example.com/kimai/index.php - do **NOT** execute the installer!).

A new version updates the database automatically. Before that a backup of your data will be created. Normally you'll not even notice this process. If anything goes wrong during the database-update you can recover the data via phpMyAdmin.


## Step 4

If the update was successful, finalize everything by removing the **updater** and **installer** folder.
For Linux that could be:

```
rm -rf updater
rm -rf installer
```
