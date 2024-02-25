---
title: "Beta 2 - Callout for testing"
date: "2023-01-21 10:00:00 +0200"
image: /images/blog/cover-5.jpeg
author: kevinpapst
tags: [On-Premise]
---

Following the longer news about the next major release this news is a quick heads up that the **Beta 2** was just released at GitHub.

You can find the relases [here](https://github.com/kimai/kimai/releases/edit/2.0.0-beta-2).
And if you want to start testing, you can simply switch the version number in the usual upgrade and installation commands to `2.0.0-beta-2`. 

For [Updates]({% link _documentation/updates.md %}) this would be:
```bash
git checkout 2.0.0-beta-2
```

And for [new installations]({% link _documentation/installation.md %}):
```bash
git clone -b 2.0.0-beta-2 --depth 1 https://github.com/kimai/kimai.git
```

## Detailed changelog

* Translated using Weblate (#3723)
* do not traverse into invoice template subdirectories (#3735)
* merged release 1.30.3 and 1.30.5 - allow to upload twig invoice templates via UI
* allow to pre-fill timesheet metafields via URL
* added test accounts with simpler names and password
* fix column bookmark cannot be saved (#3768)
* support adding existing teams with same name
* permissions cannot be set right after role was created (#3777)
* allow to deactivate unique customer number validation (#3762)
* invalid message when trying to edit locked or exported timesheets in calendar (#3766)
* updated icons and manifest (#3761)
* fix api description
* fix security open api definition

### BC for plugin authors

* upgrade to Symfony 6.2
* removed Sensio-FrameworkExtraBundle and replaced with new native SF annotations
* fixed Symfony 6.2 deprecations
* fix currency can be null, removed fluent interface

## Thank you

For now, I want to thank you all for your support and for using Kimai.
And I am really looking forward to your feedback on the new version 🙈😁
