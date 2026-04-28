# AGENTS.md

## Purpose

This file guides AI coding agents working in the `www.kimai.org` repository.

The repository contains the source for the public Kimai website. 
It is a Jekyll site with custom plugins, a webpack-based frontend asset pipeline, and a multilingual content setup.

Agents are allowed to work across the full repository: content, templates, includes, layouts, frontend assets, custom Jekyll plugins, repo structure, and workflow improvements.

## Repository Overview

- Main site generator: Jekyll
- Frontend asset pipeline: webpack
- Primary site language: English
- Secondary site language: German
- More languages existing for the main pages, see `languages` in `_config.yml` 
- Content location: `collections/_*/`
- Custom Jekyll plugins: `_plugins/`
- Shared templates and partials: `_layouts/`, `_includes/`
- Data and translations: `_data/`
- Frontend source and assets: `src/`, `assets/`, `images/`

Important: Jekyll is configured with `collections_dir: "collections"`, so content lives under `collections/`, not in top-level `_pages`, `_posts`, and similar legacy paths.

## Working Rules

- Agents may make broad changes when useful, including restructuring the website and improving multilingual workflows
- Prefer solving problems properly over preserving incidental structure
- Keep changes focused and coherent so the repository owner can review and revert easily if needed
- Preserve backward compatibility when touching layouts, includes, or plugins unless the task clearly requires a behavior change
- Prefer content or template changes over plugin changes when both are reasonable, but modify `_plugins/` when that is the correct fix
- When renaming or moving files and directories, also use `git mv` to keep the change history

## Collections

Most collections map to a specific content type and often use locale subdirectories such as `en/` and `de/`. The main exceptions are versioned docs, which use release-number directories, and technical collections such as `_error`, `_security`, and `_changelogs`.

- `collections/_alternatives` - competitor comparison landing pages such as "Kimai vs. Clockify"; currently English-focused
- `collections/_blog_tags` - rendered tag/category archive pages for the blog, for example `cloud`, `general`, and `on-premise`
- `collections/_changelogs` - Kimai Cloud update, maintenance, and rollout announcements; date-based entries that are also shown inside customer environments
- `collections/_docu_versioned` - archived documentation for older Kimai releases, organized by version directory such as `1.30.0/` or `2.13.0/`
- `collections/_documentation` - the current documentation set, including user manual, cloud docs, developer docs, Docker docs, and on-premise installation/operation guides
- `collections/_error` - static error pages such as `400`, `404`, `500`, and `503`, including locale-specific variants used by webserver configuration
- `collections/_industries` - industry-specific SEO landing pages such as agency, freelancer, lawyer, and university use cases
- `collections/_keywords` - keyword-targeted SEO landing pages for important search phrases such as `open-source-time-tracker`
- `collections/_landingpage` - campaign and audience-specific landing pages such as non-profit, discount-code, and community offers
- `collections/_pages` - the main site pages for each locale, including homepage, pricing, support, legal pages, and section index pages
- `collections/_posts` - blog posts published under localized blog routes; currently organized primarily in English and German
- `collections/_security/` - security advisory pages published under `/security/`; these are linked from the bughunter documentation page
- `collections/_store` - marketplace entries for plugins, bundles, integrations, apps, and other Kimai ecosystem add-ons; heavily translated across locales
- `collections/_stories` - customer stories and case studies with company background, quotes, results, and product usage details

## Generated And Dependency Directories

Never edit or commit generated or dependency-managed directories unless the task explicitly requires dependency updates:

- `_site/`
- `node_modules/`
- `.jekyll-cache/`
- `vendor/`

Also avoid incidental edits to lockfiles unless the task is intentionally changing dependencies:

- `package-lock.json`
- `Gemfile.lock`
- `composer.lock`

## Local Workflow

There is no mandatory verification step for content-only edits. Full builds are intentionally optional because the site build is slow enough to hurt iteration speed.

Preferred commands:

- Local Jekyll development server: `scripts/start-dev.sh`
- Direct Jekyll serve: `bundle exec jekyll serve -H 127.0.0.1 --incremental --config _config.yml,_config.dev.yml`
- Frontend development build: `npm run dev`
- Frontend production build: `npm run build`

Use verification proportionally:

- Content-only edits: no build required by default
- Layout, include, plugin, config, or asset-pipeline changes: run the most relevant local command if it is cheap enough and useful
- If verification is skipped, state that clearly in the final handoff

## Scripts

Committed scripts in `scripts/` should be considered part of the supported workflow:

- `scripts/start-dev.sh`: starts the local Jekyll dev server with `_config.dev.yml` and incremental mode
- `scripts/translate-pages.php`: scaffolds and updates multilingual page/store content from English sources
- `scripts/translate-post.php`: translates English blog posts into another locale using an external translation provider
- `scripts/update-bundles.php`: fetches and updates bundle release/changelog data
- `scripts/update-plans.php`: fetches and updates Kimai Cloud plan data
- `scripts/update-version-number.sh`: updates `kimai_v2_version` in `_config.yml`

Before replacing script-based behavior with manual edits, check whether an existing script already owns that workflow.

## Multilingual Rules

- English is the main website language and should be treated as the default source language unless the existing workflow for a section says otherwise
- German content may also be authored directly when appropriate
- Do not create or rewrite translations unless the task asks for it or the workflow clearly requires it
- It is acceptable to edit only the requested language
- When changing English source content that likely affects translated pages, note the translation follow-up in the final handoff if translations were not updated
- Respect the locale layout already used in `collections/`

Routing and domain rules matter:

- All locales use `https://www.kimai.org/<locale>/...`
- English is the primary base language
- `he` and `zh_Hant` currently have custom-domain behavior configured in `_config.yml`
- Those custom domains are part of an SEO test, so agents should avoid casual routing, canonical, permalink, or domain-logic changes without understanding the impact

## Writing Style

- American English, second person (you)
- Gender-neutral (they/them)
- Use contractions (it's, don't, you're)
- Avoid: "just", "obviously", "easy", "simply"
- Realistic examples (no foo/bar placeholders)
- Write for non-native English speakers: use simple vocabulary, avoid idioms, and complex sentence structures

## Images And Assets

- Prefer `webp` for new image assets unless there is a clear reason not to
- Place images in the established repo locations and follow existing naming patterns nearby
- Preserve the Bootstrap/theme-based visual system unless the task explicitly calls for design changes

## Safe Change Boundaries

The owner reviews all changes before commit, so agents do not need extra approval layers inside the repository. Still, use normal engineering judgment:

- Do not touch generated output just to satisfy a task that should be solved in source files
- Do not make dependency updates without human confirmation
- Do not rewrite unrelated content while touching a page
- Do not change deployment or server behavior incidentally while working on content or UI unless that is part of the requested fix

## Branching And Commits

Work is done directly on `main` unless prompted otherwise.

- Keep edits reviewable
- Prefer small, focused diffs
- Mention skipped verification when relevant
