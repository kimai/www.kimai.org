---
title: "Kimai 2.0 – Es ist da!"
date: "2023-05-20 10:00:00 +0200"
image: /images/blog/cover-9.webp
author: kevinpapst
tags: [on-premise]
---

🎉 Ja, Sie alle haben fast zu lange auf diesen Moment gewartet 🎉

Die neue Version von Kimai, die im Januar als Beta angekündigt und veröffentlicht wurde, hat seitdem 22 Minor-Releases erhalten.
Und jetzt ist es endlich Zeit, es offiziell zu machen: Kimai 2.0 ist für jeden verfügbar.

**Lassen Sie uns 5 Gründe erkunden, warum Sie upgraden sollten.**

## 1) Soooo viele neue Funktionen ⭐️

Dieses Release ist das Ergebnis von fast 1,5 Jahren Arbeit und hat Hunderte von sichtbaren und unsichtbaren Änderungen erhalten.
Hunderte von Stunden flossen in die Verbesserung von Kimai selbst, der Website und Dokumentation.
Lesen Sie die [detaillierte Liste in diesem Beitrag]({% link _posts/en/2022-12-31-next-major-release-preview.md %}), hier sind einige:

- Neues und verbessertes UI-Design (z. B. Buttons mit Beschriftungen, integrierte Suche, Dark Mode, Rechts-nach-Links-Unterstützung)
- Zwei-Faktor-Authentifizierung 2FA mit TOTP-Token (z. B. Google Authenticator App)
- Brute-Force-Schutz für den Login
- Konfigurierbare Dashboard-Widgets pro Nutzer
- Spaltenvisibilität serverseitig mit klebenden „Spaltenprofilen" pro Gerät speichern
- Neuer „Reporting"-Startbildschirm mit viel einfacherem Zugang zu allen verfügbaren Berichtstypen
- Ein „Willkommens-Assistent" für Erstnutzer
- Kontextmenüs auf allen Listen und dem Kalender (viel schneller als das Aktionsmenü)
- Neues „Systemnutzer"-Feld für Nutzer (Nutzer in Berichten und Dropdowns ausblenden, z. B. für Admins oder reine API-Accounts)
- Neue „Sätze neu berechnen"-Logik (verhindert falsche Sätze nach dem Kopieren von Stundenzettel oder Ändern von Projekt, Aktivität und Nutzer)
- Neues benutzerdefiniertes Feld für automatisches Tagging von Stundenzetteln
- Automatische Nummerierung für neue Kunden mit konfigurierbarem Kundennummernformat
- Stundenzettel-Benutzerdefinierte-Felder über URL vorausfüllen
- Datums- und Geldformate sind jetzt an das gewählte Gebietsschema gebunden
- Bearbeitungsdialoge mit Tastaturkürzel bestätigen

## 2) Version 1 ist außer Wartung 🐛

Mit dieser Nachricht wird die 1.x-Serie offiziell eingestellt und erhält keine weiteren Updates mehr.

Das letzte Release für die 1.x-Serie wurde am 17. Februar mit der Nummer 1.30.8 veröffentlicht.

## 3) Verbesserte Sicherheit 🔒

Diese überaus wichtigen Sicherheitsfunktionen wurden zu Kimai hinzugefügt:

- Zwei-Faktor-Authentifizierung mit TOTP-Token
- Zwei-Faktor für SAML- und LDAP-Nutzer
- Brute-Force-Schutz für den Login-Bildschirm

## 4) PHP 8.1 ist schneller 🚀

Es ist eine einfache technische Tatsache: PHP 8.1 übertrifft 7.4.

In Kombination mit der neuen Frontend-Architektur sollte dies Kimai schneller machen.
Falls nicht: Wechseln Sie Ihren Hoster und/oder lesen Sie Grund 5.

Was in Kimai passiert ist:

- Symfony wurde von 4.4 auf 6.2 aktualisiert
- Caching wird jetzt für viele Dateneinträge verwendet, die normalerweise nur gelesen und nicht geändert werden
- Die Anzahl der notwendigen Datenbankabfragen pro Seite wurde reduziert
- Das Frontend wurde von AdminLTE (mit Bootstrap 4) zu Tabler.io (mit Bootstrap 5.3) migriert
- jQuery wurde entfernt
- moment.js wurde durch Luxon ersetzt
- Die Gesamtgröße von CSS und Javascript wurde um etwa 50% reduziert

## 5) PHP 7.4 ist EOL ☠️

PHP 7.4, die unterstützte Version von Kimai 1.30 und die Version, die viele von Ihnen verwenden, hat das End-of-Life erreicht.
Das bedeutet, dass es seit Dezember 2021 keine Updates mehr erhält und [seit Dezember 2022 nicht einmal mehr Sicherheitsfixes](https://www.php.net/supported-versions.php) bekommt.

Betreiben Sie Ihr Unternehmen nicht auf einem veralteten Software-Stack, besonders wenn es öffentlich zugängliche Server-Software ist.

## In die Cloud wechseln ist kostenlos 👍

Kimai ist eine Server-Software, die beim Hosting und der Wartung etwas technisches Wissen erfordert.
Und nicht jeder ist mit der Linux-Bash vertraut.

Wenn Sie die neuesten und besten Funktionen nutzen möchten, können Sie [die Kimai-Cloud]({{ site.cloud.url }}) verwenden und immer auf dem neuesten Stand sein.
Wenn Sie viele Mitarbeiter haben oder eine strenge Governance benötigen, könnte die On-Premise-Version von Kimai die beste Lösung sein.
Aber wenn Sie ein Solo-Unternehmer oder ein kleines Unternehmen sind, ist es günstiger und eine große Zeitersparnis, die Cloud-Version von Kimai zu nutzen.

Um den Wechsel in die Cloud einfacher zu machen und Ihnen das Aufwand des Aktualisierens zu ersparen, kündige ich den „Sommer der kostenlosen Migration" an:
Wenn Sie zu [einem bezahlten Plan]({{ site.cloud.url }}/pricing) wechseln, werde ich **Ihre vorhandenen Kimai-Daten kostenlos importieren**.
Alles, was ich brauche, ist die registrierte Cloud und ein Datenbank-Dump Ihrer aktuellen Kimai-Installation.
Bitte [kontaktieren Sie mich](mailto:{{ site.cloud.support_email }}), um die Details zu besprechen.

## Plugins upgraden

Alte Plugins sind nicht mehr kompatibel.
Bitte [lesen Sie diesen Beitrag]({% link _posts/en/2023-05-19-plugin-upgrades-v2.md %}), wenn Sie Kimai-1-Plugins verwenden.

Cloud-Nutzer müssen sich darüber keine Gedanken machen.
