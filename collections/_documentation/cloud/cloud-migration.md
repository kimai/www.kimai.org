---
title: Migration to the cloud
description: Migrating your Kimai on-premise installation to the cloud is straightforward and fast
---

Kimai Cloud is open to all existing self-hosting customers.
We can help you migrate your current installation to a paid cloud subscription.
Migration is supported from the following systems:

- Kimai 1
- Kimai 2 (MySQL / MariaDB)
- Kimai 2 (SQLite)

Please note that we do not offer migration into a free account.

## Costs

A standard migration takes approximately 1 hour. The following circumstances can increase migration time:

- Kimai 2 SQLite database: if data was deleted, we may need to resolve issues individually
- Kimai 1 installation: make sure it's on the latest patch level — otherwise it will be upgraded during migration
- Kimai 1 installation: make sure all users have a valid email address

Migration is free for accounts with more than 10 users. For smaller accounts, the rate is 150 € per hour (excluding tax).

## What you need to provide

For a **Kimai 1 migration**, please provide: `country`, `currency`, `language`, `timezone`, and a migration `password` (all existing user passwords will be reset to this passphrase).

For a **Kimai 2 SQLite migration**: the SQLite file (e.g. `var/data/kimai.sqlite`).

For a **MySQL/MariaDB migration**: a database dump created with `mysqldump` or a tool like phpMyAdmin.
