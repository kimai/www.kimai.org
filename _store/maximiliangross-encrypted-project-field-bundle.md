---
title: "Encrypted project field plugin for Kimai 2"
name: Encrypted Project Field
intro: "A Kimai 2 plugin, which adds a field whose text is encrypted to the project form."
developer: maximiliangross
date: "2019-12-15 10:53:00 +0200"
icon: far fa-hdd
price: "0"
download: https://github.com/mxgross/EncryptedProjectFieldBundle/archive/master.zip
github: https://github.com/mxgross/EncryptedProjectFieldBundle
screenshot: 
  - https://raw.githubusercontent.com/mxgross/EncryptedProjectFieldBundle/master/screenshot.jpg
tags:
  - plugin
  - encryption
  - secret-field
  - decryption
  - secret
---

A Kimai 2 plugin, which adds a field whose text is encrypted to the project form.
It is called 'Sensitive Data' and its content is encrypted when written to the database 
and automatically decrypted when the project form is opened.

This is especially usefull when you want to store e.g. the access data for your projects or other sensitive data. Because in case of a database leak, the attacker cannot read the encrypted information.

## Installation

First clone it to your Kimai installation `plugins` directory:
```
cd /kimai/var/plugins/
git clone https://github.com/mxgross/EncryptedProjectFieldBundle.git
```

And then rebuild the cache:
```
cd /kimai/
bin/console cache:clear
bin/console cache:warmup
```

## Configuration
Make sure you set a save APP_SECRET in your Kimai 2 installations .env file. This APP_SECRET will be one of the secrets used to encrypt your data!
Once you began using the plugin and encrypted data, do not change the APP_SECRET anymore! Otherwise your data already encrypted cannot be decrypted automatically anymore.

After setting everything up, open a project and add a text in the 'Sensitive data' textbox. Then save the project form. Now you can open the project_meta table e.g. with phpMyAdmin to verify your information has been encrypted.
When you open the project again, the information should be shown in clear text again.
