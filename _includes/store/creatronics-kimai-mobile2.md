{% if page.lang == 'de' %}
kimaiMobile2 bringt eine Handy-App in Ihr eigenes Kimai. Das Plugin liefert eine schlanke Web-App (PWA) direkt von Ihrem Kimai-Server aus: auf dem Handy öffnen, mit dem Kimai-Benutzer anmelden, auf den Startbildschirm legen – fertig. Kein App-Store, kein zusätzlicher Server, kein Cloud-Konto. In Kimai finden Benutzer unter **Zeiterfassung › Mobile App** einen QR-Code zum Öffnen auf dem Handy.

## Funktionen

- **Funktioniert offline** – Zeiten ohne Verbindung erfassen, ändern und stoppen; Abgleich automatisch, sobald wieder Netz da ist
- **Wenige Klicks** – durchsuchbare Listen für Kunde, Projekt und Tätigkeit; Einzeloptionen vorausgewählt, die nächste Liste öffnet sich von selbst
- **Tagesansicht** der eigenen Zeiten der letzten 4 Wochen mit Tagessummen
- **Start/Stopp**, Schnellwahl, Dauer-Knöpfe und 5-Minuten-Raster
- **Konflikterkennung** – in Kimai inzwischen geänderte Einträge werden nie still überschrieben
- **Im Design Ihres Kimai**, hell und dunkel, in acht Sprachen
- **Abrechenbar** – Standardwert und optionale Checkbox in den Einstellungen; die Kimai-Berechtigungen gelten weiter
- **Daten bleiben auf Ihrem Server** – Zeiten gehen nur zwischen Handy und Ihrem Kimai hin und her

## Voraussetzungen

- Kimai 2.70.0 oder neuer, HTTPS
- Rechte `api_access` und `api-token_own_profile` für die Benutzer
- Benutzer mit lokalem Kimai-Passwort (LDAP- und SAML-Anmeldung werden in der App nicht unterstützt)

## Lizenz

Abo je Kimai-Installation (monatlich bis jährlich) mit kostenloser 7-Tage-Testphase über Gumroad – abgerechnet wird erst nach 7 Tagen, vorher jederzeit kündbar. Ohne gültige Lizenz ist die App nur noch lesbar; Kimai selbst bleibt unberührt. Der Lizenzschlüssel wird unter System › Einstellungen eingetragen und einmal täglich bei Gumroad geprüft (übertragen werden nur Lizenzschlüssel und Produkt-ID).

Dokumentation: https://www.creatronics.de
{% else %}
kimaiMobile2 adds a mobile app to your own Kimai. The plugin delivers a lightweight web app (PWA) directly from your Kimai server – open it on your phone, sign in with your Kimai user and add it to the home screen. No app store, no extra server, no cloud account. In Kimai, users find a QR code under **Time tracking › Mobile app** to open it on their phone.

## Features

- **Works offline** – log, edit and stop times without a connection; changes sync automatically once you are back online
- **A few taps per entry** – searchable customer, project and activity lists; single options are pre-selected and the next list opens by itself
- **Day view** of your own entries of the last 4 weeks with daily totals
- **Start/stop timer**, quick select, duration buttons and 5-minute steps
- **Conflict detection** – entries changed in Kimai meanwhile are never overwritten silently
- **Looks like your Kimai**, light and dark mode, eight languages
- **Billable** – default value and optional checkbox in the settings; Kimai permissions still apply
- **Your data stays on your server** – time entries only travel between the phone and your Kimai

## Requirements

- Kimai 2.70.0 or newer, HTTPS
- Users need the permissions `api_access` and `api-token_own_profile`
- Users with a local Kimai password (LDAP and SAML sign-in are not supported in the app)

## License

Subscription per Kimai installation (monthly to yearly) with a free 7-day trial via Gumroad – you are only charged after 7 days and can cancel any time before. Without a valid license the app switches to read-only; Kimai itself is not affected. The license key is entered under System › Settings and checked once a day with Gumroad (only license key and product ID are transmitted).

Documentation: https://www.creatronics.de
{% endif %}
