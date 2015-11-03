---
layout: kimai
title: Downloads - Kimai Time-Tracking
description: Download - Kimai Time-Tracking versions
permalink: /download/
redirect_from:
  - /en/download.html
  - /download.html
---

# Downloads

<section id="downloads">
      <a href="{{ site.stable_url }}"><span>Stable<br/>0.9.3</span></a>
      <a href="https://github.com/kimai/kimai/zipball/master"><span>DEV<br/>0.9.x</span></a>
      <a href="https://github.com/kimai/manuals/raw/master/documentation.pdf"><span>Docu<br/>PDF</span></a>
</section>
<div class="clearleft"></div>

We keep an eye on server compatibility, requirements for Kimai are only:
<br/>**MySQL 4.3** and **PHP 5.3** (with Mysql extension enabled, PDO is not supported)

<div class="clearleft"></div>

## DEV - Development version

A development version is the latest package we are currently working on. 
It might have new features, but it might be broken as well!

If you are an experienced user of Kimai and have the resources to help us with testing or just like to play with brand new features,
you can [download the latest development version](https://github.com/kimai/kimai/zipball/master).
It includes many of the features you see at the [demo site](/en/demo.html), which are not yet available in a stable release.

Please help us, test it and [give us your feedback]({{ site.issues_url }}) if you find any problems.

* * *

## Installation

1.  Use a **modern** Browser
2.  You need PHP 5.3 and access to a MySQL (or other) database.
3.  Start your browser and go to your Kimai directory.
4.  Kimai has a step-by-step installation program, just follow the instructions of the installer.

**IMPORTANT** Remove the ‘installer’ directory when you’ve successfully installed Kimai.

### Update

When you update an existing installment, just replace the entire Kimai folder on your server. Additionally you need to make all ‘compile’ folders (also inside all extension subfolders!) writable for PHP. Writing permission must also be granted to the ‘temporary’ folder and the included ‘logfile.txt’.

For current versions (&gt;0.8.0) when you installed Kimai via the UI-Installer (not by  editing the ‘conf.php’) you need to keep the file  ‘autoconf.php’. For older versions (at least version 0.7) keep the file ‘includes/conf.php’.

When Kimai doesn’t start the reason is probably wrong writing permissions on the mentioned files and folders! Users also encountered problems with older PDO version – see support forum for more detail

* * *

## More Downloads

Our documentation has information about fetching the [latest development version]({{ site.docu_url }}developer/README.html).

You can find all old versions at the [archived download page](https://sourceforge.net/projects/kimai/files/) at Sourceforge.

