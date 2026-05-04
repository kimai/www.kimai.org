---
title: "Kimai 2.56.0: Ein Schritt vorwärts für Sicherheit und Performance"
date: "2026-04-13 12:00:00 +0200"
image: /images/blog/sunset-php-81.webp
author: kevinpapst
tags: [on-premise]
excerpt: "Das neueste Release von Kimai, unserer Open-Source-Zeiterfassungs-App, ist da – und es bringt eine neue PHP-Anforderung mit sich."
---

Das neueste Release von Kimai, unserer Open-Source-Zeiterfassungs-App, ist da.
**Kimai 2.56.0** bringt neue API-Funktionen, verbesserte teambasierte Berechtigungen, ein überarbeitetes Verwaltungsskript, frische Übersetzungen und – vor allem – eine angehobene PHP-Mindestversion, die deine Installation für mehr Sicherheit und bessere Performance rüstet.

Wenn du Kimai selbst hostest, erklärt dir dieser Beitrag, was neu ist, warum sich die PHP-Anforderung geändert hat und wie du das Upgrade so reibungslos wie möglich durchführst.

## Die wichtigste Änderung: PHP 8.2 ist jetzt das Minimum

Ab Version 2.56.0 **erfordert Kimai PHP 8.2 oder neuer**. Offiziell ist das Release mit PHP 8.2 bis 8.5 kompatibel.

Wir wissen, dass ein „Minimum-Version-Bump" für Self-Hoster nach Mehraufwand klingt – deshalb möchten wir von Anfang an klarstellen, warum das wirklich eine gute Nachricht ist:

- **Sicherheit**: PHP 8.1 hat das [End-of-Life](https://www.php.net/eol.php) erreicht und erhält keine Sicherheitsupdates mehr vom PHP-Projekt. Wer eine nicht mehr unterstützte PHP-Version betreibt, lässt neu entdeckte Sicherheitslücken auf seinem Server offen. Der Wechsel auf einen unterstützten Branch schließt diese Lücke.
- **Performance**: Jedes moderne PHP-Release hat spürbare Laufzeitverbesserungen gebracht. Neuere Versionen sind schneller, nutzen Arbeitsspeicher effizienter und bewältigen moderne Workloads besser – deine Kimai-Instanz sollte sich dadurch direkt flotter anfühlen.
- **Ein gesünderes Ökosystem**: Viele Bibliotheken, von denen Kimai abhängt, haben PHP 8.2 bereits als Baseline festgelegt. Indem Kimai mitzieht, können wir weiterhin Upstream-Verbesserungen und Sicherheitsfixes einpflegen, anstatt an veralteten Abhängigkeiten festzustecken.

Kurz gesagt: Diese Änderung ermöglicht es uns, ein schnelles, sicheres und gut gewartetes Produkt weiterhin zu liefern.

Du nutzt das offizielle Docker-Image `kimai/kimai2:stable`? Wir kümmern uns um alles – du bist auf der sicheren Seite.

## Unsere Empfehlung: Gleich auf PHP 8.5 aktualisieren

Ein freundlicher Tipp für Self-Hoster, die das Upgrade planen.

Die 8.2-Anforderung ist ein **Zwischenschritt**. Wir werden das Minimum in absehbarer Zeit auf PHP 8.5 anheben. Wenn du dir also ohnehin Zeit für das Upgrade nimmst, **steige direkt auf PHP 8.5 um** und spare dir eine zweite Upgrade-Runde später.

PHP 8.5 wurde im November 2025 veröffentlicht und wird bis Ende 2027 aktiv unterstützt, mit Security-Support bis 2029. Es ist der modernste und am längsten unterstützte Branch, auf den du heute wechseln kannst.

## Was sonst noch neu ist in 2.56.0

Neben dem PHP-Bump enthält dieses Release eine Reihe nützlicher Verbesserungen:

**Neue API-Endpunkte für Rechnungen.** Du kannst jetzt Rechnungen über die API herunterladen, und es gibt einen neuen Endpunkt zum Speichern von Rechnungs-Metafeldern. Wer Integrationen baut oder Abrechnungsworkflows automatisiert, hat nun mehr Möglichkeiten.

**Verbesserte teambasierte Berechtigungen.** Die Zugriffskontrollprüfungen für Teams wurden refaktoriert und sind jetzt wiederverwendbar. Außerdem berücksichtigen die `xxx_other_timesheet`-Berechtigungen nun korrekt die Team-Grenzen. Das ist eine stille, aber wichtige Verbesserung für Organisationen, in denen Benutzer mehreren Teams angehören und eine saubere Trennung gewünscht wird, wer wessen Zeiteinträge sehen und bearbeiten darf.

**Abgesicherte PDF-Generierung.** PDF-Kontextoptionen werden jetzt per Whitelist eingeschränkt – eine kleine, aber sinnvolle Defense-in-Depth-Maßnahme für alle, die Rechnungen, Exporte oder Berichte als PDF erzeugen.

**Twig-Konfigurationsverbesserungen.** Hinter den Kulissen wurde die Template-Schicht überarbeitet, was zu einer robusteren Grundlage für die täglich sichtbare Oberfläche führt.

**Verbessertes `kimai.sh`-Verwaltungsskript.** Das CLI-Skript, mit dem du deine Kimai-Installation verwaltest, wurde verfeinert. Wir bitten ausdrücklich um Feedback dazu – wenn du es nutzt, probiere es aus und berichte uns.

**Eine neue katalanische Übersetzung** sowie die übliche Runde von Übersetzungsaktualisierungen aus Hosted Weblate. Großen Dank an alle Beitragenden, die Kimai in Dutzenden von Sprachen zugänglich halten.
Und die Website ist jetzt auch [auf Katalanisch verfügbar]({% include link-language-domain.html language="ca" url="/ca/" %}).

## So bereitest du dich auf das Upgrade vor

Wenn du noch PHP 8.1 verwendest, hier ein sinnvolles Vorgehen:

1. **Sichere deine Datenbank.** Immer der erste Schritt, keine Ausnahmen.
2. **Prüfe deine aktuelle PHP-Version.** Führe `php -v` auf deinem Server aus, um den Stand zu ermitteln.
3. **Plane für PHP 8.5, nicht nur 8.2.** Die meisten Linux-Distributionen und Hosting-Control-Panels bieten mittlerweile PHP-8.5-Pakete oder -Repositories an. Direkt auf 8.5 zu gehen bedeutet ein Upgrade-Fenster statt zwei.
4. **Prüfe die erforderlichen PHP-Erweiterungen.** Die Kimai-Dokumentation listet auf, was benötigt wird – stelle sicher, dass deine neue PHP-Version alle davon aktiviert hat.
5. **Teste in einer Staging-Umgebung, wenn möglich.** Ein kurzer Testlauf auf einer Nicht-Produktionskopie fängt Überraschungen ab, bevor sie deine Live-Instanz treffen.
6. **Aktualisiere dann Kimai selbst** auf 2.56.0 nach dem Standard-Upgrade-Verfahren für deine Installationsmethode (Git, Release-Archiv oder Docker).

Wenn du auf einem Managed Host bist, bietet dein Anbieter wahrscheinlich bereits einen Ein-Klick-PHP-Versionswechsel an.

Wenn du unser Docker-Image verwendest, kannst du die Schritte 2–5 überspringen.


## Dankeschön an die Mitwirkenden

Dieses Release wurde durch die Arbeit von [@kevinpapst](https://github.com/kevinpapst), [@ntrpc-tech](https://github.com/ntrpc-tech), [@nullvector1](https://github.com/nullvector1), [@melnicek](https://github.com/melnicek) und [@fg0x0](https://github.com/fg0x0) sowie den Übersetzern, die über Weblate beitragen, geprägt. Open Source gedeiht dank Menschen wie ihnen.

## Das Release herunterladen

Die vollständigen Release Notes, das Changelog und die Upgrade-Details findest du auf GitHub:

👉 [Kimai 2.56.0 Release Notes](https://github.com/kimai/kimai/releases/tag/2.56.0)

Wenn du beim [Upgrade]({% link _documentation/updates.md%}) auf Probleme stößt, sind GitHub Discussions und der Issue Tracker die besten Anlaufstellen für Hilfe – und wenn du Feedback zum verbesserten `kimai.sh`-Skript hast, wollen wir es unbedingt hören.

Viel Spaß beim Tracken und beim Upgraden.
