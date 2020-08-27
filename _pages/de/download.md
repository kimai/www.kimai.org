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
Eine vollständige Installationsanleitung finden Sie in in unserer [Dokumentation]({% link _documentation/installation.md %}).
{% endcapture %}

{% assign docText = docText|markdownify %}
{% include alert.html type="success" icon="fas fa-book" alert=docText %}

### Server Anforderungen

Diese Anforderungen werden von nahezu allen Hosting-Anbietern erfüllt:

- PHP 7.2 oder höher
    - PHP Erweiterungen: `mbstring`, `gd`, `intl`, `pdo`, `xml`, `zip` 
- Datenbank (MySQL, MariaDB, SQLite)
- [Webserver](https://www.kimai.org/documentation/webserver-configuration.html) (nginx, Apache mit mod_rewrite ...)
- Ein moderner Browser (ältere Versionen, insbesondere Safari und IEm, können fehlerhaft sein)

## Installation mit SSH 

**Der empfohlene Weg um Kimai zu installieren!** 

Es werden lediglich `git` und `composer` für die [Installation]({% link _documentation/installation.md %}) benötigt, welche direkt auf dem Zielsystem ausgeführt werden.

Bitte lesen Sie in Ruhe die [Installationsanleitung]({% link _documentation/installation.md %}), es gibt in Wahrheit gar keinen Grund Kimai manuell herunterzuladen. 
Aber eine Download Seite ohne Button wäre nicht dasselbe 😜 daher:
 
<a href="{{ site.kimai_v2_repo }}/archive/{{ site.kimai_v2_version }}.zip" class="btn btn-primary"><i class="fas fa-download"></i> Version {{ site.kimai_v2_version }} (nur der Quellcode)</a>
<a href="{{ site.kimai_v2_repo }}/zipball/master" class="btn btn-secondary"><i class="fas fa-download"></i> Entwicklungsversion</a>

## Installation mit FTP

Dieser Weg wird nicht empfohlen, da Kimai in diesem Modus momentan weder Updates unterstützt noch einen Web-Installer wie andere Apps bietet.
Sie sollten zunächst die [Dokumentation]({% link _documentation/installation.md %}) gründlich lesen.

Dennoch gibt es für alle wagemutigen FTP Benutzer hier das experimentelle Installationspaket der neueste Kimai-Version:

<a href="{{ site.kimai_v2_repo }}/releases/download/{{ site.kimai_v2_version }}/kimai-release-{{ site.kimai_v2_version }}.zip" class="btn btn-primary"><i class="fas fa-download"></i> Version {{ site.kimai_v2_version }} (vor installiert für FTP)</a>

## Entwicklungsversion

Die Entwicklungsversion ist das neueste Paket, an dem wir derzeit arbeiten (wird auch als der `master` bezeichnet). 
Enthalten sind neue Funktionen und Fehlerbehebungen (siehe [Demo-Site]({% link _pages/demo.md %})), aber es könnte nicht so stabil sein wie eine offizielle Release-Version.
Wenn Sie ein erfahrener Benutzer von Kimai sind und über die Ressourcen verfügen, um uns beim Testen zu helfen oder einfach nur brandneue Funktionen verwenden möchten, können Sie [die neueste Entwicklungsversion installieren]({% link _documentation/installation.md %}#development-installation).

Bitte helfen Sie mit, testen Sie Kimai und [benachrichtigen Sie uns]({{ site.kimai_v2_repo }}/issues) wenn Sie irgendwelche Probleme finden.

### Weitere Downloads

<a href="{{ site.kimai_v2_repo }}/releases/tag/{{ site.kimai_v2_version }}" class="btn btn-secondary"><i class="fab fa-github"></i> Release info {{ site.kimai_v2_version }} </a>
<a href="{{ site.kimai_v2_repo }}/releases" class="btn btn-secondary"><i class="fab fa-github"></i> Alle Releases </a>
