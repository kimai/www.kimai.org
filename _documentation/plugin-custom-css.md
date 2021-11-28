---
title: Custom CSS
description: Add your own CSS rules and improve your experience
toc: true
---

{% include plugins/custom-css.md %}  

### Examples

Hiding a menu:
```css
ul.sidebar-menu li#calendar { display:none; }
```

Hiding the colored dots:
```css
i.dot, span.dot {display:none !important;}
```

Activating horizontal scrolling on data-tables:
```css
.box .dataTables_wrapper {
    overflow-x: auto;
    min-height: .01%;
}
.box .dataTables_wrapper > .row {
    margin-left: 0;
    margin-right: 0;
}
.box .dataTables_wrapper > .row > .col-sm-12 {
    padding-left: 0;
    padding-right: 0;
}
```

Switching the order of save and cancel buttons:
```css
.modal-footer button[type=submit], .box-footer input[type=submit] {
    float: right !important
}
.modal-footer .btn-cancel, .box-footer input[type=reset] {
    float: left !important
}
```

Remove the red dotted lines between overlapping timesheet entries:
```css
table.dataTable tr.overlapping {
    border-top: none;
}
```

Highlight active timesheet records:
```css
tr.recording {
    background-color: #ffa059 !important;
}
```
