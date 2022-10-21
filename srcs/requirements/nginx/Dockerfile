FROM alpine:3.15.6

RUN apk add --update --no-cache nginx openssl \
&& openssl req -x509 -newkey rsa:4096 \
	-keyout /etc/ssl/certs/inception.key \
	-out /etc/ssl/certs/inception.crt \
	-sha256 -days 365 -nodes \
	-subj '/C=FR/ST=Ile-de-France/L=Paris/O=42/CN=estoffel.42.fr' \
&& mkdir -p /var/log/nginx

COPY ./conf/mynginx.conf /etc/nginx/http.d/

#run in foreground
ENTRYPOINT ["nginx", "-g", "daemon off;"]