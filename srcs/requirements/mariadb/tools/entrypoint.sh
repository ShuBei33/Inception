touch tmp_mdb
chmod 755 tmp_mdb

cat << break > tmp_mdb
CREATE DATABASE IF NOT EXISTS wordpress;
USE wordpress;
FLUSH PRIVILEGES;
CREATE USER 'estoffel'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL ON *.* TO 'estoffel'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
SET PASSWORD FOR 'estoffel'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');
FLUSH PRIVILEGES;
CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT OPTION ON wordpress.* TO '$MYSQL_USER'@'%' IDENTYFIED BY '$MYSQL_PASSWORD';
break

/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < tmp_mdb
rm -f tmp_mdb

exec /usr/bin/mysqld --console $@