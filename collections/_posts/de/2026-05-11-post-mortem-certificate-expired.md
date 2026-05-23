---
title: "Abgelaufenes SSL-Zertifikat und ein neues Monitoring-Setup"
date: "2026-05-11 12:00:00 +0200"
image: /images/blog/monitoring.webp
author: kevinpapst
tags: [cloud]
excerpt: "Zwei aktuelle Vorfälle in der Kimai Cloud - was ist passiert, wie haben wir es behoben und wie unser neues Monitoring uns dabei hilft, solche Probleme künftig früher zu erkennen."
---
  
In den letzten Wochen gab es in der Kimai Cloud zwei Vorfälle, über die wir transparent berichten möchten.
Beide wurden innerhalb weniger Stunden behoben, aber jeder einzelne hat eine Lücke in unserem Monitoring offengelegt.

Dieser Beitrag erklärt, was passiert ist, was wir geändert haben und welches neue Monitoring-Setup nun unsere Infrastruktur absichert.

> Wir entschuldigen uns für die Beeinträchtigung und danken für Ihre Geduld.

## Unser neues Monitoring-Setup: Uptime Kuma

Beide Vorfälle (siehe unten) haben die Grenzen unseres bisherigen Monitoring-Tools aufgezeigt.
Wir hatten [Upptime](https://upptime.js.org/) im Einsatz, einen Open-Source-Uptime-Monitor, der auf GitHub Actions aufbaut.

Was bei Upptime gut funktioniert hat:

- Vollständig automatisiert über GitHub Actions
- Keine eigene Infrastruktur zum Hosten oder Warten erforderlich

Wo Upptime für uns an seine Grenzen stieß:

- Das minimale Prüfintervall beträgt 5 Minuten, eine durch GitHub Actions vorgegebene Grenze
- GitHub kann geplante Actions verzögern, wenn die Infrastruktur ausgelastet ist
- In unserem Fall wurden Prüfungen teilweise um mehrere Stunden verzögert, ohne dass wir es bemerkten

Wir sind inzwischen auf [Uptime Kuma](https://uptime.kuma.pet/) umgestiegen, das auf einem dedizierten Server bei Hetzner in Deutschland läuft.
Die neue öffentliche Statusseite ist unter [https://status.kimai.org/](https://status.kimai.org/) erreichbar.

Was uns Uptime Kuma bietet:

- Läuft auf Infrastruktur, die wir selbst besitzen und kontrollieren
- Prüfungen im Minutentakt, ohne Verzögerungen durch geteilte Scheduler
- Native Prüfung auf das Ablaufen von SSL-Zertifikaten
- Native Prüfung auf das Ablaufen von Domains
- Flexiblere und zuverlässigere Benachrichtigungen

Nicht jeder Vorfall lässt sich verhindern, aber unser Ziel ist es, Probleme innerhalb von Minuten statt Stunden zu erkennen und ganze Klassen von Problemen dort zu beseitigen, wo es möglich ist.
Ein still ablaufendes Zertifikat gehört zu diesen Klassen, und das sollte nicht noch einmal passieren.

## Vorfall 1: Abgelaufenes SSL-Zertifikat (11. Mai)

Am **11. Mai zwischen 03:24 und 07:22 Uhr MESZ** wurde Nutzern der Kimai Cloud ein abgelaufenes SSL-Zertifikat ausgeliefert.
Browser blockierten die Verbindung mit Sicherheitswarnungen, wodurch der Dienst für betroffene Nutzer nicht erreichbar war.

**Ursache**

Die Zertifikatserneuerung wurde durch einen automatisierten Prozess durchgeführt, der seit mehr als sechs Jahren ohne Eingriff zuverlässig funktioniert hat.
Diesmal schlug die Erneuerung still fehl.
Da der Erneuerungsjob selbst nicht aktiv überwacht wurde, blieb der Fehler unentdeckt, bis das Zertifikat abgelaufen war.

**Behebung**

Wir haben das Zertifikat manuell erneuert und den Normalbetrieb bis **07:30 Uhr MESZ** wiederhergestellt.

**Was wir geändert haben**

Unsere neue Monitoring-Lösung überwacht zusätzlich zur allgemeinen Verfügbarkeit explizit die Gültigkeit und Ablaufdaten von Zertifikaten.
Zertifikate, die sich ihrem Ablaufdatum nähern, lösen jetzt rechtzeitig vor dem Ablauf Warnmeldungen aus.

## Vorfall 2: Website nicht erreichbar (24. April)

Am **24. April zwischen 13:34 und 14:39 Uhr MESZ** hatten zunehmend mehr Nutzer der Kimai Cloud Schwierigkeiten, eine Verbindung zu ihren Instanzen aufzubauen.

**Ursache**

Ein Paket-Upgrade verursachte einen Binärkonflikt zwischen den aktiven nginx-Worker-Prozessen und neu gestarteten Workern.
Da unsere nginx-Worker so konfiguriert sind, dass sie erst nach einer Weile neu starten, trat der Konflikt nur allmählich zutage und war für uns nicht sofort sichtbar.

Das damalige, auf GitHub basierende Monitoring führte seine Prüfungen nicht im erwarteten 5-Minuten-Takt aus, sodass wir später benachrichtigt wurden, als es eigentlich der Fall hätte sein sollen.

**Behebung**

Ein vollständiger Neustart des Webservers behob den Konflikt und stellte den Normalbetrieb bis **14:39 Uhr MESZ** wieder her.

**Was wir geändert haben**

Die neue Monitoring-Lösung führt ihre Prüfungen jede Minute durch und sendet sofort eine Benachrichtigung, wenn ein Problem erkannt wird.
Ein ähnliches Problem wäre für uns nun innerhalb weniger Minuten sichtbar.
