---
title: "Switch to AM/PM"
description: Using AM/PM instead of 24h-format
toc: false
---

If you want to know more about translations and the general date format configuration, read the [Translations and i18n documentation]({% link _documentation/translations.md %}).

## AM/PM format

Kimai uses 24 hour format by default. 

If you want to use the AM/PM format instead, you can set the locale config key `24_hours` to `false` to activate it.
The changes need to be applied in your [local.yaml]({% link _documentation/configurations.md %}). 

This example uses the locale `en`:

```yaml
kimai:
    languages:
        en:
            date_time_type: 'yyyy-MM-dd hh:mm a'
            date_type: 'yyyy-MM-dd'
            date: 'Y-m-d'
            date_time: 'm-d H:i'
            duration: '%%h:%%m h'
            time: 'h:i a'
            24_hours: false
```

After making these changes, you need to recompile the cache:

{% include cache-refresh.html %} 

