#!/bin/bash
set -e
sudo ln -fs /usr/share/icons/Papirus/64x64/apps/utilities-log-viewer.svg /usr/local/share/icons/Papirus-Dark/128x128/apps/io.github.gaheldev.Millisecond.svg
wget -q --show-progress "$(curl -sSL https://api.github.com/repos/gaheldev/Millisecond/releases | grep browser_download_url | grep download | grep deb | head -n1 | cut -d '"' -f4)"
sudo apt install -y "$PWD"/millisecond*.deb
rm "$PWD"/millisecond*.deb