---
title: "Zwei-Faktor-Authentifizierung"
date: "2023-04-30 18:00:00 +0200"
image: /images/blog/cover-cloud.webp
author: kevinpapst
tags: [cloud]
---

Ab heute können Sie die Zwei-Faktor-Authentifizierung mit TOTP-Token (zeitbasierte Einmalpasswörter) aktivieren.

Die Zwei-Faktor-Authentifizierung ist eine zusätzliche Sicherheitsebene für Ihr Konto, die sicherstellen soll, dass nur Sie auf Ihr Konto zugreifen können.
Diese Funktion kann in Ihren [Konto-2FA-Einstellungen]({{ site.cloud.url }}/profile/change-2fa) aktiviert werden und wird beim nächsten Login verwendet.

Wenn Sie mit dem 2FA-Prozess nicht vertraut sind: Nach Ihrem normalen Login (über Benutzername/Passwort ODER über Google/Github) wird Ihnen ein Bildschirm angezeigt, der Sie auffordert, einen TOTP-Code einzugeben.
Dieser Code wird normalerweise von einer Anwendung generiert, die auf Ihrem Mobilgerät läuft.
Es gibt viele kostenlose Apps, z. B. Aegis für Android oder Google Authenticator für iOS.

Um 2FA für Ihr Konto zu aktivieren, müssen Sie den QR-Code mit der 2FA-App scannen, die Ihnen einen Bestätigungscode anzeigt.

Diese Funktion sollte aus Sicherheitsgründen von allen Nutzern aktiviert werden, besonders von denen, die noch keine funktionierende 2FA haben (z. B. über Google-Login).
