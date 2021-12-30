#!/bin/bash

# sync LE content to our webfarm nodes
MACHINES="iem12.local iem13.local iem15.local iem16.local iemvs100 iemvs101 iemvs102 iemvs103 iemvs104 iemvs105 iemvs106 iemvs107 iemvs108 iemvs109"
for MACH in $MACHINES
do
rsync -a /etc/letsencrypt ${MACH}:/etc/
ssh $MACH systemctl reload httpd
done
