module Jekyll
  module UrlCloudRegisterFilter
    def url_cloud_register(input)
      domain = @context.registers[:site].config['cloud']['url']
      path = input == 'de' ? '/de/auth/registrierung' : '/auth/registration'
      "#{domain}#{path}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::UrlCloudRegisterFilter)
