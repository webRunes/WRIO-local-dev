FROM ubuntu:15.04
MAINTAINER denso.ffff@gmail.com

RUN apt-get update && apt-get install -y nodejs npm mc libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++ git

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g http-server browserify gulp
RUN mkdir -p /srv/www

copy WRIO-InternetOS/package.json /srv/package.json
RUN cd /srv/ && npm install --unsafe-perm

RUN npm install watchify -g

WORKDIR /srv/

COPY Login-WRIO-App/package.json /srv/package.json
RUN npm install --production

COPY Titter-WRIO-App/package.json /srv/package.json
RUN npm install --production

RUN cd /srv/node_modules/ && rm -fr passport-signin titter-wrio-app && ln -s /srv/www/Titter-WRIO-App titter-wrio-app && ln -s /srv/www/Login-WRIO-App passport-signin

EXPOSE 3000
WORKDIR /srv/www/
CMD rm -fR /srv/www/node_modules && rm -fR /srv/www/WRIO-InternetOS/node_modules && \
    hs -p 3000 & \
    cd WRIO-InternetOS && npm run watchDOCKER