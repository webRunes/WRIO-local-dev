#!/bin/bash

echo "Apache start script"
ps -e | grep apache

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/* /tmp/httpd* || true
rm -fr /var/run/apache2/* || true

. /etc/apache2/envvars && echo "Starting" && exec /usr/sbin/apache2 -DFOREGROUND

