---
title: "Custom Content rules"
date: "2021-11-29 10:00:00 +0200"
image: /images/blog/cover-cloud.jpeg
author: kevinpapst
tags: [Cloud]
---

With the latest update a new feature was introduced, the "Custom Content" rules.

This allows to write your own javascript and stylesheet extensions, which you can use to further adapt Kimai to your own needs.

To find out more, please read the [full documentation]({% link _documentation/plugin-custom-content.md %}).

**Two basic examples to trigger your imagination**:

_Removing the red dotted lines between overlapping timesheet entries_
```
table.dataTable tr.overlapping {
    border-top: none;
}
```

_Highlight active timesheet records_
```
tr.recording {
    background-color: #ffa059 !important;
}
```
