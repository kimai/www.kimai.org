---
name: kimai-add-partner
description: "Add or update an official Kimai partner profile on www.kimai.org (shown on /en/partner/find and /de/partner/find) in English and German, from the details the partner sent plus what the website already knows about them, ending in a pull request. Use whenever the user wants to add, list, onboard or publish a new Kimai partner, or update an existing partner profile."
---

# Add a Kimai partner profile

Official Kimai partners are listed in the partner directory at `/<lang>/partner/find` and each one
has a profile page at `/<lang>/partner/<slug>`. A profile is made of two pieces that must fit
together:

1. **The partner file** `collections/_partner/<slug>.md`. It holds the services, regions,
   languages and "partner since" year, plus the long "About" text in German and English. There
   is **one file per partner, not one per language**. The `partner` collection is
   `multi_language`, so `_plugins/multi_language_collection.rb` generates a page for every
   locale from that one file. The body switches between German and English with
   `{% if page.lang == 'de' %}`. All other locales show the English text.
2. **The developer entry** in `_data/developer.yml`, linked through `developer: <key>`. It holds
   the logo, website, email, phone, contact person, location and the short introduction in
   `en`/`de`. The directory card on `/partner/find` only reads from this entry, and the profile
   page uses it for the header and the contact box. Store extensions are linked to the profile
   through the same key.

Templates: `_layouts/partner.html` (profile) and `_includes/pages/find-a-partner.html`
(directory). Reference examples: `collections/_partner/dolux-gmbh.md`,
`collections/_partner/helsinki-systems.md` and `collections/_partner/pcsg.md` with their
`dolux`, `helsinkisystems` and `pcsg` entries in `_data/developer.yml`. Read at least two of them
before you start, so the new profile looks like the ones already on the site. The past partner
pull requests show the exact scope of a change: `git show aa8f361312` (Dolux) and
`git show 08ba1694c1` (Jan Čejka, which also added a new region).

The user hands over **the details the partner sent**: usually an email, a filled-in form or a
pasted text, sometimes with a logo. Your job is to merge that with what the website already knows
about the partner, fit it into the two files, write the other language, check, preview, and open
a pull request. Keep the partner's wording and facts. Only rewrite to fit the structure, to fix
obvious mistakes, or to follow the writing rules below, and say so when you do.

## 1. Collect what is already known

Before you ask the user anything, look up what the repository already has about the partner.
Search by company name, person name, domain and GitHub user:

```bash
grep -n -i -B2 -A14 "<name or domain>" _data/developer.yml
grep -rln -i "<name or domain>" collections/_partner _data/store collections/_posts collections/_stories
```

- **Existing developer entry** in `_data/developer.yml`: many partners already publish plugins in
  the Kimai Store and have an entry with `name`, `description`, `image`, `homepage`, `github` and
  `email`. Reuse that entry and its key. Never create a second entry for the same company.
- **Store extensions** in `_data/store/*.yaml` with `developer: <key>`: the profile lists them
  automatically. Mention them in the About text only if the partner did.
- **Existing partner file** `collections/_partner/<slug>.md`: then this is an update, not a new
  profile. Edit the existing file and keep its `partner_since`.
- **Stories or blog posts** about the partner: useful background, but don't copy text from them.

You may also open the partner's own public website to confirm the location, the logo URL or the
spelling of the company name. Use only facts that the partner sent or that their website states.
Don't make up facts about a real company: no invented years, team sizes, certifications or
customers.

## 2. The fields

Take what you can from the partner's details and the existing data. **Ask once, in a single
list,** for anything required that is still missing.

| What | Where | Example (Dolux) | Required |
|---|---|---|---|
| Company or person name (page title) | partner `title` | `Dolux GmbH` | yes |
| Developer key | partner `developer` | `dolux` | yes |
| Services | partner `services` | `installation`, `hosting`, … | yes |
| Regions they serve | partner `regions` | `ch` | yes |
| Languages they work in | partner `languages` | `German`, `English` | yes |
| Partner since (year) | partner `partner_since` | `2026` | yes |
| Long About text | partner body | 1–4 paragraphs | yes |
| Full company name | developer `name` | `Dolux GmbH` | yes |
| Short description (store pages) | developer `description` | `Platform Engineering and IT-Solutions` | yes |
| Logo | developer `image` | `https://dolux.ch/images/logo.webp` | recommended |
| Website | developer `homepage` | `https://dolux.ch` | yes |
| GitHub | developer `github` | `https://github.com/helsinki-systems` | if known |
| City, country | developer `location` | `Glattbrugg, Switzerland` | yes |
| Phone | developer `phone` | `+49 (0)711 96 88 39 91` | if given |
| Contact email | developer `email` | `kimai@dolux.ch` | yes* |
| Contact person | developer `contact` | `Patrick Müller` | if given |
| Back link to the profile | developer `partner` | `dolux-gmbh` (the slug) | yes |
| Short introduction, EN and DE | developer `introduction.en` / `.de` | one sentence each | yes |

\* The **Contact** button on the profile needs either `email` in the developer entry or
`contact_url` (a contact form URL) in the partner file. Only publish an email address, phone
number or person name that the partner gave for this purpose. A private address found somewhere
else doesn't count.

`partner_since` is the year the partnership started, which for new partners is the current year.

### Services

Use the standard keys whenever they fit. They are translated and have their own icons:

| Key | EN | DE |
|---|---|---|
| `installation` | Installation | Installation |
| `hosting` | Hosting | Hosting |
| `development` | Development | Entwicklung |
| `training` | Training | Schulung |
| `slas` | SLAs (support & maintenance) | SLAs (Support & Wartung) |
| `other` | Other | Sonstiges |

A free-text service (for example `Hardware Clockin Terminals` or `Custom plugins`) is allowed,
and some partners already use one, but it shows **in English on every locale** with the generic
icon. Map the partner's wording to a standard key where possible. Keep a free-text service only
if it says something the standard keys don't, and tell the user about it in the handoff.

### Regions

Each region key gets a flag and a localized name from the three `{% case region %}` blocks in
`_layouts/partner.html`. Supported today: `de`, `at`, `ch`, `nl`, `fr`, `be`, `cz`, `europe`,
`usa`. Anything else, including `world`, shows as 🌐 World-wide / Weltweit. If the partner serves
a country that is missing, add it to **all three** case blocks (flag, German name, English name),
the way `git show 08ba1694c1` added `cz`. Use the lowercase ISO 3166-1 alpha-2 code as the key.

### Languages

`languages` is the list of languages the partner works in, written in English (`German`,
`English`, `Czech`). The layout doesn't translate them, and the existing profiles use English on
every locale.

## 3. Names and paths

Derive these once and use them everywhere:

- **slug**: kebab-case of the name the way the partner presents themselves, ASCII only, e.g.
  `dolux-gmbh`, `helsinki-systems`, `pcsg`, `jan-cejka` (from Jan Čejka). The page lives at
  `/<lang>/partner/<slug>` and the filename is `collections/_partner/<slug>.md`. Ask if it's
  unclear whether to include the legal form.
- **developer key**: the existing key if the partner already has a developer entry. Otherwise
  lowercase letters and digits, no separators, like the existing keys: `dolux`, `helsinkisystems`,
  `jancejka`. Check that it isn't taken.

If `collections/_partner/<slug>.md` already exists and you didn't expect it, or another partner
already uses that developer key, stop and ask.

## 4. Logo

The logo is shown as an 80×80 px square with `object-fit: cover` on the profile and 64×64 px on
the directory card, so a square logo or icon works best. A wide logo gets cropped at the sides.

- If the developer entry already has an `image`, keep it unless the partner sent a new logo.
- If the partner sent a logo file, copy it to `images/marketplace/<key>-logo.<ext>` and set
  `image: /images/marketplace/<key>-logo.<ext>`. Keep the file as it is: don't convert, resize or
  re-encode it. Warn if it isn't `webp`, isn't roughly square, or is larger than about 100 KB.
- Otherwise a stable logo URL from the partner's website or their GitHub avatar
  (`https://avatars.githubusercontent.com/<user>`) is fine, as the existing entries do.
- Without any logo the page shows the first two letters of the name. That works, but tell the
  user.

If it's unclear which file is the logo, ask rather than guess.

## 5. Write the developer entry

Edit the existing entry in place, or append a new one at the end of `_data/developer.yml`, with
one blank line before it. Use four-space indentation and this key order. Leave out keys you have
no value for:

```yaml
<key>:
    name: <Full company name>
    description: <short description>
    image: <logo URL or /images/marketplace/<key>-logo.webp>
    homepage: <https://www.example.com>
    github: <https://github.com/example>
    location: <City, Country>
    phone: <+49 (0)… as the partner wrote it>
    email: <contact email>
    contact: <Contact person>
    partner: <slug>
    introduction:
        en: <one sentence in English>
        de: <the same sentence in German>
```

- Don't remove or rename existing keys of an existing entry: store pages and stories use them
  too (`description`, `github`, `support`, …). The developer `description` is also shown on the
  partner's store extensions. Only change it if it no longer fits, and say so in the handoff.
- `introduction` is the text of the directory card. Write one sentence of 20–30 words about what
  the partner does with Kimai for their customers, in the third person, like the existing
  entries. Draft it from the partner's details and show it to the user.
- `location` is written in English (`Stuttgart, Germany`). The layout doesn't translate it.
- Quote a value with double quotes if it contains `: ` or starts with a special character
  (`*`, `&`, `!`, `@`, `[`, `{`, `>`, `|`, `%`, `#`).

## 6. Write the partner file

```markdown
---
title: <Name as shown on the page>
developer: <key>
excerpt: <the same sentence as introduction.en>
services:
    - installation
    - hosting
regions:
    - de
languages:
    - German
    - English
partner_since: <YYYY>
---
{% if page.lang == 'de' %}
<German About text, 1–4 paragraphs>
{% else %}
<English About text, the same paragraphs>
{% endif %}
```

- Keep the frontmatter keys in this order. Don't set `lang`, `permalink` or `layout`: they come
  from `_config.yml` and the multi-language generator.
- `excerpt` is the same sentence as `introduction.en` and is used for the page description.
- The body is plain Markdown between the Liquid tags. No `<span>`, `<br>` or other HTML. Stray
  tags like that usually come from copying text out of Word, Google Docs or an email, so clean
  them out.
- **Voice:** keep the perspective the partner wrote in. If they wrote about themselves ("we",
  "I"), keep it, like Helsinki Systems, PCSG and Jan Čejka. If we write the text from their
  details, use the third person with the company name, like Dolux. Don't mix both in one text.
- **Length:** 1–4 paragraphs. Shorten a very long text to its key points about who they are,
  what they do with Kimai, and how they work with customers. Tell the user what you cut.
- Don't repeat the services, regions, languages, store extensions or contact details as lists in
  the body. The page already shows them in their own boxes.
- Don't promise anything on behalf of Kimai, and don't make the partner's claims stronger than
  they made them.

### Writing rules

For the English text follow the repository style: American English spelling
(`specialize`, `organization`), contractions, simple words for non-native readers, and none of
"just", "obviously", "easy", "simply". For partner-written text, apply this gently. Fix spelling
and the banned words, but don't rewrite their voice.

## 7. Write the other language

The partner may send German, English or both.

- **Both languages provided:** use both, and fix only obvious mistakes. Check that they say the
  same thing. If one has a fact the other doesn't, ask which is right.
- **One language provided:** translate it. If `.claude/skills/kimai-translate-post` exists,
  follow its rules for natural, native-sounding text. Translate the meaning, not the words. Use
  the idioms a native speaker would use. Restructure sentences instead of copying the word order.
  Watch out for false friends.
- German uses formal *Sie* when it addresses the reader, which is the site convention. If the
  partner wrote their own German text with *du*, keep their choice and mention it in the handoff.
- Both versions have the same paragraphs in the same order, and the same links.
- `introduction.de` is a translation of `introduction.en`, with the same facts.

When you're done, read the translation once on its own, without the source. Any sentence that
only makes sense next to the original needs rewriting.

## 8. Check

Run this from the repository root. It uses Ruby, which the Jekyll setup already needs. It
compares the partner file with the developer entry, the layout and the translations, and catches
the problems the earlier partner pages needed fixing for.

```bash
ruby - <slug> . <<'RUBY'
require "yaml"
Encoding.default_external = Encoding::UTF_8
slug, root = ARGV[0], ARGV[1] || "."
path = File.join(root, "collections/_partner/#{slug}.md")
problems, warnings = [], []
abort "#{path}: not found" unless File.file?(path)
m = File.read(path).match(/\A---\n(.*?)\n---\n(.*)\z/m) or abort "#{path}: no frontmatter"
fm, body = (YAML.safe_load(m[1]) || {}), m[2]
devs = YAML.safe_load(File.read(File.join(root, "_data/developer.yml")), aliases: true)
known_services = YAML.safe_load(File.read(File.join(root, "_data/en/translation.yml")))["partner-services"].keys
known_regions = File.read(File.join(root, "_layouts/partner.html")).scan(/\{% when '([a-z]+)' %\}/).flatten.uniq
%w[title developer excerpt services regions languages partner_since].each do |k|
  problems << "frontmatter: missing or empty '#{k}'" if fm[k].to_s.strip.empty?
end
%w[lang permalink layout].each { |k| problems << "frontmatter: don't set '#{k}'" if fm.key?(k) }
key = fm["developer"].to_s
if (dev = devs[key]).nil?
  problems << "_data/developer.yml: no entry '#{key}'"
else
  %w[name description homepage location partner].each { |k| problems << "developer.#{key}: missing '#{k}'" if dev[k].to_s.strip.empty? }
  problems << "developer.#{key}: needs 'email' (or contact_url in the partner file) for the contact button" if dev["email"].to_s.empty? && fm["contact_url"].to_s.empty?
  problems << "developer.#{key}.partner is '#{dev['partner']}', expected '#{slug}'" if dev["partner"] && dev["partner"] != slug
  intro = dev["introduction"] || {}
  %w[en de].each { |l| problems << "developer.#{key}: missing introduction.#{l}" if intro[l].to_s.strip.empty? }
  problems << "excerpt differs from developer.#{key}.introduction.en" if intro["en"] && fm["excerpt"].to_s.strip.chomp(".") != intro["en"].strip.chomp(".")
  others = devs.select { |k, d| k != key && d.is_a?(Hash) && d["partner"] == slug }.keys
  problems << "other developer entries also point to '#{slug}': #{others}" unless others.empty?
  img = dev["image"].to_s
  if img.empty? then warnings << "developer.#{key}: no image, the page shows initials"
  elsif img.start_with?("/") && !File.file?(File.join(root, img.delete_prefix("/"))) then problems << "developer.#{key}: image file not found: #{img}"
  end
end
Array(fm["services"]).each { |s| warnings << "service '#{s}' is free text: shown in English on every locale with the generic icon" unless known_services.include?(s.to_s) }
Array(fm["regions"]).each { |r| warnings << "region '#{r}' has no flag or name in _layouts/partner.html: shown as World-wide" unless known_regions.include?(r.to_s) }
de, en = body.split("{% else %}", 2)
if en.nil? || !de.include?("{% if page.lang == 'de' %}") || !en.include?("{% endif %}")
  problems << "body must be {% if page.lang == 'de' %} German {% else %} English {% endif %}"
else
  paras = ->(s) { s.gsub(/\{%.*?%\}/, "").strip.split(/\n\s*\n/).reject { |p| p.strip.empty? } }
  problems << "paragraph count differs: de=#{paras.(de).size} en=#{paras.(en).size}" if paras.(de).size != paras.(en).size
  problems << "German or English text is empty" if paras.(de).empty? || paras.(en).empty?
  links = ->(s) { s.scan(/\]\((https?:[^)\s]+)\)/).flatten.map { |u| u.sub(%r{/(en|de)/}, "/LANG/") }.sort }
  problems << "links differ: de=#{links.(de)} en=#{links.(en)}" if links.(de) != links.(en)
  stray = body.gsub(/\{%.*?%\}/, "").scan(%r{</?[a-z]+[^>]*>}).uniq
  problems << "stray HTML tags in body: #{stray}" unless stray.empty?
end
warnings.each { |w| puts "WARNING: #{w}" }
if problems.empty? then puts "OK: #{slug} partner profile is complete"
else puts "PROBLEMS FOUND:"; problems.each { |p| puts " - #{p}" }; exit 1
end
RUBY
```

Fix every problem it reports and run it again until it prints `OK`. Warnings don't block, but
report each one in the handoff. Also check that `_data/developer.yml` still parses after your
edit. The script fails on a YAML error. The script checks structure, not meaning, so also read
the two versions side by side once. Every fact, name and number should appear in both.

## 9. Preview the real pages and wait for approval

The user reviews the profile on the real site before anything is committed. Nothing goes into
git until they have looked at the pages and approved them. The CSS is committed in
`assets/build/`, so no `npm` build is needed.

1. **Start the dev server** in the background from the repository root, with the command from
   `scripts/start-dev.sh`:
   ```bash
   JEKYLL_ENV=development bundle exec jekyll serve -H 127.0.0.1 --incremental \
     --config _config.yml,_config.dev.yml > /tmp/kimai-jekyll.log 2>&1 &
   echo $! > /tmp/kimai-jekyll.pid
   ```
   If something already answers on port 4000 (`curl -sI http://127.0.0.1:4000/`), reuse that
   server. The first build is slow. Check the log every 15–30 seconds until it shows
   `Server running`, and report any build error instead of carrying on. If gems are missing, run
   `bundle install` once. If Ruby or Bundler itself is missing, tell the user and ask how to
   continue. Never skip the preview and go straight to the commit.

   `--incremental` doesn't always notice changes in `_data/` or `_layouts/`. If a change to
   `_data/developer.yml` or `_layouts/partner.html` doesn't show up, stop the server and start
   it again.

2. **Check that the pages load.** Each of these should return `200`:
   ```bash
   for u in /en/partner/<slug> /de/partner/<slug> /en/partner/find /de/partner/find; do
     echo "$(curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1:4000$u) $u"
   done
   curl -s http://127.0.0.1:4000/en/partner/find | grep -c '/en/partner/<slug>'   # should be 2 or more
   ```
   If the logo is a local file, check its URL returns `200` too.

3. **Look at the pages yourself first** if a browser tool is available (the built-in browser,
   Claude in Chrome, or a screenshot). On both profile pages, check the logo, the name, the
   Contact button, the About text in the right language, services, regions with flags,
   languages, the contact box and the "partner since" badge. On both directory pages, check that
   the card shows the logo, location, introduction and services. Fix anything that is clearly broken
   before you hand the pages over.

4. **Hand the preview to the user and stop.** Open the pages for them: in the built-in browser
   if it's available, otherwise with `open <url>` on macOS.
   - `http://127.0.0.1:4000/en/partner/<slug>`
   - `http://127.0.0.1:4000/de/partner/<slug>`
   - `http://127.0.0.1:4000/en/partner/find`

   Alongside the links, list what you took from the existing website data, what came from the
   partner's details, what you drafted (`introduction`, translations, a shortened About text),
   and any warnings from steps 4 and 8. Then ask the user to review the pages and either approve
   or say what to change. End your turn there. Don't create a branch or commit while waiting.

5. **Apply feedback** to both languages, so they stay in sync. Re-run the check from step 8,
   then ask the user to reload. Repeat until the user explicitly approves, with something like
   "looks good", "passt" or "commit it". A question or an unrelated message is not approval.

6. **Stop the server** once the user has approved, if you started it:
   `kill $(cat /tmp/kimai-jekyll.pid)`.

## 10. Branch, commit, pull request

Only do this after the user has approved the preview in step 9. The partner goes in as its own
pull request, so it can be reviewed and merged on its own.

1. Run `git status`. If there are unrelated uncommitted changes, leave them alone and only stage
   the partner's files below. Never stash, reset or commit someone else's work.
2. Update and branch from `main`:
   ```bash
   git fetch origin
   git checkout -b partner-<slug> origin/main
   ```
   If the checkout fails because `_data/developer.yml` or `_layouts/partner.html` has unrelated
   changes on the current branch, stop and ask the user.
3. Stage exactly the partner's files:
   ```bash
   git add collections/_partner/<slug>.md _data/developer.yml
   # only if you changed or added them:
   git add _layouts/partner.html images/marketplace/<key>-logo.<ext>
   git diff --cached --stat
   git diff --cached _data/developer.yml   # only the partner's entry may change
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
   git commit -m "Added <Name> as Kimai partner"
   git push -u origin partner-<slug>
   ```
   For an update of an existing profile, use `Updated <Name> partner profile` instead.
5. Open the PR against `main` with the GitHub CLI:
   ```bash
   gh pr create --base main --title "Added <Name> as Kimai partner" \
     --body "Adds <Name> to the Kimai partner directory in German and English"
   ```
   For an update, use the title `Updated <Name> partner profile` and the body
   `Updates the <Name> partner profile in German and English`. The PR body is exactly that one
   sentence, with the name filled in. Add nothing else: no URLs, no lists, no notes and no
   footer. Anything worth mentioning goes in your handoff message to the user instead.

Before you report back, check that the rule held. `git log -1 --format='%an <%ae>%n%B'` should
show only the user's name and the one-line message, and
`gh pr view --json author,title,body` should show the user's GitHub account, the title and the
one-sentence body. If an attribution line slipped into the commit, fix it with
`git commit --amend -m "<the one-line message>"` before pushing. If it was already pushed, or it
is in the PR, tell the user.

If `gh` isn't available or not logged in, push the branch and give the user the compare URL
(`https://github.com/kimai/www.kimai.org/compare/main...partner-<slug>`) so they can open the PR
themselves.

## Handoff

Finish with a short message containing:
- the PR link,
- the drafted fields the user should double-check (`introduction` in both languages, any
  translated or shortened About text),
- which details came from the existing website data or the partner's website, and not from the
  partner's own message,
- any warnings: free-text services, a newly added region, a missing or non-square logo, a
  changed developer `description`, *du* in German text.
