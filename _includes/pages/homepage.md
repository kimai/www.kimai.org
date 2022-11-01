<div class="row row-cards row-deck">

    <div class="col-sm-6 col-lg-4">
        {% include card-image.html image="timesheet" %}
    </div>
    <div class="col-sm-6 col-lg-4">
        {% include card-image.html image="invoice" %}
    </div>
    <div class="col-sm-6 col-lg-4">
        {% include card-image.html image="dashboard" %}
    </div>

    <div class="col-md-12 col-lg-8">
        <div class="card bg-green-lt">
            <div class="card-body d-flex flex-column p-4">
                <h3 class="pb-3">
                    {{ site.data[page.lang].translation.homepage-alert-title }}
                </h3>
                <p>
                    {{ site.data[page.lang].translation.homepage-alert-intro }}
                    <br><br>
                    {{ site.data[page.lang].translation.homepage-quote-excel }}
                </p> 
                <div class="btn-list mt-auto">
                    <a href="{{ site.pages | where: "lang", page.lang | where: "slug", "download" | map: "url" | first }}" class="btn btn-primary">{{ site.data[page.lang].translation.homepage-alert-button-download }}</a>
                    <a href="{{ site.pages | where: "lang", page.lang | where: "slug", "demo" | map: "url" | first }}" class="btn btn-secondary">{{ site.data[page.lang].translation.homepage-alert-button-demo }}</a>
                </div>
            </div>
        </div>
    </div>

    {% include card-cloud.html %}

    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    {{ site.data[page.lang].translation.homepage-features-title }}
                </h3>
                {% comment %}
                <br>
                <small>
                    {{ site.data[page.lang].translation.homepage-features-subtitle }}
                </small>
                {% endcomment %}
            </div>
            <div class="table-responsive">
                <table class="table card-table table-vcenter table-striped table-responsive-sm feature-list">
                    <tbody>
                    {% for feature in site.data.feature %}
                        {% assign feature_key = feature.name %}
                        {% assign feature_documentation = feature.documentation %}
                        {% assign lang_replacer = page.lang | append: '/' %}
                        {% if page.lang == 'en' %}
                           {% assign lang_replacer = '' %}
                        {% endif %}
                        {% assign feature_documentation = feature.documentation | replace: '%language%', lang_replacer %}
                        {% assign feature_title = site.data[page.lang].translation.feature[feature_key].name %}
                        {% assign feature_description = site.data[page.lang].translation.feature[feature_key].description %}
                        <tr>
                            <td>
                                {% if feature_documentation != nil and feature_documentation != '' %}
                                    <a href="{% link {{ feature_documentation }} %}">{{ feature_title }}</a>
                                {% else %}
                                    {{ feature_title }}
                                {% endif %}
                            </td>
                            <td>{{ feature_description }}</td>
                        </tr>
                    {% endfor %}
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
