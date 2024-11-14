module Jekyll
  module IconFilter
    def icon(input)
      icon = @context.registers[:site].data['icons'][input]
      return "#{icon}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::IconFilter)
