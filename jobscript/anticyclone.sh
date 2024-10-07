#!/bin/bash

cd /opt/lesync/webroot
# hack to run this web server just for the next hour
# certbot below now has a random sleep
# tomcat has 8081
timeout 3600 python3 -m http.server 8082 &

certbot renew
