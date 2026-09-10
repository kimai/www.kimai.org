---
title: "Blauart Catering GmbH"
date: "2026-09-03 12:00:00 +0200"
permalink: /de/stories/blauart-catering
layout: story
tags: [stories]
author: nikita
excerpt: "Chips statt Zettel: Wie Potsdams größtes Catering-Unternehmen die Zeiterfassung an 35 Standorten modernisiert hat"
homepage: www.blauart.de
homepage_url: https://www.blauart.de
logo: /images/stories/blauart-logo.svg
image: /images/stories/blauart-image.webp
person: Derk-Janko Blauert
photo: /images/stories/blauart-photo.webp
quote: "Derk-Janko ist IT-Administrator bei BlauArt mit starkem Fokus auf Entwicklung und Prozessoptimierung. Er liebt knifflige Probleme, automatisiert gern wiederkehrende Aufgaben und setzt auf pragmatische, nutzerfreundliche Lösungen. Besonders wichtig sind ihm Datenhoheit und Anpassbarkeit – deshalb hostet er Systeme bevorzugt on-premise und nutzt gern Open Source."
quote2: "Wir wollen nicht abhängig sein von anderen Anbietern, wo unsere Sachen lagern. Wir wollen selbst schnell reagieren können."
position: IT-Administrator
industry: Catering
size: 70+
since: 2021
location: Wien, Österreich
version: onpremise
wins:
    - Mehrere Stunden Zeitersparnis in der Personalabteilung durch automatische Zeitaufzeichnung
    - Entlastung bei der Bearbeitung von Urlaubsanträgen dank digitaler Antragsfunktion direkt in Kimai
    - Zuverlässige Chip-basierte Erfassung an 35 Standorten dank der Kiosk-Funktion
    - Vollständige Transparenz für Mitarbeitende über die eigenen Arbeitszeiten in Echtzeit
    - Jährliche Kosteneinsparung gegenüber nutzerbasierter Lizenzierung
intro_lines: 
    - title: "Gründer*in"
      content: "Simone und Ralf Blauert"
---
 
**TL;DR**  

Ein deutsches Catering-Unternehmen stellte die gesamte Belegschaft auf digitale Zeiterfassung mit Kimai um und ermöglichte eine einfache An- und Abmeldung per persönlichem Chip an Kiosk-Bildschirmen an allen Standorten. Seitdem spart das Unternehmen jährlich mehrere Stunden Papierarbeit sowie mehrere Hundert Euro für Abo-basierte Zeiterfassung.

**Über das Unternehmen**

BlauArt ist ein familiengegründetes Catering-Unternehmen aus Potsdam, das heute vor allem Schulen und Kitas mit Essen beliefert. Mit rund 70 Mitarbeitenden produziert das Team etwa 4.000 Portionen pro Tag und legt Wert auf hohe Qualität, Bioanteil und täglich eine vegetarische Option. Digitalisierung und eigene IT-Lösungen spielen eine zentrale Rolle, um Prozesse schlank zu halten und flexibel auf die unterschiedlichen Anforderungen der Einrichtungen einzugehen.

Das Potsdamer Familienunternehmen BlauArt, gegründet 1994 von Ralf und Simone Blauert, begann als ein Tagungshaus, hat sich aber über drei Jahrzehnte zu einem der bekanntesten Catering-Unternehmen der Region entwickelt. Heute beliefert BlauArt rund 15 Schulen und 20 Kitas täglich mit frisch zubereiteten Mahlzeiten – etwa 4.000 Portionen pro Tag. Was ungewöhnlich ist für ein Catering-Unternehmen: BlauArt betreibt eine eigene IT-Abteilung mit zwei Fachkräften. Derk-Janko Blauert, Sohn von Ralf und Simone, ist seit 2020 einer von ihnen. Sein Ansatz ist klar: *"Menschen bei IT-Problemen zu helfen – egal ob man eine passende Software findet oder Skripte schreibt, um lästige Aufgaben zu automatisieren."*

<!-- PARTS -->

**Die Herausforderung: Zeiterfassung für alle – auch ohne Technikaffinität**

Die gesetzliche Pflicht zur Arbeitszeiterfassung war für BlauArt der formale Anlass, aber der eigentliche Antrieb war ein anderer: Die Personalabteilung sollte entlastet werden, und die Zeiten sollten nicht mehr geschätzt, sondern zuverlässig und nachvollziehbar sein. Die größte Herausforderung war dabei, dass die Belegschaft so vielfältig ist: Köchinnen, Fahrerinnen und Ausgabepersonal an verschiedenen Standorten. Nicht alle sind technikaffin. Eine Lösung, die eine aufwendige Schulung erfordert oder täglich Fragen aufwirft, war von vornherein keine Option. *„Mir war wichtig, dass es simpel ist“*, sagt Derk-Janko. „*Chip drüberziehen, Stunden direkt sehen – fertig.“*

Gleichzeitig war von Anfang an klar: Eine Cloud-Lösung kam nicht in Frage. BlauArt hostet konsequent selbst. *„Wir wollen nicht abhängig sein von anderen Anbietern, wo unsere Sachen lagern. Wir wollen selbst schnell reagieren können."* Die gesuchte Lösung musste also Open Source, selbst hostbar und gleichzeitig so einfach wie möglich zu bedienen sein.

**Die Entscheidung für Kimai Zeiterfassung**

Derk-Janko sichtete verschiedene Optionen und entschied sich schnell für Kimai Zeiterfassung – nicht zuletzt wegen der [Demo]({% link _pages/{{page.lang}}/demo.md %}) auf der Website. *„Mich hat auch überzeugt, dass es eine Demo gibt – man bekommt schnell ein Gefühl, ohne erst alles aufsetzen zu müssen. Bei anderen Tools muss man erst installieren, Daten einpflegen usw. Bei Kimai hatte ich sofort einen guten ersten Eindruck."* Die große Community, die aktive Weiterentwicklung und die Möglichkeit, Features vorzuschlagen, überzeugten ihn zusätzlich. Dass BlauArt ohnehin bereits auf Open-Source-Produkte wie Nextcloud und LimeSurvey setzt, passte ins Bild. *„Wenn es nicht anders geht, nimmt man Closed-Source-Software. Aber der Grundgedanke ist immer: erst mal schauen, was der Open-Source-Markt bietet."*

**Die Umsetzung: Raspberry Pi, RFID-Chips und PoE-Displays**

Die Einführung verlief in Derk-Jankos eigenen Worten *„ziemlich Hauruck"*, aber mit System. Zuerst wurde intern getestet, ob die Abläufe passen. Dann kam die entscheidende Erkenntnis: Der klassische Browser-Zugang oder eine App war für viele Mitarbeitende keine praktische Lösung. Was gebraucht wurde, war ein physisches Terminal zum Ein- und Ausloggen.

Die Antwort fand sich im [Kiosk-Plugin]({% link _store/{{page.lang}}/kiosk-barcode-bundle.md %}) von Kimai Zeiterfassung. Derk-Janko baute einen ersten Prototypen aus einem Raspberry Pi, einem Bildschirm und einem RFID-Reader – und testete ihn zwei Monate lang im Büro. Für den Rollout an den Kita- und Schulstandorten wechselte er auf professionellere Hardware: Power-over-Ethernet-betriebene Displays mit integriertem RFID-Reader, die sich über das Netzwerk versorgen und ansprechen lassen.

Der Rollout selbst war gut vorbereitet. Da alle Schulstandorte denselben WLAN-Namen verwenden, konnten die Geräte vorab im Büro konfiguriert werden. *„Wir haben viel im Büro vorbereitet. In jeder Schule hintragen, Browser öffnen, Kimai starten, Kiosk öffnen – und der Reader liest die Chips sofort."* An jedem Eingang steht heute ein Terminal. Mitarbeitende loggen sich morgens mit ihrem Chip ein und abends aus. An einem anderen Standort auszuloggen ist genauso möglich – praktisch für Fahrerinnen und Fahrer, die ihre Schicht nicht dort beenden, wo sie begonnen hatten.

**Die Ergebnisse: Weniger Aufwand, mehr Verlässlichkeit**

Die Veränderung mit Kimai Zeiterfassung war spürbar. Wo früher am Monatsende geschätzt wurde, gibt es jetzt zuverlässige, lückenlose Aufzeichnungen. Die Personalabteilung wird entlastet – ein erheblicher Teil der Urlaubsanträge läuft inzwischen direkt über Kimai, ohne Zettel und ohne Rückfragen. *„Wenn 50 Prozent es online beantragen, entlastet das schon stark.*"

Zeitbetrug ist deutlich schwieriger geworden. *„Wenn jemand zehn Minuten länger eintragen will, muss die Person wirklich zehn Minuten länger bleiben."* Mitarbeitende können ihre eigenen Zeiten einsehen, aber nicht bearbeiten.

Aus den [Abwesenheitsdaten]({% link _store/{{page.lang}}/controlling.md %}) in Kimai Zeiterfassung hat er zusätzlich ein eigenes Dashboard gebaut: Eine Übersicht, die auf einen Blick zeigt, wer krank ist, wer Urlaub hat und wer im Freizeitausgleich ist – aufgeschlüsselt nach Teams, mit Statistiken pro Woche und Ferienkalender integriert. Gerade in den Sommerferien, wenn das Kerngeschäft mit den Schulen ruht, ist diese Übersicht besonders wertvoll: Man sieht sofort, wie sich der Urlaubsplan über die gesamte Belegschaft verteilt.

<!-- PARTS -->

**Kostensenkung mit Kimai Zeiterfassung: Rund 700 Euro im Jahr für 70 Mitarbeitende**

Die Kostenbilanz fällt deutlich aus. BlauArt zahlt aktuell rund 700 Euro im Jahr – für Kimai selbst und die benötigten Plugins. Bei 70 bis 80 Mitarbeitenden wären kommerzielle Anbieter mit nutzerbasierter Lizenzierung laut Derk-Janko deutlich teurer. *„Für viele kleine bis mittelständische Unternehmen, die nicht die Ressourcen für teure Software haben, sind Open-Source-Produkte das Go-to."* Hinzu kommen Anschaffungskosten für Hardware – aber die bringt Datenhoheit und volle Kontrolle mit sich. *„Wir sparen eine Menge Geld, weil wir vieles selbst hosten. Am Ende zahlt man eigentlich nur noch Strom – und keine teuren Subscriptions."*

**Die Zusammenarbeit: Wenn jemand wirklich zuhört**

Was Derk-Janko an Kimai Zeiterfassung besonders schätzt, ist die Zusammenarbeit mit dem Entwickler Kevin. *„Man hat wirklich das Gefühl, da hört jemand zu und nimmt Wünsche ernst."* Mehrere Feature-Vorschläge hat er eingebracht – einige wurden umgesetzt, andere passten nicht ins Konzept. Beides war in Ordnung. *„Manches muss er auch einfach sagen: passt nicht ins Konzept von Kimai – was völlig in Ordnung ist."* Die Möglichkeit, über die API, JavaScript oder CSS eigene Erweiterungen einzubauen, macht die Kimai-Software für BlauArt besonders wertvoll. Kein Unternehmen ist gleich – und keine Schule auch.

**Ein Rat an andere Unternehmen**

Self-Hosting ist nicht für jeden das Richtige, betont Derk-Janko. *„Ich würde das nur machen: entweder mit einem hauseigenen ITler oder mit einer Firma im Rücken, die einen betreut."* Wer die Ressourcen hat, profitiert enorm von Datenhoheit, Flexibilität und Kostenersparnis. Für kleinere Unternehmen und die, die gerne delegieren, gibt es eine wartungsfreie, DSGVO-konforme Version von [Kimai Cloud]({% link _pages/{{page.lang}}/pricing.md %}). *"Aber ab 100–200 Leuten würde ich trotzdem sagen: Es ist kostengünstiger, selbst zu hosten."*

Für BlauArt jedenfalls war die Entscheidung für Kimai Zeiterfassung und Self-Hosting die richtige. Was mit einem Raspberry Pi und einem RFID-Reader begann, ist heute das Rückgrat der Zeiterfassung für ein ganzes Unternehmen – zuverlässig, günstig und nah an den Menschen, die es täglich nutzen.

Vielen Dank für Ihre Zeit, Derk-Janko Blauert , und alles Gute für die Zukunft von BlauArt!
