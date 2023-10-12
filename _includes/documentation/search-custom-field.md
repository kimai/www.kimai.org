
Additionally, you can filter for [custom fields]({% link _documentation/meta-fields.md %}) by using a search phrase like `location:homeoffice`.
This would find all entries with the custom field `location` matching the term `homeoffice`.

The search terms will be found within the full value, so searching for `office` would find:
- `I love working in my office`
- `Office`
- `This office is beautiful`
- `Our offices are very noisy`

Attention: checkboxes have the values `0` (not checked) and `1` (checked).

You can mix the search term and use multiple meta-field queries:
- `location:homeoffice hello` - find all entries matching the search term `hello` with the custom field `location` matching the term `homeoffice`
- `location:homeoffice contract:fulltime` - find all entries with the custom field combination: `location` matching `homeoffice` and `contract` matching `fulltime`
- `expired:0` finds all items whose `expired` checkbox is `off` 

There are also special operators, which can be used in conjunction with custom fields (since Kimai 1.19.1):

- The ` ` empty string (e.g. `location:`) will find all entries whose value in the `location` field is either empty or not existing
- The `~` search term (e.g. `location:~`) will find all entries that are missing the custom field (created before the field was created)
- The `*` search term (e.g. `location:*`) will find all entries that have any value in the `location` field (basically the opposite of `~`)
