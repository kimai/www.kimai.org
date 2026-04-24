module Jekyll
  module CollectionPathLang
    module_function

    def assign_from_path(doc)
      return unless doc.respond_to?(:site) && doc.respond_to?(:collection)
      return if present?(doc.data["lang"])

      lang = extract_lang(doc)
      return unless present?(lang)

      doc.data["lang"] = lang
    end

    def extract_lang(doc)
      relative_path = source_relative_path(doc)
      return nil if relative_path.nil? || relative_path.empty?

      path_segments = relative_path.split("/")
      collection_dir = doc.collection.relative_directory.to_s.tr("\\", "/")
      collection_name = collection_dir.split("/").reject(&:empty?).last
      return nil if collection_name.nil? || collection_name.empty?

      collection_index = path_segments.index(collection_name)
      return nil if collection_index.nil?

      candidate = path_segments[collection_index + 1]
      return nil unless configured_languages(doc.site).include?(candidate)

      candidate
    end

    def source_relative_path(doc)
      source = doc.site.source.to_s
      path = doc.path.to_s
      return nil if path.empty?

      path = path.sub(%r!\A#{Regexp.escape(source)}/?!, "")
      path.tr("\\", "/")
    end

    def configured_languages(site)
      @configured_languages ||= {}
      @configured_languages[site.object_id] ||= begin
        languages = Array(site.config["languages"]).map(&:to_s)
        default_lang = site.config["lang"].to_s
        (languages + [default_lang]).reject(&:empty?).uniq
      end
    end

    def present?(value)
      !value.nil? && !value.to_s.strip.empty?
    end
  end
end

Jekyll::Hooks.register :documents, :post_init do |doc|
  Jekyll::CollectionPathLang.assign_from_path(doc)
end

Jekyll::Hooks.register :documents, :pre_render do |doc|
  Jekyll::CollectionPathLang.assign_from_path(doc)
end
