---
title: "Translations / i18n"
description: i18n, language specific configurations and the translation files
toc: true
redirect_from:
  - /documentation/developer/translations.html
  - /documentation/translations/
---

Kimai can be localized to any language and is already translated to
{% include features/multi-language.md %}

Feel free to send your self-made language files or contributing to the weblate project below  – we’re looking for translators and would appreciate your support!

| Language               | Status                                                                                                                                    |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Arabic                 | [![Translation status](https://hosted.weblate.org/widgets/kimai/ar/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/ar/)           |
| Basque                 | [![Translation status](https://hosted.weblate.org/widgets/kimai/eu/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/eu/)           |
| Chinese                | [![Translation status](https://hosted.weblate.org/widgets/kimai/zh_Hans/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/zh_Hans/) |
| Croatian               | [![Translation status](https://hosted.weblate.org/widgets/kimai/hr/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/hr/)           |
| Czech                  | [![Translation status](https://hosted.weblate.org/widgets/kimai/cs/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/cs/)           |
| Danish                 | [![Translation status](https://hosted.weblate.org/widgets/kimai/da/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/da/)           |
| Dutch                  | [![Translation status](https://hosted.weblate.org/widgets/kimai/nl/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/nl/)           |
| English                | [![Translation status](https://hosted.weblate.org/widgets/kimai/en/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/en/)           |
| Esperanto              | [![Translation status](https://hosted.weblate.org/widgets/kimai/eo/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/eo/)           |
| Faroese                | [![Translation status](https://hosted.weblate.org/widgets/kimai/fo/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/fo/)           |
| Finnish                | [![Translation status](https://hosted.weblate.org/widgets/kimai/fi/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/fi/)           |
| French                 | [![Translation status](https://hosted.weblate.org/widgets/kimai/fr/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/fr/)           |
| German                 | [![Translation status](https://hosted.weblate.org/widgets/kimai/de/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/de/)           |
| German (Swiss)         | [![Translation status](https://hosted.weblate.org/widgets/kimai/de_CH/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/de_CH/)     |
| Greek                  | [![Translation status](https://hosted.weblate.org/widgets/kimai/el/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/el/)           |
| Hebrew                 | [![Translation status](https://hosted.weblate.org/widgets/kimai/he/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/he/)           |
| Hungarian              | [![Translation status](https://hosted.weblate.org/widgets/kimai/hu/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/hu/)           |
| Italian                | [![Translation status](https://hosted.weblate.org/widgets/kimai/it/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/it/)           |
| Japanese               | [![Translation status](https://hosted.weblate.org/widgets/kimai/ja/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/ja/)           |
| Korean                 | [![Translation status](https://hosted.weblate.org/widgets/kimai/ko/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/ko/)           |
| Persian                | [![Translation status](https://hosted.weblate.org/widgets/kimai/fa/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/fa/)           |
| Polish                 | [![Translation status](https://hosted.weblate.org/widgets/kimai/pl/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/pl/)           |
| Portuguese             | [![Translation status](https://hosted.weblate.org/widgets/kimai/pt/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/pt/)           |
| Portuguese (Brazilian) | [![Translation status](https://hosted.weblate.org/widgets/kimai/pt_BR/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/pt_BR/)     |
| Romanian               | [![Translation status](https://hosted.weblate.org/widgets/kimai/ro/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/ro/)           |
| Russian                | [![Translation status](https://hosted.weblate.org/widgets/kimai/ru/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/ru/)           |
| Slovakian              | [![Translation status](https://hosted.weblate.org/widgets/kimai/sk/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/sk/)           |
| Spanish                | [![Translation status](https://hosted.weblate.org/widgets/kimai/es/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/es/)           |
| Swedish                | [![Translation status](https://hosted.weblate.org/widgets/kimai/sv/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/sv/)           |
| Turkish                | [![Translation status](https://hosted.weblate.org/widgets/kimai/tr/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/tr/)           |
| Vietnamese             | [![Translation status](https://hosted.weblate.org/widgets/kimai/vi/svg-badge.svg)](https://hosted.weblate.org/engage/kimai/vi/)           |

Languages and translations in Kimai are configurable. 
Read below how to add a new language and configure the output formats for date and time values.  

## Language files

We try to keep the number of language files small, in order to make it easier to identify the location of application messages and to unify the codebase.

- If you add a new key, you have to add it at least in the `en` version as well (as english is the fallback language)
- It's very likely that you want to edit the file `messages` as it holds 90% of our application translations 

The files in `translations/` as a quick overview:

- `about` - the about screen with license information
- `actions` - the "action" dropdowns in all data-tables
- `email` - contents for the system emails generated by Kimai (eg. user registration and password reset)
- `daterangepicker` - the date range picker dialog to choose a timeframe in screens with data-tables
- `exceptions` - error pages and exception handlers
- `flashmessages` - success and error messages (alerts), which will be shown after submitting data
- `invoice-calculator` - invoice calculator types (see `Adding invoice calculator` in [developers]({% link _documentation/developers.md %})-section)
- `invoice-numbergenerator` - invoice calculator (see `Adding invoice-number generator ` in [developers]({% link _documentation/developers.md %})-section)
- `invoice-renderer` - holds translations of all invoice templates ([read more]({% link _documentation/invoices.md %}))
- `messages` - most of the visible application translations (like menu, buttons and forms)
- `plugins` - the plugin screen
- `system-configuration` - all system configuration, which can be changed through the UI
- `tags` - the tags administration screen
- `teams` - the team administration screen
- `validators` - related to violations/validation of submitted form data (or API calls)

{% capture cache %}
If you apply changes to any files mentioned on this page, you have to [clear the cache]({% link _documentation/cache.md %}).
{% endcapture %}
{% assign cache = cache|markdownify %}
{% include alert.html type="danger" alert=cache %}

### Authentication screens

The authentication screens (login, registration, register account) are translated through the theme bundle which is used in Kimai.
The bundle can be [found here](https://github.com/kevinpapst/AdminLTEBundle) and the translations [in this directory](https://github.com/kevinpapst/AdminLTEBundle/tree/master/Resources/translations).

When you create a new translation, please open a Pull Request in this repository as well.

## Adding a new language

In the next section I will explain how to add a new language with the (not existing) locale `xx`. 

### Add translations

Copy each translation from it's english version `translations/*.en.xlf` and rename them to `translations/*.xx.xlf`.

Adjust the `target-language` attributes in the file header, as example for the new file `exceptions.xx.xlf`:
```yml
<file source-language="en" target-language="xx" datatype="plaintext" original="exceptions.en.xlf">`
```

### Adding a language variant

For a language variant `xx_YY`, the fallback will always be the base language `xx` (eg. `de` for `de_CH`). 

Only some specific keys may need to be changed for this variant and its possible to add only the respective files like i.e. `translations/messages.de_CH.xlf` including only the changed translations:

```xml
<?xml version="1.0" encoding="utf-8"?>
<xliff version="1.2" xmlns="urn:oasis:names:tc:xliff:document:1.2">
    <file source-language="de" target-language="de-CH" datatype="plaintext" original="messages.en.xlf">
        <body>
            <trans-unit resname="action.close">
                <source>action.close</source>
                <target>Schliessen</target>
            </trans-unit>
        </body>
    </file>
</xliff>
```

### Configure locale formats

Adjust the file `config/packages/kimai.yaml` and add the language (or the language variant) settings below the key `kimai.languages`:
 
```yaml
kimai:
    languages:
        # copy all settings from 'en' and adjust them to your language
        xx:
            date_time_type: 'yyyy-MM-dd HH:mm'
            date_type: 'yyyy-MM-dd'
            date: 'Y-m-d'
            date_time: 'm-d H:i'
            duration: '%%h:%%m h'
```

This is not necessary if your language uses the same configuration like `en`, which will be used as fallback.
You only have to overwrite the keys that are different, so if you new language `xx` only has a different duration format, then adding this is sufficient:

```yaml
kimai:
    languages:
        # copy all settings from 'en' and adjust them to your language
        xx:
            duration: '%%h hours and %%m minutes'
```

### Register locale

Add the new locale (or the locale variant) in the file `config/services.yaml` at `parameters.app_locales` divided by a pipe:

```yaml
parameters:
    locale: en
    app_locales: en|de|ru|it|xx
```

### Import frontend locales

{% include alert.html type="warning" icon="fas fa-exclamation" alert="You can skip this step, we will do it with when we test your changes." %}

Make sure the new locale is included in the frontend dependencies. For example Kimai includes moment.js, which ships its own translations.
Kimai ONLY compiles the moment.js locales which are needed. 
Check and adapt the JS files in the `assets/` directory:
- [app.js]({{ site.kimai_v2_repo }}/blob/master/assets/app.js) 
```
const Moment = require('moment');
global.moment = Moment;
require('moment/locale/xx');
```

- [calendar.js]({{ site.kimai_v2_repo }}/blob/master/assets/calendar.js) 
```
require('fullcalendar');
require('fullcalendar/dist/locale/xx');
```

Be careful with the naming of language variants, in JS the variants are written like xx-yy, not xx_YY. To be sure please check [the moment.js locales](https://github.com/moment/moment/tree/develop/locale).

### Number formats

The number formats on the Kimai frontend as well as in the invoices are defined by the frontend locales. If you get wrong decimal separator or thousands separator keys, please import the correct frontend locale as described above.

### Date and time formats

Kimai uses configurations from `kimai.yaml` to format the values in the frontend. 
It also uses the configurations to convert between javascript components (e.g. the date-picker) and the PHP backend,
so they must create the same output. 

## AM/PM format

Kimai uses the 24-hour format by default but can be switched to use AM/PM instead, please read the [AM/PM format documentation]({% link _documentation/i18n-am-pm.md %}) to find out how.

## Validate your changes

This will validate if the technical changes are okay / if the changed and new files can be used by Kimai:

```
bin/console lint:xliff translations
```

## Check for missing translations

You can search for missing keys by issuing this command (replace `xx` with your locale):
```bash
bin/console debug:translation --only-missing de
```

or
```
bin/console translation:update --dump-messages --force de
```

## Finalization

- Sent in a PR with your changes
- [Update the documentation](https://github.com/kimai/www.kimai.org/blob/master/_includes/features/multi-language.md), which states all available translations
