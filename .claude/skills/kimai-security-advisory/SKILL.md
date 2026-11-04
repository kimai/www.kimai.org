---
name: kimai-security-advisory
description: Use when authoring, reviewing, or editing security advisories in `collections/_security/`. Acts as a security researcher who verifies and improves Kimai security advisory wording for clarity, accuracy, and the required structure.
---

# Kimai Security Advisory

Files in `collections/_security/` contain security advisories for the Kimai open-source time-tracking software.

When working on advisories, act as a security researcher who verifies and improves the wording for clarity and accuracy.

### Generate Security advisories

This skill expects one <filename> as input. If none was given, ask for it.

The task to perform:
- Read the file at <filename> - it contains a pre-formatted raw version of the security advisory
- Fetch the content between `<!-- [START] -->` and `<!-- [END] -->` as `INPUT` and remove it from the document
- Generate 1 or 2 sentences as Introduction from `INPUT` and replace `<INTRO>` with it
- Generate a bullet point list with details from `INPUT` and replace `<DETAILS>` with it
- Generate 1 or 2 sentences about the applied fix and replace `<SOLUTION>` with it 

## Editorial rules

- Write for non-technical readers
- Adjust the `title: ` and make it accessible for non-technical users
- The `<INTRO>` should explain the issue in non-technical terms mostly
- You might use technical terms in the `<DETAILS>` section, but do not go into detail about the impacted code (unless it is strictly necessary for that issue)
- Write in English, following the writing style: American English, second person, gender-neutral, contractions allowed, avoid "just"/"obviously"/"easy"/"simply", keep vocabulary accessible to non-native speakers
- Keep advisories short and to the point
- Focus on aspects that matter inside Kimai: affected components, roles and permissions, configuration, deployment type (OnPremise vs. Cloud)
- Do not include code samples
- Do not provide exploitation instructions or proof-of-concept steps
- Provide enough context for the audience to assess severity, exposure, and required action
- Do not mention Frontmatter variables, they are used in the rendered template to display structured information like "Affected and Patched version" and "Author"

## Required structure

Every advisory follows this shape:

1. **Frontmatter** — pre-generated, do not modify except `title`. Contains: `title`, `date`, `ghsa_id`, `cve_id`, `severity`, `affected_version`, `patched_version`, `author`, `developer`.
2. **`<INTRO`>** — one or two sentences giving a quick overview of the issue and its impact. No heading.
3. **`<DETAILS>`** — detailed explanation, preferably a bullet-point list. Cover the relevant subset of required role or permissions, conditions that trigger the issue, whether OnPremise or Cloud deployments are affected (if both then write "All Kimai installations"), audit-log visibility, and any caveats.
4. **`## Solution`** — what was changed in Kimai to fix the issue. If you do not know what changed, ask the user before writing this section.

The only allowed subsection before `## Solution` is `### Why this is not eligible for a CVE` - do not generate it if it is not in the original document.

## Verification checklist

Before reporting the change as done, confirm:

- The `title` is accessible for the mainly non-technical audience and `severity` in the frontmatter
- The text is consistent with `affected_version` and `patched_version` from the frontmatter
- No exploitation steps or code samples were introduced
- Cloud-vs-OnPremise applicability is stated when relevant
