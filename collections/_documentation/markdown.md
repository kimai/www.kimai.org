---
title: Markdown
description: Markdown support in Kimai
---

Kimai supports Markdown content in the following areas:

- Description: Timesheet, Customer, Project, Activity
- Comments: Customer, Project, Activity
- Invoice text: Customer, Project
- Tasks: Todo, Comments

Only a subset of Markdown elements are supported.

- italic/em  - via `*text*`
- bold/strong - via `**text**`
- links - via `[kimai homepage](https://www.kimai.org)`
- links (auto) - via pure URLs like `this https://www.kimai.org is a link as well`
- lists (unordered) - via `- one item` and `* another item`
- lists (ordered) - via `0. first line` - `999. last line`
- code blocks (inline) - via ``some `code` block ``
- code blocks (multi-line) - via ```` ``` ````
- horizontal rule - via `---`
- line breaks - via 2 spaces `  ` at the end of the line
- tables - via `|`, `-`, `:`
- quotes - via `> `

{% alert %}
We do not guarantee backward compatibility for any other element that you might find to work.
{% endalert %}

If you want to learn how to use Markdown to style your text, [start here](https://commonmark.org/help/).

