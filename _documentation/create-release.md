---
title: "Creating a release"
redirect_from: /documentation/team/
---

- Prepare a GitHub release-draft `x.x`
- Change version constants in [src/Constants.php]({{ site.kimai_v2_file}}/src/Constants.php)
- Adjust the file [UPGRADING.md]({{ site.kimai_v2_file}}/UPGRADING.md) with version specific information
- Adjust the versions in [SECURITY.md]({{ site.kimai_v2_file}}/SECURITY.md)
- Create [CHANGELOG.md]({{ site.kimai_v2_file}}/CHANGELOG.md):
  - Change [.github_changelog_generator]({{ site.kimai_v2_file}}/.github_changelog_generator) config accordingly to new release tag (increase future release)
  - Run [github-changelog-generator](https://github.com/github-changelog-generator/github-changelog-generator) with `github_changelog_generator --user kevinpapst --project kimai2 --max-issues 500 --since-tag {{ site.kimai_v2_version }}`
- Edit the release-draft and add the "Full changelog" link + everything new from [CHANGELOG.md]({{ site.kimai_v2_file}}/CHANGELOG.md)
- Push a release branch called `release-x.x` and merge it as last PR into master
- Publish the release
- Adjust Kimai website:
  - Change version in file [_config.yml]({{ site.kimai_v2_website }}/blob/master/_config.yml) and key `kimai_v2_version`  
  - Create a new version [announcement post]({{ site.kimai_v2_website }}), including the release notes
- Post a new issue at [YunoHost tracker for Kimai](https://github.com/YunoHost-Apps/kimai2_ynh)
- Post a new issue at [Docker for Kimai](https://github.com/tobybatch/kimai2)
- Reinstall the stable-demo and change tag version in install.sh
