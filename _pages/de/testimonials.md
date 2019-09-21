---
title: Erfahrungsberichte
description: Erfahrungsberichte - Benutzer-Feedback zu Kimai
subtitle: Erfahren Sie, was andere über uns zu sagen haben
lang: de
lang-ref: testimonial
permalink: /de/meinungen.html
redirect_from:
  - /meinungen.html
  - /feedback.html
---

# Erfahrungsberichte

Was andere über uns denken:

{% for testimonial in site.data.testimonials %}
<blockquote cite="{{ testimonial.name }}">
{{ testimonial.content }}
</blockquote>
{% endfor %}

Wenn Sie hier erscheinen möchten, senden Sie uns bitte Ihre Gedanken oder einen Link zu Ihrer Seite, auf der Sie über uns bloggen.
