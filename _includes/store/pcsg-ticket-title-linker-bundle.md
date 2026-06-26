Automatically detect GitLab ticket references in Kimai timesheet descriptions and replace them with clickable links including the corresponding ticket title.

## Features

* Detects GitLab ticket references in timesheet descriptions
* Supports references such as `group/project/Ticket#1`
* Supports GitLab URLs in timesheet entries
* Replaces references with clickable links including the GitLab ticket title
* Helps teams keep GitLab ticket context visible directly in Kimai
* Provides a command to retroactively parse existing timesheet entries
* German and English translations

## Requirements

* Kimai 2.3.7 or higher
* Access to a GitLab instance
* GitLab personal access token

## Configuration

You can configure the GitLab URL and API token in Kimai:

1. Go to **System → Settings → Ticket Title Linker**
2. Enter the following values:
   * **GitLab URL**
   * **GitLab API Token**

## Command line

Existing timesheet entries can be parsed afterwards with:

```bash
bin/console kimai:timesheet:parse-ticket-titles
```

## Support

If you require support for the usage or setup of this plugin or find any bugs please contact [support@pcsg.de](mailto:support@pcsg.de)!
