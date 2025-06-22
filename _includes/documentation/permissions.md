{% assign perms = site.data.permissions[include.id] %}

{% if include.title %}
**{{ perms.name }}**
{% endif %}

| Name | Description |
|------|-------------|
{% for pn in perms.permissions -%}
| `{{ pn[0] }}` | {{ pn[1] }} |
{% endfor -%}
{: .table .permissions }

{% if include.super_admin %}
By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.
{% elsif include.all_roles %}
The plugin applies pre-configured permissions for all default user roles, you can adjust them to your needs at `System > Roles`.
{% endif %}

{% if include.howto %}
{% include snippets/store-howto-permissions.md %}
{% endif %}
