FROM ubuntu:15.04
MAINTAINER denso.ffff@gmail.com

RUN apt-get update && apt-get install -y openssh-server apache2 supervisor nodejs npm mc
RUN apt-get install -y libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
RUN mkdir -p /srv/www
RUN ln -s /usr/bin/nodejs /usr/bin/node

COPY Titter-WRIO-App /srv/www/Titter-WRIO-App/
COPY Login-WRIO-App /srv/www/Login-WRIO-App

COPY keys /srv/www/keys/

RUN cd /srv/www/Login-WRIO-App && npm install
RUN cd /srv/www/Titter-WRIO-App && npm install


COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


EXPOSE 22 80 5000 5001 5002 5003 5004 5005
CMD ["/usr/bin/supervisord"]
#   CMD ["bash"]


