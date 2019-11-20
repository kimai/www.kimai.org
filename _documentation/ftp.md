---
title: Kimai via FTP 
description: "Manamegement of Kimai via FTP: Installation, Plugins, Cache"
toc: true
---

**WARNING:** Do not use FTP because it is simpler to install, it will likely cause problems in the long run!

The recommended way to [install Kimai v2 is via SSH]({% link _documentation/installation.md %}).

FTP is not recommended, because most of Kimai's management tasks rely on the console. There are workaournds available, see below, 
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
 
If you have no SSH access to your server (e.g. when you use a shared hosting package) then you can [download a package]({% link _pages/download.md %}), 
which includes a pre-installed Kimai version.

You install it via FTP like this:
- [download]({% link _pages/download.md %}) the latest release package for FTP 
- extract it locally and upload all files
- point your domain (document root) to the `public/` directory   
- register your first user in the login screen, you will automatically become `SUPER_ADMIN`
  
The file `var/data/kimai.sqlite` will hold all your data, please include it in your backups.

## FTP updates

**Unfortunately there is no built-in support for updates yet. This feature will hopefully be included in the future.**

## Clear cache

When working with [configuration files]({% link _documentation/configurations.md %}) you cannot run the normally commands to clear the cache.

The workaround is to delete the cache directory `var/cache/prod/` manually.
If possible, use your hoster Management UI. They tend to be must faster and more reliable than using your regular FTP software.

Kimai will re-create a fresh cache when you open it again in your browser.

Make sure that you don't open a Kimai while you are deleting the cache!       
