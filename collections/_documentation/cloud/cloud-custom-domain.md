---
title: Custom domain
description: How to set up and configure your custom domain
---

{% alert info %}This feature is **available for annual PRO subscriptions**, check the feature comparison page for more details.{% endalert %}

Your Kimai Cloud can be hosted under your own domain name, including **SSL certificate support**.

This feature lets you run your time-tracking cloud at a custom domain (e.g. `https://time-tracking.example.com`) instead of the default cloud domain (e.g. `https://your-name.kimai.cloud`).

All you need is your own domain name and access to its DNS settings.
You'll need to create a `CNAME` record (short for "Canonical Name") that points to your Kimai Cloud domain.

## Configure your DNS

Here is an example screenshot of such a DNS setting:

{% include docs-image.html src="/images/documentation/cloud/custom-domain.webp" title="Configure your DNS" %}

In standard DNS notation, this looks like:
```
time.kevinpapst.de.  IN CNAME kevin.kimai.cloud.
```

This example shows the custom domain `time.kevinpapst.de` pointing to the Kimai Cloud domain `kevin.kimai.cloud`.
The cloud name and subdomain name don't have to match.

Note that a CNAME record can only be used alongside an existing A record for the domain:
```
www.kevinpapst.de.   IN A     192.168.0.1.
time.kevinpapst.de.  IN CNAME kevin.kimai.cloud.
```

You can also point a top-level domain — it doesn't have to be a subdomain.

## Configure your custom domain

Enter your domain in your profile under **Custom domain**:

{% include docs-image.html src="/images/documentation/cloud/custom-domain-form.webp" title="Configure your CNAME" %}

It usually takes a few hours for our systems to pick up the new domain, especially if you tested the setup before creating the DNS entry.
In that case, our servers need to wait for updated DNS information to propagate — how long this takes depends on your TTL setting.

Once the custom domain and SSL certificate are successfully activated, you'll receive a confirmation by email.

## SSL certificate

Kimai Cloud domains always require SSL.
After you register your custom domain in our system, an SSL certificate is automatically issued via "Let's Encrypt" on your behalf.
