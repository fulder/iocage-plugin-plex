#!/bin/sh

mkdir -p /usr/local/etc/rc.d

chmod +x /usr/local/etc/rc.d/pms
chmod +x /usr/local/bin/update_pma

echo "Starting update_pma script from post_install"
/usr/local/bin/update_pma

echo "Start pms service"
chmod +x /usr/local/etc/rc.d/pms
sysrc -f /etc/rc.conf pms_enable="YES"
service pms start

echo "Post install completed!"