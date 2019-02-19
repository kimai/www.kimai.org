---
title: Translations
description: i18n, language specific configurations and the translation files
---

Languages and translations in Kimai are completely configurable. 
Read below how to add a new language and configure the output formats for date and time values.  

## Language files

We try to keep the number of language files small, in order to make it easier to identify the location of application messages and to unify the codebase.

- If you add a new key, you have to add it at least in the `en` version as well (as english is the fallback language)
- Its very likely that you want to edit the file `messages` as it holds 90% of our application translations 

The files in `translations/` as a quick overview:

- `exceptions` only holds translations of error pages and exception handlers
- `flashmessages` hold all success and error messages, that will be shown as results from action calls after page reload
- `messages` holds most of the visible application translations (like all the static UI elements and form translations)
- `pagerfanta` includes the translations for the pagination component
- `sidebar` holds all the translations of the right sidebar
- `validators` only holds translations related to violations/validation of submitted form data (or API calls)
- `invoice-calculator` holds translations of calculator types (see `Adding invoice calculator` in [developers]({% link _documentation/developers.md %})-section)
- `invoice-numbergenerator` holds translations of the invoice calculator (see `Adding invoice-number generator ` in [developers]({% link _documentation/developers.md %})-section)
- `invoice-renderer` holds translations of all invoice templates ([read more]({% link _documentation/invoices.md %}))

## Adding a new language

As example I choose a new hypothetical language with the locale `xx`. 

Copy each translation file from `translations/*.en.xliff` and rename them to `translations/*.xx.xliff`.

Adjust the `target-language` in the file header, as example for the new file `exceptions.xx.xliff`:
```yml
<file date="2018-08-01T20:00:00Z" source-language="en" target-language="xx" datatype="plaintext" original="exceptions.en.xliff">`
```

Adjust the file `config/packages/kimai.yaml` and add the language settings below the key `kimai.languages`: 
```yaml
kimai:
    languages:
        # copy all settings from 'en' and adjust them to your language
        xx:
            date_time_type: 'yyyy-MM-dd HH:mm'
            date_time_picker: 'YYYY-MM-DD HH:mm'
            date_type: 'yyyy-MM-dd'
            date_picker: 'YYYY-MM-DD'
            date: 'Y-m-d'
            date_time: 'm-d H:i'
            duration: '%%h:%%m h'
```

Append the new locale in the file `config/services.yaml` at `parameters.app_locales` divided by a pipe:

```yaml
parameters:
    locale: en
    app_locales: en|de|ru|it|xx
```

### Date and time formats

Kimai uses the configurations in `kimai.yaml` to format the values in the frontend. 
It also uses the configurations to convert between javascript components (e.g. the date-picker) and the PHP backend,
so they must create the same output. 

The settings ending with `_type` are the ones used in PHP where the ones ending with `_picker` are used in javascript.

## Check for missing translations

When you search for missing keys, please use this command:
```bash
bin/console debug:translation --only-missing de
```
and replace `de` with your locale. 