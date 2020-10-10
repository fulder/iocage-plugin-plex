#!/bin/sh

echo "Finding latest plex version"
fetch https://plex.tv/pms/downloads/5.json
download_url=$(jq -r '.computer.FreeBSD.releases[0].url' < 5.json)
version=$(jq -r '.computer.FreeBSD.version' < 5.json)
rm 5.json

old_version=$(cat /usr/local/pms/version.txt 2>/dev/null || echo "123")

if [ "$old_version" = "$version" ]
then
    echo "Version already up to date"
else
    echo "Downloading plex server with version: ${version}"
    fetch "${download_url}"

    echo "Installing newest pms"
    rm -rf /usr/local/pms
    tar xzf "PlexMediaServer-${version}-FreeBSD-amd64.tar.bz2"
    mv "./PlexMediaServer-${version}" /usr/local/pms
    rm "PlexMediaServer-${version}-FreeBSD-amd64.tar.bz2"
    echo "${version}" >> /usr/local/pms/version.txt

    echo "Download latest script complete"
fi