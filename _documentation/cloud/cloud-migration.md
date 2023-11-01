---
title: Migration to the cloud
toc: false
description: Migrating your Kimai on-premise installation to the cloud is easy and fast 
---
 
The Kimai cloud is open for all previous self-hosting customers.
I can help to migrate your current installation to a paid cloud.
Migration is supported from the following systems:

- Kimai 1
- Kimai 2 (MySQL / MariaDB)
- Kimai 2 (SQLite)

Please note that I do not offer migration into a free account.

## Costs

Normal migrations needs approx. 1 hour, but there might be circumstances that lead to an increased migration time:

- Kimai 2 SQLite database: if you deleted data, I might need to solve issues one by one manually
- Kimai 1 installation: check that it is at latest patch level, otherwise it will be upgraded during migration
- Kimai 1 installation: make sure that all of your users have a valid email address

Migration is free, if you are bringing more than 10 users (Plus) or 5 users (Premium), otherwise it is 150€ per hour (without tax).

## What you need to provide

In case of a Kimai 1 migration, you need to provide: `country`, `currency`, `language`,
`timezone` and a migration `password` (all existing user passwords will be reset to this passphrase).

In case of a Kimai 2 SQLite migration: the SQLite file (eg. `var/data/kimai.sqlite`).

In case of a MySQL/MariaDB migration: the database as dump via `mysqldump` or created with a tool like `phpMyAdmin`.
