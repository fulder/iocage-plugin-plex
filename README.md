Iocage [plex](https://www.plex.tv/) plugin for TrueNAS/FreeNAS including auto update. 


# Installing manually

In TrueNAS shell run:

* `fetch https://raw.githubusercontent.com/fulder/iocage-plugin-index/plex-autoupdate/plex.json`
* `iocage fetch -P plex.json --name plex dhcp=on`
 