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
skip_back: true
redirect_from:
  - /dokumentation/
---

Dies ist die offizielle Dokumentation für die Zeiterfassungsanwendung Kimai 2.

{% include alert.html type="warning" alert="Alle Inhalte sind nur auf englisch verfügbar, bei Auswahl eines Themas wechseln Sie zur englischen Sprachversion!" %}

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

Sie benötigen Hilfe und können nicht finden, wonach Sie suchen? 
Erstelle ein neues Ticket im [Kimai Support-Forum]({{ site.kimai_v2_repo }}/issues) und frage nach Hilfe.
