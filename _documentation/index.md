---
title: Documentation for Kimai
description: Support information, user manual and other documentation for Kimai time-tracking
subtitle: "Time-tracking reloaded"
header: Kimai v2
icon: fas fa-book
permalink: /documentation/
redirect_from:
  - /documentation/manual/index.html
  - /dokumentation/
  - /en/documentation/
sitemap:
    priority: 0.7
    lastmod: 2018-02-02
    changefreq: weekly
---


This is the official documentation for the Kimai time-tracking application v2.
  
{% for group in site.data.menu-documentation %}
<h3>{{ group.title }}</h3>
<ul>
    {% for p in group.pages %}
    {% assign doc = site.documentation | where: "slug", p | first %}
    <li><a href="{{ doc.url }}">{{ doc.title }}</a></li>
    {% endfor %}
</ul>
{% endfor %}

Need help and can't find what you are looking for? 
Create a new ticket in our [support forum]({{ site.kimai_v2_repo }}/issues) and ask for help.
