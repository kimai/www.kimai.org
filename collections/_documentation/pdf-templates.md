---
title: PDF templates
description: Kimai supports custom PDF templates in the invoice and export screens 
canonical: /documentation/pdf-templates.html
related:
  - invoices
  - export
---

PDF templates are basically the same as Twig templates (which themselves create HTML).
The generated HTML is processed by the [MPdf library](https://mpdf.github.io), which will convert the HTML and CSS to PDF.

There are some additional contents ([that need special markup](https://mpdf.github.io/reference/html-control-tags/overview.html)), which define e.g. the page header and footer. 
Please read the MPdf documentation and check the default PDF templates.

## Setting options

You can customize many [mPDF options](https://mpdf.github.io/reference/mpdf-functions/construct.html) and [configurations](https://mpdf.github.io/reference/mpdf-variables/overview.html) like the page format with the `pdfContext.setOption(name, value)` syntax:

```twig
{% raw %}{%- set option = pdfContext.setOption('name', 'value') -%}{% endraw %}
```

## Changing the filename


```twig
{% raw %}{%- set customer = query.customers|length == 1 ? query.customers.0 : null -%}
{%- set filename = 'ACME_' ~ (customer is not null ? customer.name|replace({' ': '-'}) ~ '_' : '') ~ query.begin|date_format('Y-m') -%}
{%- set option = pdfContext.setOption('filename', filename) -%}{% endraw %}
```

## PDF/A compliance

You can create a [PDF/A1-b compliant](https://mpdf.github.io/what-else-can-i-do/pdf-a1-b-compliance.html) document by setting
these configurations in your template:

```twig
{% raw %}{%- set option = pdfContext.setOption('PDFA', true) -%}
{%- set option = pdfContext.setOption('PDFAauto', true) -%}{% endraw %} 
```

## Fonts

You can change the used font for your PDF templates. 

### Available fonts

The PDF engine comes with many fonts that can be used without the need for installing fonts in your computer system.

- Defaults: `times`, `serif`, `helvetica`, `sans`, `sans`, `courier`, `monospace`
- Built-in: `dejavusanscondensed`, `dejavusans`, `dejavuserif`, `dejavuserifcondensed`, `dejavusansmono`, `freesans`, `freeserif`, `freemono`, `ocrb`, `abyssinicasil`, `aboriginalsans`, `jomolhari`, `taiheritagepro`, `aegean`, `aegyptus`, `akkadian`, `quivira`, `lannaalif`, `daibannasilbook`, `garuda`, `khmeros`, `dhyana`, `tharlon`, `padaukbook`, `zawgyi-one`, `ayar`, `taameydavidclm`, `mph2bdamase`, `briyaz`, `lateef`, `sun-exta`, `unbatang`

### Default fonts

If you want to use another default font, you can easily change the font for the entire document by adding a bit of CSS:

```twig
{% raw %}<style type="text/css">
body { font-family: Helvetica, Dejavu, Arial, sans-serif; }
</style>{% endraw %} 
```

### Custom fonts

If you want to use a custom font in your PDF, you can configure it like that:

```twig
{% raw %}{%- set fontData = pdfContext.setOption('fonts', {
'demo': {
    'R': 'Demo-Regular.ttf',
    'B': 'Demo-Bold.ttf',
    'I': 'Demo-Italic.ttf',
    'BI': 'Demo-BoldItalic.ttf'
}
}) -%}
<style>
body { 
    font-family: 'demo', sans-serif;
}
</style>{% endraw %} 
```

The font files must be stored in the directory `var/data/fonts/` within the Kimai directory, in this case it would be:

- `var/data/fonts/Demo-Regular.ttf`
- `var/data/fonts/Demo-Bold.ttf`
- `var/data/fonts/Demo-Italic.ttf`
- `var/data/fonts/Demo-BoldItalic.ttf`

### Missing character

The default font used in the PDFs does not support certain character ranges, which will usually result in the ☐ box symbol, that symbolizes any character that is not available in the used font.
Unfortunately it is still not out of the box possible to render or display right-to-left, cyrillic and asian languages in PDFs.
Please read the relevant [MPDF documentation](https://mpdf.github.io/fonts-languages/fonts-in-mpdf-7-x.html) about fonts and them the chapter about all [available fonts](https://mpdf.github.io/fonts-languages/available-fonts-v6.html).
As last resort (and only after trying the below hints) read these Adobe [docs](https://helpx.adobe.com/acrobat/using/asian-cyrillic-right-to-left.html) and try the downloadable font pack for
[Windows](https://helpx.adobe.com/in/acrobat/kb/windows-font-packs-32-bit-reader.html#Requirements) and [macOS](https://helpx.adobe.com/in/acrobat/kb/macintosh-font-packs--acrobat---reader-.html).

The following font/language combinations were successfully used by the community.
Activate them in your template by using e.g. this CSS: `body { font-family: sun-exta, unbatang, sans-serif; }`

- **Hebrew** works with `helvetica`, `sans`, `dejavusanscondensed`, `dejavusans`, `freesans`, `freeserif`, `freemono`, `quivira`, `mph2bdamase`, `sun-exta`
- **Cyrillic** works with `times`, `sans`, `courier`, `helvetica`, `serif`, `monospace`, `mono`, `dejavusanscondensed`, `dejavusans`, `dejavuserif`, `dejavusansmono`, `freesans`, `freeserif`, `freemono`, `quivira`, `mph2bdamase`, `sun-exta`, `unbatang`
- **Japanese** works with `sun-exta` and `unbatang`, which can be downloaded from [here](https://www.alanwood.net/downloads/index.html) (if missing on your system)

### Font debugging

You can use the following template to debug fonts. Replace the sentence `The quick brown fox jumps over the lazy dog` with the text you want to test.

```twig
{% raw %}{%- set defaultFonts = ['times', 'serif', 'helvetica', 'sans', 'sans', 'courier', 'monospace', 'mono'] -%}
{%- set builtInFonts = ["dejavusanscondensed", "dejavusans", "dejavuserif", "dejavuserifcondensed", "dejavusansmono", "freesans", "freeserif", "freemono", "ocrb", "abyssinicasil", "aboriginalsans", "jomolhari", "taiheritagepro", "aegean", "aegyptus", "akkadian", "quivira", "lannaalif", "daibannasilbook", "garuda", "khmeros", "dhyana", "tharlon", "padaukbook", "zawgyi-one", "ayar", "taameydavidclm", "mph2bdamase", "xbriyaz", "lateef", "sun-exta", "unbatang"] -%}
{%- set fontData = pdfContext.setOption('fonts', customFonts) -%}
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Font Demo</title>
</head>
<body>
    <h2>Default PDF fonts</h2>
    {% for fontName in defaultFonts %}
        <p style="font-family: {{ fontName }}">The quick brown fox jumps over the lazy dog ({{ fontName }})</p>
    {% endfor %}
    <pagebreak />
    <h2>Built-In fonts</h2>
    {% for fontName in builtInFonts %}
        <p style="font-family: {{ fontName }}">The quick brown fox jumps over the lazy dog ({{ fontName }})</p>
    {% endfor %}
</body>
</html>{% endraw %}
```

## Page size

Want to display the PDF in a different size, e.g. because your customer expects `US-Letter` and not the standard size `DIN-A4`?
Xou can add a CSS rule to your twig template:
```twig
{% raw %}<style>
@page { 
    sheet-size: LETTER-L;
}
</style>{% endraw %} 
```

You could also try to set the page-size via `options`:
```twig
{% raw %}{%- set option = pdfContext.setOption('format', 'A4-L') -%}{% endraw %}
```

Available sizes are:
- `A4`, `A3`, `Letter`, `Legal`, `Executive`, `Folio`, `Demy`, `Royal`, `A`, `B`, `Ledger`, `Tabloid` ...
- `A4-L`, `A3-L`, `Letter-L`, `Legal-L`, `Executive-L`, `Folio-L` ... for landscape

More information available in the [MDPF documentation](https://mpdf.github.io/paging/different-page-sizes.html) and the
full list of available sizes [can be found here](https://mpdf.github.io/reference/mpdf-functions/construct.html) (check `format`).

## Embedding images

The best way to embed an image is a base64 encoded PNG image:

- Convert your image to PNG
- Encode the image file with `base64`, e.g. with the bash command `base64 -i image-file.png` or some [online](https://www.base64-image.de/) [tool](https://base64.guru/converter/encode/image)
- Save the base64 string as Twig variable
- Add the img tag to your template

```twig
{% raw %}{% set logo = 'A-VERY-LONG-STRING-HERE==' %}
<img style="height: 150px;margin: 10px;" src="data:image/png;base64,{{ logo }}" />{% endraw %}
```

It is also possible to include images via absolute URLs like
```twig
{% raw %}{% set logo = 'A-VERY-LONG-STRING-HERE==' %}
<img style="height: 150px;margin: 10px;" src="https://www.kimai.org/images/kimai_logo.png" />{% endraw %}
```
