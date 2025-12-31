---
title: Sync your Kimai data via API to a local database
navigation: Sync to a local DB
description: Full example application, syncing all data to a local source for integrated reporting  
related:
    - rest-api
    - rest-api-examples
---
 
Tired of exporting Excel to import it into Power BI?

Use this script and let it run every night to sync the delta from last night: [https://github.com/kimai/api-sync](https://github.com/kimai/api-sync).

Then point your BI solution to the local database. 

## Requirements

- Requires PHP >= 8.1.3
- MySQL 8
- GIT
- Composer (siehe https://getcomposer.org/download/)

## Installation

- Clone the repo: `git clone git@github.com:kimai/api-sync.git kimai-api-sync`
- Create the database and then the necessary tables, structure can be found in `database.sql`
- Execute `php composer.phar install --optimize-autoloader -n`
- Edit `configuration.php` and adjust settings to your needs

## Usage

The sync script can be run with `php sync.php` and it has two optional parameters:

- `--modified="2024-01-01 12:00:00"` - only sync timesheets, which were changed after a certain date-time, format: `YYYY-MM-DD HH:mm:SS`
- `--timesheets` - only sync timesheets

If `--modified` is skipped, only the latest 24 hours will be synced

## Initial sync

For the initial sync you should choose a date far in the past, so all non-synced timesheets will be fetched:

```
php sync.php --modified="2020-12-31 00:00:00"
```

## Cronjob

Now you can easily fetch latest changes via cronjob.

If you installed the project into `/opt/kimai-api-sync/` and want to sync once a night you might want to use something like:

```
17 3 * * * /usr/bin/php /opt/kimai-api-sync/sync.php --modified="2020-12-31 00:00:00" --timesheets >> /var/log/kimai-api-sync.log 2>&1
```
