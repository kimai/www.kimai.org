module Jekyll
  class MultiLanguageCollectionGenerator < Generator
    priority :highest

    def generate(site)
      languages = Array(site.config["languages"]).map(&:to_s)

      site.collections.each do |_name, collection|
        ml = collection.metadata["multi_language"]
        next unless ml

        target_langs = if ml.is_a?(Array)
          ml.map(&:to_s)
        else
          languages
        end

        expand_collection(site, collection, target_langs)
      end
    end

    private

    def expand_collection(site, collection, languages)
      root_docs = []
      override_docs = []

      collection.docs.each do |doc|
        if doc.data["lang"] && !doc.data["lang"].to_s.strip.empty?
          override_docs << doc
        else
          root_docs << doc
        end
      end

      override_index = {}
      override_docs.each do |doc|
        slug = doc.data["slug"] || doc.basename_without_ext
        key = "#{doc.data["lang"]}:#{slug}"
        override_index[key] = true
      end

      new_docs = []

      root_docs.each do |doc|
        slug = doc.data["slug"] || doc.basename_without_ext

        languages.each do |lang|
          next if override_index["#{lang}:#{slug}"]

          clone = Jekyll::Document.new(doc.path, site: site, collection: collection)
          clone.read

          clone.data["lang"] = lang
          clone.data["slug"] = slug

          virtual_path = File.join(
            collection.relative_directory,
            lang,
            File.basename(doc.path)
          )
          clone.instance_variable_set(:@relative_path, virtual_path)

          new_docs << clone
        end
      end

      root_docs.each { |d| collection.docs.delete(d) }
      new_docs.each { |d| collection.docs << d }
    end
  end
end
