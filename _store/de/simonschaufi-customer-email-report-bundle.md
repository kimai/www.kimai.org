---
title: Customer Email Report
type: plugin
lang: de
permalink: /de/store/simonschaufi-customer-email-report-bundle.html
---

## E-Mail-Bericht über Arbeitszeiten

Ein Kimai-Plugin zum Versenden eines E-Mail-Berichts an einen Kunden mit den Arbeitszeiten und Beschreibungen des Vortags.

Sind Sie ein Freiberufler? Verwenden Sie dieses Plugin, um Ihren Kunden einen täglichen Statusbericht über die geleisteten Arbeitsstunden zu senden.

Überraschen Sie Ihren Kunden mit Transparenz und Vertrauen statt mit einer unerwartet hohen Rechnung am Ende des Monats.
So hat Ihr Kunde einen guten Überblick über alle geleisteten Arbeiten.

In der Kundenverwaltung können Sie einstellen, ob Sie jedem Kunden einzeln einen Statusbericht zusenden möchten.

## Tagesbericht als responsive E-Mail

Die E-Mail passt sich nahtlos an jedes Endgerät an.
Sie können die E-Mail auf jedem Gerät perfekt lesen.
Je nach Geräteeinstellung kann Ihr Kunde die E-Mail auch im Dunkelmodus perfekt lesen.

## Was ist enthalten?

- eine neue Berechtigung manage_customer_email_report
- ein neuer Befehl zum Versenden des E-Mail-Berichts
- ein Meta-Feld für Kunden, um den E-Mail-Bericht zu aktivieren

## Systemvoraussetzungen

Sie benötigen die Möglichkeit, Cronjobs auf Ihrem Server auszuführen, entweder in Ihrer Hosting-Administrationsplattform oder manuell über `crontab -e`.
Dies ist erforderlich, um den Befehl `bin/console customer-email-report:send` auszuführen.

## Einrichtungsschritte nach der Installation

Wenn Sie den E-Mail-Bericht täglich um 1:00 Uhr nachts in deutscher Sprache versenden möchten, können Sie den folgenden Cronjob verwenden:

```
0 1 * * * /usr/bin/php8.1 /var/www/html/kimai/bin/console customer-email-report:send --locale=de >/dev/null 2>&1
```
