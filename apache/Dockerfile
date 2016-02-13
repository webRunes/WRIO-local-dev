FROM michbil/wrio:latest
MAINTAINER denso.ffff@gmail.com
RUN apt-get install -y apache2

RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
RUN mkdir -p /srv/www

#setup apache reverse proxy and modules
COPY apache.conf  /etc/apache2/sites-available/000-default.conf
COPY apache2.conf  /etc/apache2/apache2.conf
COPY run-apache.sh /

RUN ln -s /etc/apache2/mods-available/proxy.conf  /etc/apache2/mods-enabled/proxy.conf
RUN ln -s /etc/apache2/mods-available/proxy.load  /etc/apache2/mods-enabled/proxy.load
RUN ln -s /etc/apache2/mods-available/proxy_html.load  /etc/apache2/mods-enabled/proxy_html.load
RUN ln -s /etc/apache2/mods-available/proxy_http.load  /etc/apache2/mods-enabled/proxy_http.load

CMD bash /run-apache.sh || true
