#!/bin/sh

/usr/local/bin/download_latest.sh

sysrc -f /etc/rc.conf bazarr_enable="YES"