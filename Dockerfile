FROM ubuntu:15.04
MAINTAINER denso.ffff@gmail.com

RUN apt-get update && apt-get install -y nodejs npm mc libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++ git

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g http-server browserify gulp
RUN mkdir -p /srv/www

copy WRIO-InternetOS/package.json /srv/modules/WRIO-InternetOS/package.json
RUN cd /srv/modules/WRIO-InternetOS && npm install --unsafe-perm


COPY package.json /srv/modules/package.json
RUN cd /srv/modules/ && npm install --unsafe-perm
COPY . /srv/www/

RUN cd /srv/modules/WRIO-InternetOS/node_modules && rm -fr passport-signin titter-wrio-app && ln -s /srv/www/Titter-WRIO-App titter-wrio-app && ln -s /srv/www/Login-WRIO-App passport-signin

EXPOSE 3000
WORKDIR /srv/www/
CMD ln -s /srv/modules/node_modules node_modules && \
    ln -s /srv/modules/WRIO-InternetOS/node_modules WRIO-InternetOS/node_modules && \
    hs -p 3000 & \
    cd WRIO-InternetOS && npm run watchDOCKER