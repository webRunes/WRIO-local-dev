FROM michbil/wrio:latest
MAINTAINER denso.ffff@gmail.com

# quick fix for docker and npm3 compatibility

RUN cd $(npm root -g)/npm \
 && npm install fs-extra \
 && sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.rename/fs.move/ ./lib/utils/rename.js


copy WRIO-InternetOS/package.json /srv/package.json
RUN cd /srv/ && npm install --unsafe-perm

RUN npm install -g webpack-dev-server webpack

EXPOSE 3000
WORKDIR /srv/www/
CMD cd WRIO-InternetOS && export DOCKER_DEV=TRUE && webpack-dev-server
