---
title: "Plugins für 2.0 upgraden"
date: "2023-05-19 13:00:00 +0200"
image: /images/blog/cover-kimai2-plugins.webp
author: kevinpapst
tags: [on-premise]
---

Die Plugin-Struktur für Kimai 2.0 ist nicht mit den vorhandenen Plugins für Kimai 1 kompatibel.

Die Hauptgründe sind technischer Natur, hauptsächlich verursacht durch:

- das veränderte Frontend, das die Verwendung des alten HTML- und JS-Codes nicht erlaubt
- das aktualisierte Backend-Framework
- API-Änderungen, die das Plugin zur Aktualisierung seines Integrationsteils zwingen

Die folgenden Abschnitte beziehen sich nur auf kostenpflichtige Plugins, die von Kevin Papst, dem Maintainer von Kimai, erstellt wurden. Plugins von anderen Entwicklern können damit anders umgehen.

## Neuer Händler: Lemon Squeezy

Kimai-1-Plugins wurden ausschließlich über den Gumroad-Store verkauft.
Gumroad hat einige Entscheidungen getroffen, die mir nicht gefielen, weshalb ich nach einem möglichen Ersatz gesucht habe.
Ich fand Lemon Squeezy, der jetzt mein primärer Händler ist, aber ich biete meine Plugins auch weiterhin bei Gumroad an, weil sie PayPal unterstützen.

Einige Kunden berichteten von Problemen mit Visa-CC-Zahlungen bei Lemon Squeezy. Wenn Sie einer von ihnen sind: Bitte versuchen Sie den Kauf erneut bei Gumroad.

## Rabatte für Bestandskunden

Bestandskunden erhalten einen Rabattcode für den Kauf der aktualisierten Plugin-Version, die mit 2.0 kompatibel ist.
Je nach Zeitpunkt Ihres Kaufs erhalten Sie entweder einen 50%- oder 75%-Rabattcode.

Sie erhalten eine E-Mail mit Ihrem persönlichen Code, der spezifisch für das von Ihnen gekaufte Produkt ist.
Dieser Rabattcode läuft in einigen Monaten ab (das Datum ist auch in der E-Mail enthalten).
Wenn Sie bis Ende Mai 2023 keine E-Mail erhalten haben, [kontaktieren Sie mich](mailto:support@kimai.cloud) bitte.

## Abonnement-Modell

Die meisten Plugins werden auf ein Abonnement-Modell umgestellt.
Vor einigen Monaten habe ich [geschrieben]({% link _posts/en/2022-12-31-next-major-release-preview.md %}):

> Obwohl einige von Ihnen das vielleicht nicht mögen, hoffe ich, dass die meisten es verstehen werden: Der Plugin-Vertrieb wird (zumindest teilweise) auf ein Abonnement-Modell umgestellt.
> Es geht nicht darum, den Gewinn zu maximieren – sonst würde ich nicht so viel Code und Zeit kostenlos teilen.
> Es geht darum, ein nachhaltiges Unternehmen betreiben zu können, mich 100% auf Kimai konzentrieren zu können und
> einen Mitarbeiter einstellen zu können ...

In den folgenden Sätzen werde ich Ihnen etwas mehr über das „Warum" erklären, damit Sie meine Gründe für diese Entscheidung verstehen können.
Um es zu verstehen, müssen wir einen Schritt zurückgehen und uns die letzten Jahre ansehen – meine persönliche Geschichte der Entwicklung von Kimai:

Im Jahr 2018 begann ich mit der Arbeit an Kimai und kündigte mein Freelance-Geschäft, um Vollzeit an Kimai zu arbeiten.
Im Verlauf der nächsten drei Jahre musste ich nicht nur auf das potenzielle Einkommen einiger großer Projekte verzichten, die mir angeboten wurden,
sondern musste auch meine Familie und mich selbst unterstützen, während ich Kimai so weit aufbaute, dass es möglich war, Einnahmen zu erzielen.
Obwohl ich seit Mitte 2019 bereits einige Plugins verkauft hatte, machte ich bis Ende des dritten Jahres noch Verluste.

Menschen denken oft, dass Open-Source-Software kostenlos ist, vergessen aber, wie viel Geld in ihre Erstellung geflossen ist:
Kimai war zu diesem Zeitpunkt 300.000–500.000 € wert. Mein Geld, nicht das eines Investors.
All das war nur möglich, weil ich genug Ersparnisse hatte und weil meine Frau meinen Traum unterstützte, ein unabhängiger Open-Source-Entwickler zu sein.

Obwohl ich noch weit von dem Geld entfernt bin, das ich als Freelancer verdient habe, arbeite ich so gerne mit Kimai, dass ich nicht zurückblicke!
Aber die Zeit, die ich für Kimai aufwenden muss, wird immer mehr – Zeit, die ich wieder mit meiner Familie verbringen möchte – also brauche ich Hilfe in Form eines Mitarbeiters.
Einem Mitarbeiter, der auch bezahlt werden möchte.

Und das ist der Grund, warum ich nach fast fünf Jahren Arbeit an Kimai die meisten Plugins auf ein Abonnement-Modell umgestellt habe. Für ein nachhaltiges Geschäftsmodell, das es mir ermöglicht, kontinuierlich an Kimai zu arbeiten und es für alle zu verbessern.
Das Abonnement-Modell ist einfach und fair: Sie zahlen jährlich für das Plugin und erhalten Zugang zu jeder neuen Version.
Wenn Sie Ihr Abonnement kündigen, verlieren Sie den Zugang zu zukünftigen Updates, können aber weiterhin die neueste Version verwenden, die Sie besitzen.

## Möchten Sie stattdessen in die Cloud wechseln?

Die meisten Plugins sind in der Cloud verfügbar, der Zugang hängt vom gewählten bezahlten Plan ab.
Die Cloud ist günstiger, wenn Sie nur wenige Nutzer haben.

Wenn Sie wechseln möchten, biete ich den „Sommer der kostenlosen Migration" an:
Wenn Sie zu [einem bezahlten Plan]({{ site.cloud.url }}/pricing) wechseln, werde ich **Ihre vorhandenen Kimai-Daten kostenlos importieren**.
Alles, was ich brauche, ist die registrierte Cloud und ein Datenbank-Dump Ihrer aktuellen Kimai-Installation.
Bitte [kontaktieren Sie mich](mailto:support@kimai.cloud), um die Details zu besprechen.
