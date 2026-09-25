{% if page.lang == 'de' %}
    {% assign t_title_subprocessors = "Unterauftragsverarbeiter für Kimai Cloud" %}
    {% assign t_intro_subprocessors = "Diese Dienstleister verarbeiten Daten, die Kunden in ihrer Kimai Cloud erfassen, in unserem Auftrag auf Grundlage eines Vertrags nach Art. 28 DSGVO." %}
    {% assign t_title_recipients = "Empfänger im Rahmen unserer eigenen Verarbeitung" %}
    {% assign t_intro_recipients = "Diese Dienstleister verarbeiten keine Daten aus den Kimai Clouds unserer Kunden. Sie sind an der Registrierung, der Zahlungsabwicklung, dem Betrieb unserer Webseite oder am Verkauf von Plugins für selbst gehostete Installationen beteiligt. Ein Teil von ihnen ist datenschutzrechtlich eigenständig verantwortlich." %}
    {% assign t_cloud_owner = "Cloud Eigentümer" %}
    {% assign t_independent_controller = "eigenständig verantwortlich" %}
    {% assign t_optional_usage = "Optionale Nutzung" %}
    {% assign t_optional_usage_text = "nur, wenn die Anmeldung am Kundenkonto über den jeweiligen Anbieter gewählt wird." %}
    {% assign t_website_visitors = "Webseiten Besucher" %}
    {% assign t_google_website = "YouTube Videos (erst nach Start des Videos), reCAPTCHA bei der manuellen Registrierung, Webfonts" %}
    {% assign t_onpremise_customers = "OnPremise Kunden" %}
    {% assign t_onpremise_intro = "Beide Anbieter verkaufen die Plugins im eigenen Namen und sind dabei eigenständig verantwortlich." %}
{% else %}
    {% assign t_title_subprocessors = "Sub-processors for Kimai Cloud" %}
    {% assign t_intro_subprocessors = "These providers process data that customers record in their Kimai Cloud on our behalf, under a contract pursuant to Art. 28 GDPR." %}
    {% assign t_title_recipients = "Recipients for our own processing" %}
    {% assign t_intro_recipients = "These providers do not process any data from our customers' Kimai Clouds. They are involved in registration, payment processing, the operation of our website or the sale of plugins for self-hosted installations. Some of them act as independent controllers." %}
    {% assign t_cloud_owner = "Cloud owner" %}
    {% assign t_independent_controller = "independent controller" %}
    {% assign t_optional_usage = "Optional usage" %}
    {% assign t_optional_usage_text = "only if the respective provider is chosen to sign in to the customer account." %}
    {% assign t_website_visitors = "Website visitors" %}
    {% assign t_google_website = "YouTube videos (only after starting a video), reCAPTCHA during manual registration, webfonts" %}
    {% assign t_onpremise_customers = "OnPremise customers" %}
    {% assign t_onpremise_intro = "Both providers sell the plugins in their own name and act as independent controllers." %}
{% endif %}

#### {{ t_title_subprocessors }}

{{ t_intro_subprocessors }}

**Brevo**: Emails, Newsletter, [Link](https://www.brevo.com/), [Privacy policy](https://www.brevo.com/legal/privacypolicy/)  
Sendinblue GmbH, Köpenicker Straße 126, 10179 Berlin, Germany

**Hetzner**: Server Hosting, [Link](https://www.hetzner.com/), [Privacy policy](https://www.hetzner.com/rechtliches/datenschutz)  
Hetzner Online GmbH, Industriestr. 25, 91710 Gunzenhausen, Germany

**Mailbox**: Support Emails, [Link](https://mailbox.org/), [Privacy policy](https://mailbox.org/en/data-protection/)  
Heinlein Hosting GmbH, Schwedter Straße 8/9B, 10119 Berlin, Germany

#### {{ t_title_recipients }}

{{ t_intro_recipients }}

##### {{ t_cloud_owner }}

**Stripe**: Payment and Invoices ({{ t_independent_controller }}), [Link](https://stripe.com), [Privacy policy](https://stripe.com/ie/legal/dpa)  
Stripe Payments Europe Limited, The One Building, 1 Grand Canal Street Lower, Dublin 2, Ireland

**{{ t_optional_usage }}:** {{ t_optional_usage_text }}

**GitHub**: Cloud OAuth login, [Link](https://github.com), [Privacy policy](https://github.com/site/privacy)  
GitHub, Inc., 88 Colin P. Kelly Jr. Street, San Francisco, CA 94107, USA

**Google**: Cloud OAuth login, [Link](https://www.google.com), [Privacy policy](https://policies.google.com/privacy)  
Google Ireland Limited, Gordon House, Barrow Street, Dublin 4, Ireland

##### {{ t_website_visitors }}

**Google**: {{ t_google_website }}, [Link](https://www.google.com), [Privacy policy](https://policies.google.com/privacy)  
Google Ireland Limited, Gordon House, Barrow Street, Dublin 4, Ireland

##### {{ t_onpremise_customers }}

{{ t_onpremise_intro }}

**Gumroad**: Plugin Marketplace, [Link](https://gumroad.com/), [Privacy policy](https://gumroad.com/privacy)  
Gumroad, Inc., 548 Market St, San Francisco, CA 94104-5401, USA

**Lemon Squeezy**: Plugin Marketplace, [Link](https://www.lemonsqueezy.com), [Privacy policy](https://www.lemonsqueezy.com/privacy)  
Lemon Squeezy, 222 Main Street Suite 500, Salt Lake City, UT 84101, USA
