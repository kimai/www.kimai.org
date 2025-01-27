{% assign title=site.data[page.lang].translation.reviews.name %}
{% assign intro=site.data[page.lang].translation.reviews.subtitle|newline_to_br %}

{% include hero-text.html title=title intro=intro %}

{% include pages/reviews.html %}

{% include cta-begin-journey.html %}


