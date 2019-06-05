---
title: "Translations / i18n"
description: i18n, language specific configurations and the translation files
toc: true
---


Languages and translations in Kimai are completely configurable. 
Read below how to add a new language and configure the output formats for date and time values.  

{{ site.features.multi-language }}

## Language files

We try to keep the number of language files small, in order to make it easier to identify the location of application messages and to unify the codebase.

- If you add a new key, you have to add it at least in the `en` version as well (as english is the fallback language)
- Its very likely that you want to edit the file `messages` as it holds 90% of our application translations 

The files in `translations/` as a quick overview:

- `about` - the about screen with license information
- `daterangepicker` - the daterange picker dialog to choose a timeframe in screens with data-tables
- `exceptions` - error pages and exception handlers
- `flashmessages` - success and error messages (alerts), whichwill be shown after submitting data
- `invoice-calculator` - invoice calculator types (see `Adding invoice calculator` in [developers]({% link _documentation/developers.md %})-section)
- `invoice-numbergenerator` - invoice calculator (see `Adding invoice-number generator ` in [developers]({% link _documentation/developers.md %})-section)
- `invoice-renderer` - holds translations of all invoice templates ([read more]({% link _documentation/invoices.md %}))
- `messages` - most of the visible application translations (like menu, buttons and forms)
- `pagerfanta` - includes the translations for the pagination component below data-tables
- `plugins` - the plugin screen
- `system-configuration` - all system configuration, which can be changed through the UI
- `validators` - related to violations/validation of submitted form data (or API calls)

### Authentication screens

The authentication screens (login, registration, register account) are translated through the theme bundle which is used in Kimai.
The bundle can be [found here](https://github.com/kevinpapst/AdminLTEBundle) and the translations [in this directory](https://github.com/kevinpapst/AdminLTEBundle/tree/master/Resources/translations).

When you create a new translation, please open another PR there as well.

## Adding a new language

As example I choose a new hypothetical language with the locale `xx`. 

### Add translations

Copy each translation from it's english version `translations/*.en.xliff` and rename them to `translations/*.xx.xliff`.

Adjust the `date` and `target-language` attributes in the file header, as example for the new file `exceptions.xx.xliff`:
```yml
<file date="2018-08-01T20:00:00Z" source-language="en" target-language="xx" datatype="plaintext" original="exceptions.en.xliff">`
```

https://github.com/kevinpapst/AdminLTEBundle/tree/master/Resources/translations

### Configure locale formats

Adjust the file `config/packages/kimai.yaml` and add the language settings below the key `kimai.languages`: 
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

### Register locale

Append the new locale in the file `config/services.yaml` at `parameters.app_locales` divided by a pipe:

```yaml
parameters:
    locale: en
    app_locales: en|de|ru|it|xx
```

### Import frontend locales

Make sure the new locale is included in the frontend dependencies. For example Kimai includes moment.js, which ships its own translations.
Kimai ONLY compiles the moment.js locales which are needed. 
Check and adapt the JS files in the `assets/` directory:
- [app.js](https://github.com/kevinpapst/kimai2/blob/master/assets/app.js) 

```
const Moment = require('moment');
global.moment = Moment;
require('moment/locale/xx');
```

- [calendar.js](https://github.com/kevinpapst/kimai2/blob/master/assets/calendar.js) 
```
require('fullcalendar');
require('fullcalendar/dist/locale/xx');
```

### Date and time formats

Kimai uses configurations from `kimai.yaml` to format the values in the frontend. 
It also uses the configurations to convert between javascript components (e.g. the date-picker) and the PHP backend,
so they must create the same output. 

## 12-hour format

Kimai uses 24 hour format by default. If your locale typically uses the 12 hour am/pm format, you have to adjust the locale config at the key `24_hours` like this:

```yaml
kimai:
    languages:
        xx:
            date_time_type: 'yyyy-MM-dd hh:mm a'
            date_type: 'yyyy-MM-dd'
            date: 'Y-m-d'
            date_time: 'm-d H:i'
            duration: '%%h:%%m h'
            time: 'h:i a'
            24_hours: false
```

## Check for missing translations

You can search for missing keys by issuing this command (replace `xx` with your locale):
```bash
bin/console debug:translation --only-missing de
```

## Finalization

- Sent in a PR with your changes
- [Update the documentation](https://github.com/kimai/www.kimai.org/blob/master/_features/multi-language.md), which states all available translations
