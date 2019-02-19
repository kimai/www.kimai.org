---
title: Updates
description: Updating Kimai 1
redirect_from:
  - /documentation/installation/updates.html
  - /documentation/updates/
---

When you update an existing installation, just replace the entire Kimai folder on your server. 
Additionally you need to make the `temporary` folder writable for PHP. 
Open Kimai in your browser and follow the upgrade guide. Afterwards remove the `installer` and `updater` directories.

And here comes the longer version:

## Step 1 - Create a full backup!

You need to backup both: your Kimai **database** and the **folder containing your Kimai installation**, especially the file `includes/autoconf.php`. 
To backup the folder holding your Kimai installation you can rename it and create a new folder for the new version. 
For these instructions we will use the folders `public_html` and `public_html-backup`. 
If your webhosting uses a different name adjust the instructions below as needed.

## Step 2 - Download and unzip

Change to the folder where you will be installing the new version of Kimai and download the newest version with something like this (the filename will change with the version):

```bash
wget {{ site.kimai_v1_repo }}/releases/download/1.3.1/kimai_1.3.1.zip
```

The link to the newest version can be found on the [Downloads]({% link _v1/index.md %}) page.

Unzip it with something like this (the filename will change with the version):

```bash
unzip kimai_1.3.1.zip
```

## Step 3 - copy configuration

Copy `autoconfig.php` from the old version to the new version of Kimai with something like this:

```bash
cp public_html-backup/includes/autoconfig.php public_html/includes/
```

## Step 4 - Set correct permissions

Ensure that `temporary` folder has write permissions.

For webhosters who only give you FTP access, this step can be ignored as the permissions will be set for you automatically.

**Attention: The Kimai Updater will NOT work with wrong permissions!**

If you have SSH access to your webserver, you can set write permissions to the 'temporary' folder with:

```bash
chmod -R og+w temporary/
```

This will give write permissons to the owner and group. 
The best is to only give the write permissions to PHP and the webserver in this way instead of giving all users write permissions. 
This can be or is a risk, especially in shared hosting environments.
If setting the permissions with the command above does not work you can give every user write permissions with:

```bash
chmod -R 777 temporary/
```

## Step 5 - Run the updater.php

Ready for update:

Visit your Kimai installation (eg. http://kimai.example.com/) with your web browser and the auto update process will perform all necessary tasks. 
You should see the **updater**. If you see the **installer** do not continue. 
Check that you have copied the file `includes/autoconfig.php` from your old installation to the new. 
Do **NOT** execute the installer, as doing so will misconfigure the new installation and you will need to restore the backup of the database and start the update process again.

A new version of kimai will update the database automatically. Before any database migrations will be done, a backup of 
your tables will be created in the same database with a timestamp.

For a recovery it is still better to use the original backup that you created before.

## Step 4

If the update was successful, finalize everything by removing the **updater** and **installer** folder.

For Linux that will be:

```bash
rm -rf updater
rm -rf installer
```