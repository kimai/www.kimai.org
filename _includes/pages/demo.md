
{% assign introduction = site.data[page.lang].translation.demo.introduction %}
{% include alert.html icon="desktop" alert=introduction %}

## {{ site.data[page.lang].translation.demo.title }}

{{ site.data[page.lang].translation.demo.choose }}

{% include pages/demo-boxes.html %}

{{ site.data[page.lang].translation.demo.reinstall }}

### {{ site.data[page.lang].translation.demo.user }}

{{ site.data[page.lang].translation.demo.accounts }}

{% include pages/demo-users.md %}
