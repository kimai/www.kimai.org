---
title: "How-To's for Kimai"
description: Articles about Kimai configurations and solutions
subtitle: "Get deeper knowledge about your time-tracking software"
---

These are official How-TOs for Kimai 2, which don't fit into the regular documentation.

{% for group in site.data.menu-howto %}
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
