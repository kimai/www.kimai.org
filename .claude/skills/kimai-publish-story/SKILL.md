---
name: kimai-publish-story
description: "Publish a Kimai customer success story on www.kimai.org in English and German from finished text, with header, person and logo images, ending in a pull request. Use whenever the user wants to add or publish a success story, customer story or case study."
---

# Publish a Kimai success story

Success stories are blog posts with `layout: story` that live twice: once in
`collections/_posts/en/` and once in `collections/_posts/de/`, with the same filename. Each one
uses three pictures in `images/stories/`. The reference example is
`collections/_posts/en/2026-11-10-solidic.md` and its German twin
`collections/_posts/de/2026-11-10-solidic.md`. Read both before you start, so the result looks
like the stories already on the site.

The user hands over **finished text** in German *or* English. Your job is to fit it into the
story template, write the other language, put the pictures in place, check that both versions
match, and open a pull request. You are not writing the story itself. Keep the user's wording and
facts. Only rewrite to fit the structure or to fix obvious mistakes, and say so when you do.

## 1. Collect the input

You need the following. Take what you can from the text and the user's message, and **ask once,
in a single list,** for anything that is missing. Don't make up facts about a real company.

| What | Frontmatter | Example (Solidic) |
|---|---|---|
| Company name (page title) | `title` | `"Solidic GmbH"` |
| Website, shown and linked | `homepage`, `homepage_url` | `www.solidic.it`, `https://www.solidic.it` |
| Interviewee's full name | `person` | `Dr. Ing. Felix Bertagnolli` |
| Interviewee's job title | `position` | `Managing Director` / `Geschäftsführer` |
| Industry | `industry` | `Civil engineering` / `Bauingenieurwesen` |
| Company size (employees) | `size` | `5+` |
| Using Kimai since (year) | `since` | `2020` |
| City, country | `location` | `Bolzano, Italy` / `Bozen, Italien` |
| Kimai edition | `version` | `onpremise` or `cloud` |
| Publication date | `date` | `"2026-11-10 12:00:00 +0200"` |
| Header, person and logo pictures | `image`, `photo`, `logo` | see step 3 |

Some fields are often missing from the text. You can draft these from it, then show the drafts
to the user for a yes/no:

- `excerpt`: one sentence of the form "How a … did … with Kimai". It is shown as the H2 above
  the story.
- `quote`: despite the name, this is a **short third-person bio** of the interviewee, 1–2
  sentences. It is shown next to their photo.
- `wins`: 3–5 short bullet points with concrete results from the text.

**The quote box (`quote2`) is not drafted.** The provided text ends with a quote by the
interviewee. That closing quote is the one for the quote box, which shows it with the person's
photo, name and position. Take it **word for word** from the end of the text and put it into
`quote2`. Then remove it from the body, so it doesn't appear twice on the page. The body then
ends with the thank-you line. Leave out the surrounding quote marks and any attribution
("— Felix Bertagnolli"), because the layout adds the name and position itself. If the text
doesn't end with a quote by the interviewee, ask the user which quote to use. Don't pick one
from the middle of the text and don't write one.

`author` defaults to `nikita` (the author of the existing stories) unless the user says otherwise.
`tags: [stories]` and `layout: story` are always the same.

## 2. Names and paths

Derive these once and use them everywhere:

- **slug**: kebab-case of the company name as it appears in the title, e.g. `solidic-gmbh`,
  `leadmetrix`, `blauart-catering`. Ask if it's unclear whether to include the legal form.
- **filename**: `YYYY-MM-DD-<short-name>.md` using the publication date. It must be identical in
  `en/` and `de/`, because the language switcher pairs the files by filename.
- **permalink**: `/en/stories/<slug>` and `/de/stories/<slug>`. Only the locale segment differs.
  The slug is never translated.
- **date**: `"YYYY-MM-DD 12:00:00 +0100"` (use `+0200` during summer time). Use the same value in
  both files. Jekyll doesn't build posts with a future date (`future` is not enabled in
  `_config.yml`), so a future-dated story only appears after a build on or after that day. Tell
  the user if the date is in the future, and double-check that it's the intended one: a wrong
  date is the most common fix needed after a story PR.

Check that neither `collections/_posts/en/<filename>` nor `collections/_posts/de/<filename>`
exists yet, and that no other story already uses the slug. If one does, stop and ask.

## 3. Pictures

Every story has exactly three pictures. Copy them into `images/stories/` under these names,
keeping each file's original extension. **Don't convert, resize or re-encode them.** The user
prepares the files.

| Picture | Target name | Used for |
|---|---|---|
| Header | `<slug>-header.<ext>` | `image:` the large landscape picture at the top of the page |
| Person | `<slug>-photo.<ext>` | `photo:` cover background next to the bio, and a round avatar |
| Logo | `<slug>-logo.<ext>` | `logo:` small logo next to the person's name (max 50px tall) |

Frontmatter paths start with a slash: `/images/stories/<slug>-header.webp`.

If it's unclear which file is which, ask rather than guess. A person photo in the header slot is
very visible. Then check the files (`identify` or `file` show dimensions) and report what you
found. Warn, but don't block, when:

- the header is not landscape (existing headers are about 1536–1920 px wide, 3:2),
- the person photo is not roughly square (existing ones are 600–1200 px square, under 40 KB),
- a raster file is unusually large (more than about 300 KB for the header, or 50 KB for the
  photo). Large photos have been shrunk by hand after earlier PRs.

If the user's source says where the header comes from (for example an Unsplash link), keep that
as a YAML comment above `image:`, the way `2026-10-05-leadmetrix.md` does.

## 4. Write the source-language file

Use this structure. It is the same for every story, and the `story` layout depends on it: the
body is split at the two `<!-- PARTS -->` markers into three sections. Between the first and
second section the page shows the photo with the bio (`quote`). Between the second and third it
shows the pull quote (`quote2`).

```markdown
---
title: "<Company>"
date: "<YYYY-MM-DD 12:00:00 +0100>"
permalink: /<lang>/stories/<slug>
layout: story
tags: [stories]
author: nikita
excerpt: "<one sentence>"
homepage: <www.example.com>
homepage_url: <https://www.example.com>
logo: /images/stories/<slug>-logo.<ext>
image: /images/stories/<slug>-header.<ext>
person: <Full Name>
photo: /images/stories/<slug>-photo.<ext>
quote: "<third-person bio, 1–2 sentences>"
quote2: "<the closing quote from the end of the provided text, word for word>"
position: <Job title>
industry: <Industry>
size: <N+>
since: <YYYY>
location: <City, Country>
version: <onpremise|cloud>
wins:
  - <win 1>
  - <win 2>
  - <win 3>
---

**TL;DR**

<2–4 sentence summary: who they are, the problem, what Kimai does for them now>

**About the company**

<1 paragraph about the company>

<!-- PARTS -->
<main story: the situation before, the problem, how Kimai was introduced or connected, how it works now.
Optional bold sub-headings like **The challenge: …** are fine, as in the BlauArt and LeadMetrix stories.>
<!-- PARTS -->

<results, advice to other companies, outlook>

<Thank-you line, e.g. "A big thank you to <Person> for the valuable insights — best of luck to <Company> going forward!">
```

In German the second heading is `**Über das Unternehmen**`. `**TL;DR**` stays the same.

Keep the frontmatter keys in exactly this order in both files. That makes the two files easy to
diff and lets the check in step 6 compare them. Wrap `title`, `date`, `excerpt`, `quote` and
`quote2` in double quotes. If the text itself contains a `"`, use typographic quotes inside:
`“…”` in English, `„…“` in German. Make sure every opening quote mark has a closing one.

Put interviewee quotes in the body in italics with typographic quotes, as in Solidic:
`*"For me it's absolutely a productivity booster."*` / `*„Für mich ist es absolut ein Produktivitätshelfer.“*`.

The body is plain Markdown. No `<span>`, `<br>` or other HTML. Stray tags like that usually come
from copying text out of Word or Google Docs, so clean them out of the source text.

## 5. Write the other language

Translate the finished source file into the other language. If `.claude/skills/kimai-translate-post`
exists, follow its rules. They are written for EN→DE, but they apply the same way for DE→EN.
The essentials:

- **Translate:** `excerpt`, `quote`, `quote2`, `position`, `industry`, `location` (localize
  place names: Bozen ↔ Bolzano, Köln ↔ Cologne), every `wins` item, and all body text including
  bold headings and link text.
- **Keep identical:** `title` (company name), `date`, `layout`, `tags`, `author`, `homepage`,
  `homepage_url`, `logo`, `image`, `person`, `photo`, `size`, `since`, `version`, and the slug in
  `permalink`.
- **Same structure:** same paragraphs in the same order, same `<!-- PARTS -->` positions, same
  number of wins, same sub-headings, and the same links. If one version links to the Kimai API
  docs, the other one must too. For `www.kimai.org` links with a locale segment (`/en/…`,
  `/de/…`), point each version at its own language.
- German uses formal *Sie* in the narrative. Direct quotes from the interviewee stay as they said
  them, even if they used *du*.
- Match the tone of the neighbouring stories in that language.

### Sound like a native speaker

The translated version has to read as if it had been written in that language from the start.
Readers of the German page shouldn't be able to tell that the story was written in English, and
the reverse. A text that is correct but obviously translated feels stiff, and it makes the
customer sound stiff too. So translate the meaning, not the words, and use the idioms and
expressions a native speaker would naturally pick in a business blog.

- **Replace idioms with idioms.** Find the expression a native speaker would use for the same
  idea, rather than translating the image literally or flattening it into a dry word:
  - DE *jemandem eins auf den Deckel geben* → EN *to come down on someone*, not *to reprimand*
  - DE *den Überblick behalten* → EN *to keep track of*, not *to keep the overview*
  - DE *Das war umständlich.* → EN *That was a hassle.*
  - DE *praktisch gegen null* → EN *practically zero*
  - EN *a game changer* → DE *ein echter Gewinn* or *hat vieles verändert*
  - EN *hit the ground running* → DE *von Anfang an voll durchstarten*
  - EN *it's a no-brainer* → DE *da muss man nicht lange überlegen*
- **Restructure sentences.** German tends towards long sentences and noun-heavy phrasing
  (*die Durchführung der Erfassung*). In English, split long sentences and use verbs (*logging
  hours*). Going from English to German, don't copy English word order or *-ing* constructions.
  Build the sentence the way a German writer would.
- **Watch out for false friends:** *eventuell* ≠ *eventually*, *aktuell* ≠ *actually*,
  *konsequent* ≠ *consequent*, *sensibel* ≠ *sensible*, *Chef* ≠ *chef*, *Handy* ≠ *handy*,
  *Kontrolle* is often *oversight* or *checking* rather than *control*.
- **Interviewee quotes** get the same treatment. Render them as that person would have said it
  in the other language, in the same tone (casual, dry, enthusiastic, with a wink), while keeping
  exactly what they meant. The quote-box quote is included.
- **Stay natural, not showy.** Use an idiom where a native writer would, not to decorate the
  text. No slang, no regional dialect, and nothing that changes the facts or makes the claims
  stronger than the original.

When you're done, read the translation once on its own, without the source. Any sentence that
only makes sense next to the original needs rewriting.

## 6. Check both versions

Run this check from the repository root. It compares the two files and catches the problems
earlier stories needed fixing for: links in one language only, stray HTML, unbalanced quote
marks, wrong permalink locales, missing images.

```bash
python3 - collections/_posts/en/<filename> collections/_posts/de/<filename> . <<'PY'
import re, sys, os
def load(path):
    text = open(path, encoding="utf-8").read()
    m = re.match(r"^---\n(.*?)\n---\n(.*)$", text, re.S)
    if not m: sys.exit(f"{path}: no frontmatter")
    keys, data, wins = [], {}, []
    for line in m.group(1).splitlines():
        km = re.match(r"^([a-z_0-9]+):\s*(.*)$", line)
        if km:
            keys.append(km.group(1)); data[km.group(1)] = km.group(2).strip().strip('"')
        elif re.match(r"^\s+-\s+", line):
            wins.append(line.strip()[2:])
    return keys, data, wins, m.group(2)
paras = lambda part: [p for p in re.split(r"\n\s*\n", part.strip()) if p.strip()]
en_path, de_path, root = sys.argv[1], sys.argv[2], sys.argv[3]
problems, en, de = [], load(en_path), load(de_path)
if os.path.basename(en_path) != os.path.basename(de_path): problems.append("filenames differ")
if en[0] != de[0]: problems.append(f"frontmatter keys/order differ:\n  en={en[0]}\n  de={de[0]}")
for k in ["title","date","layout","tags","author","homepage","homepage_url","logo","image","person","photo","size","since","version"]:
    if en[1].get(k) != de[1].get(k): problems.append(f"'{k}' differs: en={en[1].get(k)!r} de={de[1].get(k)!r}")
for lang, d in (("en", en), ("de", de)):
    if not d[1].get("permalink", "").startswith(f"/{lang}/stories/"): problems.append(f"{lang}: permalink must start with /{lang}/stories/")
    for k in ["title","excerpt","homepage","homepage_url","logo","image","person","photo","quote","quote2","position","industry","size","since","location","version"]:
        if not d[1].get(k): problems.append(f"{lang}: missing or empty '{k}'")
    for k in ["logo","image","photo"]:
        p = d[1].get(k, "")
        if p and not os.path.isfile(os.path.join(root, p.lstrip("/"))): problems.append(f"{lang}: {k} file not found: {p}")
    for k in ["quote","quote2"]:
        v = d[1].get(k, "")
        opens = v.count("„") + (v.count("“") if lang == "en" else 0)
        closes = v.count("”") if lang == "en" else v.count("“")
        if opens != closes: problems.append(f"{lang}: unbalanced quotation marks in '{k}': {v[:60]}...")
    if not d[2]: problems.append(f"{lang}: no wins")
    body = d[3]
    if body.count("<!-- PARTS -->") != 2: problems.append(f"{lang}: expected 2 '<!-- PARTS -->' markers, found {body.count('<!-- PARTS -->')}")
    stray = re.findall(r"</?[a-z]+[^>]*>", re.sub(r"<!--.*?-->", "", body))
    if stray: problems.append(f"{lang}: stray HTML tags in body: {sorted(set(stray))}")
    if "**TL;DR**" not in body: problems.append(f"{lang}: missing **TL;DR**")
if len(en[2]) != len(de[2]): problems.append(f"wins count differs: en={len(en[2])} de={len(de[2])}")
for i, (a, b) in enumerate(zip(en[3].split("<!-- PARTS -->"), de[3].split("<!-- PARTS -->"))):
    if len(paras(a)) != len(paras(b)): problems.append(f"section {i+1}: paragraph count differs: en={len(paras(a))} de={len(paras(b))}")
link = r"\]\((https?://[^)\s]+)\)"
la, lb = re.findall(link, en[3]), re.findall(link, de[3])
norm = lambda ls: sorted(re.sub(r"/(en|de)/", "/LANG/", u) for u in ls)
if norm(la) != norm(lb): problems.append(f"links differ:\n  en={la}\n  de={lb}")
if problems:
    print("PROBLEMS FOUND:"); [print(" -", p) for p in problems]; sys.exit(1)
print("OK: EN and DE versions match structurally")
PY
```

Fix everything it reports and run it again until it prints `OK`. If a difference is intentional
(rare), say why in the handoff. The script checks structure, not meaning, so also read the two
versions side by side once. Every fact, number and name should appear in both.

## 7. Preview the real pages and wait for approval

The user reviews the story on the real site before anything is committed. Nothing goes into git
until they have looked at both pages and approved them. The preview is the local Jekyll dev
server, so the user sees exactly the layout, pictures, quote boxes and wins box that kimai.org
will show. The CSS is committed in `assets/build/`, so no `npm` build is needed.

1. **Start the dev server** in the background from the repository root. This is the command from
   `scripts/start-dev.sh` plus `--future`. Without `--future`, a story with a publication date
   in the future is not built and its page returns 404:
   ```bash
   JEKYLL_ENV=development bundle exec jekyll serve -H 127.0.0.1 --incremental --future \
     --config _config.yml,_config.dev.yml > /tmp/kimai-jekyll.log 2>&1 &
   echo $! > /tmp/kimai-jekyll.pid
   ```
   If something already answers on port 4000 (`curl -sI http://127.0.0.1:4000/`), reuse that
   server. If the story is future-dated and its page 404s there, the running server probably
   lacks `--future`: tell the user and ask whether to restart it. The first build is slow. Check
   the log every 15–30 seconds until it shows `Server running`, and report any build error
   instead of carrying on. If gems are missing, run `bundle install` once. If Ruby or Bundler
   itself is missing, tell the user and ask how to continue. Never skip the preview and go
   straight to the commit.

2. **Check that the pages and pictures load.** Each of these should return `200`:
   ```bash
   for u in /en/stories/<slug> /de/stories/<slug> \
            /images/stories/<slug>-header.<ext> /images/stories/<slug>-photo.<ext> /images/stories/<slug>-logo.<ext>; do
     echo "$(curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1:4000$u) $u"
   done
   ```

3. **Look at the pages yourself first** if a browser tool is available (the built-in browser,
   Claude in Chrome, or a screenshot). Check the header picture, the photo next to the bio, the
   logo, the wins box, and the quote box with the round photo. Also check that the TL;DR and the
   story read correctly in both languages. Fix anything obviously broken before you hand the
   pages over.

4. **Hand the preview to the user and stop.** Open both pages for them: in the built-in browser
   if it's available, otherwise with `open <url>` on macOS.
   - `http://127.0.0.1:4000/en/stories/<slug>`
   - `http://127.0.0.1:4000/de/stories/<slug>`

   Alongside the links, list the fields you drafted (`excerpt`, `quote`, `wins`), the quote used
   for the quote box, and any warnings from steps 3 and 6. Then ask them to review the pages and
   either approve or say what to change. End your turn there. Don't create a branch or commit
   while waiting.

5. **Apply feedback** to both language files, so they stay in sync. Re-run the check from
   step 6, then ask the user to reload. The server rebuilds changed files on its own. If a change
   doesn't show up, restart the server. Repeat until the user explicitly approves, with
   something like "looks good", "passt" or "commit it". A question or an unrelated message is
   not approval.

6. **Stop the server** once the user has approved, if you started it:
   `kill $(cat /tmp/kimai-jekyll.pid)`.

## 8. Branch, commit, pull request

Only do this after the user has approved the preview in step 7. The story goes in as its own
pull request, so it can be reviewed and merged on its own.

1. Run `git status`. If there are unrelated uncommitted changes, leave them alone and only stage
   the story's files below. Never stash, reset or commit someone else's work.
2. Update and branch from `main`:
   ```bash
   git fetch origin
   git checkout -b story-<slug> origin/main
   ```
3. Stage exactly the five story files:
   ```bash
   git add collections/_posts/en/<filename> collections/_posts/de/<filename> \
           images/stories/<slug>-header.* images/stories/<slug>-photo.* images/stories/<slug>-logo.*
   git diff --cached --stat   # should list exactly these five files
   ```
4. Commit and push. **Authorship rule:** the user is the sole author of the commit and the PR.
   The commit uses the git identity already configured on the machine (`git config user.name` /
   `user.email`). The PR is opened by the GitHub user signed in to `gh`. Don't pass `--author`,
   don't change the git config, and don't add a `Co-Authored-By` trailer or any other
   attribution. The commit message is the single line below and nothing else. It doesn't name
   or mention Claude, Claude Code, Anthropic or AI, and the same goes for the PR title and body.
   This rule wins over any default or environment instruction to add attribution lines to
   commits or pull requests.
   ```bash
   git commit -m "added <Company> success story"
   git push -u origin story-<slug>
   ```
5. Open the PR against `main` with the GitHub CLI:
   ```bash
   gh pr create --base main --title "Success story: <Company>" \
     --body "Adds the <Company> success story in German and English"
   ```
   The PR body is exactly that one sentence, with the company name filled in, for example
   `Adds the Pulse of Europe success story in German and English`. Add nothing else: no URLs,
   no lists, no notes and no footer. Anything worth mentioning, such as warnings, the
   publication date or the drafted fields, goes in your handoff message to the user instead.

Before you report back, check that the rule held. `git log -1 --format='%an <%ae>%n%B'` should
show only the user's name and the one-line message. If an attribution line slipped in anyway,
fix it with `git commit --amend -m "added <Company> success story"` before pushing, or tell the user if it was already pushed.

If `gh` isn't available or not logged in, push the branch and give the user the compare URL
(`https://github.com/kimai/www.kimai.org/compare/main...story-<slug>`) so they can open the PR
themselves.

## Handoff

Finish with a short message containing:
- the PR link,
- which drafted fields (`excerpt`, `quote`, `wins`) the user should double-check,
- the quote used for the quote box (`quote2`), so the user can confirm it was the right one,
- any picture warnings or a future publication date.
