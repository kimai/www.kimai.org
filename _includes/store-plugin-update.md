{% if include.plugin == nil %}
<div class="alert alert-danger" role="alert">
ATTENTION, this include needs the <strong>plugin</strong> variable!
</div>
{% else %}
{% assign plugin = include.plugin %}

Updating the bundle works the same way as the installation does. 

- Delete the directory `var/plugins/{{ plugin }}/`
- Execute all installation steps again:
  - Copy files
  - Clear cache
  - Update database with `bin/console {{ include.command }}` 
{%- if include.assets != nil %}
  - Update assets with `bin/console assets:install` 
{% endif %}
  
{% endif %}
