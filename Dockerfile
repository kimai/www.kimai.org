FROM ruby:3.4-slim-bookworm AS jekyll

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /usr/local/bin/

RUN gem install jekyll \
    && gem cleanup \
    && gem install bundler -v 2.3.16

EXPOSE 4000

WORKDIR /site

ENTRYPOINT [ "jekyll" ]

CMD [ "--help" ]

FROM jekyll AS jekyll-serve

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000", "--incremental", "--config", "_config.yml,_config.dev.yml" ]
