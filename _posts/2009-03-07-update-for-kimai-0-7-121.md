---
layout: post
title: "Update for Kimai 0.7.121"
date: "2009-03-07 16:08:00 +0200"
author: beny
---

I just found out that I forgot to add the code to disable "regular user" to add new Customers/Projects/Tasks.
If you like to add this to Kimai 0.7.121.

Add the following piece of code:

1. Open main.tpl (in templates/core/) with your favorite text editor
2. Go to line 181: <a href ... ></a>
3. Place the above code inside {if $allowedit < 2} {/if}
4. It will look like: `{if $allowedit < 2}<a href ... ></a>{/if}`
5. Repeat step 3 for line 188 and 195

Let me know if you have any questions 
