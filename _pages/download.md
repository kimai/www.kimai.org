---
layout: page
title: Download
description: Download - Kimai Zeiterfassung
lang: en
lang-ref: download
redirect_from:
  - /en/download.html
  - /download.html
---

# Download Kimai - it's FREE!

{% capture docText %}
Full installation instructions can be found in our [documentation]({% link _documentation/installation.md %}).
{% endcapture %}

{% assign docText = docText|markdownify %}
{% include alert.html type="success" icon="fas fa-book" alert=docText %}

### Server requirements 

These requirements are provided by almost all hosting companies:

- PHP 7.2.9 or higher
    - PHP extensions: `mbstring`, `gd`, `intl`, `pdo`, `xml`, `zip`, `xsl`
- Database (MySQL, MariaDB, SQLite)
- [Webserver](https://www.kimai.org/documentation/webserver-configuration.html) (nginx, Apache with mod_rewrite ...)
- A modern browser

## Installation with SSH 

**The recommended way to install Kimai!** 

You will use `git` and `composer` for the [installation]({% link _documentation/installation.md %}), which will be executed directly on the target system. 

Please read the [installation instructions]({% link _documentation/installation.md %}) carefully, there is really no reason to download Kimai manually.
But a download page without button would not be the same 😜 therefore:
 
<a href="{{ site.kimai_v2_repo }}/archive/{{ site.kimai_v2_version }}.zip" class="btn btn-primary"><i class="fas fa-download"></i> Version {{ site.kimai_v2_version }} (source code only)</a>
<a href="{{ site.kimai_v2_repo }}/zipball/master" class="btn btn-secondary"><i class="fas fa-download"></i> Development</a>

## Shared hosting / FTP

This way is not recommended, as Kimai does neither support updates in this mode nor ships a web-installer like other web-apps.
You have to read the [documentation]({% link _documentation/ftp.md %}) carefully.

Here is the experimental installation package for all the brave FTP users: 

<a href="{{ site.kimai_v2_repo }}/releases/download/{{ site.kimai_v2_version }}/kimai-release-{{ site.kimai_v2_version }}.zip" class="btn btn-primary"><i class="fas fa-download"></i> Version {{ site.kimai_v2_version }} (pre-installed for FTP)</a>

## Development version

A development version is the latest package we are currently working on, also referred to as the `master`. 
It will have new features and bugfixes included (see [demo site]({% link _pages/demo.md %})), but it might not be as stable as an official release.
If you are an experienced user of Kimai and have the resources to help us with testing or just like to play with brand new features, you should [install the latest development version]({% link _documentation/installation.md %}#development-installation).

Please help us, test it and [leave some feedback]({{ site.kimai_v2_repo }}/issues) if you find any problems.

### More downloads

<a href="{{ site.kimai_v2_repo }}/releases/tag/{{ site.kimai_v2_version }}" class="btn btn-secondary"><i class="fab fa-github"></i> Release info {{ site.kimai_v2_version }} </a>
<a href="{{ site.kimai_v2_repo }}/releases" class="btn btn-secondary"><i class="fab fa-github"></i> All releases </a>
