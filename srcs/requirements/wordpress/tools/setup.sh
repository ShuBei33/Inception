sleep 10

set -x

cd /var/www/wordpress

if [ -f /var/www/wordpress/wp-config.php ]; then
	echo "Already set up, starting..."
	exec /usr/sbin/php-fpm7 -F
	exit 1
fi

echo "Installing..."
wp config create	--allow-root \
					--dbname=$DB_NAME \
					--dbuser=$MYSQL_USER \
					--dbpass=$MYSQL_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'
wp db create
wp core install		--url="estoffel.42.fr/wordpress" \
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

exec /usr/sbin/php-fpm7 -F