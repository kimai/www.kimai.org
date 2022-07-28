
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
        <div class="card alert alert-success">
            <div class="card-body">
                <h4>
                    {{ site.data.trans[page.lang].homepage-alert-title }}
                </h4>
                <p>
                    {{ site.data.trans[page.lang].homepage-alert-intro }}
                    <br><br>
                    {{ site.data.trans[page.lang].homepage-quote-excel }}
                </p>
                <div class="btn-list">
                    <a href="{{ site.data.trans-menu[page.lang].download.url }}" class="btn btn-primary">{{ site.data.trans[page.lang].homepage-alert-button-download }}</a>
                    <a href="{{ site.data.trans-menu[page.lang].demo.url }}" class="btn btn-secondary">{{ site.data.trans[page.lang].homepage-alert-button-demo }}</a>
                </div>
            </div>
        </div>
    </div>

    {% include card-cloud.html %}

    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    {{ site.data.trans[page.lang].homepage-features-title }}
                </h3>
                {% comment %}
                <br>
                <small>
                    {{ site.data.trans[page.lang].homepage-features-subtitle }}
                </small>
                {% endcomment %}
            </div>
            <div class="table-responsive">
                <table class="table card-table table-vcenter table-striped table-responsive-sm feature-list">
                    <tbody>

                        {% assign features = site.features | sort:"order" %}
                        {% for feature in features %}
                        <tr>
                            <td class="text-nowrap">
                                {% if feature.documentation != nil %}
                                {% assign url = feature.documentation | replace: '_store/', '/store/' | replace: '_documentation/', '/documentation/' | replace: '.md', '.html' %}
                                <a href="{{ url }}">{{ feature.title }}</a>
                                {% else %}
                                {{ feature.title }}
                                {% endif %}
                            </td>
                            <td>{{ feature.excerpt }}</td>
                        </tr>
                        {% endfor %}

                    </tbody>
                </table>
            </div>
        </div>
    </div>
