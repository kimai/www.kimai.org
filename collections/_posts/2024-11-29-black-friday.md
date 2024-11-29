---
title: "Black Friday for On-Premise users"
date: "2024-11-29 06:00:00 +0200"
image: /images/blog/black-friday.webp
author: valentina
tags: [General]
excerpt: "At Kimai, we've always believed in fair and accessible pricing. So here is our Black Friday offer: Kimai's PPP Discount for plugin users!"
---

At Kimai, we've always believed in fair and accessible pricing. 
While some companies flood your inbox with aggressive Black Friday deals, we're taking a different approach — one that reflects our commitment to global equity in software pricing.

**Breaking the traditional Black Friday mold**

First, let's be clear: we don't do typical seasonal promotions. 
You won't find flashy, time-limited discounts or coupon codes scattered across discount websites. 
Remember everything you can find as Kimai coupons outside our website and official social profiles is fake. 
Instead, we're introducing a targeted Black Friday offer that helps our on-premise users.

**Purchasing Power Parity: making our plugins accessible worldwide**

Our Black Friday special focuses on Gross Domestic Product (GDP) — a principle that recognizes economic differences across countries. 

Here's how it works:

- If you're an on-premise Kimai user from a country with a lower GDP per capita than Austria, you're eligible for a plugin discount
- We'll compare your country's economic indicators to determine your discount eligibility
- This approach ensures that our software remains affordable, regardless of your geographical location

To give you a clearer picture, here are some example of discounts for five countries[^1]:

- Hungary: 50% off
- Poland: 40% off
- Czechia: 30% off
- Spain: 30% off
- Italy: 10% off

This discount applies to the wide range of plugins available for our on-premise customers:

{% assign products = site.store | where: "lang", page.lang | where_exp:"product", "product.type == 'featured'" | sort: 'order', 'last' %}
{% for product in products -%}
{% if site.data.store[product.slug].disabled == nil %}
- [{{ site.data[page.lang].store.items[product.slug].title | default: product.title }}]({{ product.url }})
{%- endif %}
{%- endfor %}

Ready to explore your PPP discount*? Check your eligibility and request your plugin coupon via e-mail.

[^1]: Disclaimer: Discount calculations are based on the latest available economic data. Eligibility will be verified during the application process.
