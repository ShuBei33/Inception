FROM alpine:3.15.6

RUN apk add --update --no-cache wget mariadb-client \
php7-curl php7-fpm php7-mysqli php7-json php7-dom php7-exif php7-fileinfo \
php7-xml php7-openssl php7-intl php7-ftp php7-zlib php7-opcache php7-zip php7-iconv \
php-gd php-intl php-mbstring php-soap php-zip php7-phar php7-simplexml php7-sodium php7-xmlreader \
php7-ssh2 php7-ftp php7-sockets php7-session php7-tokenizer

RUN mkdir -p /var/www \
&& wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
&& cd /var/www && tar xvf wordpress-6.0-fr_FR.tar.gz \
&& rm wordpress-6.0-fr_FR.tar.gz

COPY ./conf/www.conf /etc/php7/php-fpm.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setup.sh /setup.sh

ENTRYPOINT ["sh", "/setup.sh"]