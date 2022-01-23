
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

Hiding the billable field:
```css
label[for=timesheet_edit_form_billable] { display:none; }
```

Hiding the navigation icons:
```css
.sidebar-menu>li>ul>li>a>i, .sidebar-menu>li>a>i {
    display: none;
}
body.sidebar-collapse .sidebar-menu>li>ul>li>a>i, body.sidebar-collapse .sidebar-menu>li>a>i {
    display: inline-block;
}
```

Remove the title on security screens (login, reset password):
```css
.login-logo, .register-logo { visibility: hidden; }
```

Setting a plain background color for security screens:
```css
.login-logo, .register-logo { visibility: hidden; }
.layout-boxed body, .layout-boxed html, body, html { background: #000000; }
.login-page, .register-page { background: none; }
```

Hide the header on mobile devices:
```css
@media (max-width: 767px) {
    .main-header .logo {
        display: none;
    }
    .fixed .content-wrapper, .fixed .right-side, .control-sidebar, .main-sidebar {
        padding-top: 50px;
    }
}
```
