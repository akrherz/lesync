#!/bin/bash

# sync LE content to our webfarm nodes
MACHINES="iemvs35-dc iemvs36-dc iemvs37-dc iemvs38-dc iemvs39-dc iemvs40-dc iemvs41-dc iemvs42-dc iemvs43-dc iemvs44-dc"
for MACH in $MACHINES
do
rsync -a /etc/letsencrypt ${MACH}:/etc/
ssh $MACH systemctl reload httpd
done
