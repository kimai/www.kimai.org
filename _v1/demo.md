---
title: Kimai v1 - Demo
description: Test Kimai v1 online in our demo installation
---

The button below leads you to a [demo installation]({{ site.kimai_v1_demo }}) of Kimai v1, where you can get a first
impression on how this software feels and which functionality it provides.
If you encounter any problem, we would kindly ask you to send us a [message in our issue tracker]({{ site.kimai_v1_repo }}/issues).
Please notice, that the Demo will be reinstalled on a regular schedule and all entered data will be removed.

### Last installation

{% capture alert_note %}
<strong>ATTENTION:</strong> This is the demo of the outdated Kimai v1.
<br>
We released Kimai v2 in the meantime and would invite you to head over to our <a href="{% link _pages/demo.md %}">demo page</a>.  
{% endcapture %}
{% assign alert_note = alert_note| markdownify %}
{% include alert.html type="danger" alert=alert_note %} 

Click the button below and you will be redirected to a page where you receive a unique user-login for your test. 

<script src="{{ site.kimai_v1_demo }}/status.php"></script>

## Login

As Kimai forbids multiple sessions for the same user, the previously logged-in user will be logged out, if another
login occurs for that same account. Therefor is it recommended to create your own test-account instead of using the
following "admin" account:

*   Website: [{{ site.kimai_v1_demo }}]({{ site.kimai_v1_demo }})
*   Username: admin
*   Password: changeme

## Note

The demo is always created from the latest [development version]({% link _v1/developer.md %}).
It's possible, that you find bugs, which will not be available in a release version.
The Kimai Demo will be reinstalled multiple times a day, that's why you cannot perform long-time tests.
