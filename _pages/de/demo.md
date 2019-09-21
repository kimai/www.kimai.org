---
title: Demo
description: Testen Sie unseren Zeiterfassungssystem Kimai, direkt online in einer unserer Demo Installationen.
lang: de
lang-ref: demo
permalink: /de/demo.html
redirect_from:
  - /en/demo.html
  - /demo.html
---
{% assign masterDescription = "Entdecken Sie die neuesten Funktionen, die in der Entwicklungsversion hinzugefügt wurden und die im nächsten Release enthalten sein werden." %}
{% assign stableDescription = "Präsentation der aktuellen stabilen Version. Am besten für diejenigen, die keine Entwicklungsfehler riskieren wollen. Installierte Version: "|append:site.kimai_v2_version %}
{% assign pluginsDescription = "Die neueste Entwicklungsversion mit zusätzlich installierten Erweiterungen. Sie finden diese Erweiterungen in unserem Marktplatz." %}

# Teste Kimai in einer unserer Demos

{% include alert.html icon="fas fa-desktop" alert='Probieren Sie die Kimai Zeiterfassungs-Demo aus und wir versprechen Ihnen: Ihr nächster Schritt wird der Download sein!' %}

Wählen Sie eine unserer Demo-Installationen von Kimai 2 aus, bei der Sie sich einen ersten Eindruck davon verschaffen können, wie sich diese Software anfühlt und welche Funktionen sie bietet.

<div class="row row-cards">
    <div class="col-sm-6 col-lg-4">
        {% include card-demo.html title="Entwicklungs-Version" description=masterDescription url=site.kimai_v2_demo %}
    </div>
    <div class="col-sm-6 col-lg-4">
        {% include card-demo.html title="Stabile Version" description=stableDescription url="https://demo-stable.kimai.org" %}
    </div>
    <div class="col-sm-6 col-lg-4">
        {% include card-demo.html title="Plugins" description=pluginsDescription url="https://demo-plugins.kimai.org" %}
    </div>
</div>

Beachten Sie, dass die Demos in regelmäßigen Abständen neu installiert werden und alle eingegebenen Daten entfernt werden. 
Aber um es Ihnen bequemer zu machen, werden diese mit zufälligen Daten vorbefüllt, so dass Sie direkt mit dem Testen von funktionen (wie Rechnung oder Export) beginnen können.

Wenn Sie ein Problem feststellen, würde ich Sie bitten eine Nachricht [bei GitHub]({{ site.kimai_v2_repo }}/issues) zu hinterlassen.

## Demo Benutzer

Diese Konten stehen für Ihre Tests zur Verfügung. Oder Sie erstellen einen eigenen Testbenutzer im Anmeldeformular jeder Demo:

| Benutzername | Passwort | API |
|---|:---:|:---:|
| **john_user** (Benutzer) | **kitten** | api_kitten |
| **tony_teamlead** (Teamleiter) | **kitten** | api_kitten |
| **anna_admin** (Admin) | **kitten** | api_kitten |
| **susan_super** (Super-Admin) | **kitten** | api_kitten |
| **admin** (Super-Admin) | **password** | - |
