---
layout: post
title: "Removing SQLite support and FTP installation"
date: "2021-04-03 08:00:00 +0200"
author: kevinpapst
tags: [Announcement]
---

Today I have to share two important updates, before the next release will be published: 

- Kimai will stop supporting FTP installation immediately
- Kimai removes support for SQLite with the next release 1.14

I know that some of you will now be shocked, removing features is always a very unpopular decision. 
Let me say, that I am sorry about any troubles that may cause! 
But before you complain, these two facts were always clearly communicated:

- SQLite was NOT supported for production
- FTP installations never had a chance to get updates

I already updated the website weeks ago and nobody complained by now, so I hope that only very few users are affected. 
The good side: this will make time free for other features.
Not only because a lot of code could be removed, but also because I answered support requests over and over again for 
these two topics and this will now immediately stop. 

## FTP installation removed

Most users will not recognize this change. After more than 1.5 years of having a somewhat broken FTP package, 
I decided to stop creating further packages. Several issues existed for the FTP packages, which were never solved and 
had no chance to be cleared out. The most critical ones being:

- No Kimai update was possible, so security issues could never be removed
- Only SQLite as database engine was supported, which had critical bugs upon deleting items 

As you will read in the next chapter: SQLite support was dropped, which was a pre-requirement for the FTP installation. 
So the FTP package will be removed as well, but not only because of the SQLite removal, but also because it is not acceptable 
for me to publish a broken software package any longer. Or in other words: the FTP test failed.

If you are currently using an FTP installation of Kimai, you have several options for the future:

- Get a hoster that supports SSH. Shared hosting is usually not the best idea for Kimai, but many modern hosters offer SSH support.
- Use the [Kimai Cloud](https://www.kimai.cloud), which is free for up to 5 users and supports full backups in paid plans.

## Migrate from SQLite to MySQL

It was always clearly communicated that SQLite is only meant for development installations and not for production.
As many support requests showed in the past, this was either not communicated good enough or simply ignored by many users.
My only fear is, that there are still too many SQLite installations existing that need to be updated soon.

SERIOUSLY: **be aware** that you cannot upgrade to Kimai 1.14 before migrating the data from SQLite to MySQL!

For now there are three documented ways to perform that migration (see bewlo). 
If you know more, [please open a new discussion]({{ site.kimai_v2_forum }}).

### Dump with SQLite browser

The SQLite frontend [DB Browser for SQLite](https://sqlitebrowser.org) has an export module, that generates
full inserts (including column names).

- Go to `File` > `Export` > `Database to SQL file...`
- Choose `Select All`
- Select `Keep column names in INSERT INTO`
- Choose `Export data only` in dropdown
- Hit `Save`

### Manual migration

In short the steps are: create mysql database structure, export from sqlite and import into mysql:

- Use the sqlite console with its `.dump` command to export the data, more at [https://www.sqlitetutorial.net/sqlite-dump/](https://www.sqlitetutorial.net/sqlite-dump/)
- Re-Install Kimai with MySQL, so the database structure is properly setup
    - Edit `.env` and adjust `DATABASE_URL` to a MySQL URL (eg. `DATABASE_URL=mysql://user:password@127.0.0.1:3306/database`)
    - Run `bin/console kimai:install -n`
- Open the dumped SQLite file and adjust it (only leave the INSERT commands, remove everything else)
- Import the prepared file into MySQL
    - You should deactivate foreign keys during the import via `SET FOREIGN_KEY_CHECKS=0;`

If you need help with the transition, I offer [paid migration support]({% link _store/keleo-installation-support.md %}).

### Data migration via Ruby

You need to have an empty Kimai MySQL database first:
- edit `.env` and point to a MySQL database
- run the installer `bin/console kimai:install -n`
- copy & paste the script below (save as `Rakefile`) and adjust the credentials and file location
- install the required ruby gems
- run the script `rake`

```
require 'sequel'

@old = Sequel.sqlite('/tmp/kimai.sqlite')
@new = Sequel.mysql('kimai', user: 'root', socket: '/run/mysqld/mysqld.sock')
@new.run "SET FOREIGN_KEY_CHECKS=0;"

task :default => [:migrate]

desc "assuming matching schemata, copy all records from sqlite to mysql after deleting pre-existing records in target database"
task :migrate do
  @old.tables.each do |t|
    if @new.tables.include?(t)
      @new.run(@new[t].delete_sql); @old[t].all.each{|r| @new[t].insert(r)}; puts "#{t}: #{@new[t].count} records copied"
    else
      puts "no table #{t} in mysql"
    end
  end
end
```

Thanks @sixtyfive for this script, works like a charm!

#### Ubuntu

Update from @kosli who mentioned [here](https://github.com/kevinpapst/kimai2/issues/2484#issuecomment-814349874) that 
using the above script on Ubuntu requires the packages `ruby-sequel ruby-mysql2 ruby-sqlite3`.
With these packages installed the script needs to be changed from `Sequel.mysql` to `Sequel.mysql2`.

#### Mac / Homebrew

Before you start: you need Homebrew and ruby installed!

Then copy and paste the above script into your clipboard, enter a console and 

```bash
cd ~
mkdir migration
cd migration
pbpaste > Rakefile
gem install sequel
gem install mysql2 -- --with-mysql-dir=$(brew --prefix mariadb)
gem install sqlite3
```

Edit `Rakefile` and replace the second line with this:
```
@new = Sequel.mysql2('database', user: 'root', password: 'password', socket: '/tmp/mysql.sock')
``` 
adjust the credentials and the file location in line 1. Save & exit.
Run the script with `rake` and wait for a couple of seconds.

#### Paid migration

If all from above doesn't work or is simply impossible for you: I do a migration for a fixed price of 100€. 
You sent me a SQLite file (and the Kimai version you are running) and get a MySQL dump in return, 
which you can import (eg. with phpmyadmin).

For 150€ you get the full service, I only need your server credentials / hoster login and you will get back a 
working Kimai with MySQL database and migrated data from SQLite.
