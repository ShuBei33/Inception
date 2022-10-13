FROM alpine:3.15.6

RUN apk add --update --no-cache mariadb mariadb-client \
&& rm -rf /var/lib/mysql \
&& mkdir -p /var/lib/mysql

COPY ./conf/mydb.conf /etc/my.cnf.d

ENTRYPOINT ["sh", "entrypoint.sh"]