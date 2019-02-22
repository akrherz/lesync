#!/bin/bash
# The workflow the IEM uses, I am run as root

cd /opt/lesync/webroot
# hack to run this web server just for the next hour
# certbot below now has a random sleep
timeout 3600 python -m SimpleHTTPServer 8081 &

cd /opt/certbot
# if something got renewed, sync content
# Needs . in $PATH to work
export PATH=$PATH:.
sh certbot-auto renew --post-hook "sh /opt/lesync/jobscript/iemsync.sh"
