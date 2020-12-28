---
title: Témoignages
description: Témoignages - Commentaires des utilisateurs sur Kimai
subtitle: Découvrez ce que les autres ont à dire sur nous
lang: fr
lang-ref: testimonial
permalink: /fr/meinungen.html
redirect_from:
  - /meinungen.html
  - /feedback.html
---

# Témoignages

Ce que les autres pensent de nous :

{% for testimonial in site.data.testimonials %}
<blockquote cite="{{ testimonial.name }}">
{{ testimonial.content }}
</blockquote>
{% endfor %}

Si vous souhaitez apparaître ici, veuillez nous envoyer vos réflexions ou un lien vers votre site où vous bloguez à notre sujet.
