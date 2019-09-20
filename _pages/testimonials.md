---
title: Testimonials
description: Testimonials - User feedback about Kimai
subtitle: Find out what others have to say about us
redirect_from:
  - /meinungen.html
  - /feedback.html
  - /en/feedback.html
  - /about/testimonials.html
---

# Testimonials

What others think about us:

{% for testimonial in site.data.testimonials %}
<blockquote cite="{{ testimonial.name }}">
{{ testimonial.content }}
</blockquote>
{% endfor %}

If you want to appear here, please sent us your statement or a link to your page where you blog about us.
