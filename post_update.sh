#!/bin/sh

/usr/local/bin/update_pma

sysrc -f /etc/rc.conf bazarr_enable="YES"