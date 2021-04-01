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
skip_back: true
redirect_from:
  - /documentation/manual/index.html
  - /en/documentation/
  - /en/documentation/
  - /documentation/howto.html
---

This is the official documentation for the time-tracking application Kimai 2.
  
<div class="row">
{% for group in site.data.menu-documentation %}
    {% assign modulo = forloop.index0 | modulo: 2 %}
    <div class="col-md-6">
        <div class="card">
            <div class="card-status bg-blue"></div>
            <div class="card-header">
                <h3 class="card-title">{{ group.title }}</h3>
            </div>
            <div class="card-body">
                <ul>
                    {% for p in group.pages %}
                    {% assign doc = site.documentation | where: "slug", p | first %}
                    <li><a href="{{ doc.url }}">{{ doc.title }}</a></li>
                    {% endfor %}
                </ul>
            </div>
        </div>
    </div>
{% endfor %}

{% for group in site.data.menu-howto %}
<div class="col-md-6">
    <div class="card">
        <div class="card-status bg-blue"></div>
        <div class="card-header">
            <h3 class="card-title">{{ group.title }}</h3>
        </div>
        <div class="card-body">
            <ul>
                {% for p in group.pages %}
                {% assign doc = site.documentation | where: "slug", p | first %}
                    <li><a href="{{ doc.url }}">{{ doc.title }}</a></li>
                {% endfor %}
            </ul>
        </div>
    </div>
</div>
{% endfor %}
</div>

Need help and can't find what you are looking for? 
Create a new ticket in the [Kimai support forum]({{ site.kimai_v2_repo }}/issues) and ask for help.
