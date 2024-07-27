{% note "How to reload Kimai cache" %}
```plaintext
bin/console kimai:reload --env=prod
```

It is not advised, but in case the above command fails you could try:

```plaintext
rm -r var/cache/prod/*
```
{% endnote %}
