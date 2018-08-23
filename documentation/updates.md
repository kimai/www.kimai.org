---
layout: kimai
title: Documentation for Kimai update
description: Documentation for updating Kimai
redirect_from:
  - /documentation/installation/updates.html
---
# Updates

## Step 1 - **Create a full backup!** 

You need to backup both: your Kimai **database** and the **folder containing your Kimai installation**, especially the file `includes/autoconf.php`. To backup the folder holding your Kimai installation you can rename it and create a new folder for the new version. For thes instructions we will use the folders `public_html` and `public_html-backup`. If your webhosting use a different name adjust the instructions below as needed.

## Step 2 - Download and unzip
Change to the folder were you will be installing the new version of Kimai and download the newest version with something like:
```
wget https://github.com/kimai/kimai/releases/download/1.3.1/kimai_1.3.1.zip
```
The link to the newest version can be found on the [Downloads](/download/) page.

Unzip it with something like this:
```
unzip kimai_1.3.1.zip
```
## Step 3 - copy configuration

Copy `autoconfig.php` from the old version to the new version of Kimai with something like this:
```
cp public_html-backup/includes/autoconfig.php public_html/includes/
```

## Step 4 - Set correct permissions

Insure that `temporary` folder has write permissions.

**Attention: The Kimai Updater will NOT work with wrong permissions!**

You can set write permissions to the 'temporary' folder with:
```
chmod -R og+w temporary/
```
This will give write permissons to the owner and group. The best is to only give the write permissions to PHP and the webserver in this way instead of giving all users write permissions. This can be or is a risk, especially in shared hosting environments.
If setting the permissions with the command above does not work you can give every user write permissions with:
```
chmod -R 777 temporary/
```
## Step 5 - Run the updater.php

Ready for update:

Visit your Kimai installation (eg. http://kimai.example.com/) with your web browser and the auto update process will perform all necessary tasks. You should see the **updater**. If you see the **installer** do not continue. Check that you have copied the `includes/autoconfig.php` from your old installation to the new. Do **NOT** execute the installer, as doing so will misconfigure the new installation and you will need to restore the backup of the database and start the update process again.

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
