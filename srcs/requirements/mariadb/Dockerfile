FROM alpine:3.15.6

RUN apk add --update --no-cache mariadb mariadb-client

COPY ./conf/mydb.conf /etc/my.cnf.d/

RUN mkdir -p /run/mysqld/ \
&& chown -R mysql:root /run/mysqld

COPY ./tools/entrypoint.sh /

RUN chmod -R 755 /var/lib/mysql \
&& chmod 755 /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]