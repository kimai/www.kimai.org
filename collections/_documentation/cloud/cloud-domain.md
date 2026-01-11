---
title: Can I change my Kimai Cloud domain?
navigation: Change the cloud domain
---

**Short answer:** No.

**Long answer:** No — and there are no exceptions, **but workarounds**.

When you register for Kimai Cloud, you choose a subdomain (for example `example.kimai.cloud`).  
This subdomain is **permanently bound** to your Kimai instance and **cannot be changed later**.

This is not a policy decision or a missing feature — it is a **technical limitation** of how Kimai Cloud is provisioned and operated. Once an instance is created, the subdomain becomes an integral part of its infrastructure and identity. Renaming it is technically not possible without recreating the entire instance.

For this reason, we clearly state **during registration** that the selected subdomain cannot be changed afterward:

{% include docs-image.html src="/images/documentation/cloud/domain-registration.webp" title="Selecting a cloud domain during registration" width="800px" %}

Please make sure to choose your subdomain carefully. Even small details like using `test`, `demo`, or temporary names cannot be corrected later.

> “But I accidentally used `test` in the name…”

We understand that this can be frustrating. Unfortunately, even in this case, the subdomain **cannot be renamed**.

There is no manual intervention, support override, or paid exception that would allow changing an existing Kimai Cloud subdomain.

## Alternative solutions

While the original subdomain cannot be changed, you have the following options:

### Option 1: Custom domain (recommended)

If you are on the **annual Pro subscription**, you can configure a **custom domain**.

Instead of using  
`example.kimai.cloud`  
you can access your Kimai instance via  
`time.example.com` or `kimai.example.com`.

This is the **best solution** if you want a professional or branded URL without recreating your instance.

→ See: [Custom domain documentation]({% link _documentation/cloud/cloud-custom-domain.md %})

### Option 2: Create a new instance and migrate your data

If a custom domain is not an option, you can recreate your Kimai Cloud instance with a new subdomain and move your data manually.

Steps:

1. Export your timesheets from the existing instance as CSV ([Timesheets → Export]({% link _documentation/export.md %}))
2. Create a new Kimai Cloud instance with the correct subdomain
3. Import the data into the new instance ([System → Importer]({% link _documentation/plugin-import.md %}))

Please note:

- This is a **manual workaround**
- Settings, and configuration must be recreated
- The original instance and its subdomain remain unchanged

## Summary

- A Kimai Cloud subdomain **cannot be changed**
- This is due to **technical constraints**, not policy
- Use a **custom domain** or **recreate the instance** if the current name is unsuitable
