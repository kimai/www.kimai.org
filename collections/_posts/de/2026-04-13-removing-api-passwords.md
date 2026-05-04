---
title: "API-Passwörter werden entfernt – jetzt auf API-Token umstellen"
date: "2026-04-13 12:00:00 +0200"
image: /images/blog/sunset-api-passwords.webp
author: kevinpapst
tags: [general]
excerpt: "Kimai-Integrationen müssen von den benutzerdefinierten 'X-AUTH-*' Headern auf den Industriestandard 'Authorization: Bearer' Header umstellen – spätestens bis Juli 2026."
---

Am 07. April 2024 haben wir [API-Token eingeführt]({% link _changelogs/2024-04-07-cloud-update-104.md %}) und API-Passwörter in Kimai als veraltet markiert.

Seitdem standen beide Authentifizierungsmethoden weiterhin zur Verfügung, um Administratoren, Benutzern und Integrations-Maintainern ausreichend Zeit für die Migration zu geben.
Dieser Übergangszeitraum nähert sich nun seinem Ende.

## API-Passwörter werden nach Q2 2026 entfernt

Die Unterstützung für API-Passwörter wird nach **Q2 2026** entfernt, das heißt **spätestens im Juli 2026**.

Wenn Sie in Skripten, Tools, Plugins oder eigenen Integrationen noch API-Passwörter verwenden, sollten Sie diese jetzt aktualisieren.

Nach der Entfernung werden API-Anfragen mit der alten Authentifizierungsmethode nicht mehr funktionieren.

## Wer ist betroffen?

Diese Änderung betrifft alle, die sich noch mit den alten `X-AUTH-*` Headern mit der Kimai API verbinden, zum Beispiel in:

- eigenen Skripten
- internen Tools
- Desktop- oder mobilen Apps
- Automatisierungsplattformen
- externen Diensten
- kundenspezifischen Integrationen

Dies ist besonders relevant für Administratoren selbst gehosteter Kimai-Instanzen und technische Ansprechpartner, die Integrationen für größere Teams verwalten.

## Was hat sich geändert?

Bisher wurden Kimai API-Anfragen mit **zwei benutzerdefinierten Headern** authentifiziert:

```text
X-AUTH-USER: ihr-benutzername-oder-email
X-AUTH-TOKEN: ihr-api-passwort
```

Das API-Passwort musste im Benutzerprofil konfiguriert werden.

Diese Authentifizierungsmethode finden Sie noch in der [älteren Dokumentation]({% link _docu_versioned/2.13.0/rest-api.md %}).

Heute verwendet Kimai die standardmäßige **Bearer-Token** Authentifizierung mit einem einzigen Header:

```text
Authorization: Bearer xyz
```

Dabei ist `xyz` das für den Account generierte API-Token.

Siehe die [aktuelle Dokumentation]({% link _documentation/developer/rest-api.md %}).

## Was wird nicht mehr funktionieren?

Sobald die Unterstützung für API-Passwörter entfernt wurde, können sich Integrationen mit diesem alten Format nicht mehr authentifizieren:

```text
X-AUTH-USER: ihr-benutzername-oder-email
X-AUTH-TOKEN: ihr-api-passwort
```

Um weiterhin zu funktionieren, müssen sie auf folgendes geändert werden:

```text
Authorization: Bearer ihr-api-token
```

## Warum Sie jetzt migrieren sollten

Eine frühzeitige Migration hilft Ihnen, unterbrochene Integrationen zu vermeiden, sobald die Unterstützung für API-Passwörter entfernt wird.

API-Token sind die moderne Authentifizierungsmethode in Kimai und bieten eine übersichtlichere Einrichtung:

- ein Standardheader statt zwei benutzerdefinierter Header
- mehrere Token pro Benutzer
- optionale Ablaufdaten
- bessere Kontrolle und Übersicht

## Was Administratoren und Support-Teams jetzt tun sollten

Bitte überprüfen Sie alle Stellen, an denen Ihre Kimai API genutzt wird, und identifizieren Sie Integrationen, die noch auf API-Passwörter angewiesen sind.

Anschließend:

1. zentral verwaltete Integrationen auf `Authorization: Bearer` umstellen
2. betroffene Benutzer und Teams über die bevorstehende Entfernung informieren
3. Benutzer bitten, bei Bedarf API-Token in ihrem Profil zu erstellen
4. alle kritischen Integrationen vor dem Stichtag testen

## Was Ihre Benutzer tun müssen

Jeder Benutzer kann API-Token in seinem Kimai-Benutzerprofil generieren.

Nach dem Erstellen eines Tokens muss die verwendete Integration aktualisiert und das neue Token anstelle des alten API-Passworts eingetragen werden.

Viele Apps unterstützen API-Token bereits, während ältere Skripte und individuelle Integrationen möglicherweise angepasst werden müssen.

## Was Sie Ihren Benutzern mitteilen sollten

Wenn Sie Kimai-Benutzer in Ihrer Organisation unterstützen, ist die Botschaft einfach:

- API-Passwörter sind veraltet und werden nach Q2 2026 entfernt
- alte Integrationen, die `X-AUTH-USER` und `X-AUTH-TOKEN` verwenden, müssen aktualisiert werden
- Benutzer sollten API-Token in ihrem Profil erstellen
- Integrationen sollten `Authorization: Bearer` verwenden

## Benötigen Sie Hilfe?

Bitte prüfen Sie zuerst die [aktuelle API-Dokumentation]({% link _documentation/developer/rest-api.md %}).

Wenn Sie eine Integration für Kimai betreuen und unsicher sind, wie Sie migrieren sollen, können Sie sich gerne melden.

Vielen Dank, dass Sie Ihre Integrationen rechtzeitig aktualisieren.
