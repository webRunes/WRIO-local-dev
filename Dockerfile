FROM ubuntu:15.04
MAINTAINER denso.ffff@gmail.com

RUN apt-get update && apt-get install -y openssh-server apache2 supervisor nodejs npm mc
RUN apt-get install -y libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++
RUN apt-get install -y git
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
RUN mkdir -p /srv/www
RUN ln -s /usr/bin/nodejs /usr/bin/node

# build package

ADD package.json /srv/www/package.json
RUN npm install -g gulp

# misc packages

COPY Default-WRIO-Theme /srv/www/Default-WRIO-Theme
COPY Plus-WRIO-App /srv/www/Plus-WRIO-App


COPY index.html /srv/www/index.html


#setup apache reverse proxy and modules
COPY apache.conf  /etc/apache2/sites-available/000-default.conf
COPY apache2.conf  /etc/apache2/apache2.conf
RUN ln -s /etc/apache2/mods-available/proxy.conf  /etc/apache2/mods-enabled/proxy.conf
RUN ln -s /etc/apache2/mods-available/proxy.load  /etc/apache2/mods-enabled/proxy.load
RUN ln -s /etc/apache2/mods-available/proxy_html.load  /etc/apache2/mods-enabled/proxy_html.load
RUN ln -s /etc/apache2/mods-available/proxy_http.load  /etc/apache2/mods-enabled/proxy_http.load
COPY keys /srv/www/keys/



COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# WRIO-intenet-os

ADD WRIO-InternetOS/package.json /srv/www/WRIO-InternetOS/package.json
RUN cd /srv/www/WRIO-InternetOS && npm install

ADD WRIO-InternetOS /srv/www/WRIO-InternetOS
#RUN rm /srv/www/WRIO-InternetOS/node_modules || true
RUN rm /srv/www/WRIO-InternetOS/WRIO.js || true



# Login

ADD Login-WRIO-App/package.json /srv/www/Login-WRIO-App/package.json
RUN cd /srv/www/Login-WRIO-App && npm install

ADD Login-WRIO-App /srv/www/Login-WRIO-App
#RUN rm /srv/www/Login-WRIO-App/node_modules || true

# Titter

ADD Titter-WRIO-App/package.json /srv/www/Titter-WRIO-App/package.json
RUN cd /srv/www/Titter-WRIO-App && npm install

ADD Titter-WRIO-App /srv/www/Titter-WRIO-App/
#RUN rm /srv/www/Titter-WRIO-App/node_modules || true

# server

ADD package.json /srv/www/package.json
RUN cd /srv/www/ && npm install

RUN npm install browserify http-server gulp -g


RUN cd /srv/www/WRIO-InternetOS && npm start

EXPOSE 22 80 5000 5001 5002 5003 5004 5005
CMD ["/usr/bin/supervisord"]
#   CMD ["bash"]


