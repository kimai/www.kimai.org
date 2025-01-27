module Jekyll
  module FullUrlFilter
    def full_url(input, language)
      domain = @context.registers[:site].config['language_base'][language]
      "#{domain}#{input}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::FullUrlFilter)
