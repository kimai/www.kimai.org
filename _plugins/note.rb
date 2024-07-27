module Jekyll
    # {% note "Super title!" %} Some info message. Markdown is supported! {% endnote %}

    class NoteBlock < Liquid::Block
        Syntax = /\"(?<title>[^\"]*)\"/i

        def initialize(tag_name, markup, tokens)
            if markup =~ Syntax
                @title=$1
            else
                raise SyntaxError.new("Syntax Error in 'note' - Valid syntax: note \"title\"")
            end
            super
        end

        def render(context)
            site      = context.registers[:site]
            converter = site.find_converter_instance(Jekyll::Converters::Markdown)
            output = converter.convert(super(context))
            return "<div class=\"card border-primary mb-3\">
                       <p class=\"card-title bg-faded-primary p-1 mb-1\"><strong><i class=\"bx bxs-info-circle ms-2 me-2 text-primary fs-5\"></i>#{@title}</strong></p>
                       <div class=\"card-body m-0 pb-0 pt-3 px-3\">#{output}</div>
                   </div>"
        end

    end

end

Liquid::Template.register_tag('note', Jekyll::NoteBlock)
