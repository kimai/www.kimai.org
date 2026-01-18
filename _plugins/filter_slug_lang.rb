=begin

    RETURNS ONE ITEM FOR THE GIVEN SLUG IN THE CURRENT PAGES LANGUAGE
    IF NO ITEM WAS FOUND: RETURNS THE ITEM IN ENGLISH
    IF ENGLISH WAS NOT FOUND: RETURNS NIL
=end
module Jekyll
  module FilterSlugLang
    def filter_slug_lang(input, slug)
      return nil unless input.respond_to?(:select)

      page = @context.registers[:page] || @context["page"] || {}
      lang = page["lang"]
      lang = "en" if lang.nil? || lang.to_s.strip.empty?

      slugged = input.select { |item| item_slug(item).to_s == slug.to_s }
      return nil if slugged.empty?

      match = slugged.find { |item| item_lang(item).to_s == lang.to_s }
      if match.nil? && lang.to_s != "en"
        match = slugged.find { |item| item_lang(item).to_s == "en" }
      end

      match
    end

    private

    def item_lang(item)
      return item.data["lang"] if item.respond_to?(:data)
      return item["lang"] if item.is_a?(Hash)

      nil
    end

    def item_slug(item)
      return item.data["slug"] if item.respond_to?(:data)
      return item["slug"] if item.is_a?(Hash)

      nil
    end
  end
end

Liquid::Template.register_filter(Jekyll::FilterSlugLang)
