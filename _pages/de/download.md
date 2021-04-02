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

{% capture docText %}
Eine vollständige Installationsanleitung finden Sie in in unserer [Dokumentation]({% link _documentation/installation.md %}) (englisch).
{% endcapture %}

{% assign docText = docText|markdownify %}
{% include alert.html type="success" icon="fas fa-book" alert=docText %}

### Server Anforderungen

Diese Anforderungen werden von nahezu allen Hosting-Anbietern erfüllt:

- PHP 7.2 oder höher
    - PHP Erweiterungen: `mbstring`, `gd`, `intl`, `pdo`, `xml`, `zip` 
- Datenbank: MariaDB oder MySQL
- [Webserver](https://www.kimai.org/documentation/webserver-configuration.html) (nginx, Apache mit mod_rewrite ...)
- Eine freie Subdomain (Verwendung im Unterordner wird nicht unterstützt)
- Ein moderner Browser (ältere Versionen, insbesondere Safari und IEm, können fehlerhaft sein)

## Installation mit SSH 

**Der empfohlene Weg um Kimai zu installieren!** 

Sie benötigen `git` und `composer` für die [Installation]({% link _documentation/installation.md %}), welche auf dem Zielsystem ausgeführt werden.
Bitte lesen Sie die [Installationsanleitung]({% link _documentation/installation.md %}) ausführlich. 
 
<a href="{% link _documentation/installation.md %}" class="btn btn-success"><i class="fas fa-book"></i> Installationsanleitung (englisch)</a>

### Weitere Downloads

<a href="{{ site.kimai_v2_repo }}/archive/{{ site.kimai_v2_version }}.zip" class="btn btn-secondary"><i class="fas fa-download"></i> Version {{ site.kimai_v2_version }} (ZIP)</a>
<a href="{{ site.kimai_v2_repo }}/zipball/master" class="btn btn-secondary"><i class="fas fa-download"></i> Entwicklungsversion (ZIP)</a>
<a href="{{ site.kimai_v2_repo }}/releases/tag/{{ site.kimai_v2_version }}" class="btn btn-secondary"><i class="fab fa-github"></i> Release info {{ site.kimai_v2_version }} </a>
<a href="{{ site.kimai_v2_repo }}/releases" class="btn btn-secondary"><i class="fab fa-github"></i> Alle Releases </a>

## Entwicklungsversion

Die Entwicklungsversion ist das neueste Paket, an dem wir derzeit arbeiten (wird auch als der `master` bezeichnet). 
Enthalten sind neue Funktionen und Fehlerbehebungen (siehe [Demo-Site]({% link _pages/demo.md %})), aber es könnte nicht so stabil sein wie eine offizielle Release-Version.
Wenn Sie ein erfahrener Benutzer von Kimai sind und über die Ressourcen verfügen, um uns beim Testen zu helfen oder einfach nur brandneue Funktionen verwenden möchten, können Sie [die neueste Entwicklungsversion installieren]({% link _documentation/installation.md %}#development-installation).

Bitte helfen Sie mit, testen Sie Kimai und [benachrichtigen Sie uns]({{ site.kimai_v2_repo }}/issues) wenn Sie irgendwelche Probleme finden.

## Shared Hosting / FTP

Dies wird nicht unterstützt! Kimai kann nicht via FTP installiert werden.
