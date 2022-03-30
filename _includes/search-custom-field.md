
Additionally, you can filter for [custom fields]({% link _documentation/meta-fields.md %}) by using a search phrase like `location:homeoffice`.
This would find all entries with the custom field `location` matching the term `homeoffice`.

The search terms will be found within the full value, so searching for `office` would find:
- `I love working in my office`
- `Office`
- `This office is beautiful`
- `Our offices are very noisy`

You can mix the search term and use multiple meta-field queries:
- `location:homeoffice hello world` - find all entries matching the search term `hello world` with the custom field `location` matching the term `homeoffice`
- `location:homeoffice contract:foo foo` - find all entries matching the search term `foo` with the custom field combination: `location` matching the term `homeoffice` and `contract` matching the term `foo`
- `location:homeoffice contract:foo` - find all entries with the custom field combination: `location` matching the term `homeoffice` and `contract` matching the term `foo`

There are also special operators, which can be used in conjunction with custom fields (since Kimai 1.19.1):

- The ` ` empty string (e.g. `location:`) will find all entries whose value is either empty or not existing
- The `~` search term (e.g. `location:~`) will find all entries that are missing the custom field (created before the field was created)
- The `*` search term (e.g. `location:*`) will find all entries that have any value for the field (basically the opposite of `~`)

Please note: checkboxes have the values `0` (not checked) and `1` (checked).
