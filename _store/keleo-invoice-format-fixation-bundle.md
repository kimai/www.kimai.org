---
title: Invoice format fixation plugin for Kimai
name: Fixed invoice data format (by language)
intro: "A plugin that allows to set a global language for invoice data formats"
developer: keleo
date: "2020-10-26 16:00:00 +0200"
icon: fas fa-file-invoice-dollar
price: "0"
download: https://github.com/Keleo/InvoiceFormatFixationBundle/archive/master.zip
github: https://github.com/Keleo/InvoiceFormatFixationBundle
type: plugin
tags:
  - plugin
bundle:
  name: "InvoiceFormatFixationBundle"
  clone: "https://github.com/Keleo/InvoiceFormatFixationBundle.git" 
screenshots:
  - 
    src: "https://raw.githubusercontent.com/Keleo/InvoiceFormatFixationBundle/master/screenshot.png"
    title: Language configuration
    description: Configure the language for formatting all invoice settings 
---

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
