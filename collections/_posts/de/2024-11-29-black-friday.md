---
title: "Black Friday für On-Premise-Nutzer"
date: "2024-11-29 06:00:00 +0200"
image: /images/blog/black-friday.webp
author: valentina
tags: [on-premise]
excerpt: "Bei Kimai glauben wir schon immer an faire und zugängliche Preisgestaltung. Daher unser Black-Friday-Angebot: Kimais Kaufkraftparität-Rabatt für Plugin-Nutzer!"
---

Bei Kimai glauben wir schon immer an faire und zugängliche Preisgestaltung.
Während einige Unternehmen Ihren Posteingang mit aggressiven Black-Friday-Angeboten fluten, verfolgen wir einen anderen Ansatz – einen, der unser Engagement für globale Gerechtigkeit bei der Software-Preisgestaltung widerspiegelt.

**Den traditionellen Black-Friday-Rahmen sprengen**

Zunächst sei klargestellt: Wir machen keine typischen Saisonangebote.
Sie finden keine auffälligen, zeitlich begrenzten Rabatte oder Gutscheincodes auf Rabatt-Websites.
Denken Sie daran: Alles, was Sie als Kimai-Gutscheine außerhalb unserer Website und offiziellen Social-Media-Profile finden, ist gefälscht.
Stattdessen führen wir ein gezieltes Black-Friday-Angebot ein, das unseren On-Premise-Nutzern hilft.

**Kaufkraftparität: Unsere Plugins weltweit zugänglich machen**

Unser Black-Friday-Angebot konzentriert sich auf das Bruttoinlandsprodukt (BIP) – ein Prinzip, das wirtschaftliche Unterschiede zwischen Ländern anerkennt.

So funktioniert es:

- Wenn Sie ein On-Premise-Kimai-Nutzer aus einem Land mit einem niedrigeren BIP pro Kopf als Österreich sind, haben Sie Anspruch auf einen Plugin-Rabatt
- Wir vergleichen die Wirtschaftsindikatoren Ihres Landes, um Ihre Rabattberechtigung zu ermitteln
- Dieser Ansatz stellt sicher, dass unsere Software erschwinglich bleibt, unabhängig von Ihrem geografischen Standort

Um ein klareres Bild zu geben, hier einige Beispielrabatte für fünf Länder[^1]:

- Ungarn: 50% Rabatt
- Polen: 40% Rabatt
- Tschechien: 30% Rabatt
- Spanien: 30% Rabatt
- Italien: 10% Rabatt

Dieser Rabatt gilt für die breite Palette an Plugins, die für unsere On-Premise-Kunden verfügbar sind:

{% assign products = site.store | where: "lang", page.lang | where_exp:"product", "product.type == 'featured'" | sort: 'order', 'last' %}
{% for product in products -%}
{% if site.data.store[product.slug].disabled == nil %}
- [{{ site.data[page.lang].store.items[product.slug].title | default: product.title }}]({{ product.url }})
{%- endif %}
{%- endfor %}

Bereit, Ihren [KKP-Rabatt]({% link _landingpage/en/discount-codes.md %}) zu erkunden? Prüfen Sie Ihre Berechtigung und fordern Sie Ihren Plugin-Gutschein per E-Mail an.

[^1]: Haftungsausschluss: Rabattberechnungen basieren auf den aktuell verfügbaren Wirtschaftsdaten. Die Berechtigung wird während des Antragsverfahrens überprüft.
