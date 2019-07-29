---
title: Branding
description: Customize Kimai title and logo
---

Kimai offers basic configuration settings, to adapt it to your company.

> Ask yourself: which paid software allows such an option?   
> If you use these options, you should really consider [to donate]({% link _pages/donate.md %}) something back to Kimai!

## What can be customized?

- You can change the login screen and add your logo
- You can replace the application name with your company name
- You can replace the mini version "KTT" with some abbreviation for your company name
- The browser title will be replaced as well

```yaml
kimai:
    theme:
        branding:
            logo: "https://www.kimai.org/assets/icon/apple-touch-icon.png"
            company: Acme University
            mini: AC
            title: Awesome!
```

If you remove the `logo`, the value of `company` will be used in the login screen.
