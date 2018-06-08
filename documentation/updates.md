---
layout: kimai
title: Documentation for Kimai update
description: Documentation for updating Kimai
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
It would be even better, if you give writing permission to your PHP or Webserver user only, instead of making it world 
writable. The last can be or is a risk, especially in shared hosting environments.

## Step 3

Ready for update:

Visit your Kimai installation with your web browser and the auto update process will perform all necessary tasks
(eg. http://kimai.example.com/ - do **NOT** execute the installer!).

A new version of kimai will update the database automatically. Before any database migrations will be done, a backup of 
your tables will be created in the same database with a timestamp.
For a recovery it is still better to use the original backup that you hopefully created before.

## Step 4

If the update was successful, finalize everything by removing the **updater** and **installer** folder.
For Linux that could be:

```
rm -rf updater
rm -rf installer
```
