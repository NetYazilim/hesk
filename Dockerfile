FROM alpine:3.21.1
LABEL maintainer="Levent SAGIROGLU <LSagiroglu@gmail.com>"

VOLUME /shared
VOLUME /hesk

EXPOSE 80 443

ENV HESK_PATH="/shared/hesk"
ENV PHP_CONF="/etc/php83/php-fpm.d/www.conf"
ENV WEB_CONF="/etc/nginx/http.d/default.conf"
ENV ADD_MODS_URL=""
ENV ADD_LANG_URL=""

COPY entrypoint.sh /bin/entrypoint.sh
COPY default.conf /etc/nginx/http.d/default.conf
COPY user.ini /etc/php83/conf.d/user.ini
COPY hesk351.zip /hesk/hesk351.zip

RUN apk add --update --no-cache ca-certificates nginx  php83-fpm php83-mysqli php83-json php83-session 	php83-curl && \
    update-ca-certificates

RUN sed -i 's/user = nobody/user = nginx/g' /etc/php83/php-fpm.d/www.conf  && \
    sed -i 's/group = nobody/group = nginx/g' /etc/php83/php-fpm.d/www.conf && \
    mkdir -p /run/nginx
ENTRYPOINT ["/bin/entrypoint.sh"]