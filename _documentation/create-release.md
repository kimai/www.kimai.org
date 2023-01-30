---
title: "Creating a release"
redirect_from: 
- /documentation/team/
- /v1/team.html
toc: false
---

- Change version constants in [src/Constants.php]({{ site.kimai_v2_file}}/src/Constants.php)
- Adjust the file [UPGRADING.md]({{ site.kimai_v2_file}}/UPGRADING.md) with version specific information
- Adjust the versions in [SECURITY.md]({{ site.kimai_v2_file}}/SECURITY.md)
- Push a release branch called `release-x.x` and merge it as last PR into master
- Publish the release

**Post release task:**
 
- Website: Change version in [_config.yml]({{ site.kimai_v2_website }}/blob/main/_config.yml) and key `kimai_v2_version`  
- Website: Create a new version [announcement post]({{ site.kimai_v2_website }}), including the release notes
- Twitter: share a link to the new release
