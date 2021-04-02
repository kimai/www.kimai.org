---
title: Installation of Kimai via FTP 
description: "Installation of Kimai via FTP is not supported, read why..."
toc: false
---

{% include alert.html type="warning" alert="Installation via FTP is not supported, because most of Kimai's management tasks rely on the console." %}

The recommended way to [install Kimai is via SSH]({% link _documentation/installation.md %}).

{% capture support %}
If you don't have the technical background for managing a server yourself and need to rely on a shared hosting package, 
it is better to stop hosting business critical software yourself!
If you thought about switching to a managed server before (they are affordable these days) 
you can contact me, [I offer paid setup support]({% link _store/keleo-installation-support.md %}).
{% endcapture %}
{% assign support = support|markdownify %}

{% include alert.html type="info" alert=support %}
