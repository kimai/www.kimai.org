# Extends the --incremental builder to include cross-language relationships that Jekyll does not
# recognize on its own:
#   1. Language siblings: edit _posts/de/<slug>.md => _posts/en/<slug>.md
#      (and all other languages with the same filename) are rebuilt.
#   2. Blog index pages: edit any post => all
#      _pages/<lang>/blog.html are rebuilt.
#   3. Story index pages: edit _stories/<lang>/<slug>.md =>
#      _pages/<lang>/stories.html is rebuilt.
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

    posts       = site.collections["posts"].docs
    stories     = site.collections["stories"].docs
    by_basename = posts.group_by { |doc| File.basename(doc.relative_path) }
    pages       = site.collections["pages"].docs

    blog_pages = pages.select do |page|
      page.relative_path.match?(%r{_pages/[^/]+/blog\.html\z})
    end

    stories_pages_by_lang = pages.each_with_object({}) do |page, memo|
      match = page.relative_path.match(%r{_pages/([^/]+)/stories\.html\z})
      memo[match[1]] = page if match
    end

    data_dependencies = {
      "_data/feature.yml" => pages.select do |page|
        page.relative_path.match?(%r{_pages/[^/]+/features\.html\z})
      end
    }

    # Etwaige zyklische deps aus einer frueheren Plugin-Version aus
    # .jekyll-metadata wegraeumen, damit modified? unten nicht hineinlaeuft.
    (posts + blog_pages).each do |doc|
      meta = regenerator.metadata[doc.path]
      meta["deps"] = [] if meta && meta["deps"].any?
    end

    forced            = []
    any_post_modified = false

    posts.each do |post|
      next unless regenerator.modified?(post.path)
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
      next unless regenerator.modified?(story.path)

      match = story.relative_path.match(%r{_stories/([^/]+)/.+\.(?:md|markdown)\z})
      next unless match

      stories_page = stories_pages_by_lang[match[1]]
      next unless stories_page

      regenerator.force(stories_page.path)
      forced << stories_page.path
    end

    data_dependencies.each do |source_path, dependent_pages|
      next unless regenerator.modified?(site.in_source_dir(source_path))

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
