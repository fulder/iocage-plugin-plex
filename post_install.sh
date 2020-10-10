#!/bin/sh

mkdir -p /usr/local/etc/rc.d

chmod +x /usr/local/etc/rc.d/pms
chmod +x /usr/local/bin/download_latest.sh

echo "Starting download_latest script from post_install"
/usr/local/bin/download_latest.sh

echo "Start pms service"
chmod +x /usr/local/etc/rc.d/pms
sysrc -f /etc/rc.conf pms_enable="YES"
service pms start

echo "Post install completed!"