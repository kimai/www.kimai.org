---
title: Readonly access plugin for Kimai 2
name: Readonly access plugin
intro: "A plugin, which allows to create readonly users, that can read times recorded for a special company."
developer: derpilzcc
date: "2019-08-09 20:00:00 +0200"
icon: fas fa-book
price: "0"
download: https://github.com/fungus75/ReadOnlyAccessBundle/archive/master.zip
github: https://github.com/fungus75/ReadOnlyAccessBundle
screenshot: 
  - https://raw.githubusercontent.com/fungus75/ReadOnlyAccessBundle/master/screenshot.jpg
tags:
  - plugin
---

This bundle adds a special admin screen where the role can be assigned to an existing Kimai user.

Imagein the following:

If you are a contract worker for some different customers and if you are using Kimai for time-tracking.

Than you can do it that way: Create in Kimai the different Companies: Comp1 and Comp2
Create the different Projects you are working on: ProjC1A and ProjC1B for Comp1, ProjC2A for Comp2
And record your times.

At the end of the month, you create a bill for Comp1 and Comp2 and send it to them. Now you wait for your money.
But sometimes no money comes back, but some discussions will start: why do you charge that mouch for ProjC1A,
why was adjusting the loginscreen that expensive,
why did you do that... and that...

So, what if you can create some other user-accounts in Kimai, lets say UserComp1 and UserComp2. And now you can assign
UserComp1 to Comp1 and UserComp2 to Comp2.

With that user-accounts someone responsible at Company1 and Company2 can login into Kamai and track instantly your times. Because UserComp1 can 
see (and only see!!) the times entered for Company1 from anyone who can record some times in Kamai.

Whould that be great? 


## Installation

First clone it to your Kimai installation `plugins` directory:
```
cd /kimai/var/plugins/
git clone https://github.com/fungus75/ReadOnlyAccessBundle.git
```


You could also [download it as zip](https://github.com/fungus75/ReadOnlyAccessBundle/archive/master.zip) and upload the directory via FTP:

```
/kimai/var/plugins/
├── ReadOnlyAccessBundle
│   ├── ReadOnlyAccessBundle.php
|   └ ... more files and directories follow here ...
```


And then rebuild the cache: 
```
cd /kimai/
bin/console cache:clear
bin/console cache:warmup
```

## Permissions

This bundle ships a new administration screen, which will be available for the following users:

- `ROLE_SUPER_ADMIN` - every super administrator
- `edit_readonly_user` - every use that owns this permission 

This bundle also ships a new user-screen, which is available for users that are configured in the new admin-screen.

## Requires

Kimai 2, V1.1


