---
title: "Release 1.16 - Weekly working times form"
date: "2021-11-16 10:00:00 +0200"
author: kevinpapst
tags: [On-Premise]
---

The release 1.16 was published in November 2021. 

### Attention before upgrading 

Remember that [release 1.15]({% link _posts/2021-09-17-kimai-release-1-15.md %}): 
- [dropped support for PHP 7.2 and added support for PHP 8]({% link _posts/2021-05-31-php8-support-php72-dropped.md %})
- LDAP & SAML config structure changed

### List of notable changes

- Weekly "quick-entry" form
- Allow to set 24 hour format as user preference
- Default team for new users / adjusted "create user" form
- Update Preview & Save buttons after "invoice template" selection
- Added new "canceled" invoice status
- Improve export filename
- Allow to delete invoice documents

### Security issues

Some possible CSRF and XSS attacks were found and patched. Thanks for the disclosure go out to the huntr.dev community, especially
to @Haxatron and @Asura-N and @tdozbun-reno and @noobpk.

If you use Kimai in a multi-user environment, you are urged to update as soon as possible.

### Thank you!

Thanks to all of you for using and supporting Kimai, especially:
- all clients and donors who help me to keep up the work for Kimai
- the developers who contributed their time
- the translators at Weblate
- the security researcher at huntr.dev, who privately disclose any issue   
- everyone else contributing at GitHub, too many to name you all 

Thanks for being part of the Kimai community ❤️

> Want to upgrade? [Click here to find out how]({%link _documentation/updates.md %}).

## Full changelog

You can find [all commits here]({{ site.kimai_v2_repo }}/compare/1.15.6...1.16.5).

### Implemented enhancements

- Extend orderNumber string to 50 characters \(\#2824\) [\#2828]({{ site.kimai_v2_repo }}/pull/2828) - thanks @iusgit
- Extend length of project orderNumber string [\#2824]({{ site.kimai_v2_repo }}/issues/2824)
- default team for new users [\#2802]({{ site.kimai_v2_repo }}/issues/2802)
- Update "Preview"/ "Save" buttons after invoice template \(re\)selection [\#2749]({{ site.kimai_v2_repo }}/issues/2749)
- Reporting - choose which type of times [\#2575]({{ site.kimai_v2_repo }}/issues/2575)
- improve error handling during invoice generation [\#2932]({{ site.kimai_v2_repo }}/pull/2932)
- submit invoice search after changing the template [\#2931]({{ site.kimai_v2_repo }}/pull/2931)
- added new invoice status: canceled [\#2922]({{ site.kimai_v2_repo }}/pull/2922)
- Translations update from Weblate [\#2915]({{ site.kimai_v2_repo }}/pull/2915) [\#2850]({{ site.kimai_v2_repo }}/pull/2850) ([weblate](https://github.com/weblate))
- added resname for tool compatibility [\#2912]({{ site.kimai_v2_repo }}/pull/2912)
- change data filter on project month report [\#2911]({{ site.kimai_v2_repo }}/pull/2911)
- Fetch user preferences via API [\#2905]({{ site.kimai_v2_repo }}/pull/2905)
- optimizations [\#2904]({{ site.kimai_v2_repo }}/pull/2904)
- prevent empty migration warning [\#2901]({{ site.kimai_v2_repo }}/pull/2901)
- composer upgrade [\#2900]({{ site.kimai_v2_repo }}/pull/2900)
- added invoice replacer for currently logged-in user [\#2899]({{ site.kimai_v2_repo }}/pull/2899)
- activate bleeding edge rules for phpstan and fix problems [\#2898]({{ site.kimai_v2_repo }}/pull/2898)
- fix weekly view day format [\#2893]({{ site.kimai_v2_repo }}/pull/2893)
- simplify building theme independent plugins [\#2888]({{ site.kimai_v2_repo }}/pull/2888)
- include roles and teams in user create form [\#2849]({{ site.kimai_v2_repo }}/pull/2849)
- Weekly "quick-entry" form [\#2793]({{ site.kimai_v2_repo }}/pull/2793)
- allow to set 24 hour format as user preference [\#2789]({{ site.kimai_v2_repo }}/pull/2789)
- added ProjectConstraint to add dynamic project validation [\#2747]({{ site.kimai_v2_repo }}/pull/2747) thanks @pkaltenboeck
- PDF memory optimizations [\#2736]({{ site.kimai_v2_repo }}/pull/2736)
- workflow to trigger event for docker build [\#2882]({{ site.kimai_v2_repo }}/pull/2882) thanks @Apfelwurm
- include calendar week in week chooser [\#2933]({{ site.kimai_v2_repo }}/pull/2933)
- improve export filename [\#2958]({{ site.kimai_v2_repo }}/pull/2958)
- allow to delete invoice documents from within kimai [\#2968]({{ site.kimai_v2_repo }}/pull/2968)

### Fixed bugs

- Time records marked as exported even when invoice is not saved due to duplicate invoice numbers [\#2917]({{ site.kimai_v2_repo }}/issues/2917)
- Error on Install: "Call to undefined method Doctrine\DBAL\Statement::fetchAll\(\)" [\#2885]({{ site.kimai_v2_repo }}/issues/2885)
- Request via API with X-AUTH-USER invalidates all other sessions for the \(LDAP\) user [\#2873]({{ site.kimai_v2_repo }}/issues/2873) thanks @handcode
- improve csrf handling [\#2936]({{ site.kimai_v2_repo }}/pull/2936)
- link to doctor [\#2930]({{ site.kimai_v2_repo }}/pull/2930)
- do not reset password for LDAP and SAML users unless needed [\#2916]({{ site.kimai_v2_repo }}/pull/2916)
- use token in invoice delete route [\#2889]({{ site.kimai_v2_repo }}/pull/2889)
- fixes for new quick-entry week form [\#2887]({{ site.kimai_v2_repo }}/pull/2887)
- optional csrf token name, fixes detail pages for teamleads  [\#2941]({{ site.kimai_v2_repo }}/issues/2941)
- Filtering the administrative project list by Visible=Both results in 500 Server Error [\#2941]({{ site.kimai_v2_repo }}/issues/2941)
- drop default value to prevent error when server version is not set [#2769]({{ site.kimai_v2_repo }}/issues/2769) [#2796]({{ site.kimai_v2_repo }}/issues/2796) [#2943]({{ site.kimai_v2_repo }}/issues/2943)
- csrf tokens for multiple actions - thanks @haxatron
- CSRF Tokens are not properly refreshed on some form submissions [#2947]({{ site.kimai_v2_repo }}/issues/2947) [#2948]({{ site.kimai_v2_repo }}/issues/2948) - thanks @tdozbun-reno
- escape customer, project and activity name in javascript [#2959]({{ site.kimai_v2_repo }}/issues/2959)
- escape data in calendar popover [#2960]({{ site.kimai_v2_repo }}/issues/2960)
- make sure that markdown uses safe mode [#2961]({{ site.kimai_v2_repo }}/issues/2961)
- improve permission handling in invoice screen [#2965]({{ site.kimai_v2_repo }}/issues/2965)
