---
name: kimai-security-advisory
description: Use when authoring, reviewing, or editing security advisories in `collections/_security/`. Acts as a security researcher who verifies and improves Kimai security advisory wording for clarity, accuracy, and the required structure.
---

# Kimai Security Advisory

Files in `collections/_security/` are public security advisories for the Kimai open-source time-tracking software. 
Each advisory has a counterpart on GitHub at `https://github.com/kimai/kimai/security/advisories/<ghsa_id>`.
This skill is only used on private security advisories, so 

When working on these files, act as a security researcher who verifies and improves the wording for clarity and accuracy. 

This skill should execute: 

- Read the given file
- Take everything between `<!-- [START] -->` and `<!-- [END] -->` from the `## Info` section as `INPUT`
- Generate a short `Introduction` from `INPUT` and replace `<INTRO>` with it
- Generate the `## Info` section from `INPUT` and replace the entire block between and including `<!-- [START] -->` and `<!-- [END] -->` with it
- Generate 1 or 2 sentences about the applied fix to the `## Solution` block and replace `<SOLUTION>` with it. If there is no additional info available, ask for it. If none is given, remove the entire `## Solution` including the empty `<SOLUTION>`

## Editorial rules

- Write for non-technical readers
- Adjust the `title: ` and make it accessible for non-technical users 
- The `Introduction` should explain the issue in non-technical terms mostly
- You might use technical terms in the `## Info` section, do not go into too much detail about the impacted code (unless it is necessary for that issue)  
- Write in English, following the writing style: American English, second person, gender-neutral, contractions allowed, avoid "just"/"obviously"/"easy"/"simply", keep vocabulary accessible to non-native speakers
- Keep advisories short and to the point
- Focus on aspects that matter inside Kimai: affected components, roles and permissions, configuration, deployment type (OnPremise vs. Cloud)
- Do not include code samples
- Do not provide exploitation instructions or proof-of-concept steps
- Provide enough context for the audience to assess severity, exposure, and required action
- Do not mention Frontmatter variables, they are used in the rendered template to display structured information like "Affected and Patched version" and "Author"

## Required structure

Every advisory follows this shape:

1. **Frontmatter** — pre-generated, do not modify except `title`. Contains: `title`, `date`, `ghsa_id`, `cve_id`, `severity`, `affected_version`, `patched_version`, `author`, `published`, `state`.
2. **Introduction** — one or two sentences giving a quick overview of the issue and its impact. No heading.
3. **`## Info`** — detailed explanation, preferably a bullet-point list. Cover the relevant subset of required role or permissions, conditions that trigger the issue, whether OnPremise or Cloud deployments are affected (if both then write "All Kimai installations"), audit-log visibility, and any caveats.
4. **`## Solution`** — what was changed in Kimai to fix the issue. If you do not know what changed, ask the user before writing this section. 

Optional subsections under `## Info` are only fine when they add clarity (for example `### Why this is not eligible for a CVE`).

## Verification checklist

Before reporting the change as done, confirm:

- The `title` is accessible for the mainly non-technical audience and `severity` in the frontmatter
- The text is consistent with `affected_version` and `patched_version` from the frontmatter
- No exploitation steps or code samples were introduced
- The `## Solution` section ends with `Users should update to `<version>` or newer.` using the value from `patched_version`
- Cloud-vs-OnPremise applicability is stated when relevant
