{% assign fieldName = include.field_name|default: 'duration' %}

The `{{ fieldName }}` field supports entering data in the following formats:

#### Time span

- Format: `{hours}:{minutes}`, `{hours}:{minutes}:{seconds}`
- Description: Seconds are optional, leading zero can be skipped, overflow is supported for every field
- Examples: `2:27` = 2 hours and 27 minutes, `3:143:13` = 5 hours and 23 minutes and 13 seconds

#### Time interval (ISO 8601)

- Format: `{hours}h`, `{hours}h{minutes}m`, `{hours}h{minutes}m{seconds}s`
- Description: Each section is optional, overflow is supported for every field, unit identifier can be written in lower and uppercase, seconds are supported but will be removed with activated rounding
- Examples: `2h` = 2 hours, `147m` = 2 hours and 27 minutes, `3h14m` = 3 hours and 14 minutes

#### Decimal duration

- Format: `{hours}`, `{hours,minutes in decimal}`, `{hours.minutes in decimal}`
- Description: Duration in hours, for decimal separator both `.`  and `,` are supported, minutes need to be given as decimal portion (eg. 30 minutes = 0.5)
- Examples: `1,5` = 1 hour and 30 minutes, `2` = 2 hours
