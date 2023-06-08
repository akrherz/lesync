#!/bin/bash
# Copy the new certs in for Openfire to use, fix perms

cp -f /etc/letsencrypt/live/weather.im/privkey.pem /tmp/weatherim_privkey.pem
# needs fullchain
cp -f /etc/letsencrypt/live/weather.im/fullchain.pem /tmp/weatherim_cert.pem
chown daemon:daemon /tmp/weatherim*.pem
rsync -a /tmp/weatherim*.pem iem11-dc:/opt/openfire/resources/security/hotdeploy/

exit 0
