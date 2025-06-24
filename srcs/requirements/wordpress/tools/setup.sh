sleep 10

set -x

cd /var/www/wordpress

if [ -f /var/www/wordpress/wp-config.php ]; then
	echo "Already set up, starting..."
	exec /usr/sbin/php-fpm7 -F
	exit 1
fi

echo "Installing WordPress..."
wp config create	--allow-root \
					--dbname=$DB_NAME \
					--dbuser=$MYSQL_USER \
					--dbpass=$MYSQL_PASSWORD \
					--dbhost=mariadb:3306 \
					--path='/var/www/wordpress'

wp db create		--allow-root \

wp core install		--allow-root \
					--url="https://${DOMAIN_NAME}" \
					--title="${WP_TITLE}" \
					--admin_user="${WP_ADMIN_USER}" \
					--admin_password="${WP_ADMIN_PASSWORD}" \
					--admin_email="${WP_ADMIN_MAIL}" \
					--skip-email

wp user create 		--allow-root \
					"${WP_USER}" \
					"${WP_USER_MAIL}" \
					--user_pass="${WP_USER_PASSWORD}" \
					--porcelain

wp search-replace	"https://${DOMAIN_NAME}/wordpress" "https://${DOMAIN_NAME}" \
					--all-tables \
					--allow-root \

wp option update siteurl	"https://$DOMAIN_NAME" \
							--allow-root

wp option update home 		"https://$DOMAIN_NAME" \
							--allow-root


mkdir -p /run/php

exec /usr/sbin/php-fpm7 -F