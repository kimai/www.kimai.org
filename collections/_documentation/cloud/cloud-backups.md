---
title: Backups
description: Download full backups of your data — your data belongs to you
---

{% alert info %}This feature is **available for paid subscriptions**, check the feature comparison page for more details.{% endalert %}

The system creates full database backups for each paying customer.
These backups are provided as ZIP archives.

We recommend downloading your backups regularly so you always have an independent copy of your data.

## Archive duration

Backups are kept for {{ site.cloud.backup_archive_days }} days before they're removed from our servers.

Make sure to download them before that period expires.

## Why backups?

**TL;DR:** Your data belongs to you, and you should always have it in your own hands.

You might wonder why backups matter when you're already using a cloud service.
Your data is secure, replicated across multiple locations, and protected by processes designed to keep it available at all times.

But there's a bigger principle at play: we believe your data should never be held hostage.
These backups let you set up your own Kimai instance using the on-premise version at any time.
We don't believe in vendor lock-in — you're free to leave whenever you want, and you take all your data with you.

## From cloud to on-premise

To move from the cloud to an on-premise installation, import your backup into your own database.
The backup and restore process is described [here]({% link _documentation/backups.md %}).

Some features that are included in certain cloud subscriptions are available as [plugins for self-hosting]({% link _pages/en/store.html %}) (e.g. vacation tracking).
If you want to keep using these features after switching, you'll need to purchase and install the corresponding plugins.
