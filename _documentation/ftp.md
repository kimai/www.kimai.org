---
title: Kimai via FTP 
description: "Manamegement of Kimai via FTP: Installation, Plugins, Cache"
toc: true
---

**WARNING:** Do not use FTP because it is simpler to install, **it will cause problems** in the long run!

The recommended way to [install Kimai v2 is via SSH]({% link _documentation/installation.md %}).

FTP is not supported, because most of Kimai's management tasks rely on the console. There are workaournds available, see below, 
but they are not as reliable as SSH access.

{% capture support %}
I know that you probably don't have the technical background for managing a server yourself and need to rely 
on a shared hosting package. If you thought about switching to a managed server before (they are affordable these days) 
you can contact me, [I offer paid setup support]({% link _store/keleo-installation-support.md %}).
{% endcapture %}
{% assign support = support|markdownify %}

{% include alert.html type="info" alert=support %}

## FTP installation

{% include alert.html type="warning" alert="FTP installation is only possible, if your hosters PHP version has SQLite support!" %}

### SQLite not supported for production usage

SQLite is a great database engine for testing, but when it comes to **production usage it is not supported for Kimai**:

- It does not support ALTER TABLE commands and makes update procedures clunky and problematic (I try to support updates, but they are heavy on large databases)
- It does [not support FOREIGN KEY](https://www.sqlite.org/quirks.html#foreign_key_enforcement_is_off_by_default) constraints [out of the box](https://www.sqlite.org/foreignkeys.html#fk_enable), which can lead to critical bugs when deleting users/activities/projects/customers

Kimai tries to work around the Foreign Keys issue by using a 
[Doctrine PostConnect EventSubscriber]({{ site.kimai_v2_file }}/src/Doctrine/SqliteSessionInitSubscriber.php), 
but this does not work in all environments (SQLite needs to be compiled with foreign support), 
it is not intended to be used in production environments and it can't be guaranteed that SQLite handles everything as expected!

If you insist on using SQLite: make a copy of the database file BEFORE each update to prevent possible data loss and don't ever delete data that is already linked to other data (like users/customers/projects/activities used in timesheets) ... 

**And don't file any bug report - you have been warned!**
 
If you have no SSH access to your server (e.g. when you use a shared hosting package) then you can create a package tha 
includes a pre-installed Kimai version.

- First you [install the development version of Kimai]({% link _documentation/developers.md %}) on your local system.
- As next step you run `bin/console kimai:create-release --directory=/tmp/ --release={{ site.kimai_v2_version }}` in that installation. 
This will create a ZIP at `/tmp/kimai-release-{{ site.kimai_v2_version }}.zip` that you can either upload directly and then extract 
using your hosters tools or you extract it locally and upload all files.
- Now point your domain (document root) to the `public/` directory
- Register your first user in the login screen, you will automatically become `SUPER_ADMIN`
  
The file `var/data/kimai.sqlite` will hold all your data, include it in your backups!

## Do not delete data

Do not, under any circumstance delete data. It will cause problems. FTP version fo Kimai uses SQLite and that is (in connection with Kimai) an unreliable database system.
Please re-read the `SQLIte not supported for production usage` warning above!

You can deactivate users and hide unused objects - don't ever delete data that is already linked to other data (like users/customers/projects/activities used in timesheets). 
If you insist on playing with fire: make a copy of the database file BEFORE each delete to prevent data loss. 

## Clear cache

When working with [configuration files]({% link _documentation/configurations.md %}) you cannot run the normal commands to clear the cache.

The workaround is to delete the cache directory `var/cache/prod/` manually.
If possible, use your hoster Management UI. They tend to be must faster and more reliable than using your regular FTP software.

Kimai will re-create a fresh cache when you open it again in your browser.

Make sure that you don't open a Kimai while you are deleting the cache!       

## FTP updates

**There is no support for updates yet. This feature will hopefully be included in the future.**

The problem is, that there is currently no support for upgrading your database automatically. 
You can only do it manually and please don't expect support for that method. You have been warned!   

### Manual update

Currently the way to upgrade Kimai via FTP includes several manual steps:

- Install Kimai via GIT locally
- Download the SQLite database from your server to your local Kimai installation
  - Configure your local Kimai to use this SQLite database
- Execute the [update as documented]({% link _documentation/updates.md %})
- Backup/Rename/Delete your FTP installation
- Install the latest FTP package
- Upload the locally upgraded SQLite database to your new FTP installation 
  - Add `.env`, `local.yaml` and other adjusted files back to this new installation
  - Clear your cache
