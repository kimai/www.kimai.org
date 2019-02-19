---
layout: post
title: "Update Problem..."
date: "2007-08-08 20:48:43 +0200"
author: skilleven
---

I noticed today that users will face a little problem when updating from version 0.6.1 to 0.7.9.

After the Update you will not be able to access the admin panel even when you're logged in as user 'admin'.
This is because one field of the database is not updated correctly.

We will publish a fix with version 0.8 but until then you can easily fix this issue by editing the database using e.g. PHPMyAdmin.
Find your admin user in the table 'usr' and change the value of usr_sts from 2 (two) to 0 (zero).
You'll find the crown button in the main menu then.
