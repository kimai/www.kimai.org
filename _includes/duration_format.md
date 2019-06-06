{% assign fieldName = include.field_name|default: 'duration' %}

The `{{ fieldName }}` field supports entering data in the following formats:

| Format | Description | Examples |
|---|---|---|
| {hours}:{minutes}[:{seconds}] | Seconds are optional, overflow is supported for every field | `2:27` = 2 Hours, 27 Minutes / `3:143:13` = 5 Hours, 23 Minutes, 13 Seconds|
| {hours}h{minutes}m{seconds}s | Each section is optional, overflow is supported for every field | `2h` = 2 Hours / `147m` = 2 Hours, 27 Minutes / `3h14m13s` = 3 Hours, 14 Minutes, 13 Seconds |
| {seconds} | | `3600` = 1 Hour / `8820` = 2 Hours, 27 Minutes |
