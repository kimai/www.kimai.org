---
title: "Repository URL changed"
date: "2022-12-26 10:00:00 +0200"
author: kevinpapst
tags: [Announcement]
---

This is a short but important announcement!

In an ongoing process to simplify and optimize the entire development stack, 
the main code repository was moved from `https://github.com/kevinpapst/kimai2` to `https://github.com/kimai/kimai`.

All links should be transparently redirected and so should be every GIT installation out there.
So you can still run updates as you are used to.

But to be 100% percent future-proof, I'd kindly ask you to execute the following command (this is a one-timer!):

```bash
cd /var/www/kimai2
git remote set-url origin https://github.com/kimai/kimai.git
```

### Why was that change done?

In the past, people were sometimes confused about the legacy version and the new version. 
Part of that, was the personal URL, another part was the version number.

Having the main code repository under the [Kimai organization](https://github.com/kimai) in GitHub as well, was the logical choice and is simpler for everyone.
It was just delayed for a longer time, because ... 

### Why did this take so long?

This switch took 5 years, because the legacy Kimai 1 version was still alive and living at that URL.
Now with PHP 7.4 officially being EOL (end of live) really NOBODY should still use that legacy version anymore.
It might still run on private hosts or by some brave hosters that ship an unsupported PHP version. 
But you shouldn't, and it is strongly advised against. 

Kimai v1 is - as a software without maintenance since years and running with a PHP version that is not supported - a potential risk in your IT infrastructure.
If you do NOT know how to upgrade, [get in touch]({% link _store/keleo-installation-support.md %}), it is about time!

The legacy version repo was archived at `https://github.com/kimai/kimai1`.

### Please report mistakes

The website was already updated, the next minor release of Kimai (1.30.1) will ship the changes as well.

But there are, without doubt, a lot of places still linking to the old URL.
If you stumble across them, please help out and [let me know where they are]({{ site.kimai_v2_forum }}).
