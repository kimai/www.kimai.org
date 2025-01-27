---
title: Custom domain
description: Read how to set-up and configure your custom domain
---
 
Your Kimai-Cloud can be hosted under your own domain name and **SSL certificates are supported** as well.

This feature allows to run your time-tracking cloud at a custom-domain (eg. `https://time-tracking.example.com`) instead of only using the generic cloud domain (eg. `https://your-name.kimai.cloud`).

All you need is your own domain name and access to the DNS settings of that domain.
You have to create a so-called CNAME (short for "Canonical name") entry, with your cloud domain as destination.

## Configure your DNS

Here is an example screenshot of such a DNS setting:

{% include docs-image.html src="/images/documentation/cloud/custom-domain.webp" title="Configure your DNS" width="800px" %}

It is unlikely that you need it in this syntax, but in "technical speech" this would be:
```
time.kevinpapst.de.  IN CNAME kevin.kimai.cloud.
```

This example shows the custom domain `time.kevinpapst.de` configured to point to the Kimai-Cloud domain `kevin.kimai.cloud`.
As you can see: cloud name and subdomain name do not have to match.

Be aware that a CNAME record can only be used, if your domain already has an A record:
```
www.kevinpapst.de.   IN A     192.168.0.1.
time.kevinpapst.de.  IN CNAME kevin.kimai.cloud.
```

You can also point to a top-level domain, it doesn't have to be a subdomain.

## Configure custom domain

In the last step you enter your domain in your profile under **Custom domain**:

{% include docs-image.html src="/images/documentation/cloud/custom-domain-form.webp" title="Configure your CNAME" width="800px" %}

It usually takes a couple of hours until our system are able to utilize this new domain, especially if you tested the integration before creating the DNS entry.
In that case our servers will have to wait until new DNS information are available (the waiting time depends on your TTL).

After the custom domain and SSL certificate were successfully activated, you will be informed by email.

## SSL certificate

Kimai-Cloud domains always require the use of SSL.
After registering the custom domain in our system, an SSL certificate is issued (via LetsEncrypt) on your behalf for this domain.

## Costs

There are **no additional costs** involved with the certificate or the custom domain feature. 

Instead this feature is **only available for certain plans**, check the feature comparison before subscribing to a plan.  
