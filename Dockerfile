FROM nginx:stable

RUN apt-get update && apt-get install -y \
    php \
    php-mysql \
    php-mbstring \
    php-zip \
    php-gd \
    php-curl \
    php-xml \
    php-fpm \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY ./bookstore /usr/share/nginx/html/
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/php_site.conf /etc/nginx/conf.d/default.conf
COPY /nginx/5-php-pfm_entrypoint.sh /docker-entrypoint.d/

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]