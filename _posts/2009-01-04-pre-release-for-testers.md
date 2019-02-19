---
layout: post
title: "Pre-Release For Testers"
date: "2009-01-04 12:32:00 +0200"
author: skilleven
---

v0.8.0.805 is ready for download.

Please test and report all errors you encounter.
Important changes: YOU CAN ONLY UPDATE VERSIONS HIGHER THAN 7.0!

There are two new variables to set in the conf.php if you did not install via the step-by-step installer:

{% highlight php %}
$server_conn = "mysql";      // If you want to use PDO $server_conn must be set to "pdo".
$server_type = 'mysql';      // the database type (needed for PDO) usually 'mysql'
{% endhighlight %}

The installation will then be performed in non-PDO mode.



[Download]({{ site.download_url }})
