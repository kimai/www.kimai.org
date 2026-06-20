
<section class="container pb-5 mb-md-2 mb-lg-4 mb-xl-5">
    <div class="row justify-content-center pt-5 pb-1 pb-sm-2 pb-md-3">
        <div class="col-auto">
            <div class="d-sm-flex">
                <div class="card border-0 bg-faded-primary text-center p-4">
                    <div class="card-body p-0 pb-2 pb-sm-3 mb-3">
                        <div class="d-inline-block bg-secondary text-primary rounded-circle fs-3 lh-1 p-3 mb-3">
                            <i class="bx bx-video"></i>
                        </div>
                        <h3 class="fs-5 mb-4">{{ site.data[page.lang].translation.press-media.contact_title }}</h3>
                        {{ site.data[page.lang].translation.press-media.contact_text | markdownify }}
                    </div>
                    <div class="card-footer border-0 p-0 text-center m-0 w-100">
                        <a href="mailto:{{ site.marketing_email }}" class="btn btn-lg btn-primary">{{ site.data[page.lang].translation.press-media.contact_button }}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

{% include section-faq.html type="press" %}
