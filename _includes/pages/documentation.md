
{{ site.data.trans[page.lang].docu-intro }}

{% if page.lang != 'en' %}
    {% assign alertMsg = site.data.trans[page.lang].docu-alert-english %}
    {% include alert.html type="warning" alert=alertMsg %}
{% endif %}

<div class="row">
{% for group in site.data.menu-documentation %}
    {% assign modulo = forloop.index0 | modulo: 2 %}
    <div class="col-md-6">
        <div class="card">
            <div class="card-status bg-blue"></div>
            <div class="card-header">
                <h3 class="card-title">{{ group.title }}</h3>
            </div>
            <div class="card-body">
                <ul>
                    {% for p in group.pages %}
                    {% assign doc = site.documentation | where: "slug", p | first %}
                    <li><a href="{{ doc.url }}">{{ doc.title }}</a></li>
                    {% endfor %}
                </ul>
            </div>
        </div>
    </div>
{% endfor %}

{% for group in site.data.menu-howto %}
<div class="col-md-6">
    <div class="card">
        <div class="card-status bg-blue"></div>
        <div class="card-header">
            <h3 class="card-title">{{ group.title }}</h3>
        </div>
        <div class="card-body">
            <ul>
                {% for p in group.pages %}
                {% assign doc = site.documentation | where: "slug", p | first %}
                    <li><a href="{{ doc.url }}">{{ doc.title }}</a></li>
                {% endfor %}
            </ul>
        </div>
    </div>
</div>
{% endfor %}
</div>
