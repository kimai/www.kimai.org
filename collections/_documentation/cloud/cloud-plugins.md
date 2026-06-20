---
title: Plugins
description: "All available plugins and why additional ones cannot be installed"
---

{% alert info %}TL;DR — The cloud includes a fixed set of plugins. Additional plugins cannot be installed.{% endalert %}

## Available plugins in Kimai Cloud

Kimai Cloud provides a curated set of plugins that are fully tested, maintained, and supported by us.

The following extensions are currently available:

{%- assign products = site.store | where: "lang", page.lang | sort: 'title' -%}
{%- for product in products -%}
{%- assign settings = site.data.store[product.slug] -%}
{%- for tag in settings.tags -%}
{%- assign translation = site.data[page.lang].store.items[product.slug] -%}
    {%- if tag == 'cloud' %}
- [{{ translation.title | default: product.title }}]({% link _store/{{ page.lang }}/{{ product.name }} %})
    {%- endif -%}
{%- endfor -%}
{%- endfor %}

These plugins cover all features we support for cloud use.

## Why additional plugins cannot be added to the Cloud

A common question is whether plugins from the [Kimai Marketplace]({% link _pages/{{ page.lang }}/store.html %}) or third-party developers can be installed.
This is not possible, and the sections below explain why.

### Feature overlap and product consistency

Most unavailable plugins provide functionality already covered by existing Cloud plugins, or they conflict with how the Cloud is designed to work.

To keep the product stable and consistent, we must avoid overlapping or conflicting features.

### Licensing restrictions

Many plugins are developed by external developers or companies, not by us.

We can't automatically extend their licenses to cover the Cloud. In many cases, the license doesn't permit redistribution or SaaS hosting, and some plugins don't provide clear or commercially usable licensing terms at all.

For these reasons, we can't include such plugins in the Cloud.

### Missing Cloud-required APIs

Kimai Cloud relies on specific APIs and integrations that ensure secure, scalable, and reliable operation.
Many third-party plugins don't support these APIs, which can lead to errors, incompatibilities, or data issues.

Every component in the Cloud must fully support this infrastructure.

### Support and maintainability

When we include a plugin in the Cloud, we take on full responsibility for it — providing support, fixing bugs, and maintaining compatibility with future Kimai versions.

This isn't possible for third-party plugins: we don't know their code, can't debug or fix their issues, and would be dependent on another developer's release schedule, which could take days, weeks, or months.

We can't build a reliable cloud service on components we can't maintain ourselves.

### Security and code quality

Security is one of the most important aspects of Kimai Cloud.

Since third-party plugins aren't developed by us, we can't review their source code, guarantee their security, or take responsibility for any vulnerabilities they might contain.

Even well-written software can have security issues. Allowing external code in the Cloud would introduce risks that could affect all customers.

For this reason, we only include code that we fully control, audit, and maintain.

### Reliability and operational stability

All components of the Cloud must behave predictably under all conditions.

A third-party plugin might contain bugs, break during a Kimai update, cause performance or memory issues, or interrupt critical business processes.

Because we can't fix or maintain external code, a single problematic plugin could affect the stability of the entire Cloud.

### Our commitment to quality

Our goal is to deliver the best possible quality, stability, and security to all Cloud customers.

Every part of the Cloud comes from a single responsible source — so everything works together seamlessly.

The plugins available in the Cloud are optimized specifically for this environment and are continuously updated, tested, and maintained by us.
