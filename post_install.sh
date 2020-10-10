#!/bin/sh

mkdir -p /usr/local/etc/rc.d

echo "Enable service"
sysrc -f /etc/rc.conf pms_enable="YES"
/usr/local/bin/pmsset auto_update true
/usr/local/bin/pmsset cron "0 5 * * *"

echo "Starting update_pms script from post_install"
/usr/local/bin/update_pms

echo "Post install completed!"