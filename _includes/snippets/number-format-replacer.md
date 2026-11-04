{% assign ct = include.counter %}
{% assign ct_plus = ct | replace: '}', '+100}' %}
{% assign ct_length = ct | replace: '}', ',4}' %}

| Replacer   | Description                                                                    | Example  |
|------------|--------------------------------------------------------------------------------|----------|
| `{{ ct }}` | {{ include.entity }} counter                                                   | 2        |
| `{Y}`      | Year 4 digits                                                                  | 2025     |
| `{y}`      | Year 2 digits                                                                  | 25       |
| `{M}`      | Month with leading zero                                                        | 04 or 10 |
| `{m}`      | Month 1 or 2 digits                                                            | 4 or 10  |
| `{D}`      | Day with leading zero                                                          | 04 or 23 |
| `{d}`      | Day 1 or 2 digits                                                              | 4 or 23  |
| `{YY}`     | Like `{Y}`, but the increment is added to the year (default increment is `1`)  | 2026     |
| `{yy}`     | Like `{y}`, but the increment is added to the year (default increment is `1`)  | 26       |
| `{MM}`     | Like `{m}`, but the increment is added to the month (default increment is `1`) | 5        |
| `{DD}`     | Like `{d}`, but the increment is added to the day (default increment is `1`)   | 24       |
{: .table }

Each replacer supports an increment/decrement (e.g. `{{ ct_plus }}`) and a length formatter, which prepends
leading zeros (e.g. `{{ ct_length }}`).

Every character outside a replacer is copied as-is, but `{` and `}` are reserved and cannot be used.
An unknown replacer (e.g. `{foo}`) is not replaced and ends up in the number as written.
