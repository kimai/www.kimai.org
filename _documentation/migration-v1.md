---
title: Upgrade to Kimai 2 from v1
description: Install Kimai 2 and import your existing timesheet data from Kimai 1
toc: true
canonical: /documentation/migration-v1.html
redirect_from:
  - /v1/upgrade-v2.html
  - /documentation/upgrade-kimai-v1.html
---

This documentation covers the necessary steps to migrate from Kimai 1 to Kimai 2.

{% capture upgrade_note %}
You can <a href="{% link _store/keleo-installation-support.md %}">get professional support</a> if you are not sure about performing the upgrade yourself.
{% endcapture %}

{% include alert.html type="success" icon="fas fa-shipping-fast" alert=upgrade_note %}

## Introduction

Before starting with the migration, please read the following FAQs:

- Data from the existing v1 installation is only read and will never be changed
- Data can only be imported from a Kimai installation with at least `v1.0.1` and database revision `1388` (check your `configuration` table)
- User-specific rates are not yet supported in Kimai 2, but
    - fixed-rates and hourly-rates for projects and activities are imported
    - fixed-rates and hourly-rates and total rate for timesheet entries are imported
- Customers in Kimai 2
    - are only used for recording, they cannot login and no user accounts will be created for them
    - have a country code, which can be set during import or edited afterwards (Kimai v1 didn't know about country)
    - have a currency code, which can be set during import or edited afterwards (Kimai v1 only knows one global currency)
- You have to supply a default password, which will be used for every imported user(!)
    - due to security issues we cannot import the original passwords
    - let your users reset it afterwards with the [Password reset]({% link _documentation/users.md %}) function
- The import will fail, if a user from v1 has either an empty email, or the same email is used for multiple users. But you can automatically fix that by using the `--fix-email` option
- Data which was deleted in Kimai v1 (user, customer, projects, activities) will be imported and set to `invisible`
    - if you don't want that, you have to delete all entries that have the value `1` in the `trash` column before importing
- Groups import
    - The import will skip groups that have no members.
    - The import will always assign a teamlead to the project. If none of the users in Kimai v1 was assigned as the teamlead, the first member of the group is assigned as teamlead during import.
    - The groups that were trashed in Kimai v1 are not imported into Kimai 2 as hidden/trashed teams are not supported.

## Install Kimai

Please read the [installation docs]({% link _documentation/installation.md %}) first and execute the installation.
You can install it on the same server, but you have to meet the server requirements (see [downloads page]({% link _pages/download.md %})).

The other option is to dump the old database and import it in the new server, the import does not need a running Kimai installation, but only the data!

After Kimai 2 runs properly, the actual *migration* takes place, by importing the data from your Kimai 1 database into Kimai 2.
You have to have SSH access to your server, as you will use a command shipped with Kimai 2, which will pull the data into the new database (configured in your `.env` file).

The database does not have to be on the same server, and the database user (for the Kimai 1 tables) needs only read access.

## Database import

{% include alert.html type="warning" alert="It is strongly recommended to test the import, as unexpected problems may occur. If you already created data (like users and customers), backup your Kimai 2 database before performing the first tests!" %}

See the help for the import command and all its options and arguments by executing:

```bash
bin/console kimai:import --help
```

A full command could look like this:
```bash
bin/console kimai:import:v1 --global --timezone="timezone" --language="language" --country="DE" --currency="EUR" --prefix="kimai1_" "mysql://user:password@127.0.0.1:3306/database?charset=utf8" "password" 
```

All arguments (eg. `country`, `currency`, `timezone` and `language`) are optional and will be set to sensitive defaults if not provided.
Most flags are used for imported customers and users, becuase they were optional or not existing in Kimai 1.

It is recommended to test the import in a fresh database. You can test your import as often as you like and fix possible problems in your installation.
A sample command could look like that:
```bash
bin/console doctrine:schema:drop --full-database --force && \
bin/console kimai:install -n && \
bin/console kimai:import:v1 --global --timezone="Europe/Zurich" --country="CH" --language="ch" --currency="CHF" "mysql://kimai:test@127.0.0.1:3306/kimai?charset=latin1" "NEW-PASSWORD-1234"
```
That will drop all tables (including ones that are not created by Kimai) in the configured database and re-create it, before importing the data from the `mysql` database at `127.0.0.1` on port `3306` authenticating the user `kimai` with the password `test` for import.
The connection will use the charset `latin1` and the default table prefix `kimai_` for reading data. Imported users can login with the password `test123` and all customer will have the country `CH` and the currency `CHF` assigned.

### Problems and solution

Kimai 1 was written a long time ago, when MySQL was lacking proper UTF8 support and foreign keys.
While [migrating dozens of customers installations]({% link _store/keleo-installation-support.md %}) I stumbled upon some recurring problems,
that can be solved with some SQL commands.

You can either fix the problems manually as described below, or you let the importer handle all these problems by using the
arguments `--fix-email=example.com`, `--fix-utf8` and `--fix-timesheet`. The argument `--skip-error-rates` is also interesting.

If you want to work on these issues manually (for best results) you find infos and tips below.

#### Broken character

{% include alert.html type="warning" alert="Be aware, depending on your Kimai 1 version the field names might be different in the following snippets" %}

Many Kimai 1 installations have broken special character (like german umlauts or other language specific non-ascii characters) in the database.

This problem does not show up in the frontend of Kimai 1, as the database connection is using a different collation as the database, which leads to an implicit encoding change.
But you can see these problems, when you query the database directly (eg. with a tool like phpMyAdmin).

You can find these broken entries (mainly timesheet descriptions) with SQL statements like these (in the Kimai 1 database):
```sql 
SELECT * FROM `kimai_timeSheet` WHERE comment like "%Ã¤%";
SELECT * FROM `kimai_timeSheet` WHERE comment like "%Ã„%";
SELECT * FROM `kimai_timeSheet` WHERE comment like "%Ã¼%";
SELECT * FROM `kimai_timeSheet` WHERE comment like "%Ãœ%";
SELECT * FROM `kimai_timeSheet` WHERE comment like "%Ã¶%";
SELECT * FROM `kimai_timeSheet` WHERE comment like "%Ã–%";
SELECT * FROM `kimai_timeSheet` WHERE comment like "%ÃŸ%";
```

Changing them is can be done with SQL queries like these:
```sql 
UPDATE `kimai_timeSheet` SET comment = REPLACE(comment, "Ã¤", "ä") WHERE comment like "%Ã¤%";
UPDATE `kimai_timeSheet` SET comment = REPLACE(comment, "Ã„", "Ä") WHERE comment like "%Ã„%";
UPDATE `kimai_timeSheet` SET comment = REPLACE(comment, "Ã¼", "ü") WHERE comment like "%Ã¼%";
UPDATE `kimai_timeSheet` SET comment = REPLACE(comment, "Ãœ", "Ü") WHERE comment like "%Ãœ%";
UPDATE `kimai_timeSheet` SET comment = REPLACE(comment, "Ã¶", "ö") WHERE comment like "%Ã¶%";
UPDATE `kimai_timeSheet` SET comment = REPLACE(comment, "Ã–", "Ö") WHERE comment like "%Ã–%";
UPDATE `kimai_timeSheet` SET comment = REPLACE(comment, "ÃŸ", "ß") WHERE comment like "%ÃŸ%";

UPDATE `kimai_timeSheet` SET description = REPLACE(description, "Ã¤", "ä") WHERE description like "%Ã¤%";
UPDATE `kimai_timeSheet` SET description = REPLACE(description, "Ã„", "Ä") WHERE description like "%Ã„%";
UPDATE `kimai_timeSheet` SET description = REPLACE(description, "Ã¼", "ü") WHERE description like "%Ã¼%";
UPDATE `kimai_timeSheet` SET description = REPLACE(description, "Ãœ", "Ü") WHERE description like "%Ãœ%";
UPDATE `kimai_timeSheet` SET description = REPLACE(description, "Ã¶", "ö") WHERE description like "%Ã¶%";
UPDATE `kimai_timeSheet` SET description = REPLACE(description, "Ã–", "Ö") WHERE description like "%Ã–%";
UPDATE `kimai_timeSheet` SET description = REPLACE(description, "ÃŸ", "ß") WHERE description like "%ÃŸ%";

UPDATE `kimai_users` SET name = REPLACE(name, "Ã¤", "ä") WHERE name like "%Ã¤%";
UPDATE `kimai_users` SET name = REPLACE(name, "Ã„", "Ä") WHERE name like "%Ã„%";
UPDATE `kimai_users` SET name = REPLACE(name, "Ã¼", "ü") WHERE name like "%Ã¼%";
UPDATE `kimai_users` SET name = REPLACE(name, "Ãœ", "Ü") WHERE name like "%Ãœ%";
UPDATE `kimai_users` SET name = REPLACE(name, "Ã¶", "ö") WHERE name like "%Ã¶%";
UPDATE `kimai_users` SET name = REPLACE(name, "Ã–", "Ö") WHERE name like "%Ã–%";
UPDATE `kimai_users` SET name = REPLACE(name, "ÃŸ", "ß") WHERE name like "%ÃŸ%";

UPDATE `kimai_activities` SET name = REPLACE(name, "Ã¤", "ä") WHERE name like "%Ã¤%";
UPDATE `kimai_activities` SET name = REPLACE(name, "Ã„", "Ä") WHERE name like "%Ã„%";
UPDATE `kimai_activities` SET name = REPLACE(name, "Ã¼", "ü") WHERE name like "%Ã¼%";
UPDATE `kimai_activities` SET name = REPLACE(name, "Ãœ", "Ü") WHERE name like "%Ãœ%";
UPDATE `kimai_activities` SET name = REPLACE(name, "Ã¶", "ö") WHERE name like "%Ã¶%";
UPDATE `kimai_activities` SET name = REPLACE(name, "Ã–", "Ö") WHERE name like "%Ã–%";
UPDATE `kimai_activities` SET name = REPLACE(name, "ÃŸ", "ß") WHERE name like "%ÃŸ%";

UPDATE `kimai_projects` SET name = REPLACE(name, "Ã¤", "ä") WHERE name like "%Ã¤%";
UPDATE `kimai_projects` SET name = REPLACE(name, "Ã„", "Ä") WHERE name like "%Ã„%";
UPDATE `kimai_projects` SET name = REPLACE(name, "Ã¼", "ü") WHERE name like "%Ã¼%";
UPDATE `kimai_projects` SET name = REPLACE(name, "Ãœ", "Ü") WHERE name like "%Ãœ%";
UPDATE `kimai_projects` SET name = REPLACE(name, "Ã¶", "ö") WHERE name like "%Ã¶%";
UPDATE `kimai_projects` SET name = REPLACE(name, "Ã–", "Ö") WHERE name like "%Ã–%";
UPDATE `kimai_projects` SET name = REPLACE(name, "ÃŸ", "ß") WHERE name like "%ÃŸ%";

UPDATE `kimai_projects` SET comment = REPLACE(comment, "Ã¤", "ä") WHERE comment like "%Ã¤%";
UPDATE `kimai_projects` SET comment = REPLACE(comment, "Ã„", "Ä") WHERE comment like "%Ã„%";
UPDATE `kimai_projects` SET comment = REPLACE(comment, "Ã¼", "ü") WHERE comment like "%Ã¼%";
UPDATE `kimai_projects` SET comment = REPLACE(comment, "Ãœ", "Ü") WHERE comment like "%Ãœ%";
UPDATE `kimai_projects` SET comment = REPLACE(comment, "Ã¶", "ö") WHERE comment like "%Ã¶%";
UPDATE `kimai_projects` SET comment = REPLACE(comment, "Ã–", "Ö") WHERE comment like "%Ã–%";
UPDATE `kimai_projects` SET comment = REPLACE(comment, "ÃŸ", "ß") WHERE comment like "%ÃŸ%";

UPDATE `kimai_customers` SET name = REPLACE(name, "Ã¤", "ä") WHERE name like "%Ã¤%";
UPDATE `kimai_customers` SET name = REPLACE(name, "Ã„", "Ä") WHERE name like "%Ã„%";
UPDATE `kimai_customers` SET name = REPLACE(name, "Ã¼", "ü") WHERE name like "%Ã¼%";
UPDATE `kimai_customers` SET name = REPLACE(name, "Ãœ", "Ü") WHERE name like "%Ãœ%";
UPDATE `kimai_customers` SET name = REPLACE(name, "Ã¶", "ö") WHERE name like "%Ã¶%";
UPDATE `kimai_customers` SET name = REPLACE(name, "Ã–", "Ö") WHERE name like "%Ã–%";
UPDATE `kimai_customers` SET name = REPLACE(name, "ÃŸ", "ß") WHERE name like "%ÃŸ%";

UPDATE `kimai_expenses` SET designation = REPLACE(designation, "Ã¤", "ä") WHERE designation like "%Ã¤%";
UPDATE `kimai_expenses` SET designation = REPLACE(designation, "Ã„", "Ä") WHERE designation like "%Ã„%";
UPDATE `kimai_expenses` SET designation = REPLACE(designation, "Ã¼", "ü") WHERE designation like "%Ã¼%";
UPDATE `kimai_expenses` SET designation = REPLACE(designation, "Ãœ", "Ü") WHERE designation like "%Ãœ%";
UPDATE `kimai_expenses` SET designation = REPLACE(designation, "Ã¶", "ö") WHERE designation like "%Ã¶%";
UPDATE `kimai_expenses` SET designation = REPLACE(designation, "Ã–", "Ö") WHERE designation like "%Ã–%";
UPDATE `kimai_expenses` SET designation = REPLACE(designation, "ÃŸ", "ß") WHERE designation like "%ÃŸ%";

UPDATE `kimai_expenses` SET comment = REPLACE(comment, "Ã¤", "ä") WHERE comment like "%Ã¤%";
UPDATE `kimai_expenses` SET comment = REPLACE(comment, "Ã„", "Ä") WHERE comment like "%Ã„%";
UPDATE `kimai_expenses` SET comment = REPLACE(comment, "Ã¼", "ü") WHERE comment like "%Ã¼%";
UPDATE `kimai_expenses` SET comment = REPLACE(comment, "Ãœ", "Ü") WHERE comment like "%Ãœ%";
UPDATE `kimai_expenses` SET comment = REPLACE(comment, "Ã¶", "ö") WHERE comment like "%Ã¶%";
UPDATE `kimai_expenses` SET comment = REPLACE(comment, "Ã–", "Ö") WHERE comment like "%Ã–%";
UPDATE `kimai_expenses` SET comment = REPLACE(comment, "ÃŸ", "ß") WHERE comment like "%ÃŸ%";
```

#### User accounts without email

Find and update all users, that have no email address:
```sql
SELECT * FROM `kimai_users` WHERE mail = '' OR mail IS NULL;
UPDATE `kimai_users` SET mail = concat(name, '@example.com') WHERE mail = '' OR mail IS NULL;
```

#### Reset password for testing

Update an account with a new `password` in your Kimai 1 database:
```sql
UPDATE `kimai_users` SET password = md5(concat('your-salt', 'new-password', 'your-salt')) WHERE userID = XYZ;
```
