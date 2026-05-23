---
title: "Expired SSL certificate and a new monitoring setup"
date: "2026-05-11 12:00:00 +0200"
image: /images/blog/monitoring.webp
author: kevinpapst
tags: [cloud]
excerpt: "Two recent incidents on Kimai Cloud - here is what happened, how we resolved it, and how our new monitoring helps us catch problems like these earlier."
---
  
In recent weeks, we had two incidents on Kimai Cloud that we want to be transparent about.
Both were resolved within hours, but each one revealed a gap in how we were monitoring the service.

This post explains what happened, what we changed, and the new monitoring setup that now backs our infrastructure.

> We apologize for the disruption and thank you for your patience.

## Our new monitoring setup: Uptime Kuma

Both incidents (see below) pointed to limits in our previous monitoring tool.
We were using [Upptime](https://upptime.js.org/), an open-source uptime monitor built on top of GitHub Actions.

What worked well with Upptime:

- Fully automated through GitHub Actions
- No infrastructure to host or maintain

Where Upptime fell short for us:

- The minimum interval between checks is 5 minutes, a limit enforced by GitHub Actions
- GitHub can delay scheduled actions if its infrastructure is under load
- In our case, checks were sometimes delayed by several hours without us noticing

We've since moved to [Uptime Kuma](https://uptime.kuma.pet/), running on a dedicated server hosted by Hetzner in Germany.
The new public status page is available at [https://status.kimai.org/](https://status.kimai.org/).

What Uptime Kuma gives us:

- Runs on infrastructure we own and control
- Checks every minute, with no shared scheduler delays
- Native checks for SSL certificate expiration
- Native checks for domain expiration
- More flexible and reliable notifications

Not every incident can be prevented, but our goal is to notice issues within minutes rather than hours, and to remove entire classes of problems where we can.
A silently expiring certificate is one of those classes, and it should not happen again.

## Incident 1: Expired SSL certificate (May 11)

On **May 11th between 03:24 and 07:22 CEST**, users of Kimai Cloud were served an expired SSL certificate.
Browsers blocked the connection with security warnings, which made the service unreachable for affected users.

**Root cause**

Certificate renewal was handled by an automated process that had run reliably for more than six years without intervention.
This time, the renewal failed silently.
Because the renewal job itself was not under active monitoring, the failure went undetected until the certificate expired.

**Resolution**

We renewed the certificate manually and restored normal service by **07:30 CEST**.

**What we've changed**

Our new monitoring solution explicitly tracks certificate validity and expiration dates in addition to general uptime.
Certificates approaching their expiry date now trigger alerts well before they expire.

## Incident 2: Website not reachable (April 24)

On **April 24th between 13:34 and 14:39 CEST**, a growing number of Kimai Cloud users had trouble connecting to their instances.

**Root cause**

A package upgrade caused a binary conflict between the active nginx worker processes and newly spawned workers.
Because our nginx workers are configured to restart only after a while, the conflict surfaced gradually and was not immediately visible to us.

The old Github based monitoring at the time was not running its checks on the expected 5-minute schedule, so we were notified later than we should have been.

**Resolution**

A full restart of the webserver cleared the conflict and restored normal service by **14:39 CEST**.

**What we've changed**

The new monitoring solution runs its checks every minute and sends notifications immediately when a problem is detected.
A similar issue would now be visible to us within a few minutes.

