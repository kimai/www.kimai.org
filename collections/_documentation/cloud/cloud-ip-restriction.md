---
title: IP access restriction
description: Limit access to your Kimai-Cloud by configuring IP access restrictions. 
---

{% alert info %}This feature is **available for annual PRO subscriptions**, check the feature comparison page for more details.{% endalert %}

With the help of this function you can restrict the accessibility of your time tracking for up to 5 different IPv4 addresses.
As soon as an IP has been stored, only access from this IP is allowed.
Access from any other IP is answered with an error page.

To activate the function, enter your IP address(es) in your profile under `Access restriction to IP address`.

## Configuring IPs

By default, one empty row is shown in the form. You can enter your main IP address there.
If you want to configure more IPs, you can click the `Add` button, which will add more rows.

Each row can contain one IP address, which must be specified in IPv4 format.
Private or reserved ranges are not allowed.

The maximum allowed number of IPs is 5.

After saving, you will see a message that the changes are pending. Our system should apply the new rules within 10 minutes.
If the "changes pending" message does not disappear within 1 hour, please [contact the support](mailto:{{ site.cloud.support_email }}).

### Removing IPs

You can delete an IP by clearing the row, it will be removed after the form is saved.

To restore public access, simply remove all stored IP addresses (empty all rows).
