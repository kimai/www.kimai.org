---
title: "Switch to AM/PM"
description: Using AM/PM instead of 24h-format
toc: false
---

Kimai uses the 24-hour format by default.

If you want to use the AM/PM format instead, you can set the locale config key `24_hours` to `false` to activate it.
The changes need to be applied in your [local.yaml]({% link _documentation/local-yaml.md %}).

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

After making these changes, you need to [reload the cache]({% link _documentation/cache.md %}).

