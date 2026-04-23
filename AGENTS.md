# AGENTS.md

## Purpose

This file guides AI coding agents working in the `www.kimai.org` repository.

The repository contains the source for the public Kimai website. It is a Jekyll site with custom plugins, a webpack-based frontend asset pipeline, and a multilingual content setup.

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

- Agents may make broad changes when useful, including restructuring the website and improving multilingual workflows.
- Prefer solving problems properly over preserving incidental structure.
- Keep changes focused and coherent so the repository owner can review and revert easily if needed.
- Preserve backward compatibility when touching layouts, includes, or plugins unless the task clearly requires a behavior change.
- Prefer content or template changes over plugin changes when both are reasonable, but modify `_plugins/` when that is the correct fix.

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
- Direct Jekyll serve: `bundle exec jekyll serve -H 0.0.0.0 --incremental --config _config.yml,_config.dev.yml`
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

- English is the main website language and should be treated as the default source language unless the existing workflow for a section says otherwise.
- German content may also be authored directly when appropriate.
- Do not create or rewrite translations unless the task asks for it or the workflow clearly requires it.
- It is acceptable to edit only the requested language.
- When changing English source content that likely affects translated pages, note the translation follow-up in the final handoff if translations were not updated.
- Respect the locale layout already used in `collections/`.

Routing and domain rules matter:

- All locales use `https://www.kimai.org/<locale>/...`
- English is the primary base language
- `he` and `zh_Hant` currently have custom-domain behavior configured in `_config.yml`
- Those custom domains are part of an SEO test, so agents should avoid casual routing, canonical, permalink, or domain-logic changes without understanding the impact

## Images And Assets

- Prefer `webp` for new image assets unless there is a clear reason not to.
- Place images in the established repo locations and follow existing naming patterns nearby.
- Preserve the Bootstrap/theme-based visual system unless the task explicitly calls for design changes.

## Safe Change Boundaries

The owner reviews all changes before commit, so agents do not need extra approval layers inside the repository. Still, use normal engineering judgment:

- Do not touch generated output just to satisfy a task that should be solved in source files.
- Do not make speculative dependency updates.
- Do not rewrite unrelated content while touching a page.
- Do not change deployment or server behavior incidentally while working on content or UI unless that is part of the requested fix.

## Branching And Commits

Work is usually done directly on `main`.

When preparing changes:

- Keep edits reviewable
- Prefer small, focused diffs
- Mention skipped verification when relevant
- Mention which locales were changed when working on multilingual content

## Areas To Expand Later

The following sections are intentionally left lightweight for now and can be expanded later:

- Content structure conventions and required frontmatter by collection
- Editorial and marketing tone rules
- Source-of-truth rules for product facts, marketplace data, and documentation
- Additional locale-specific SEO constraints
