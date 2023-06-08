#!/bin/bash
# The workflow the IEM uses, I am run as root

cd /opt/lesync/webroot
# hack to run this web server just for the next hour
# certbot below now has a random sleep
timeout 3600 python3 -m http.server 8081 &

# epel has it
certbot renew --post-hook "sh /opt/lesync/jobscript/iemsync.sh"
