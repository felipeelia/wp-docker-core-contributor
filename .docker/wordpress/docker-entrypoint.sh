#!/bin/bash
set -euo pipefail

if ! [ -e src/index.php ]; then
    echo "Copying SVN WordPress files from image cache"
    cp -a ../trunk/. .
    chown -R www-data:www-data .
fi

if ! [ -e src/wp-config.php ]; then
    wp core config --dbhost=db --dbname=wordpress --dbuser=wordpress --dbpass=wordpress --extra-php <<PHP
define( 'WP_DEBUG', true );
PHP
fi

svn up

exec "$@"
