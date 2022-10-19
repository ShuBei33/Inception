c

RUN apk add --update --no-cache mariadb mariadb-client

COPY ./conf/mydb.conf /etc/my.cnf.d/

RUN mkdir -p /run/mysqld/ \
&& chown -R mysql:mysql /run/mysqld

COPY ./tools/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]