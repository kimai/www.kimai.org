---
title: "Team & Internal"
---

Documentation for project maintainer.

## Create a release

- Prepare a GitHub release-draft `x.x`
- Change version constants in [src/Constants.php]({{ site.kimai_v2_file}}/src/Constants.php)
- Adjust the file [UPGRADING.md]({{ site.kimai_v2_file}}/UPGRADING.md) with version specific information
- Create [CHANGELOG.md]({{ site.kimai_v2_file}}/CHANGELOG.md):
  - Change [.github_changelog_generator]({{ site.kimai_v2_file}}/.github_changelog_generator) config accordingly to new release tag (increase future release)
  - Run [github-changelog-generator](https://github.com/github-changelog-generator/github-changelog-generator) with `github_changelog_generator kevinpapst/kimai2`
- Edit the release-draft and add the "Full changelog" link + everything from [CHANGELOG.md]({{ site.kimai_v2_file}}/CHANGELOG.md) related to the new version
- Push a release branch called `release-x.x` and merge it as last PR into master
- Create the release
- Adjust Kimai website:
  - Change version in file [_config.yml]({{ site.kimai_v2_website }}/blob/master/_config.yml) and key `kimai_v2_version`  
  - Create a new version [announcement post]({{ site.kimai_v2_website }}), including the release notes
- Post a new issue at [YunoHost tracker for Kimai 2](https://github.com/YunoHost-Apps/kimai2_ynh)
- Post a new issue at [Docker for Kimai 2](https://github.com/tobybatch/kimai2)
