
<div class="row row-cards row-deck">
{% for tmp in site.data.menu-documentation %}
    {% assign nav = tmp[0] %}
    {% include docs-menu-card.html navigation=nav %}
{% endfor %}
</div>
