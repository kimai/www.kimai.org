
# {{ site.data[page.lang].translation.donate.title }}

{% assign introduction = site.data[page.lang].translation.donate.introduction %}
{% include alert.html icon="far fa-smile" alert=introduction %}

{{ site.data[page.lang].translation.donate.please-donate }}

{% include card-donate.html user="kevinpapst" %}

{{ site.data[page.lang].translation.donate.your-donation }}
