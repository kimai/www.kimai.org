---
title: "Dokumentation für Kimai"
description: "Supportinformationen, Benutzerhandbuch und andere Dokumentationen für die Kimai-Zeiterfassung"
subtitle: "Zeiterfassung neu gedacht"
lang: de
lang-ref: documentation
header: Kimai v2
icon: fas fa-book
layout: documentation
permalink: /de/dokumentation/
redirect_from:
  - /dokumentation/
---

Dies ist die offizielle Dokumentation für die Zeiterfassungsanwendung Kimai 2.

**ACHTUNG: Alle Inhalte momentan nur auf englisch verfügbar!**
  
{% for group in site.data.menu-documentation %}
<h3>{{ group.title }}</h3>
<ul>
    {% for p in group.pages %}
    {% assign doc = site.documentation | where: "slug", p | first %}
    <li><a href="{{ doc.url }}">{{ doc.title }}</a></li>
    {% endfor %}
</ul>
{% endfor %}

## How-To Artikel

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

Sie benötigen Hilfe und können nicht finden, wonach Sie suchen? 
Erstelle ein neues Ticket in unserem [Supportforum]({{ site.kimai_v2_repo }}/issues) und frage nach Hilfe.
