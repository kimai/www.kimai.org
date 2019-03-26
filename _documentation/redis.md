---
title: Using Redis for caching
description: Using Redis as caching instance for Kimai
toc: true
---

## Production

If you want to use Redis as caching instance, you have to change your `local.yaml` and add the following lines:

```yaml
framework:
    cache:
        app: cache.adapter.redis
        system: cache.adapter.redis
        default_redis_provider: redis://:password@host
        pools:
            app.cache.redis:
                adapter: cache.adapter.redis
                public: false
                default_lifetime: 120
            doctrine.result_cache_pool:
                adapter: app.cache.redis
            doctrine.system_cache_pool:
                adapter: app.cache.redis
```

Change the connection URL in `default_redis_provider` to your Redis server.

## Connection string for Redis

A Data Source Name (DSN) for this adapter must use the following format:
  
```
redis://[user:pass@][ip|host|socket[:port]][/db-index]
```

The user can be skipped if your Redis is password protected with `requirepass` (see example above). 

## Development 

If you are using Kimai in `dev` environment, you have to add these additional configs as well:

```yaml
doctrine:
    orm:
        metadata_cache_driver:
            type: service
            id: doctrine.system_cache_provider
        query_cache_driver:
            type: service
            id: doctrine.system_cache_provider
        result_cache_driver:
            type: service
            id: doctrine.result_cache_provider

services:
    doctrine.result_cache_provider:
        class: Symfony\Component\Cache\DoctrineProvider
        public: false
        arguments:
            - '@doctrine.result_cache_pool'
    doctrine.system_cache_provider:
        class: Symfony\Component\Cache\DoctrineProvider
        public: false
        arguments:
            - '@doctrine.system_cache_pool'
```

This is needed, because Doctrine cache is normally only active in `prod` (see config/packages/prod/doctrine.yaml). 