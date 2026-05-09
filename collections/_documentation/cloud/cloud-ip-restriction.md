---
title: IP access restriction
description: Limit access to your Kimai Cloud by configuring IP access restrictions.
---

{% alert info %}This feature is **available for annual PRO subscriptions**, check the feature comparison page for more details.{% endalert %}

This feature lets you restrict access to your time tracking to up to 5 specific IPv4 addresses.
Once an IP address is saved, only requests from that address are allowed.
Any other IP address will receive an error page.

To activate this feature, enter your IP address(es) in your profile under `Access restriction to IP address`.

## Configuring IPs

By default, one empty row is shown in the form. Enter your main IP address there.
To add more addresses, click the `Add` button to add additional rows.

Each row holds one IP address in IPv4 format.
Private or reserved ranges are not allowed.

The maximum number of allowed IP addresses is 5.

After saving, you'll see a message indicating that the changes are pending. Our system applies the new rules within 10 minutes.
If the "changes pending" message doesn't disappear within 1 hour, please [contact support](mailto:{{ site.cloud.support_email }}).

### Removing IPs

Clear the content of a row to remove that IP address — the change takes effect when you save the form.

To restore unrestricted public access, remove all stored IP addresses by clearing all rows.
