{% if include.plugin == nil %}
<div class="alert alert-danger" role="alert">
ATTENTION, this include needs the <strong>plugin</strong> variable!
</div>
{% else %}
{% assign plugin = include.plugin %}
### Copy files

Extract the ZIP file and upload the included directory and all files to your Kimai installation to the new directory:
`var/plugins/{{ plugin }}/`

The file structure needs to like like this afterwards:

```
var/plugins/
├── {{ plugin }}
│   ├── {{ plugin }}.php
|   └ ... more files and directories follow here ...
```

### Clear cache

After uploading the files, Kimai needs to know about the new plugin. It will be found, once the cache was re-built:

```
cd kimai2/
bin/console cache:clear --env=prod
bin/console cache:warmup --env=prod
```

or when using FTP: delete the folder `var/cache/prod/`.

{% endif %}
