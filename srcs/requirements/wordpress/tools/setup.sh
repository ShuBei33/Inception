sleep 6

wp config create	--allow-root \
					--dbname=$DB_NAME \
					--dbuser=$MYSQL_USER \
					--dbpass=$MYSQL_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'
wp db create
wp core install		--url="bbrassar.42.fr/wordpress" \
					--title="${WP_TITLE}" \
					--admin_user="${WP_ADMIN_USER}" \
					--admin_password="${WP_ADMIN_PASSWORD}" \
					--admin_email="${WP_ADMIN_MAIL}" \
					--skip-email
wp user create 		"${WP_USER}" \
					"${WP_USER_MAIL}" \
					--user_pass="${WP_USER_PASSWORD}" \
					--porcelain

mkdir -p /run/php

/usr/sbin/php-fpm8 -F