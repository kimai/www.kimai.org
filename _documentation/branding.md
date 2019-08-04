---
title: Branding
description: Customize Kimai title and logo
---

Kimai offers some basic configuration settings, to adapt the branding to your company.

> Ask yourself: which paid software allows such an option?  
> If you use these options, you should really consider [to donate]({% link _pages/donate.md %}) something back to Kimai.

## What can be customized?

- You can change the login screen and add your `logo`
- You can replace the application name with your `company` name (approx. 15-20 character)
- You can replace the `mini` version "KTT" with an abbreviation for your company name (3 chars max)
- The browser `title` can be replaced as well

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

If you need to show some more characters in the application name, you can use the [CustomCSS plugin]({% link _store/keleo-css-custom-bundle.md %}) to adapt the font size.
