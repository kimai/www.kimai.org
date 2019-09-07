---
title: Empty description checker plugin for Kimai 2
name: Empty description checker plugin
intro: "A plugin for Kimai 2 which shows you all entries without a description + email notification for users to ask them to add a description."
developer: hmr-it
date: "2019-09-07 22:00:00 +0200"
icon: fas fa-check-square
price: "0"
download: https://github.com/hmr-it/EmptyDescriptionCheckerBundle/archive/master.zip
github: https://github.com/hmr-it/EmptyDescriptionCheckerBundle
screenshot: 
  - https://raw.githubusercontent.com/hmr-it/EmptyDescriptionCheckerBundle/master/_screenshots/email.jpg
  - https://raw.githubusercontent.com/hmr-it/EmptyDescriptionCheckerBundle/master/_screenshots/kimai_web.jpg
tags:
  - plugin
---

A plugin for Kimai 2 which shows you all entries without a description + email notification for users to ask them to add a description.

## Installation

First clone it to your Kimai installation `plugins` directory:
```
cd /kimai/var/plugins/
git clone https://github.com/hmr-it/EmptyDescriptionCheckerBundle.git
```

And then rebuild the cache: 
```
cd /kimai/
bin/console cache:clear
bin/console cache:warmup
```

The plugin should appear now.

You could also [download it as zip](https://github.com/hmr-it/EmptyDescriptionCheckerBundle/archive/master.zip) and upload the directory via FTP:

```
/kimai/var/plugins/
├── EmptyDescriptionCheckerBundle
│   ├── EmptyDescriptionCheckerBundle.php
|   └ ... more files and directories follow here ...
```

### Usage

To generate the emails to notify the users about missing descriptions just click the paper-plane at the right top button bar!
Make sure that you have fully configured mail sending as it is written in the [documentation](https://www.kimai.org/documentation/emails.html)!

### Exclude users, projects, or customers from this plugin

You might want to exclude users, projects or customers from appearing in this plugin. It can be done by providing their id in a config file.
After the first run of the plugin you'll find a dedicated config file in var/data/EmptyDescriptionCheckerBundle/

open the file *_to_exclude.conf in the above mentioned path. Write the id(s) of the user(s), project(s) or customer(s),  in the SECOND line of the config file.

Example of how your users_to_exclude.conf could look like:
```
### DO NOT REMOVE THIS LINE! ### If you want to exclude users from notifying about missing descriptions please put their usersIds separated by , (it is a comma - NOT a semicolon!) in the SECOND line (the line after this line) in this file. You may want to include this file in your backup!
1,2,3
```
 
with this config the users with id 1, 2, and 3 will not appear in this plugin + they won't be notified about missing descriptions.

## Permissions

This bundle ships a new administration screen, which will be available for the following users:

- `ROLE_SUPER_ADMIN` - every super administrator
- `empty_description_checker` - every user that owns this permission