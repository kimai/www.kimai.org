You can customize the following values from within your PDF templates:
- many [mPDF options](https://mpdf.github.io/reference/mpdf-functions/construct.html) and [configurations](https://mpdf.github.io/reference/mpdf-variables/overview.html) like the page format
- the generated filename by using the option named `filename`

```twig
{% raw %}{%- set customer = query.customers|length == 1 ? query.customers.0 : null -%}
{%- set filename = 'ACME_' ~ (customer is not null ? customer.name|replace({' ': '-'}) ~ '_' : '') ~ query.begin|date_format('Y-m') -%}
{%- set option = pdfContext.setOption('filename', filename) -%}
{%- set option = pdfContext.setOption('format', 'A4-L') -%}{% endraw %}
```

#### PDF/A compliance

You can create a [PDF/A1-b compliant](https://mpdf.github.io/what-else-can-i-do/pdf-a1-b-compliance.html) document by setting 
these configurations in your template:

```twig
{% raw %}{%- set option = pdfContext.setOption('PDFA', true) -%}
{%- set option = pdfContext.setOption('PDFAauto', true) -%}{% endraw %} 
```

#### Custom fonts

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

#### Page size

Want to display the PDF in a different size, e.g. because your customer expects `US-Letter` and not the standard size `DIN-A4`?
Xou can add a CSS rule to your twig template:
```twig
{% raw %}<style>
@page { 
    sheet-size: LETTER-L;
}
</style>{% endraw %} 
```

Available sizes are:
- `A4`, `A3`, `Letter`, `Legal`, `Executive`, `Folio`, `Demy`, `Royal`, `A`, `B`, `Ledger`, `Tabloid` ...
- `A4-L`, `A3-L`, `Letter-L`, `Legal-L`, `Executive-L`, `Folio-L` ... for landscape

More information available in the [MDPF documentation](https://mpdf.github.io/paging/different-page-sizes.html) and the
full list of available sizes [can be found here](https://mpdf.github.io/reference/mpdf-functions/construct.html) (check `format`).
