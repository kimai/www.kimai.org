{% assign ct = include.counter %}
{% assign ct_plus = ct | replace: '}', '+100}' %}
{% assign ct_plus_one = ct | replace: '}', '+1}' %}
{% assign ct_minus = ct | replace: '}', '-1}' %}
{% assign ct_length = ct | replace: '}', ',4}' %}
{% assign ct_full = ct | replace: '}', '+100,5}' %}
{% assign ct_year = ct | replace: '}', ',3}' | prepend: '{Y}-' %}
{% assign ct_date = ct | prepend: '{y}{M}{D}-' %}
{% assign ct_prefix = ct | replace: '}', ',4}' | prepend: 'K-{Y}-' %}
Every {{ include.entity }} can have a `number`: a short identifier, which is shown in the listing and detail pages
and which is available in exports and invoice templates.

The number is optional, it is a free text field and by default it has to be unique.

#### Automatic number generation

Kimai calculates a number whenever a new {{ include.entity }} is created: when you open the
`create {{ include.entity }}` form, the `number` field is already pre-filled.
The same happens when {{ include.article }} {{ include.entity }} is created through the API{{ include.creation_hint }}.

The pre-filled value is only a suggestion:

- you can overwrite it or empty it before saving
- you can change it later on the edit screen
- existing {{ include.entities }} are never renumbered, a changed format only applies to newly created ones

The format is configured at `System > Settings > {{ include.section }} > {{ include.setting }}` and its
default value is `{{ ct_length }}`. If the format is emptied, no number will be generated and the field stays empty.

{% alert warning %}
The number is calculated when the create form is <b>opened</b>, not when it is saved.
If two users open the create form at the same time, both will see the same number and the second one to save
runs into the "number already used" validation error (unless duplicates are allowed, see below).
{% endalert %}

#### Format and replacer

The format is a free text, in which the following replacer can be used:

{% include snippets/number-format-replacer.md counter=include.counter entity=include.Entity %}

#### Counter

The counter `{{ ct }}` is **not** derived from the highest number in use, it is calculated from the
**amount of existing {{ include.entities }}**:

```
counter = amount of existing {{ include.entities }} + 1 + increment
```

The increment defaults to `1` (see below), therefor the first {{ include.entity }} in an empty installation
receives the counter value `2` and with 41 existing {{ include.entities }} the next one receives `43`.

Because the counter is based on the record count, deleting {{ include.entities }} lowers it again, which would
lead to numbers that were used before. Kimai detects and skips used numbers (see [Uniqueness](#uniqueness)),
but if you want a permanently higher counter, use the increment.

If several {{ include.entities }} are created within one request, each of them receives the next free counter value.

#### Increment and decrement

Every counter and every "incrementing" date replacer can be shifted by a fixed amount, by adding `+X` or `-X`:

- `{{ ct_plus }}` - adds 100 to the counter instead of the default `1`
- `{{ ct_minus }}` - subtracts 1 from the counter

The default increment is `1` and it cannot be set to `0`, so `{{ ct }}` behaves exactly like `{{ ct_plus_one }}`.

The increment is applied to `{{ ct }}`, `{YY}`, `{yy}`, `{MM}` and `{DD}`.
It is ignored by `{Y}`, `{y}`, `{M}`, `{m}`, `{D}` and `{d}`, which always return the current date.

This also means that `{YY}` does not "increment until a free number was found", it is simply "the current year
plus the increment": `{YY}` and `{YY+1}` return next year, `{YY-1}` returns the last year and `{YY-2}` the year before.

#### Length formatter

Adding `,X` to a replacer prepends leading zeros, until the result is `X` characters long:

- `{{ ct_length }}` - results in `0043` for the counter value `43`
- a result which is already longer than `X` characters will not be shortened

The length formatter is always the last part of a replacer and it can be combined with the increment and
decrement, e.g. `{{ ct_full }}`.

#### Uniqueness

The setting `System > Settings > {{ include.section }} > Allow multiple usages of the same number` defines
whether the same number may be used more than once:

- `No` (default) - saving {{ include.article }} {{ include.entity }} with an already used number fails with a validation error
- `Yes` - the same number can be used by multiple {{ include.entities }}

Independent of this setting, the **generator** always avoids numbers which are already in use: if the calculated
number exists, the counter is increased and the number is calculated again, for a maximum of 100 retries.

If no free number can be found, the field is left empty. That happens for example with a format which does not
contain a counter (like `{Y}`), because every retry produces the same result.

#### Limits

- The number can be at most {{ include.length }} characters long
- These characters are not allowed: `<` `>` `"` `=`

#### Examples

The following examples assume that today is the 9th of July 2025 and that 41 {{ include.entities }} exist:

| Format            | Result        | Description                               |
|-------------------|---------------|-------------------------------------------|
| `{{ ct }}`        | `43`          | the plain counter                         |
| `{{ ct_length }}` | `0043`        | the counter with four digits              |
| `{{ ct_minus }}`  | `41`          | the counter, shifted down by one          |
| `{{ ct_plus }}`   | `142`         | the counter, shifted up by 100            |
| `{{ ct_year }}`   | `2025-043`    | year and a three digit counter            |
| `{{ ct_date }}`   | `250709-43`   | date and counter                          |
| `{{ ct_prefix }}` | `K-2025-0043` | a static prefix, the year and the counter |
{: .table }
