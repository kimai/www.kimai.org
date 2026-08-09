---
name: kimai-translate-post
description: "Use when translating or localizing a Kimai blog post or customer story from `collections/_posts/en/` into another language directory such as `collections/_posts/de/`. Trigger this whenever the user asks to translate a post, create a German (or French, Spanish, ...) version of an article, localize a story, or mentions a post filename together with a language — even if they don't say the word 'translate'. Also use when reviewing or fixing an already-translated post."
---

# Translate a Kimai blog post

Blog posts and customer stories live in `collections/_posts/<locale>/`. English is the source
language; every other locale is a translation of the English file with the **same filename**.

A translation is not a fresh article. It's the same post, in another language, with the Jekyll
plumbing pointed at the right locale. Most mistakes here come from translating too much (breaking
Liquid tags, renaming slugs) or too little (leaving `/en/` links behind). The rules below exist to
keep the build green and the page consistent with the rest of that locale's site.

## Input

The skill needs a source post and a target locale.

- **Source**: a filename or slug, for example `2026-07-08-fair-pricing.md`. Resolve it to
  `collections/_posts/en/<filename>`. If the user gives a partial name or just a topic, search the
  directory and confirm the match before starting.
- **Target locale**: the language code, for example `de`, `fr`, `es`. **If none is given, use `de`.**
  The locale must be listed under `languages` in `_config.yml`.

If you can't resolve the source file, ask rather than guess — translating the wrong post wastes
real review time.

## Before you write anything

Check whether `collections/_posts/<locale>/<filename>` already exists.

Existing translations often carry manual edits made after the last translation pass, so overwriting
one silently destroys work. **If the target file exists, stop and ask** whether to overwrite, and
say what you found. Only proceed once the user confirms.

If it doesn't exist, copy the English file to the target path first, then edit it in place. Working
from a copy means anything you forget to touch stays correct rather than going missing.

**Never change the filename.** The slug ties the locales together and feeds the language switcher.

## Frontmatter

Translate the fields that a reader sees, leave the structural ones alone.

### Every post

| Field | Action |
|---|---|
| `title` | Translate — unless it's a company or product name (common on stories) |
| `excerpt` | Translate |
| `date`, `author`, `tags`, `cta`, `layout` | Keep exactly as-is |
| `image` | See [Images](#images) |
| `permalink` | See [Permalinks](#permalinks) |

`tags` are internal keys that drive the tag archive pages (`cloud`, `stories`, `general`) — they
are never translated.

### Customer stories (`layout: story`)

Stories carry extra frontmatter. Translate these as well:

| Field | Action |
|---|---|
| `quote`, `quote2` | Translate — these are pull quotes shown on the page |
| `position` | Translate the job title (`Founder` → `Gründer`) |
| `industry` | Translate (`Education` → `Bildung`); leave it if the term is identical in the target language |
| `location` | Localize city and country (`Cologne, Germany` → `Köln, Deutschland`) |
| `wins` | Translate every list item, keeping the list structure and any quoting |
| `person`, `photo`, `logo`, `homepage`, `homepage_url`, `company`, `size`, `since`, `version` | Keep as-is |

`size`, `since` and `version` are data values (`2+`, `2024`, `cloud`), not prose.

### Permalinks

Only story posts set an explicit `permalink`. Swap the locale segment and keep the slug:

```
permalink: /en/stories/blueflare-consulting
permalink: /de/stories/blueflare-consulting
```

Do not translate the slug part — inbound links and the language switcher depend on it.

## Content

Translate the prose. Everything else is either markup or a build-time reference, and changing it
breaks something.

**Preserve exactly:**

- Markdown structure — heading levels, list markers, bold/italic, blockquotes, tables
- The source's line breaks. These files are written roughly one sentence per line so diffs stay
  readable. Keep that rhythm rather than reflowing into long paragraphs.
- Code inside single backticks and triple-backtick fences
- HTML comments such as `<!-- PARTS -->` — the story layout splits the page on these
- URLs in plain Markdown links, and `homepage_url`-style external links

**Translate:**

- All body prose, including headings and list items
- Link text (`[How Much Is Time Tracking?]` → `[Was kostet Zeiterfassung wirklich?]`)
- `title=` and `alt=` parameters passed to includes, since those render as visible captions:
  `{% include image.html src="..." title="Reddit discussion" %}` →
  `title="Reddit-Diskussion"`
- Quoted speech from interviewees in stories. Keep the typographic quote characters the source uses.

## Liquid tags

Three shapes show up, and each is handled differently.

**1. `{% link %}` with a hardcoded locale** — point it at the target locale, but only if that file
exists:

```liquid
{% link _posts/en/2025-12-05-price-comparison.md %}
```

Check for `collections/_posts/de/2025-12-05-price-comparison.md`. If it's there, switch to
`_posts/de/...`. **If it isn't, leave the `en` path.** Jekyll fails the build on a `{% link %}` to a
file that doesn't exist, and many older posts have never been translated. The same check applies to
`_industries/`, `_keywords/`, `_landingpage/`, `_store/` and `_pages/`.

**2. `{% link %}` with `{{ page.lang }}`** — leave it untouched. It already resolves per locale:

```liquid
{% link _store/{{ page.lang }}/invoice-bundle.md %}
```

**3. Everything else** — `{% include ... %}`, filters like `{{ page.lang | url_cloud_register }}`,
and any other tag: keep the tag itself intact and translate only human-readable parameter values.

Documentation links (`{% link _documentation/... %}`) have no locale directory — leave them alone.

## Images

The `image:` frontmatter field points to the social/header image, which sometimes contains English
text baked in. A localized version may exist at `/images/blog/<locale>/<name>.webp`.

Check whether that file exists on disk. If it does, use it. If not, keep the English path — a
broken image path is worse than an English one. Inline images referenced through
`{% include image.html %}` follow the same rule.

Don't create or edit image files as part of a translation. If a localized image is obviously needed
(the screenshot is full of English UI text) mention it in the handoff so the user can decide.

## Writing style

Match the tone of existing posts in the target locale rather than translating word for word. Read
one or two neighbouring files in `collections/_posts/<locale>/` if you're unsure how something is
usually phrased.

General guidance:

- Keep it natural. A literal translation that reads like a translation defeats the purpose.
- Keep product terms in English: Kimai Cloud, On-Premise, Plugin, Bundle, Timesheet where the
  locale already uses it.
- Keep the friendly, direct voice of the source. Kimai posts avoid hype and avoid "just", "simply",
  "obviously" — that holds in every language.
- Numbers, prices and dates keep their source values. Adjust only the formatting convention if the
  locale clearly uses another one (`€2,99` stays `€2,99` in German).

**German specifically:** use formal *Sie*, not *du* — that's the established convention across
`collections/_posts/de/`.

## Verification

Before reporting the translation as done, confirm:

- The target file has the same filename as the English source
- No `{% link %}` points at a file that doesn't exist — check each one you changed
- `permalink` (stories only) uses the target locale prefix and the unchanged slug
- `date`, `author`, `tags` are byte-identical to the source
- Every `<!-- PARTS -->` comment from the source is still present, in the same position
- Code blocks are unchanged
- The `image:` path resolves to a file that exists

State in the handoff which links you left pointing at `en` because no translation exists, and
whether a localized header image is missing. Those are the two things the user will want to follow
up on.
