---
title: Branding your Kimai
description: Customize Kimai with your company name and logo
---

Kimai offers the followinh configuration settings, to adapt the branding to your company.

## What can be customized?

- You can change the login screen and add your `logo`
- You can replace the application name with your `company` name (approx. 15-20 character)
- You can replace the `mini` version "KTT" with an abbreviation for your company name (3 chars max)
- The browser `title` can be replaced as well

If you remove the `logo`, the value of `company` will be used in the login screen.

{% capture allowed_tags %}
The settings for `company` and `mini` name can contain the HTML tags `<b><i><u><strong><em><img><svg>` for formatting. 
{% endcapture %}
{% assign allowed_tags = allowed_tags|markdownify %}
{% include alert.html icon="fas fa-exclamation" type="warning" alert=allowed_tags %}

If you want to show more character in `company`, you can use the [CustomCSS plugin]({% link _store/keleo-css-custom-bundle.md %}) to adapt eg. the font size.

#### Configure via local.yaml

```yaml
kimai:
    theme:
        branding:
            logo: "https://www.kimai.org/assets/icon/apple-touch-icon.png"
            company: Acme University
            mini: AC
            title: Awesome!
```

## Translations

If you want/need to replace some default translations (eg. they don't reflect your industry), then you can add a translation file 
which will used as first translation source. 

First you create a file `my-company.en.xlf` either in the `translations/` directory or in 
the translation directory of your custom plugin at `Resources/translations/`.

Then activate the file by changing your [local.yaml]({% link _documentation/configurations.md %}):

```yaml
kimai:
    theme:
        branding:
            translation: my-company
```
