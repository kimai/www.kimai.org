# Builds the absolute URL of a page in a given language, respecting the
# per-language domains in `language_base` and the `custom_domain` setting
# (e.g. `he` on www.kimai.co.il, where the `/he/` path prefix is dropped).
#
# Replaces `_includes/link-language-domain.html`, which was called on every page
# (hreflang links, language dropdown, sitemaps) and was slow as an include.
#
#   {{ lang | language_domain_url }}            => https://www.kimai.org/de/
#   {{ page.lang | language_domain_url: page.url }} => https://www.kimai.org/de/about/
#
# Results are cached per language and URL, the cache is cleared whenever the site resets.
module Jekyll
  module LanguageDomainUrl
    @cache = {}

    class << self
      attr_reader :cache

      def build(config, language, url)
        base = config.dig("language_base", language)
        custom_domain = config.dig("custom_domain", language)

        if url.nil?
          return base.to_s if custom_domain

          "#{base}/#{language}/"
        else
          target = "#{base}#{url}"
          target = target.gsub("/#{language}/", "/") if custom_domain
          target
        end
      end
    end

    module Filter
      def language_domain_url(language, url = nil)
        key = [language, url]
        cache = Jekyll::LanguageDomainUrl.cache
        return cache[key] if cache.key?(key)

        config = @context.registers[:site].config
        cache[key] = Jekyll::LanguageDomainUrl.build(config, language, url).freeze
      end
    end
  end
end

Jekyll::Hooks.register :site, :after_reset do |_site|
  Jekyll::LanguageDomainUrl.cache.clear
end

Liquid::Template.register_filter(Jekyll::LanguageDomainUrl::Filter)
