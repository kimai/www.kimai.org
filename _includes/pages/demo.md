{% assign introduction = site.data[page.lang].translation.demo.introduction %}
{% assign title = site.data[page.lang].translation.demo.title %}

{% include hero-text-round-dark.html title=title intro=introduction %}

{% include pages/demo.html %}

{% include cta-begin-journey.html %}
