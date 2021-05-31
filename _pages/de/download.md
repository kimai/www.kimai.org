---
layout: page
title: Download
description: Download - Kimai Zeiterfassung herunterladen
options: '<a href="https://github.com/kevinpapst/kimai2/releases.atom" class="btn btn-option"><i class="fa fa-rss"></i></a>'
lang: de
lang-ref: download
permalink: /de/download.html
redirect_from:
  - /en/download.html
  - /download.html
---

# Kimai herunterladen - kostenlos!

<div class="row">
<div class="col-sm-12 col-lg-8" markdown="1">

### Server Anforderungen

Diese Anforderungen werden von nahezu allen Hosting-Anbietern erfüllt:

- PHP 7.3 oder höher
    - PHP Erweiterungen: `mbstring`, `gd`, `intl`, `pdo`, `xml`, `zip` 
- Datenbank: MariaDB oder MySQL
- [Webserver](https://www.kimai.org/documentation/webserver-configuration.html) (nginx, Apache mit mod_rewrite)
- Eine freie Subdomain (Verwendung im Unterordner wird nicht unterstützt)
- Ein moderner Browser

## Installation mit SSH 

Der empfohlene Weg um [Kimai zu installieren]({% link _documentation/installation.md %}) ist `git` und `composer` auf dem Zielsystem auszuführen.

{% capture docText %}
Eine vollständige Installationsanleitung finden Sie in unserer [Dokumentation]({% link _documentation/installation.md %}) (englisch).
{% endcapture %}

{% assign docText = docText|markdownify %}
{% include alert.html type="success" icon="fas fa-book" alert=docText %}

## Entwicklungsversion

Das neueste Paket an dem wir arbeiten wird auch als `master` bezeichnet. Enthalten sind neue Funktionen 
und Fehlerbehebungen (siehe [Demo-Site]({% link _pages/demo.md %})), könnte aber nicht so stabil sein wie ein offizielles Release.
Erfahrene Kimai-Benutzer können uns beim Testen helfen, indem Sie [die neueste Entwicklungsversion installieren]({% link _documentation/installation.md %}#development-installation) 
und uns [benachrichtigen]({{ site.kimai_v2_repo }}/issues) wenn Probleme auftreten.

### Download Links

<a href="{{ site.kimai_v2_repo }}/archive/{{ site.kimai_v2_version }}.zip" class="btn btn-secondary"><i class="fas fa-download"></i> Version {{ site.kimai_v2_version }} (ZIP)</a>
<a href="{{ site.kimai_v2_repo }}/zipball/master" class="btn btn-secondary"><i class="fas fa-download"></i> Entwicklungsversion (ZIP)</a>
<a href="{{ site.kimai_v2_repo }}/releases/tag/{{ site.kimai_v2_version }}" class="btn btn-secondary"><i class="fab fa-github"></i> Release info {{ site.kimai_v2_version }} </a>
<a href="{{ site.kimai_v2_repo }}/releases" class="btn btn-secondary"><i class="fab fa-github"></i> Alle Releases </a>

</div>
<div class="col-sm-12 col-lg-4">
    <div class="card card-md">
        <div class="card-body text-center">
            <h4>Kimai - Hosted</h4>
            <ul class="list-unstyled lh-lg">
                <li>
                    Kostenloses TLS (SSL) Zertifikat
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Hosting & Updates
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Backups
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Eigene-Felder Plugin
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Aufgaben-Verwaltung Plugin
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Ausgaben Plugin
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Audit-Trail plugin
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    <br>
                    Kostenloser Tarif für <strong>5</strong> Benutzer
                </li>
            </ul>
            <div class="text-center mt-4">
                <a href="https://www.kimai.cloud/de/preise" class="btn btn-primary w-100">Tarif auswählen</a>
            </div>
        </div>
    </div>
</div>
</div>
