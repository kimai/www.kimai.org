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
      <a href="{{ site.stable_url }}"><span>Stable<br/>1.1.0</span></a>
      <a href="https://github.com/kimai/kimai/zipball/develop"><span>DEV<br/>1.x</span></a>
      <a href="https://github.com/kimai/manuals/raw/master/documentation.pdf"><span>Docu<br/>PDF</span></a>
</section>
<div class="clearleft"></div>

We keep an eye on server compatibility, requirements for Kimai are only:
<br/>**MySQL 4.3** and **PHP 5.4** (required extensions: mysqli and iconv)

<div class="clearleft"></div>

## DEV - Development version

A development version is the latest package we are currently working on.
It might have new features, but it might be broken as well!

If you are an experienced user of Kimai and have the resources to help us with testing or just like to play with brand new features,
you can [download the latest development version](https://github.com/kimai/kimai/zipball/develop).
It includes many of the features you see at the [demo site](/demo/), which are not yet available in a stable release.

Please help us, test it and [give us your feedback]({{ site.issues_url }}) if you find any problems.

* * *

## Installation

1.  Use a **modern** Browser
2.  You need PHP 5.4 and access to a MySQL database.
3.  Start your browser and go to your Kimai directory.
4.  Kimai has a step-by-step installation program, just follow the instructions of the installer.

**IMPORTANT** Remove the ‘installer’ directory when you’ve successfully installed Kimai.

### Update

When you update an existing installation, just replace the entire Kimai folder on your server. Additionally you need to make all ‘compile’ folders (also inside all extension subfolders!) writable for PHP. Writing permission must also be granted to the ‘temporary’ folder and the included ‘logfile.txt’.

When Kimai doesn’t start the reason is probably wrong writing permissions on the mentioned files and folders!

* * *

## More Downloads

Our documentation has information about fetching the [latest development version]({{ site.docu_url }}developer/index.html).

You can find all old versions at the [archived download page](https://sourceforge.net/projects/kimai/files/) at Sourceforge.
