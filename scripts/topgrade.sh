#!/bin/bash
set -e
wget -q --show-progress "$(curl -sSL https://api.github.com/repos/topgrade-rs/topgrade/releases | grep browser_download_url | grep deb | head -n1 | cut -d '"' -f4)"
sudo apt install -y "$PWD"/topgrade*.deb
rm "$PWD"/topgrade*.deb
sudo mkdir -p /usr/local/share/{applications,icons}
sudo wget -q --show-progress -O /usr/local/share/icons/aptdaemon-update-cache.png https://cdn-icons-png.flaticon.com/512/7686/7686946.png
sudo tee /usr/local/share/applications/topgrade.desktop >/dev/null <<EOF
[Desktop Entry]
Type=Application
Name=Topgrade
Exec=bash -c "topgrade; printf 'Pressione qualquer tecla para fechar...'; read -n1"
Icon=aptdaemon-update-cache
Terminal=true
Categories=System;Utility;
StartupNotify=true
EOF