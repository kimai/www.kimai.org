
A Kimai plugin which allows adding custom content for:

- Stylesheet (embedded in all pages)
- Javascript (embedded in all pages, except security screens)
- A global warning message, shown to every logged-in user
- An entire new page to display (markdown formatted) information for your users
 
### Permissions

| Permission Name      | Description                                     |
|----------------------|-------------------------------------------------|
| edit_custom_content  | show the "custom content" administration screen |
{: .table }

By default, these are assigned to each user with the role `ROLE_SUPER_ADMIN`.

{% include store-howto-permissions.md %}
