---
title: Documentation for Kimai
description: Support information, user manual and other documentation for Kimai time-tracking
subtitle: "Time-tracking reloaded"
lang: en
lang-ref: documentation
header: Kimai v2
icon: fas fa-book
layout: documentation
permalink: /documentation/
redirect_from:
  - /documentation/manual/index.html
  - /en/documentation/
---

This is the official documentation for the time-tracking application Kimai 2.
  
{% for group in site.data.menu-documentation %}
<h3>{{ group.title }}</h3>
<ul>
    {% for p in group.pages %}
    {% assign doc = site.documentation | where: "slug", p | first %}
    <li><a href="{{ doc.url }}">{{ doc.title }}</a></li>
    {% endfor %}
</ul>
{% endfor %}

## How-To articles

{% for group in site.data.menu-howto %}
<h3>{{ group.title }}</h3>
<ul>
    {% for p in group.pages %}
    {% assign doc = site.documentation | where: "slug", p | first %}
        <li><a href="{{ doc.url }}">{{ doc.title }}</a></li>
    {% endfor %}
    {% if forloop.last %}
        <li><a href="{% link _posts/2019-06-11-using-kimai-as-native-app.md %}">Using Kimai as native app</a></li>
    {% endif %}
</ul>
{% endfor %}

Need help and can't find what you are looking for? 
Create a new ticket in our [support forum]({{ site.kimai_v2_repo }}/issues) and ask for help.
