FROM webrunes/wriobase:latest
MAINTAINER denso.ffff@gmail.com
RUN apt-get install -y apache2

RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
RUN mkdir -p /srv/www

#setup apache reverse proxy and modules
COPY apache.conf  /etc/apache2/sites-available/000-default.conf
COPY apache2.conf  /etc/apache2/apache2.conf
COPY run-apache.sh /
RUN a2enmod xml2enc
RUN a2enmod rewrite headers proxy_http  proxy_html proxy_wstunnel

CMD bash /run-apache.sh || true
