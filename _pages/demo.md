---
title: Demo
description: Test and evaluate our time-tracker Kimai online, directly from our demo page.
lang: en
lang-ref: demo
redirect_from:
  - /en/demo.html
  - /demo.html
---
{% assign masterDescription = "Explore the latest features, which were added in the development version and that will be included in the next release." %}
{% assign stableDescription = "Showcasing the latest stable release. Best for the people who don't want to risk development bugs. Installed version: "|append:site.kimai_v2_version %}
{% assign pluginsDescription = "The latest development version with some additional plugins installed. You can find these plugins in our Marketplace." %}

# Test Kimai in one of the demos

{% include alert.html icon="fas fa-desktop" alert='Try out the Kimai time-tracking demo and we promise: your next step will be the download!' %}

Please choose one of our demo installations of Kimai 2, where you can get a first impression on how this software feels and which functionality it provides.

<div class="row row-cards">
    <div class="col-sm-6 col-lg-4">
        {% include card-demo.html title="Development version" description=masterDescription url=site.kimai_v2_demo %}
    </div>
    <div class="col-sm-6 col-lg-4">
        {% include card-demo.html title="Latest stable" description=stableDescription url="https://demo-stable.kimai.org" %}
    </div>
    <div class="col-sm-6 col-lg-4">
        {% include card-demo.html title="Plugins" description=pluginsDescription url="https://demo-plugins.kimai.org" %}
    </div>
</div>

Be aware that the demos will be reinstalled on a regular schedule and all entered data will be removed. But for your convenience, they 
are pre-filled with test data, so you can directly start testing features (like invoice or export).

If you encounter any problem, I would kindly ask you to drop a message in the [issue tracker]({{ site.kimai_v2_repo }}/issues).

## Demo user

These accounts are available for your tests. Or you create your own test user in the login form of each demo:

| Username | Password | API |
|---|:---:|:---:|
| **john_user** (User) | **kitten** | api_kitten |
| **tony_teamlead** (Teamlead) | **kitten** | api_kitten |
| **anna_admin** (Admin) | **kitten** | api_kitten |
| **susan_super** (Super-Admin) | **kitten** | api_kitten |
| **admin** (Super-Admin) | **password** | - |
