{% if include.page == 'settings' -%}
[System → Settings]({% link _documentation/configurations.md %})
{%- else %}
{% alert warning %}Unknown Kimai page: {{ include.page }}{% endalert %}
{% endif -%}
