# Laravel8 Base (PHP7.4)

### Laravel8 Require Extension

[link] (https://laravel.com/docs/8.x#server-requirements)

- PHP >= 7.3 ( 7.4-fpm-alpine )
- BCMath PHP Extension
- Ctype PHP Extension
- Fileinfo PHP Extension
- JSON PHP Extension
- Mbstring PHP Extension
- OpenSSL PHP Extension
- PDO PHP Extension
- Tokenizer PHP Extension
- XML PHP Extension

### Add Extension

- redis
- composer (https://packagist.kr)

---

### Child Dockerfile

```
RUN composer config -g repos.packagist composer https://packagist.kr \
    && composer global require "hirak/prestissimo"
```

#### 4 Layer Dockerfile
