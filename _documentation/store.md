---
title: The Marketplace
description: How to list your Kimai extension in the Marketplace 
toc: true
---

If you created a plugin or any other kind of software around Kimai, which you want to see listed in the [{{ site.data.trans[page.lang].store }}]({% link _pages/store.html %}), 
follow these short guidelines and it will soon be published.

## Jekyll and GitHub pages

The Kimai website is generated with [Jekyll](https://jekyllrb.com) and [managed at GitHub]({{ site.kimai_v2_website }}).
As all {{ site.data.trans[page.lang].store }} entries are rendered from data collections, you can fork the repository and after changing the necessary files, 
create a pull request.

Your changes will be published immediately after your PR was merged.

## Adding a plugin

You have to:
- add your developer/company information to the `developer.yml` file
- create one file for your item that should be listed in the {{ site.data.trans[page.lang].store }} 

### The developer information

The information about yourself or your company comes from the [developer.yml file]({{ site.kimai_v2_website }}/tree/master/_data/developer.yml).

It starts by defining your company/developer ID and then adding the following keys:

- `name` - your company or personal name (**mandatory**)
- `description` - a short self description in one sentence (**mandatory**)
- `image` - full URL to your company logo or avatar (**mandatory**)
- `homepage` - full URL to your website (optional)
- `github` - your GitHub organization or profile URL (optional)
- `twitter` - full URL to your twitter profile (optional)

The ID should be built from the lowercased version of your name: use only alphabetical character and remove all special chars and spaces.

For example my own entry (`kevinpapst` being my developer ID):

```
kevinpapst:
    name: Kevin Papst
    description: Freelancer, PHP professional and Kimai core developer since 2007
    image: https://avatars1.githubusercontent.com/u/533162?s=460&v=4
    homepage: https://www.kevinpapst.de
    github: https://github.com/kevinpapst
    twitter: http://twitter.com/keleo
```

### The product information

Create a new markdown file in the [_store directory]({{ site.kimai_v2_website }}/tree/master/_store/), follow the filename pattern:
`company-short-descriptive-name.md`

Within the Jekyll [Front Matter](https://jekyllrb.com/docs/front-matter/) you have the following attributes available:

- `name` - a name for your {{ site.data.trans[page.lang].store }} entry, will be used in the list view and in the title of the detail screen (**mandatory**)
- `intro` - a descriptive sentence for this entry, will be used in the detail screen (**mandatory**)
- `developer` - your company/developer ID (**mandatory**)
- `date` - date of the last release (**mandatory**)
- `image` - product image (optional)
- `icon` - fontawesome icon class (optional, but should be given when no image is supplied - a fallback icon will be used if not given)
- `price` - the item price (optional, if not given explain pricing structure in the full-text)
- `version` - last release version (optional)
- `download` - full URL to the download if available (optional)
- `github` - full URL to the GitHub project (optional)
- `screenshot` - full URL to an image / screenshot (optional)
- `new` - indicates that the {{ site.data.trans[page.lang].store }} item is new, represents a visible state in the shop (set to `true` - this will be removed after a while) (optional)
- `featured` - a boolean indicating if this item will be featured in the {{ site.data.trans[page.lang].store }} (decision is done by the project maintainer) 
- `features` - array with up to 6 features (short description with approx. 5 words each, currently only shown in the list view if `featured` is `true`) (optional) 
- `tags` - array with up to 4 tag, try to stay in the range of existing tags if applicable (optional)

A full example can be seen in the file [keleo-css-custom-bundle.md]({{ site.kimai_v2_website }}/tree/master/_store/keleo-css-custom-bundle.md).
