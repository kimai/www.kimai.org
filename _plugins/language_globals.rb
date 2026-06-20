module Jekyll
  module LanguageGlobals
    def self.current_lang(doc)
      lang = doc.data["lang"]
      return lang.to_s unless lang.nil? || lang.to_s.strip.empty?

      config_lang = doc.site.config["lang"]
      return config_lang.to_s unless config_lang.nil? || config_lang.to_s.strip.empty?

      "en"
    end
  end
end

Jekyll::Hooks.register [:pages, :documents], :pre_render do |doc, payload|
  active_lang = Jekyll::LanguageGlobals.current_lang(doc)
  payload["active_lang"] = active_lang
  payload["english_german"] = (active_lang == "de" ? "de" : "en")
end
