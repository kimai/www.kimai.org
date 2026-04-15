{% assign configs = site.data.configurations[include.id] %}

{% if include.title %}
## {{ configs.name }}
{% endif %}

{% if include.howto %}
You can configure these at [System → Settings]({% link _documentation/configurations.md %}).
{% endif %}

{% if configs.before %}
{{ configs.before | markdownify }}
{% endif %}

{% for pn in configs.configurations -%}
- `{{ pn.title }}` — {{ pn.description }}
{% endfor -%}
{: .table }

{% if configs.after %}
{{ configs.after | markdownify }}
{% endif %}
