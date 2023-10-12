 
### {{ site.data[page.lang].translation.install.requirements.title }}

{{ site.data[page.lang].translation.install.requirements.hosters }}

- {{ site.data[page.lang].translation.install.requirements.version | replace: "%version%", "8.1" }}
    - {{ site.data[page.lang].translation.install.requirements.extensions }} `mbstring`, `gd`, `intl`, `json`, `pdo`, `tokenizer`, `xml`, `zip`
- {{ site.data[page.lang].translation.install.requirements.database }}
- {{ site.data[page.lang].translation.install.requirements.webserver }}
- {{ site.data[page.lang].translation.install.requirements.subdomain }}
- {{ site.data[page.lang].translation.install.requirements.browser }}

## {{ site.data[page.lang].translation.install.download.title }}

{{ site.data[page.lang].translation.install.download.intro | markdownify }}

{% capture docu_link %}
[{{ site.data[page.lang].translation.menu.default.documentation.name }}]({% link _documentation/installation.md %})
{% endcapture %}

{% assign shared_hosting = site.data[page.lang].translation.install.download.alert-vps | replace: "%documentation%", docu_link | markdownify %}
{% include alert.html type="warning" alert=shared_hosting %}
 
