---
title: "Documentation de Kimai"
description: "Informations de support, manuel d'utilisation et autres documents pour le système d'enregistrement des temps Kimai"
subtitle: "Repenser le suivi du temps"
lang: fr
lang-ref: documentation
header: Kimai v2
icon: fas fa-book
layout: documentation
permalink: /fr/documentation/
---

Il s'agit de la documentation officielle de l'application de suivi du temps Kimai 2.

{% include alert.html type="warning" alert="Tout le contenu est disponible en anglais uniquement, si vous le sélectionnez, vous passerez à la version anglaise du site !" %}

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

Vous avez besoin d'aide et ne trouvez pas ce que vous cherchez ?
Créez un nouveau ticket à [Kimai Support-Forum]({{ site.kimai_v2_repo }}/issues) et demandez de l'aide..
