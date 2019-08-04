---
title: Demo
description: Test and evaluate our time-tracker Kimai online, directly from our demo page.
redirect_from:
  - /en/demo.html
  - /demo.html
---
{% assign stableDescription = "Showcasing the latest stable release. Best for the people who don't want to risk development bugs. Installed version: "|append:site.kimai_v2_version %}
{% assign pluginsDescription = "The latest development version with some additional plugins installed. You can find these plugins in our Marketplace." %}

# Test Kimai in one of the demos

{% include alert.html icon="fas fa-desktop" alert='Try out the Kimai time-tracking demo and we promise: your next step will be the download!' %}

Please choose one of our demo installations of Kimai 2, where you can get a first impression on how this software feels and which functionality it provides.

<div class="row row-cards">
    <div class="col-sm-6 col-lg-4">
        {% include card-demo.html title="Development version" description="Explore the latest features, which were added in the development version and that will be included in the next release." url=site.kimai_v2_demo %}
    </div>
    <div class="col-sm-6 col-lg-4">
        {% include card-demo.html title="Latest stable" description=stableDescription url="https://demo-stable.kimai.org" %}
    </div>
    <div class="col-sm-6 col-lg-4">
        {% include card-demo.html title="Plugins" description=pluginsDescription url="https://demo-plugins.kimai.org" %}
    </div>
   
</div>

Be aware that the demos will be reinstalled on a regular schedule and all entered data will be removed. But for your convenience, they 
are reinstalled with a lot of test data inside, so you can directly start testing features (like invoice or export) that require data to be present.

If you encounter any problem, I would kindly ask you to drop a message in the [issue tracker]({{ site.kimai_v2_repo }}/issues).

## Demo users

These accounts are available for your tests. Or you create your own test user in the login form of each demo, if the following don't work:

| Username | Password | API Password | Role | Description |
|---|:---:|:---:|:---:|---|
| john_user | kitten | api_kitten | User | |
| chris_user | kitten | api_kitten | User | deactivated |
| tony_teamlead | kitten | api_kitten | Teamlead | |
| anna_admin | kitten | api_kitten | Administrator | |
| susan_super | kitten | api_kitten | Super-Administrator | |
| admin | password | - | Super-Administrator | no records |
