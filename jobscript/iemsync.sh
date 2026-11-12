#!/bin/bash
# Control node maintains the fleet of certificates, this script is a
# post-hook which copies them over to all the service + farm nodes

# sync LE content to our webfarm nodes
MACHINES="iem8-dc iem9-dc iem27-dc iemvs35-dc iemvs36-dc iemvs37-dc iemvs38-dc iemvs39-dc iemvs40-dc iemvs41-dc iemvs42-dc iemvs43-dc iemvs44-dc"
for MACH in $MACHINES
do
    rsync -a /etc/letsencrypt/{live,archive} "${MACH}:/etc/letsencrypt/"
    ssh "$MACH" systemctl reload httpd
done
