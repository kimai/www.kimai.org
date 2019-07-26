---
layout: post
title: "How to use Kimai 2 as native app"
date: "2019-06-11 20:00:00 +0200"
author: kevinpapst
tags: [HowTo]
---

Thanks to the Kimai user Roman, who wrote me about that topic, I can share a nice inspiration with you today. 

The title might be a bit misleading, as Kimai will not really run as native app.
You still have to have your server installation at hand, but with so many fantastic projects out there, 
it is really easy nowadays to pack Kimai into an Electron container, simulating a native app.

No more browser tabs required, open Kimai inside an application container which almost feels like a native app, 
which will gets its own place in your system tray.

## Build the app with nativefier 

We use [nativefier](https://github.com/jiahaog/nativefier) to bundle the app with a transparent Kimai icon: 

```bash
npm install nativefier -g
wget https://demo.kimai.org/touch-icon-192x192.png
nativefier --icon touch-icon-192x192.png --name "Kimai 2 - Demo" "https://demo.kimai.org/" --disable-dev-tools
``` 

## How it looks

![Kimai native app screenshot]({% link /images/news/kimai-native-app.png %}){:class="image"}

And that's it already. You will have a new directory with an executable inside.

Using this method, an administrator could even distribute the software to all his managed clients within the company.

## Caveats

There are some minor issues: 
- After restarting the app, you have to re-login ... but who will close a time-tracker anyways!?
- Cookies do not seem to be stored across sessions, so column filters will be reset
- File downloads are buggy, so export and invoice might not work as expected
