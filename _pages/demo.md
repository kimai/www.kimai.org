---
title: Demo
description: Test and evaluate our time-tracker Kimai online, directly from our demo page.
redirect_from:
  - /en/demo.html
  - /demo.html
---

# Test Kimai

{% include alert.html icon="fas fa-desktop" alert='Try out the Kimai time-tracking demo and we promise: your next step will be the download!' %}

This page leads you to a [demo installation]({{ site.kimai_v2_demo }}) of Kimai, where you can get a first
impression on how this software feels and which functionality it provides.
If you encounter any problem, we would kindly ask you to send us a [message in our issue tracker]({{ site.kimai_v2_repo }}/issues).
Please notice, that the Demo will be reinstalled on a regular schedule and all entered data will be removed.

<p class="text-center">
    <a href="{{ site.kimai_v2_demo }}" target="_blank" class="btn btn-primary">Access demo</a>
</p>

## Demo users

The following user are available for your tests. Please create your own test user (see below) if these don't work:

| Username | Password | Role | Description |
|---|:---:|:---:|---|
| john_user | kitten | User | |
| chris_user | kitten | User | deactivated |
| tony_teamlead | kitten | Teamlead | |
| anna_admin | kitten | Administrator | |
| susan_super | kitten | Super-Administrator | |
| admin | password | Super-Administrator | no records |

## Demo re-installation

The demo url is: [{{ site.kimai_v2_demo }}]({{ site.kimai_v2_demo }})

<script src="https://demo-v2.kimai.org/status.php"></script>

You can register your own account in the [demo login form]({{ site.kimai_v2_demo }}).

## The demo ...

- ... imports the Kimai v2 test data, so you can directly start testing 
- ... will be reinstalled twice a day, check above that you don't run into a reinstall while testing
- ... is always created from the latest development version (master branch), so you might find bugs which will not be available in the next release
