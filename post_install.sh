#!/bin/sh

mkdir -p /usr/local/etc/rc.d

echo "Enable plex auto update"
/usr/local/bin/pmsset auto_update true
/usr/local/bin/pmsset cron "0 5 * * *"

echo "Starting update_pma script from post_install"
/usr/local/bin/update_pma

echo "Start pms service"
sysrc -f /etc/rc.conf pms_enable="YES"
service pms start

echo "Post install completed!"