FROM alpine:3.15.6

RUN apk add --update --no-cache wget mariadb-client php \
php8-curl php8-fpm php8-mysqli php8-json \
php8-xml php8-openssl php8-intl php8-ftp php8-zlib php8-opcache \
php-gd php-intl php-mbstring php-soap php-zip

RUN mkdir -p /var/www \
&& wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
&& cd /var/www && tar xvf wordpress-6.0-fr_FR.tar.gz \
&& rm wordpress-6.0-fr_FR.tar.gz \
&& chown -R root:root /var/www/wordpress

COPY ./conf/myphp-fpm.conf /etc/php8/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setup.sh /setup.sh

ENTRYPOINT ["sh", "/setup.sh"]