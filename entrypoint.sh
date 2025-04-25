#!/usr/bin/env bash

PATH=/srv/packagr:$PATH

# retrieve the latest bumpr binary
asset_url=$(curl -s https://api.github.com/repos/PackagrIO/bumpr/releases/latest \
	| grep browser_download_url | grep 'packagr-bumpr-linux-amd64' | cut -d '"' -f 4)

# download the bumpr asset here.
curl -L -o /srv/packagr/packagr-bumpr $asset_url

# make bumpr executable
chmod +x /srv/packagr/packagr-bumpr


echo "Starting Bumpr $1"
packagr-bumpr start --scm github --package_type generic
