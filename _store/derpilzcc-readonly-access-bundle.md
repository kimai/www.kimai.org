---
title: Readonly access plugin for Kimai 2
name: Readonly access plugin
intro: "A plugin, which allows to create readonly users, that can read times recorded for a special company."
developer: derpilzcc
date: "2019-08-09 20:00:00 +0200"
icon: fas fa-mouse-pointer
price: "0"
download: https://github.com/fungus75/ReadOnlyAccessBundle/archive/master.zip
github: https://github.com/fungus75/ReadOnlyAccessBundle
screenshot: 
  - https://raw.githubusercontent.com/fungus75/ReadOnlyAccessBundle/master/screenshot.jpg
tags:
  - plugin
---

This bundle adds a special admin screen where the role can be assigned to an existing Kimai user.



## Installation

First clone it to your Kimai installation `plugins` directory:
```
cd /kimai/var/plugins/
git clone https://github.com/fungus75/ReadOnlyAccessBundle.git
```


You could also [download it as zip](https://github.com/fungus75/ReadOnlyAccessBundle/archive/master.zip) and upload the directory via FTP:

```
/kimai/var/plugins/
├── CustomCSSBundle
│   ├── CustomCSSBundle.php
|   └ ... more files and directories follow here ...
```



Create (or add if still exist) the file config/packages/local.yml
with this content:
```
kimai:
    permissions:
        sets:
            READONLYACCESSPLUGIN: ['edit_readonly_user', 'view_readonly_customer']
            READONLYACCESSPLUGINADMIN: ['@READONLYACCESSPLUGIN']
            READONLYACCESSPLUGINUSER:  ['@READONLYACCESSPLUGIN','!edit_readonly_user']
        maps:
            ROLE_READONLYACCESS_ADMIN: ['READONLYACCESSPLUGINADMIN']
            ROLE_READONLYACCESS_USER:  ['READONLYACCESSPLUGINUSER']
```
Make sure that you just use spaces and no tabs!


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

This bundle also ships a new user-screen, which is available for users with teh following permission:

- `view_readonly_customer`

In the new administration screen, this permission can be set to an existing user.

