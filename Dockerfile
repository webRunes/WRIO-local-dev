FROM mhart/alpine-node:6
MAINTAINER denso.ffff@gmail.com

RUN apk add --no-cache make gcc g++ python
RUN npm install -g yarn@0.17 gulp webpack-dev-server webpack
RUN mkdir -p /srv/www

copy WRIO-InternetOS/package.json WRIO-InternetOS/yarn.lock /srv/
RUN cd /srv/ && yarn

EXPOSE 3000
RUN cd /srv/www && pwd && ls
WORKDIR /srv/www/WRIO-InternetOS
CMD export DOCKER_DEV=TRUE && webpack-dev-server
