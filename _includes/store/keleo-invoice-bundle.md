{% include contents/pay-what-you-want.md %}

{% include documentation-link.html chapter="plugin-invoice" %}

You can test the Plugin in the [Plugin demo]({% link _pages/demo.md %}).

## Features 

{% include plugins/invoice.md %}

{% capture alert_note %}
If you only want to change the locale, you can have a look at the [Fixed invoice data format plugin]({% link _store/keleo-invoice-format-fixation-bundle.md %}).
This plugin here does the same, but offers more features. 
{% endcapture %}

{% assign alert_note = alert_note| markdownify %}

{% include alert.html type="warning" alert=alert_note %}
