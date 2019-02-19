---
title: Kimai 1 is tracking your times since 2007
description: Kimai v1 resources - upgrade infos, documentation and links
subtitle: "Oldie but goldie!"
header: Kimai v1
permalink: /v1/
sitemap:
    priority: 0.7
    lastmod: 2018-02-10
    changefreq: weekly
---
<a href="{{ site.kimai_v1_repo }}/releases/download/1.3.1/kimai_1.3.1.zip" class="btn btn-primary"><i class="fas fa-download"></i> Download 1.3.1</a>
<a href="{{ site.kimai_v1_repo }}" class="btn btn-primary"><i class="fab fa-github"></i> GitHub</a>
<a href="demo.html" class="btn btn-primary"><i class="fas fa-desktop"></i> Demo</a>
<a href="https://github.com/kimai/manuals/" class="btn btn-primary"><i class="fas fa-book"></i> PDF manuals</a>
<a href="{% link _v1/apps.md %}" class="btn btn-primary"><i class="fas fa-cubes"></i> Applications</a>

## Server requirements

Kimai 1 requires at least: 

- MySQL 4.3 or higher
- PHP 5.5 or higher
- Required PHP extensions: `mysqli`, `iconv` and `xml`

## Installation

1. Use a **modern** Browser
2. You need at least PHP 5.5 and access to a MySQL database.
3. Start your browser and go to your Kimai directory.
4. Kimai has a step-by-step installer, just follow the instructions.

**IMPORTANT**: Remove the `installer` directory when you’ve successfully installed Kimai.

Please read the complete [installation docu]({% link _v1/installation.md %}) for more details.

### Update

Please see the [Update documentation]({% link _v1/updates.md %}) for more information on how to update to a newer version of Kimai.

## Donations

Kimai 1 is not maintained any longer by @kevinpapst. But Simon is still trying to keep it alive:

{% include card-donate.html user="simonschaufi" %}

{% comment %}
## Documentation chapters

{% for group in site.data.menu-v1 %}
<h3>{{ group.title }}</h3>
<ul>
    {% for p in group.pages %}
    {% assign doc = site.v1 | where: "slug", p | first %}
    <li><a href="{{ doc.url }}">{{ doc.title }}</a></li>
    {% endfor %}
</ul>
{% endfor %}
{% endcomment %}

## More downloads

- Kimai v2 releases can be found at our [GitHub release page]({{ site.kimai_v2_repo }}/releases)
- And historical versions for v1 on the [archived download page](https://sourceforge.net/projects/kimai/files/){:rel="nofollow"}
