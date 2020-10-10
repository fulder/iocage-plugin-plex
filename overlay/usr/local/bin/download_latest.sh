#!/bin/sh

echo "Finding latest plex version"
fetch https://plex.tv/pms/downloads/5.json
download_url=$(cat 5.json | jq -r '.computer.FreeBSD.releases[0].url')
version=$(cat 5.json | jq -r '.computer.FreeBSD.version')
rm 5.json

echo "Downloading plex server with version: ${version}"
fetch "${download_url}"

echo "Installing newest pms"
rm -rf /usr/local/pms
tar xzf "PlexMediaServer-${version}-FreeBSD-amd64.tar.bz2" /usr/local/pms
rm "PlexMediaServer-${version}-FreeBSD-amd64.tar.bz2"

echo "Download latest script complete"