**{% for locale in site.data.multi-language -%}
{{ locale[1] }}{% unless forloop.last %}, {% endunless -%} 
{% endfor %}**
