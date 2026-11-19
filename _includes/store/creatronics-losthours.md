{% if page.lang == 'de' %}
**Keine Stunde mehr verschenken.**

„Verlorene Stunden“ (englisch *Lost Hours*) zeigt auf dem Kimai-Dashboard Ihre Woche als Zeitleiste. Jeder Wochentag ist eine Zeile: Arbeitsblöcke in der Farbe Ihres Kimai, Lücken dazwischen orange, lange Lücken rot. Kimais eigenes Widget „Arbeitszeit“ zeigt Summen je Tag – „Verlorene Stunden“ zeigt, **wann** gearbeitet wurde und **wo Zeiten fehlen**. So fällt eine vergessene Buchung sofort auf.

## Funktionen

- **Woche auf einen Blick** – Arbeitsblöcke, Lücken und lange Lücken je Tag
- **Lange Lücken rot** – der Schwellwert (Standard 60 Minuten) ist einstellbar
- **Überlappungen sichtbar** – parallel laufende Einträge erscheinen parallel wie im Kalender, die Überlappung ist rot markiert
- **Lücken mit einem Klick füllen** – Klick auf eine Lücke öffnet Kimais Dialog „Zeit erfassen“ mit Beginn und Ende der Lücke
- **Letzte Stunde schnell nachtragen** – heute zeigt ein grauer Balken die Zeit vom Ende der letzten Erfassung bis jetzt; ein Klick erfasst genau diesen Zeitraum (abschaltbar)
- **Details per Maus** – Beginn, Ende und Dauer, dazu Kunde, Projekt und Tätigkeit
- **Korrekt gerechnet** – Einträge über Mitternacht aufgeteilt, eine laufende Uhr zählt bis jetzt; Zeitzone und Sommerzeit des Benutzers werden beachtet
- **Wochenweise blättern** – auf Wunsch gemeinsam mit Kimais Widget „Arbeitszeit“
- **Auf Wunsch in Kundenfarben** – Buchungsbalken in der Farbe, die am Kunden in Kimai eingestellt ist (Schalter in den Einstellungen)
- **Im Design Ihres Kimai**, hell und dunkel, in acht Sprachen
- **Daten bleiben auf Ihrem Server** – das Widget liest nur die eigenen Zeiten aus Ihrem Kimai

## Voraussetzungen

- Kimai 2.70.0 oder neuer
- Recht `view_own_timesheet` für die Benutzer (Standard in Kimai)
- Internetzugang für die Lizenzprüfung: Der Kimai-Server (oder ersatzweise der Browser eines Administrators) muss einmal täglich per HTTPS `api.gumroad.com` erreichen. Im Inselbetrieb ohne Internetzugang („air-gapped“) kann die Lizenz nicht bestätigt werden.

## Lizenz

Abo je Kimai-Installation (5 € im Monat oder 49 € im Jahr, zzgl. MwSt., die Gumroad an der Kasse berechnet; Geschäftskunden können ihre USt-IdNr. angeben) mit kostenloser 7-Tage-Testphase über Gumroad – abgerechnet wird erst nach 7 Tagen, vorher jederzeit kündbar. Ohne gültige Lizenz zeigt das Widget einen Hinweis statt der Zeitleiste; Kimai selbst bleibt unberührt. Der Lizenzschlüssel wird unter System › Einstellungen eingetragen und einmal täglich bei Gumroad geprüft (übertragen werden nur Lizenzschlüssel und Produkt-ID).

Produktseite und Handbuch (PDF): [www.creatronics.de/losthours](https://www.creatronics.de/losthours/)
{% else %}
**Stop losing billable hours.**

Lost Hours shows your week as a timeline on the Kimai dashboard. Each weekday is one row: work blocks in your Kimai's color, gaps in orange, long gaps in red. Kimai's built-in "Working hours" widget shows totals per day – Lost Hours shows **when** you worked and **where time is missing**, so a forgotten entry stands out at once.

## Features

- **Your week at a glance** – work blocks, gaps and long gaps per day
- **Long gaps in red** – the threshold (default 60 minutes) is configurable
- **Overlaps made visible** – entries that run in parallel are shown in parallel like a calendar, the overlap is marked in red
- **Fill gaps with one click** – clicking a gap opens Kimai's "Create time entry" dialog with begin and end prefilled
- **Catch up on the last hour** – today, a grey bar shows the time from the end of your last entry until now; one click logs exactly that period (can be switched off)
- **Details on hover** – begin, end and duration, plus customer, project and activity
- **Calculated correctly** – entries across midnight are split, a running timer counts until now; the user's time zone and daylight saving time are respected
- **Page through weeks** – optionally together with Kimai's "Working hours" widget
- **Customer colors if you like** – entry bars in the color set on the customer in Kimai (switch in the settings)
- **Looks like your Kimai**, light and dark mode, eight languages
- **Your data stays on your server** – the widget only reads your own entries from your Kimai

## Requirements

- Kimai 2.70.0 or newer
- Users need the permission `view_own_timesheet` (Kimai default)
- Internet access for the license check: your Kimai server (or, as a fallback, an administrator's browser) must reach `api.gumroad.com` via HTTPS once a day. In air-gapped networks without internet access the license cannot be confirmed.

## License

Subscription per Kimai installation (€5 per month or €49 per year, plus VAT where applicable, calculated by Gumroad at checkout; business customers can enter their VAT ID) with a free 7-day trial via Gumroad – you are only charged after 7 days and can cancel any time before. Without a valid license the widget shows a notice instead of the timeline; Kimai itself is not affected. The license key is entered under System › Settings and checked once a day with Gumroad (only license key and product ID are transmitted).

Product page and manual (PDF): [www.creatronics.de/losthours](https://www.creatronics.de/losthours/)
{% endif %}
