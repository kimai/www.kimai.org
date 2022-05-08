---
title: Commands
description: Command line tool
toc: true
---

Some functionality of Kimai can only be triggered via bash / command line.

Please run `bin/console` to see all available commands. 

## Stopping all timesheets

Since version 1.19.7 you can stop all running timesheets with the call of one command:

```bash
bin/console kimai:timesheet:stop-all
```

This will immediately stop all active records. Validations will NOT be executed, which normally takes place if entries are stopped manually! 

You can run this command via cron-at regular intervals, e.g. to stop all forgotten timesheet records at midnight (crontab example).
```
0 0 * * * /var/www/kimai2/bin/console kimai:timesheet:stop-all >> /dev/null
```

## Reset forgotten password

If you lost your (admin) password and don't have another admin account to reset it and deactivated the "forgot password" function,
you can use the following console command:

```bash
bin/console kimai:user:password
```


## Create invoices with cronjobs

Kimai comes with a new command, which allows you to create invoices from the command line.
When combined with a cronjob, you can automate your invoice creation.

Find all available options with the `--help` parameter:
```bash
bin/console kimai:invoice:create --help 
```

This command will create one invoice for every customer which had timesheets in this month.
The invoice template that will be used is fetched from the customer meta-field `inv_tpl` (can be an ID or a template name):
```bash
bin/console kimai:invoice:create --user=susan_super --timezone=Europe/Berlin --by-customer --template-meta=inv_tpl 
```

This command will create one invoice for every project which had timesheets in January 2020.
The invoice template that will be used for every invoice is `Freelancer (PDF)`:
```bash
bin/console kimai:invoice:create --user=susan_super --timezone=UTC --by-project --template="Freelancer (PDF)" --start=2020-01-02 --end=2020-01-31
```
