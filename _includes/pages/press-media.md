{% assign title=site.data[page.lang].translation.press.title %}
{% assign intro=site.data[page.lang].translation.press.intro %}

{% include hero-text-round-dark.html title=title intro=intro %}

<section class="container py-5 my-md-2 my-lg-4 my-xl-5">
    <div class="row justify-content-center pt-5 pb-1 pb-sm-2 pb-md-3">
        <div class="col-auto pt-sm-2 pt-md-5">
            <div class="d-sm-flex">
                <div class="card border-0 bg-transparent text-center px-sm-1 px-md-3 mt-4">
                    <div class="card-body p-0 pb-2 pb-sm-3 mb-3">
                        <div class="d-inline-block bg-secondary text-primary rounded-circle fs-3 lh-1 p-3 mb-3">
                            <i class="bx bx-video"></i>
                        </div>
                        <h3 class="fs-5 mb-4">{{ site.data[page.lang].translation.press.contact_title }}</h3>
                        {{ site.data[page.lang].translation.press.contact_text | markdownify }}
                    </div>
                    <div class="card-footer border-0 p-0 text-center m-0 w-100">
                        <a href="mailto:{{ site.marketing_email }}" class="btn btn-lg btn-primary">{{ site.data[page.lang].translation.press.contact_button }}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

{% include section-faq.html type="press" %}
