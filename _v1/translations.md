---
title: Translations
redirect_from:
  - /documentation/developer/translations.html
  - /documentation/translations/
---

Kimai is continually evolving so translations get outdated pretty fast. Therefore we're always happy, if people invest their time into improving the translations. Translations to new languages are very welcome as well!

## Where to start?

The languages/ folder in Kimai is where all translation files are stored. All files in that folder, which end in .php are displayed to the user as possible translations. For now we use a short code to identify the langauge.

## Format of the translation files

The files are simple PHP scripts which return an array (that in turn can contain arrays) which maps translation keys to their respective translation in the language. So if you have

```php
'ext_invoice' => array(
“invoiceTitle” => “Create invoice”,
“foo” => “Hello World”
),
```

only “Create invoice” and "Hello World" is what is shown to the user and has to be translated. The strings “ext_invoice”, “invoiceTitle” and "foo" are the keys which Kimai uses to find the translated string (don't touch them).

## Adding a new language

Doing so is pretty easy to describe, but it is some work for you. Take the file languages/en.php as starting point. This file contains all strings which can be translated in Kimai. Save that file under the short name of the language with the file extension .php (e.g. es.php for spanish) and start translating.

## Updating a translation

If you want to improve an existing translation there are mainly two things you will do. Either you will change existing translated string or you will add missing translations. To do so check where the keys of the PHP arrays differ from the reference file en.php. If you find any keys missing in en.php you can remove them in your language file.

## Publishing a translation

You can either sent the files in via a [new issue]({{ site.kimai_v1_repo }}/issues) or (what would make look even cooler) you sent us a [Pull request]({{ site.kimai_v1_repo }}/pulls).
