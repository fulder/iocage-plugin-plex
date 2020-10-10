#!/bin/sh

/usr/local/bin/update_pms

sysrc -f /etc/rc.conf pms_enable="YES"