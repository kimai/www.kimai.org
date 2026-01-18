=begin
    RETURNS A COLLECTION FOR THE GIVEN PAGES LANGUAGE
    IF NO ITEM WAS FOUND: RETURNS THE LIST IN ENGLISH
=end
module Jekyll
  module FilterPageLang
    def filter_page_lang(input)
      return input unless input.respond_to?(:select)

      page = @context.registers[:page] || @context["page"] || {}
      lang = page["lang"]
      lang = "en" if lang.nil? || lang.to_s.strip.empty?

      filtered = input.select { |item| item_lang(item).to_s == lang.to_s }
      if filtered.empty? && lang.to_s != "en"
        filtered = input.select { |item| item_lang(item).to_s == "en" }
      end

      filtered
    end

    private

    def item_lang(item)
      return item.data["lang"] if item.respond_to?(:data)
      return item["lang"] if item.is_a?(Hash)

      nil
    end
  end
end

Liquid::Template.register_filter(Jekyll::FilterPageLang)
