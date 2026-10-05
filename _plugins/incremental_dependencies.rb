# Extends the --incremental builder to include cross-language relationships that Jekyll does not
# recognize on its own:
#   1. Language siblings: edit _posts/de/<slug>.md => _posts/en/<slug>.md
#      (and all other languages with the same filename) are rebuilt.
#   2. Blog index pages: edit any post => all
#      _pages/<lang>/blog.html are rebuilt.
#   3. Security advisories: edit any _security entry =>
#      _documentation/developer/bughunter.md is rebuilt.
#   4. Cloud changelog JSON: edit cloud-changelog.json => all _changelogs entries are
#      rebuilt (otherwise their `content` is still unrendered Liquid source), and
#      edit any _changelogs entry => cloud-changelog.json is rebuilt.
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
    security    = site.collections["security"].docs
    by_basename = posts.group_by { |doc| File.basename(doc.relative_path) }
    pages       = site.collections["pages"].docs
    docs        = site.collections["documentation"].docs
    changelogs  = site.collections["changelogs"].docs

    blog_pages = pages.select do |page|
      page.relative_path.match?(%r{_pages/[^/]+/blog\.html\z})
    end

    bughunter_page = docs.find do |doc|
      doc.relative_path == "_documentation/developer/security.md"
    end

    cloud_changelog_page = site.pages.find do |page|
      page.relative_path == "cloud-changelog.json"
    end
    cloud_changelog_path = cloud_changelog_page && site.in_source_dir(cloud_changelog_page.relative_path)

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

    if bughunter_page && security.any? { |doc| source_file_changed.call(doc.path) }
      regenerator.force(bughunter_page.path)
      forced << bughunter_page.path
    end

    if cloud_changelog_path
      if source_file_changed.call(cloud_changelog_path)
        changelogs.each do |changelog|
          regenerator.force(changelog.path)
          forced << changelog.path
        end
      elsif changelogs.any? { |changelog| source_file_changed.call(changelog.path) }
        regenerator.force(cloud_changelog_path)
        forced << cloud_changelog_path
      end
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
