This bundle allows you to configure a global language, which is used to format all invoices.

In the core system of Kimai, you configure the language fo an invoice via its template. 
Then the language is used both, for translations and for value formatting.

This behavior might not be desired if you export invoice data e.g. to JSON and use that as input for further processing.

### Configuration

This bundle adds one new configuration to the "Invoice settings", which can be configured via the global `Settings` 
screen or from the invoice screen directly.


{% capture alert_note %}
The [enhanced invoicing plugin]({% link _store/keleo-invoice-bundle.md %}) offers the same features and more. 
Do not mix these two plugins
{% endcapture %}

{% assign alert_note = alert_note| markdownify %}

{% include alert.html type="warning" alert=alert_note %}
