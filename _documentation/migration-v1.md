---
title: Upgrade to Kimai 2 from v1
description: Install Kimai 2 and import your existing timesheet data from Kimai 1
redirect_from:
  - /v1/upgrade-v2.html
  - /documentation/upgrade-kimai-v1.html
toc: true
---

This documentation covers all necessary steps to migrate from Kimai 1 to Kimai 2.

## Introduction

Before starting with the migration, please read the following FAQs:

- Data from the existing v1 installation is only read and will never be changed
- Data can only be imported from a Kimai installation with at least `v1.0.1` and database revision `1388` (check your `configuration` table)
- User-specific rates are not yet supported in Kimai 2, but
  - fixed-rates and hourly-rates for projects and activities are imported
  - fixed-rates and hourly-rates and total rate for timesheet entries are imported
- Customers in Kimai 2
  - are only used for recording, they cannot login and no user accounts will be created for them
  - have a country code, which can be set during import or edited afterwards (Kimai v1 doesn't know the country)
  - have a currency code, which can be set during import or edited afterwards (Kimai v1 only knows one global currency)
- You have to supply a default password, which will be used for every imported user(!)
  - due to security issues we cannot import the original passwords
  - let your users reset it afterwards with the [Password reset]({% link _documentation/users.md %}) function
- Data which was deleted in Kimai v1 (user, customer, projects, activities) will be imported and set to `invisible`
  - if you don't want that, you have to delete all entries that have the value `1` in the `trash` column before importing

## Install Kimai 2

You have to install Kimai v2, please read the [documentation]({% link _documentation/installation.md %}) first.
You can install it on the same server, but remember that you have to meet the server requirements (see [downloads page]({% link _pages/download.md %})).

After Kimai 2 runs properly, the actual *migration* takes place, by importing the data from your Kimai 1 database into Kimai 2.
You have to have SSH access to your server, as you will use a command shipped with Kimai 2, which will pull the data into the configured database from your `.env` file.

The database does not have to be on the same server and the the database user (for the Kimai 1 tables) needs only read access.
     
## Database import

{% include alert.html type="warning" alert="It is strongly recommended to test the import, as unexpected problems may occur. If you already created data (like users and customers), backup your Kimai 2 database before performing the first tests!" %} 

See the help for the import command and all its arguments by executing:

```bash
bin/console kimai:import --help
```

A full command would look like this:
```bash
bin/console kimai:import-v1 "mysql://user:password@127.0.0.1:3306/database?charset=utf8" "db_prefix" "password" "country" "currency"
```
The fields "country" and "currency" are optional and will be set to DE and EUR if not given. 

It is recommended to test the import in a fresh database. You can test your import as often as you like and fix possible problems in your installation.
A sample command could look like that:
```bash
bin/console doctrine:schema:drop --force && bin/console doctrine:schema:create && bin/console kimai:import-v1 "mysql://kimai:test@127.0.0.1:3306/kimai?charset=latin1" "kimai_" "test123" "CH" "CHF"
```
That will drop the configured Kimai v2 database schema and re-create it, before importing the data from the `mysql` database at `127.0.0.1` on port `3306` authenticating the user `kimai` with the password `test` for import.
The connection will use the charset `latin1` and the default table prefix `kimai_` for reading data. Imported users can login with the password `test123` and all customer will have the country `CH` and the currency `CHF` assigned.
