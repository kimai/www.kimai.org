---
title: Benutzer Reporting
type: plugin
lang: de
---
## Beschreibung
Dieses Plugin erstellt PDF-Berichte aus den Zeiterfassungsdaten von Kimai und versendet diese per E-Mail an konfigurierte Empfänger. Es unterstützt die automatische monatliche Berichterstellung über Cronjobs, die manuelle Erstellung für benutzerdefinierte Datumsbereiche sowie die rollenbasierte Verteilung an Teamleiter, Vorgesetzte und konfigurierte Empfänger. Die Berichte werden mithilfe von Twig-basierten PDF-Vorlagen erstellt und umfassen eine Web-Benutzeroberfläche unter „Berichte -> Detaillierter Benutzerbericht“ mit Filtern für Datumsbereich, Benutzer und Team.


## Installation

Um die Graphen darzustellen verwendet dieses Plugin das `JPGraph` Package von Amenadiel. Dies können Sie wie folgt installieren:

```bash
composer require amenadiel/jpgraph
```

Danach können Sie das Bundle mit folgendem Befehl installieren:

`php bin/console kimai:bundle:userreporting:install`

## Konfiguration

Dieses Plugin stellt folgende Variablen zur Konfiguration bereit:

- `user_reporting.config.send_to_teamlead`
- `user_reporting.config.send_to_supervisor`
- `user_reporting.config.send_company_report_teamleads`
- `user_reporting.config.send_company_report_supervisors`
- `user_reporting.config.all_reports_receiver`
- `user_reporting.config.additional_mails`
- `user_reporting.config.kimai_url`

## Benutzung

{% include image.html src="/images/marketplace/helsinki-systems/userreporting/search.webp" title="Suchfunktion" %}
{% include image.html src="/images/marketplace/helsinki-systems/userreporting/kunden.webp" title="Projektzeiten nach Kunden aufschlüsseln" %}
{% include image.html src="/images/marketplace/helsinki-systems/userreporting/projekte.webp" title="Arbeitszeiten nach Projekten aufschlüsseln" %}


## Support

Wenn Sie Hilfe bei der Einrichtung dieses Plugins benötigen oder Funktionswünsche haben, steht Ihnen unser kommerzieller Support unter [kunden@helsinki-systems.de](mailto:kunden@helsinki-systems.de) zur Verfügung.

