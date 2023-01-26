<p align="center">
    <img src="https://raw.githubusercontent.com/kimai/images/main/repository-header.png" alt="Kimai logo">
</p>

<p align="center">
    <a href="https://packagist.org/packages/kimai/kimai"><img alt="Latest stable version" src="https://poser.pugx.org/kimai/kimai/v/stable"></a>
    <a href="https://www.gnu.org/licenses/agpl-3.0.en.html"><img alt="License" src="https://poser.pugx.org/kimai/kimai/license"></a>
    <a href="https://phpc.social/@kimai" rel="me"><img alt="Mastodon" src="https://img.shields.io/badge/toot-%40kimai-8c8dff"></a>
</p>

<h1 align="center">Kimai - Jekyll based website</h1>

Kimai is a free, open source and online time-tracking software designed for small businesses and freelancers.

This repository contains the website contents (and layout) for www.kimai.org in all translations.

The website is created using [Jekyll](http://jekyllrb.com/), a static site builder.

Directory structure:

- **_data** contains data files and translations
- **_docu_versioned** contains version specific (older releases) documentation pages
- **_documentation** contains the documentation (english only)
- **_error** contains the error pages
- **_includes** contains re-usable HTML content elements
- **_layouts** contains the actual HTML structure of the page
- **_pages** contains the main pages of the website (all languages)
- **_posts** contains all blog posts (english only)
- **_store** contains all marketplace pages (all languages)
- **assets** contains the frontend stuff - SASS, CSS, Javascript, Font and Icon files
- **images** contains ONLY images used in the content
- **static** contains binary document files

## Translate the website

A lot of the website content is translatable. We use the great service [Weblate](https://weblate.org/) for the translations.

Please click the image to help with the translations:
<a href="https://hosted.weblate.org/engage/kimai/">
<img src="https://hosted.weblate.org/widgets/kimai/-/open-graph.png" alt="Übersetzungsstatus" />
</a>    

## Build it locally

```bash
bundle exec jekyll serve
```

or

```bash
bundle exec jekyll serve -H 0.0.0.0 --incremental
```
