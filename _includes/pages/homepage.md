
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
                    {{ site.data[page.lang].translation.homepage-alert-title }}
                </h4>
                <p>
                    {{ site.data[page.lang].translation.homepage-alert-intro }}
                    <br><br>
                    {{ site.data[page.lang].translation.homepage-quote-excel }}
                </p>
                <div class="btn-list">
                    <a href="{{ site.data.trans-menu[page.lang].download.url }}" class="btn btn-primary">{{ site.data[page.lang].translation.homepage-alert-button-download }}</a>
                    <a href="{{ site.data.trans-menu[page.lang].demo.url }}" class="btn btn-secondary">{{ site.data[page.lang].translation.homepage-alert-button-demo }}</a>
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

                        {% assign features = site.features | where: "lang", page.lang | sort:"order" %} 
                        {% for feature in features %}
                        <tr>
                            <td>
                                {% if feature.documentation != nil %}
                                    <a href="{{ feature.documentation }}">{{ feature.title }}</a>
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
