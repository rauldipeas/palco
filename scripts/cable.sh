#!/bin/bash
set -e
sudo ln -fs /usr/share/icons/Papirus/64x64/apps/laditools.svg /usr/local/share/icons/Papirus-Dark/128x128/apps/jack-plug.svg
wget -q --show-progress "$(curl -sSL https://api.github.com/repos/magillos/Cable/releases | grep browser_download_url | grep deb | head -n1 | cut -d '"' -f4)"
sudo apt install -y "$PWD"/Cable*.deb
rm "$PWD"/Cable*.deb
#sudo mkdir -p /etc/skel/.config/cable
#sudo tee /etc/skel/.config/cable/config.ini >/dev/null <<EOF
#[DEFAULT]
#tray_enabled = True
#EOF
sudo mkdir -p /usr/local/share/applications
sudo tee /usr/local/share/applications/cables.desktop >/dev/null <<EOF
[Desktop Entry]
Name=Cables
Exec=pw-jack cable %u
Icon=jack-plug
Terminal=false
Type=Application
StartupWMClass=connection-manager.py
NoDisplay=true
EOF