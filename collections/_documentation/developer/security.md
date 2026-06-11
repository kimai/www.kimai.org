---
title: Security advisories
---

This document describes how reported security vulnerabilities are handled for Kimai.

We take every security report seriously and act upon it as soon as possible. 
If you're a **security researcher**, please read our [Guidelines]({% link _documentation/developer/bughunter.md %}) about testing and reporting new vulnerabilities before submitting a report.

Upon receiving a new security report, our process looks like this:

- We review the report and, if needed, contact the reporter with follow-up questions
- We reproduce and verify the reported issue
- We write regression tests to prevent the issue from reoccurring
- We fix the vulnerability and create a new Kimai release (noting that security fixes are included)
- We update the Kimai-Cloud environment
- We write an advisory for our website that explains the issue in plain language (see the list of published advisories below)
- We request a CVE ID, if the issue qualifies for one
- At least two weeks after the patched version has been released, we publish the advisory on our website and on GitHub

## Severity levels

We rate security issues using four severity levels: `Low`, `Medium`, `High`, and `Critical`.

Our GitHub advisories may include CVSS scores for reference, but we do not rely on CVSS as the primary basis for grading vulnerabilities. 
In our view, CVSS does not adequately capture all the factors and context involved in assessing real-world impact.

A rough guideline for how we classify security issues:

- `Low`: read access to data that should not be accessible
- `Medium`: write access to data that should not be accessible (e.g. XSS, CSRF)
- `High`: permission escalation to admin level, escaping sandboxes, reading filesystem contents
- `Critical`: system manipulation, passing authentication flows 

We take additional details into account beyond this list. Each advisory is rated as a whole, and we
particularly consider the permission level required for exploitation.

For example: any issue that requires direct filesystem access or a **System-Admin** account to exploit is unlikely to be
rated higher than `Medium`, as these preconditions significantly limit the realistic attack surface:
- The **System-Admin** role is the Kimai equivalent of a **root** account and can easily delete all data in the system.
- Users who already have filesystem access to the server have a variety of options to manipulate the system and do not need Kimai for that.

## Published vulnerabilities
 
You can subscribe to all advisories via [Atom RSS Feed]({% link security.xml %}).

{% assign advisories = site.security | reverse -%}
{% for advisory in advisories -%}
- {{ advisory.date | date: "%Y-%m-%d" }}: {% if advisory.severity == 'high' %}⚠️{% elsif advisory.severity == 'critical' %}🚨{% endif %}  [{{ advisory.title }}]({{ advisory.url }})
{% endfor %}
