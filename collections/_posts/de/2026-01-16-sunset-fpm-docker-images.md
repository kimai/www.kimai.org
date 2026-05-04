---
title: "Einstellung der FPM-Docker-Images"
date: "2026-01-16 16:00:00 +0200"
image: /images/blog/sunset-fpm-images.webp
tags: [on-premise]
excerpt: "Aufgrund anhaltender Probleme mit den FPM-Docker-Images stellen wir deren Verwendung ein."
cta: cloud
---

## Was passiert?

Ab dem **nächsten Release** werden wir keine versionsspezifischen FPM-Tags mehr erstellen:

- `kimai/kimai2:fpm-x.xx.x`

Und ab dem nächsten **Major Release** werden wir die Erstellung folgender Images und Tags einstellen:

- `kimai/kimai2:fpm`
- `kimai/kimai2:latest`

## Wer ist betroffen?

Jede Installation, die das Kimai-Docker-Image mit einem der folgenden Tags verwendet:

- `kimai/kimai2:fpm`
- `kimai/kimai2:latest`
- `kimai/kimai2:fpm-x.xx.x`

Die folgenden Images wurden bereits vor längerer Zeit als veraltet markiert:

- `kimai/kimai2:fpm-prod`
- `kimai/kimai2:fpm-latest`
- `kimai/kimai2:prod`
- `kimai/kimai2:fpm-x.xx.x-prod`

## Warum machen wir das?

Es gab eine hohe Anzahl wiederkehrender Support-Anfragen zu veralteten Assets nach Updates.
Diese entstanden durch das Problem, dass das FPM-Image selbst keine statischen Assets ausliefern kann und einen Mount-Point wie `public:/opt/kimai/public` benötigte.

Dieser Mount musste nach jedem Docker-Image-Update (also nach `docker compose pull`) manuell aktualisiert werden, was den eigentlichen Sinn von Docker zunichte macht.

Wir haben dieses Image damals erstellt, als wir noch nicht genug über Docker und die Nutzung von Kimai-Images wussten.

## Lösung

Wechseln Sie zum Apache-Tag `kimai/kimai2:stable`.

Je nach Ihrer (Reverse-Proxy-)Integration kann dies Änderungen an Ihrem Setup erfordern.

Weitere Informationen finden Sie in unserer [Docker-Dokumentation]({% link _documentation/docker/docker.md %}).
