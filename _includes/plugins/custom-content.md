
A Kimai plugin which allows adding custom content for:

- Stylesheet (embedded in all pages)
- Javascript (embedded in all pages, except security screens)
- A global warning message, shown to every logged-in user
- An entire new page to display (markdown formatted) information for your users
    - The title is the name of the menu entry
    - Multi-language is not supported

### Permissions

This bundle introduces new permissions, which limit access to certain functions:

| Permission Name        | Description |
|------------------------|--- |
| `edit_custom_content`  | show the administration screen to edit custom content rules   |
{: .table }

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include store-howto-permissions.md %}
