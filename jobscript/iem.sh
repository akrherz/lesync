#!/bin/bash
# The workflow the IEM uses, I am run as root

cd /opt/lesync/webroot
# hack to run this web server just for the next 3 minutes
timeout 180 python -m SimpleHTTPServer 8081 &

cd /opt/certbot
# if something got renewed, sync content
sh certbot-auto renew --post-hook "sh iemsync.sh"