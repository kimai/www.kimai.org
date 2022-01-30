---
title: Invoice plugin for Kimai
name: Enhanced invoicing plugin
intro: "Enhanced invoicing features: change locale for money and date values, automatic timesheet proof PDF for new invoices."
slug: invoice-bundle
developer: kevinpapst
date: "2022-01-22 20:00:00 +0200"
icon: fas fa-file-invoice-dollar
demo: true 
price: "0€"
gumroad: kimai-invoice
featured: "Enhanced invoicing features: change format locale, automatic timesheet proof PDF for new invoices."
new: true
toc: false
type: featured
tags:
  - plugin
bundle:
  name: "InvoiceBundle"
  purchase: true
  versions:
    - ["1.1 - 1.2", "1.17.1"]
    - ["1.0", "1.17"]
screenshots:
  - 
    src: "/images/marketplace/invoice-fullscreen.png"
    title: Invoice configuration
    description: The new configuration settings for export template and format language
  - 
    src: "/images/marketplace/invoice-configuration.png"
    title: Invoice configuration
    description: Detail screenshot of the new invoice settings for format language and export template
---

{% include pay-what-you-want.md %}

You can test the Plugin in the [Plugin demo]({% link _pages/demo.md %}).

Full documentation available [in the documentation]({% link _documentation/plugin-invoice.md %}).
  
## Features 

{% include plugins/invoice.md %}

{% capture alert_note %}
If you only want to change the locale, you can have a look at the [Fixed invoice data format plugin]({% link _store/keleo-invoice-format-fixation-bundle.md %}).
This plugin here does the same, but offers more features. 
{% endcapture %}

{% assign alert_note = alert_note| markdownify %}

{% include alert.html type="warning" alert=alert_note %}
