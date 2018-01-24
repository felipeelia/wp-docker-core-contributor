FROM node

RUN npm install grunt-cli -g

RUN mkdir /src
WORKDIR /src
VOLUME /src

EXPOSE 3000

COPY wait-for-it.sh /usr/local/bin/wait-for-it
RUN chmod +x /usr/local/bin/wait-for-it
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
