---
title: Plugins
description: "All available plugins and why they cannot be extended"
---

{% alert info %}TL;DR - The cloud has a fixed set of plugins and new ones cannot be installed{% endalert %}


## Available Plugins in the Kimai Cloud

The Kimai Cloud provides a curated set of plugins that are fully tested, maintained, and supported by us.

The following extensions are currently available:

{%- assign products = site.store | where: "lang", page.lang | sort: 'title' -%}
{%- for product in products -%}
{%- assign settings = site.data.store[product.slug] -%}
{%- for tag in settings.tags -%}
{%- assign translation = site.data[page.lang].store.items[product.slug] -%}
    {%- if tag == 'cloud' %}
- [{{ translation.title | default: product.title }}]({% link _store/{{ product.name }} %})
    {%- endif -%}
{%- endfor -%}
{%- endfor %}

These plugins cover all features we support for cloud use.

## Why other plugins cannot be added to the Cloud

A common question is whether additional plugins from the [Kimai Marketplace]({% link _pages/store.html %}) or third-party developers can be installed.
This is not possible in the Cloud, and the following sections explain why.

### Feature Overlap & Product Consistency

Most unavailable plugins provide functionality that is already covered by existing Cloud plugins, or they conflict with how the Cloud is designed to work.

To keep the product stable and consistent, we must avoid overlapping or conflicting features.

### Licensing Restrictions

Many plugins are not developed by us, but by external developers or companies.
* We cannot automatically transfer their licenses to the Cloud.
* In many cases, the license does not allow redistribution or SaaS hosting.
* Some plugins do not provide clear or commercially usable licensing terms at all.

Because of this, we cannot include these plugins in the Cloud.

### Missing Cloud-Required APIs

The Kimai Cloud relies on specific APIs and integrations that ensure secure, scalable, and reliable operation.
Many third-party plugins do not support these Cloud-required APIs, which can lead to errors, incompatibilities, or data issues.

To guarantee the reliability of the Cloud, every component must fully support this infrastructure.

### Support & Maintainability

If we offer a plugin in the Cloud, we must be able to:
* Provide support
* Fix bugs
* Maintain compatibility with future Kimai versions

This is not possible for third-party plugins:
* We do not know their code
* We cannot debug or fix their issues
* We would depend on another developer’s release cycle, which might take days, weeks, or months

We cannot build a reliable cloud service on components we cannot maintain ourselves.

### Security & Code Quality

Security is one of the most important aspects of the Kimai Cloud.

Since third-party plugins are not developed by us:
* We cannot review their source code
* We cannot guarantee their security
* We cannot take responsibility if a plugin contains vulnerabilities

Even well-written software can contain security issues.
Allowing external code in the Cloud would introduce risks that could affect all customers.

For this reason, we only accept code that we fully control, audit, and maintain.

### Reliability & Operational Stability

To run the Cloud reliably, all components must behave predictably under all circumstances.

A third-party plugin might:
* Contain bugs
* Break during Kimai updates
* Cause performance or memory issues
* Interrupt critical business processes

Because we cannot fix or maintain external code, a single plugin could jeopardize the stability of the entire Cloud.

### Delivering the Best Possible Experience

Our goal is to deliver the best possible quality, stability, and security to all Cloud customers.

Therefore, we follow one clear principle:

Every part of the Cloud must come from a single responsible source — so everything works together seamlessly.

The plugins available in the Cloud are optimized specifically for this environment and continuously updated, tested, and maintained.
