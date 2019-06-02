---
layout: page
title: Download
description: Download - Kimai Time-Tracking versions
redirect_from:
  - /en/download.html
  - /download.html
---

# Get your Kimai copy for unlimited users - no license fees!

{% capture docText %}
Full installation instructions can be found in our [documentation]({% link _documentation/installation.md %}).
{% endcapture %}

{% assign docText = docText|markdownify %}
{% include alert.html type="success" icon="fas fa-book" alert=docText %}

Server requirements for Kimai are: 

- PHP 7.2 or higher 
- one of the PHP extensions `PDO-SQLite` or `PDO-MySQL`
- the PHP extensions `mbstring`, `gd`, `intl`, `xml` and `zip`

If you are unsure, you can test your servers compatibility with the [Symfony requirements-checker](http://symfony.com/doc/current/reference/requirements.html).

<a href="{{ site.kimai_v2_repo }}/releases/tag/{{ site.kimai_v2_version }}" class="btn btn-secondary"><i class="fab fa-github"></i> Release info {{ site.kimai_v2_version }} </a>
<a href="{{ site.kimai_v2_repo }}/releases" class="btn btn-secondary"><i class="fab fa-github"></i> All releases </a>

## Installation with SSH 

**This is the recommended way to install Kimai.** 
You don't need to download anything manually, you will use `git` and `composer` for the installation.
Start right away by following the [installation documentation]({% link _documentation/installation.md %}).  
 
But I know that everyone likes shiny download buttons, especially if you get something for free, so here you go:

<a href="{{ site.kimai_v2_repo }}/archive/{{ site.kimai_v2_version }}.zip" class="btn btn-primary"><i class="fas fa-download"></i> Version {{ site.kimai_v2_version }} (source code only)</a>
<a href="{{ site.kimai_v2_repo }}/zipball/master" class="btn btn-secondary"><i class="fas fa-download"></i> Development</a>

## Shared hosting / FTP

This way is neither recommended nor supported. 
Kimai does not ship a web-installer like other large web-apps do.
You have to read the [documentation]({% link _documentation/installation.md %}) carefully.
That said, here is the installation package for the latest Kimai release, for file uploads with FTP or SCP: 

<a href="{{ site.kimai_v2_repo }}/releases/download/{{ site.kimai_v2_version }}/kimai-release-{{ site.kimai_v2_version }}.zip" class="btn btn-primary"><i class="fas fa-download"></i> Version {{ site.kimai_v2_version }} (pre-installed for FTP)</a>

3 simple steps: Extract it, upload everything, point your domain to the `public/` directory. 
More info in the [installation docs]({% link _documentation/installation.md %}). 

## Development version

A development version is the latest package we are currently working on AKA the `master`. 
It will have new features and bugfixes included, but it might have not be as stable as an official release.

If you are an experienced user of Kimai and have the resources to help us with testing or just like to play with brand new features,
you can [download the latest development version]({{ site.kimai_v2_repo }}/zipball/master).
It includes many of the features you see at the [demo site]({% link _pages/demo.md %}), which are not yet available in a stable release.

Please help us, test it and [give us your feedback]({{ site.kimai_v2_repo }}/issues) if you find any problems.

### Older downloads


All Kimai v2 releases can be found at our [GitHub release page]({{ site.kimai_v2_repo }}/releases).