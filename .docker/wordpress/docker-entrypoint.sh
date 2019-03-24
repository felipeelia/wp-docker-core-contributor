#!/bin/bash
set -euo pipefail

if ! [ -e src/index.php ]; then
    echo "Copying SVN WordPress files from image cache"
    cp -a ../trunk/. .
    chown -R www-data:www-data .
fi

wait-for-it -t 0 db:3306

# Commented until I find a way to wait until the build process is done.
# if ! [ -e src/wp-config.php ]; then
#     wp core config --dbhost=db --dbname=wordpress --dbuser=wordpress --dbpass=wordpress --extra-php <<PHP
# define( 'WP_DEBUG', true );
# PHP
# fi

svn up

exec "$@"
