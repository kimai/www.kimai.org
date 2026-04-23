---
title: Publishing in the Store
navigation: Add to store
description: How to list your Kimai plugin, app or client in the Marketplace
---

If you built a plugin, mobile app, desktop client, or another integration around Kimai and want it listed in the 
[Store]({% link _pages/en/store.html %}) or [Apps & Integrations]({% link _pages/en/integrations.html %}) page, 
this guide explains the current repository structure.

Due to the multi-lingual structure of the website, its not enough to add just one store entry but it needs a few files:

1. developer metadata
2. product metadata
3. one shared content partial (for all language versions)
4. one wrapper page per store locale (you only need to create the `en/` version)
5. translated title and intro texts (again, you only need `en/` but more are always better)
6. optional screenshots, compatibility data, and changelog files

If you follow the steps below and keep the same slug everywhere, the structure becomes straightforward.

## Before you start

Pick two identifiers first:

- `Developer ID` - your company or personal ID in `_data/developer.yml`
- `Slug` - the Store item ID used in filenames, translation keys, and data files

Example:

- Developer ID: `acme`
- Slug: `acme-foo` (should always include your developer ID as prefix)
- In case its a Plugin, the bundle class: `FooBundle`

Use the slug consistently in every place. Filename, translation key, include name, and store data file must match.

## What a Store entry consists of

For a typical plugin entry, you will usually touch these files:

- `_data/developer.yml`
- `_data/store/acme-foo.yml`
- `_includes/store/acme-foo.md`
- `collections/_store/en/acme-foo.md`
- `_data/en/store.yml` 

Optional files:

- `collections/_store/<locale>/acme-foo.md` for additional locales (use `scripts/translate-pages.php` to generate all)
- `_data/<locale>/store.yml` for additional translations
- `_data/screenshots.yml`
- `_data/store/releases/FooBundle.yaml`
- `_includes/store/changelog/FooBundle.md`
- image files in `images/marketplace/`

## Step 1: Add the developer entry

Add yourself or your company to `_data/developer.yml`.

Minimal example:

```yaml
acme:
    name: Acme GmbH
    description: Kimai plugin and integration vendor
    image: https://example.com/logo.webp
    homepage: https://example.com
    github: https://github.com/acme
    email: hello@example.com
```

Important notes:

- `name`, `description`, and `image` should be treated as required for Store entries
- `image` can be a local image path like `/images/...` or a full remote URL
- `homepage`, `github`, `email`, `twitter`, `mastodon`, and `youtube` are optional
- paid items can also define `purchase_details`, but that is optional and mainly used for the FAQ section on the detail page

## Step 2: Add the product metadata

Create `_data/store/acme-foo.yml`.

This file controls pricing, buttons, screenshots, documentation links, plugin installation tabs, and badges.

Example for a plugin:

```yaml
developer: acme
icon: fas fa-puzzle-piece
price: 0
documentation: plugin-foo
tags: [plugin]
bundle:
    name: "FooBundle"
    clone: "https://github.com/acme/FooBundle.git"
```

Example for a paid plugin:

```yaml
developer: acme
icon: fas fa-puzzle-piece
subscription: 49 €
shop: "https://example.com/buy/foo"
documentation: plugin-foo
changelog: true
demo: true
tags: [plugin, cloud]
bundle:
    name: "FooBundle"
```

### Common keys in `_data/store/<slug>.yml`

- `developer` - your developer ID from `_data/developer.yml`
- `icon` - icon class shown in the listing and fallback areas
- `tags` - badges such as `plugin`, `app`, `desktop`, `client`, `cloud`, `featured`
- `price` - one-time price, or `0` for free items
- `subscription` - recurring price label like `49 €`
- `subscription_period` - optional. default: annual payment, allowed values: `month`
- `shop` - checkout URL for paid items
- `download` - download URL for free downloads
- `github` - repository URL; if no explicit `download` exists, the page links to GitHub releases
- `email` - contact fallback if there is no direct download or checkout
- `play-store` - Android store link
- `app-store` - Apple App Store link
- `documentation` - slug of a documentation page under `collections/_documentation/`
- `demo` - set to `true` to show the demo tab
- `changelog` - set to `true` to show a changelog tab
- `screenshots` - screenshot IDs from `_data/screenshots.yml`
- `screenshot` - direct image URLs, usually only used for simple cases
- `new` - legacy field that may be used for temporary highlighting

### Plugin-specific `bundle` block

If your item is a Kimai plugin and should show installation instructions, add a `bundle` section:

```yaml
bundle:
    name: "FooBundle"
    clone: "https://github.com/acme/FooBundle.git"
    command: "kimai:bundle:foo:install"
    assets: true
```

Available keys:

- `name` - bundle directory and class name, for example `FooBundle`
- `clone` - optional Git clone URL shown in the installation tab
- `command` - optional install or migration command shown in the installation tab
- `assets` - set to `true` when `bin/console assets:install` is required

Important:

- compatibility versions are no longer stored here
- do not put `title` or `intro` into this file, they belong in the locale translation files
- the old `bundle.versions` structure is obsolete
- legacy top-level flags like `cloud` should not be used for new entries; use badges in `tags` instead

## Step 3: Add the shared content partial

Create `_includes/store/acme-foo.md`.

This file contains the actual Store description and is reused by every locale wrapper page.

Minimal example:

```md
FooBundle adds feature X, Y, and Z to Kimai.

## Features

- First important feature
- Second important feature
- Third important feature
```

If your item already has a dedicated plugin documentation page, the Store description can stay short and link to that page.

## Step 4: Add the Store page wrapper

Create the English wrapper page at `collections/_store/en/acme-foo.md`.

Example:

```md
---
title: Foo
type: plugin
---

{% raw %}{% include store/acme-foo.md %}{% endraw %}
```

The wrapper page is intentionally tiny.

The frontmatter now only contains:

- `title` - mostly a fallback title
- `type` - controls where the item appears

Current `type` values used in the repository:

- `plugin` - normal plugin listing
- `featured` - featured plugin listing on the main store page
- `app` - mobile apps
- `desktop` - desktop applications
- `client` - other clients and integrations

If you are unsure, use `plugin` for Kimai plugins.

Important:

- featured placement is currently controlled by `type: featured`
- a `featured: true` flag inside `_data/store/<slug>.yml` is not enough on its own

## Step 5: Add translated list texts

The title and short intro shown in listings and headers come from `_data/<locale>/store.yml`, not from the markdown frontmatter.

At minimum, add the English entry to `_data/en/store.yml`:

```yaml
items:
    acme-foo:
        title: Foo
        intro: Short summary of your item in one sentence.
```

If you also want the item to show up with localized text in German, add the same key to `_data/de/store.yml`.

Current repository reality:

- Store translation files exist for many locales
- every Store locale currently also has its own wrapper page under `collections/_store/<locale>/`
- for external contributors, English is the minimum sensible starting point

If you want your item to appear in additional locales immediately, create the matching wrapper pages and add the translated `title` and `intro` to the corresponding `_data/<locale>/store.yml` files.

## Step 6: Add locale wrapper pages when needed

All existing Store items currently have wrapper pages for all active Store locales.

Each wrapper page looks the same except for the path, for example:

- `collections/_store/de/acme-foo.md`
- `collections/_store/fr/acme-foo.md`
- `collections/_store/zh_Hans/acme-foo.md`

The content can stay identical:

```md
---
title: Foo
type: plugin
---

{% raw %}{% include store/acme-foo.md %}{% endraw %}
```

The localized title and intro still come from `_data/<locale>/store.yml`.

## Step 7: Add screenshots

If your item has screenshots, there are two parts:

1. add image files, preferably in `images/marketplace/`
2. register the screenshot IDs in `_data/screenshots.yml`

Example:

```yaml
acme-foo0:
    src: "/images/marketplace/acme/foo-0.webp"
acme-foo1:
    src: "/images/marketplace/acme/foo-1.webp"
```

Then reference them in `_data/store/acme-foo.yml`:

```yaml
screenshots:
    - acme-foo0
    - acme-foo1
```

Optional localized captions are stored in `_data/<locale>/store.yml`:

```yaml
screenshots:
    acme-foo0:
        description: Main dashboard of FooBundle
    acme-foo1:
        description: Configuration screen
```

## Step 8: Add compatibility and changelog data

If your plugin should display compatibility information or a changelog tab, add release metadata.

Compatibility file:

- `_data/store/releases/FooBundle.yaml`

Example:

```yaml
versions:
    - [1.2.0, 2.54.0]
    - [1.1.0, 2.50.0]
```

Optional changelog include:

- `_includes/store/changelog/FooBundle.md`

Then enable the tab in `_data/store/acme-foo.yml`:

```yaml
changelog: true
bundle:
    name: "FooBundle"
```

Notes:

- the old `bundle.versions` key is no longer used
- compatibility data lives in `_data/store/releases/`
- changelog content lives in `_includes/store/changelog/`
- some Kimai-maintained plugins update this data through `scripts/update-bundles.php`

## Full example

For a new free plugin called `acme-foo`, the minimal useful file set is:

```text
_data/developer.yml
_data/store/acme-foo.yml
_data/en/store.yml
_includes/store/acme-foo.md
collections/_store/en/acme-foo.md
```

A more complete Store entry usually also includes:

```text
collections/_store/de/acme-foo.md
_data/de/store.yml
_data/screenshots.yml
images/marketplace/acme/foo-0.webp
_data/store/releases/FooBundle.yaml
_includes/store/changelog/FooBundle.md
```

## What changed compared to the old workflow

The following parts of older instructions are no longer correct:

- product metadata is not stored in markdown frontmatter anymore
- wrapper pages now only contain `title`, `type`, and the include call
- `title` and `intro` come from `_data/<locale>/store.yml`
- compatibility versions no longer belong in `_data/store/<slug>.yml`
- `bundle.versions` has been replaced by `_data/store/releases/<Bundle>.yaml`
- screenshots are now typically managed via `_data/screenshots.yml`
- one shared include in `_includes/store/<slug>.md` is the central place for the long description
- Store entries are now spread across data files, include files, locale files, and optional release metadata

## Tips for first-time contributors

- start with English first
- copy an existing item with a similar type, then rename all occurrences of the slug
- keep the same slug everywhere
- prefer `webp` for new local images
- if you add a plugin, include the `bundle.name` so the installation tab can be generated
- if you do not want to add translations for all locales yourself, mention that in the pull request

If you are unsure which existing entry is closest to your case, use one of these as a template:

- free plugin: `keleo-importer-bundle`
- paid plugin: `task-management-bundle`
- desktop client: `owlysk-codetimer`
- mobile app: `drthomasentner-timai`
- saas: `kloudshift-klockshift`
