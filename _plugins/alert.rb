module Jekyll
    # {% alert %} Some info message {% endalert %}
    # {% alert info|warning|danger %} Well done! You successfully read this important alert message. {% endalert %}

    class AlertBlock < Liquid::Block

        def initialize(tag_name, markup, tokens)
            @style = "info"
            @icon = "message-rounded-detail"
            if /(?<style>[^\s]+)/i =~ markup
                if style == 'warning'
                    @icon = 'alarm-exclamation'
                    @style = style
                elsif style == 'danger'
                    @icon = 'info-circle'
                    @style = style
                elsif style == 'success'
                    @icon = nil
                    @style = style
                end
            end
            super
        end

        def render(context)
            site      = context.registers[:site]
            converter = site.find_converter_instance(Jekyll::Converters::Markdown)
            output = converter.convert(super(context))
            if @icon.nil?
                return "<div class=\"alert alert-#{@style} d-flex\" role=\"alert\">#{output}</div>"
            else
                return "<div class=\"alert alert-#{@style} d-flex\" role=\"alert\"><i class=\"bx bx-#{@icon} lead me-3\"></i>#{output}</div>"
            end
        end
    end

end

Liquid::Template.register_tag('alert', Jekyll::AlertBlock)
