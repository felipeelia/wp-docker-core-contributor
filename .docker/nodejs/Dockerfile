FROM node

RUN npm install grunt-cli -g

RUN mkdir /src
WORKDIR /src
VOLUME /src

EXPOSE 3000

COPY wait-for-it.sh /usr/local/bin/wait-for-it
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
