FROM node

RUN npm install grunt-cli -g

RUN mkdir -p /var/www/html
WORKDIR /var/www/html
VOLUME /var/www/html

COPY wait-for-it.sh /usr/local/bin/wait-for-it
RUN chmod +x /usr/local/bin/wait-for-it

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Change www-data user to match the host system UID and GID and chown www directory
RUN usermod --non-unique --uid 1000 www-data \
  && groupmod --non-unique --gid 1000 www-data \
  && chown -R www-data:www-data /var/www

USER www-data

EXPOSE 3000
ENTRYPOINT ["/docker-entrypoint.sh"]
