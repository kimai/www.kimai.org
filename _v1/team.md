---
title: "Team / Internal"
redirect_from: 
  - /documentation/team/
---

This part of the documentation is related to the Kimai development team, you can safely skip this part 
if you are a end-user of the Kimai time-tracking application.

## Developing for Kimai

Please read our [CONTRIBUTING GUIDELINES]({{ site.kimai_v1_repo }}/blob/master/.github/CONTRIBUTING.md) directly at Github.

## Creating a new release

For creating a new release, you need to have ant installed

- Change the version number in the following files and push them to master: 
    - build.xml
    - composer.json
    - includes/version.php
        - set the version
        - ALWAYS increase the revision, otherwise people using the develop branch will be stuck in the updater(!)
        - set the release status (dev for pre-release versions. empty for release)
- Switch to your bash (this script is for unix based systems)

```bash
cd /tmp/
git clone {{ site.kimai_v1_repo }}.git kimai-master
cd kimai-master
git tag -a -f -m 'Tagged version x.x.x' x.x.x
git push origin x.x.x
composer install --no-dev
ant build
```

- Now open GitHub, [create a new "Release"]({{ site.kimai_v1_repo }}/releases) as Draft and upload the release ZIP from /tmp/kimai/kimai_xxx.zip to this draft
- Add one or two sentences and a link to this versions milestone with the "closed" filter
- Publish the release draft
- Publish a new blog post regarding this new release (see below)
- Update [kimai.json]({{ site.kimai_v1_repo }}/blob/master/kimai.json) and change the version number and news link, commit and push it to master (so the update check in Kimai administration will catch it as well)
- Edit the GitHub release and add a link to the blog post
- Let the rest of the team know and spread the word (Twitter, Facebook ...)

## How to publish a new blog article

Writing a new blog post is a simple as:
 
- Fork the [website repo]({{ site.kimai_v2_website }}) 
- Create a new .md file in the _posts directory
- Send a pull request
