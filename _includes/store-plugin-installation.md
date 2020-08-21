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
│   ├── {{ plugin }}.php
|   └ ... more files and directories follow here ...
```

### Clear cache

After uploading the files, Kimai needs to know about the new plugin. It will be found once the [cache was re-built]({% link _documentation/updates.md %}). 
Call these commands from the Kimai directory:

{% include cache-refresh.html %} 

You might have to set file permissions afterwards:

{% include file-permissions.html %} 

{% if include.command != nil %}

### Create database

Run the following command:

```bash
bin/console {{ include.command }}
```

This will install all required databases.
{% endif %}

{% if include.assets != nil %}

### Install the bundle assets

The following command will install the required assets (images, javascripts, styles):

```bash
bin/console assets:install
```
{% endif %}
{% endif %}
