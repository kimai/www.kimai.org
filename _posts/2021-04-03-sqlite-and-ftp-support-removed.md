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

I already updated the website weeks ago and nobody complained by now, so I hope that only a very few users are affected. 
The good side: this will make time free for other features.
Not only because a lot of code could be removed, but also because I answered support requests over and over again for 
these two topics and this will now immediately stop. 

## FTP installation removed

Most users will not recognize this change. After more than 1,5 years of having an FTP installation package, I decided to 
not create further packages, the last available one is for 1.13.
Several issues existed for the FTP package, which were never solved and had no chance to be cleared out, the most important ones being:

- No Kimai update possible
- Only SQLite as database engine supported

As you will read in the next chapter: SQLite support is dropped, which was a pre-requirement for the FTP installation. 
So the FTP package will be removed as well, but not only because of the SQLite removal, but also because it is not acceptable 
for me to publish a software package that is broken-by-design.

If you are currently using an FTP installation of Kimai, you have several options for the future:

- Get a hoster that supports SSH (shared hosting contracts are never a good idea for Kimai, but at least in the EU most large hosters have SSH support)
- Use the [Kimai Cloud](https://www.kimai.cloud) (free for up to 5 users and with full backups in paid plans)

## Migrate from SQLite to MySQL

It was always clearly communicated that SQLite is only meant for development installations and not for production.
As many support requests showed over the past 18 month, this simple trutrh was ignored by many users and I fear that there 
are still some SQLite installations existing that need to be updated soon.

SERIOUSLY: **be aware** that you cannot upgrade to Kimai 1.14 before migrating the data from SQLite to MySQL!

For now there are two documented ways to perform that migration (see bewlo). 
If you know more, [please open a new discussion]({{ site.kimai_v2_forum }}).

### Manual migration

Export from sqlite, import into mysql:

- Use the sqlite console with its `.dump` command to export the data, more at [https://www.sqlitetutorial.net/sqlite-dump/](https://www.sqlitetutorial.net/sqlite-dump/)
- Re-Install Kimai with MySQL, so the database structure is properly setup
    - Edit `.env` and adjust `DATABASE_URL` to a MySQL URL (eg. `DATABASE_URL=mysql://user:password@127.0.0.1:3306/database`)
    - Run `bin/console kimai:install -n`
- Open the dumped SQLite file and adjust it (only leave the INSERT commands, remove everything else)
- Import the prepared file into MySQL
    - You should deactivate foreign keys during the import via `SET FOREIGN_KEY_CHECKS=0;`

### Data migration via Ruby

The following script was submitted by @sixtyfive (save as `Rakefile.txt`):

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


