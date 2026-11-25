{% if page.lang == 'de' %}
Receivables for Kimai begleitet Ihre Rechnungen von der Erstellung in Kimai bis zum Zahlungseingang. Alle Seiten finden Sie in Kimai im Menü „Forderungen“.

## Funktionen

- **Zahlungsabgleich**: Kontoumsätze per Online-Banking (FinTS, Enable Banking) oder Dateiimport (CAMT, MT940, OFX, CSV). Eindeutige Zahlungen werden automatisch verbucht, für die übrigen gibt es Vorschläge.
- **Mahnwesen**: Zahlungserinnerung und Mahnstufen, nur auf Klick, optional mit Mahngebühr und Verzugszinsen
- **Versand**: per E-Mail, einzeln oder je Kunde automatisch, mit Protokoll, Kopie im Ordner „Gesendet“ und Ablage in Paperless-ngx
- **E-Rechnung**: Prüfung der XRechnung mit dem KoSIT-Validator vor dem Versand
- **Integrationen**: beliebige Webhooks für Ereignisse von der Rechnung bis zur Zahlung, mit frei zusammenstellbaren Schritten. Vorkonfigurierte Abläufe gibt es für die Archivierung in Paperless-ngx, für n8n und für Push-Nachrichten über ntfy.
- **Fälligkeit**: Zahlungsziel in Geschäftstagen (ohne Wochenenden und Feiertage) oder Kalendertagen
- **Überblick**: Kennzahlen, Dashboard-Widget „Überfällige Rechnungen“ und eine REST-API

## Voraussetzungen

- Kimai ab Version 2.69, selbst betrieben, PHP ab 8.2
- ein Hintergrunddienst, am besten jede Minute (Cron, systemd oder Container)
- für E-Rechnungen: das [InvoiceBundle]({% link _store/invoice-bundle.md %}) und der KoSIT-Validator als Container
- für Rechnungsvorlagen im Format DOCX, ODT oder XLSX: Gotenberg oder LibreOffice

Ohne InvoiceBundle funktionieren Versand, Fälligkeit, Zahlungsabgleich und Mahnwesen. Der volle Funktionsumfang, vor allem die E-Rechnung, steht nur mit dem InvoiceBundle zur Verfügung. Das Plugin gibt es auf Deutsch und Englisch.

## Dokumentation und Support

Installation, Einrichtung und alle Funktionen beschreibt die [Anleitung](https://ing-becker.eu/kimai-receivables/de/). Fragen beantworten wir unter [info@ing-becker.eu](mailto:info@ing-becker.eu).
{% else %}
Receivables for Kimai follows your invoices from their creation in Kimai to the incoming payment. All pages are in Kimai under the menu "Receivables".

## Features

- **Payment reconciliation**: bank transactions by online banking (FinTS, Enable Banking) or file import (CAMT, MT940, OFX, CSV). Clear payments are booked automatically, the others get suggestions.
- **Dunning**: payment reminder and dunning levels, only on click, optionally with dunning fee and default interest
- **Dispatch**: by email, one by one or automatically per customer, with a log, a copy in the "Sent" folder and filing in Paperless-ngx
- **E-invoicing**: XRechnung is checked with the KoSIT validator before sending
- **Integrations**: custom webhooks for events from the invoice to the payment, with freely combined steps. Preconfigured flows are available for archiving in Paperless-ngx, for n8n and for push messages via ntfy.
- **Due dates**: payment terms in business days (without weekends and public holidays) or calendar days
- **Overview**: key figures, dashboard widget "Overdue invoices" and a REST API

## Requirements

- Kimai 2.69 or later, self-hosted, PHP 8.2 or later
- a background service, ideally every minute (cron, systemd or container)
- for e-invoices: the [InvoiceBundle]({% link _store/invoice-bundle.md %}) and the KoSIT validator as a container
- for invoice templates in DOCX, ODT or XLSX format: Gotenberg or LibreOffice

Without the InvoiceBundle, dispatch, due dates, payment reconciliation and dunning work. The full range of functions, above all e-invoicing, is only available with the InvoiceBundle. The plugin is available in English and German.

## Documentation and support

The [user guide](https://ing-becker.eu/kimai-receivables/en/) describes the installation, the setup and all features. We answer questions at [info@ing-becker.eu](mailto:info@ing-becker.eu).
{% endif %}
