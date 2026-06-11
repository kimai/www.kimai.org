# Extends the --incremental builder to include cross-language relationships that Jekyll does not
# recognize on its own:
#   1. Language siblings: edit _posts/de/<slug>.md => _posts/en/<slug>.md
#      (and all other languages with the same filename) are rebuilt.
#   2. Blog index pages: edit any post => all
#      _pages/<lang>/blog.html are rebuilt.
#   3. Story index pages: edit _stories/<lang>/<slug>.md =>
#      _pages/<lang>/stories.html is rebuilt.
#   4. Security advisories: edit any _security entry =>
#      _documentation/developer/bughunter.md is rebuilt.
#
# The additionally enforced paths are inserted into the watcher log,
# so they appear below the “Regenerating: ...” line.
#
# Active only in JEKYLL_ENV=development.
#
# Implementation: Determine which posts have changed per build and mark their siblings
# or the blog index pages via Regenerator#force. Deliberately NO
# add_dependency, because that creates a cycle between siblings
# (de -> en -> de) and Regenerator#existing_file_modified? recurses indefinitely
# (SystemStackError).

if ENV["JEKYLL_ENV"] == "development"
  Jekyll::Hooks.register :site, :post_read do |site|
    regenerator = site.regenerator

    # Erstbuild: keine Metadata vorhanden, Jekyll baut sowieso alles.
    next if regenerator.metadata.empty?

    source_file_changed = lambda do |path|
      metadata = regenerator.metadata[path]

      # Neue Quelldateien sind fuer den aktuellen Lauf direkte Aenderungen.
      next true if metadata.nil?

      File.exist?(path) && !metadata["mtime"].eql?(File.mtime(path))
    end

    tracked_file_changed = lambda do |path|
      next false unless File.exist?(path)

      metadata = regenerator.metadata[path]
      mtime    = File.mtime(path)

      # Jekyll speichert fuer manche Inputs wie _data-Dateien keine Metadata.
      # Diese pflegen wir hier selbst, damit sie nicht bei jedem Lauf als
      # "geaendert" gelten.
      if metadata.nil?
        regenerator.metadata[path] = { "mtime" => mtime, "deps" => [] }
        next false
      end

      next false if metadata["mtime"].eql?(mtime)

      regenerator.metadata[path]["mtime"] = mtime
      true
    end

    posts       = site.collections["posts"].docs
    stories     = site.collections["stories"].docs
    security    = site.collections["security"].docs
    by_basename = posts.group_by { |doc| File.basename(doc.relative_path) }
    pages       = site.collections["pages"].docs
    docs        = site.collections["documentation"].docs

    blog_pages = pages.select do |page|
      page.relative_path.match?(%r{_pages/[^/]+/blog\.html\z})
    end

    stories_pages_by_lang = pages.each_with_object({}) do |page, memo|
      match = page.relative_path.match(%r{_pages/([^/]+)/stories\.html\z})
      memo[match[1]] = page if match
    end

    bughunter_page = docs.find do |doc|
      doc.relative_path == "_documentation/developer/bughunter.md"
    end

    data_dependencies = {
      "_data/feature.yml" => pages.select do |page|
        page.relative_path.match?(%r{_pages/[^/]+/features\.html\z})
      end,
      "_data/testimonials.yml" => pages.select do |page|
        page.relative_path.match?(%r{_pages/[^/]+/reviews\.md\z})
      end
    }

    forced            = []
    any_post_modified = false

    posts.each do |post|
      next unless source_file_changed.call(post.path)
      any_post_modified = true

      siblings = by_basename[File.basename(post.relative_path)] || []
      siblings.each do |sibling|
        next if sibling.equal?(post)
        regenerator.force(sibling.path)
        forced << sibling.path
      end
    end

    if any_post_modified
      blog_pages.each do |page|
        regenerator.force(page.path)
        forced << page.path
      end
    end

    stories.each do |story|
      next unless source_file_changed.call(story.path)

      match = story.relative_path.match(%r{_stories/([^/]+)/.+\.(?:md|markdown)\z})
      next unless match

      stories_page = stories_pages_by_lang[match[1]]
      next unless stories_page

      regenerator.force(stories_page.path)
      forced << stories_page.path
    end

    if bughunter_page && security.any? { |doc| source_file_changed.call(doc.path) }
      regenerator.force(bughunter_page.path)
      forced << bughunter_page.path
    end

    data_dependencies.each do |source_path, dependent_pages|
      next unless tracked_file_changed.call(site.in_source_dir(source_path))

      dependent_pages.each do |page|
        regenerator.force(page.path)
        forced << page.path
      end
    end

    prefix = "#{site.source}/"
    forced.uniq.each do |path|
      Jekyll.logger.info "", path.sub(prefix, "")
    end
  end
end
