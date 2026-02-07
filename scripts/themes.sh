#!/bin/bash
set -e
# Temas
## adw-gtk3
curl -sSL https://julianfairfax.codeberg.page/package-repo/pub.gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/julians-package-repo.gpg 2>/dev/null
printf 'deb [ signed-by=/usr/share/keyrings/julians-package-repo.gpg ] https://julianfairfax.codeberg.page/package-repo/debs packages main' | sudo tee /etc/apt/sources.list.d/julians-package-repo.list >/dev/null
sudo apt update
sudo apt install -y adw-gtk3
## Cursor Bibata
wget -q --show-progress http://ftp.us.debian.org/debian/pool/main/b/bibata-cursor-theme/"$(curl -sSL http://ftp.us.debian.org/debian/pool/main/b/bibata-cursor-theme/ | grep all.deb | tail -n1 | cut -d '"' -f8)"
sudo apt install -y "$PWD"/bibata-cursor-theme*.deb
rm "$PWD"/*.deb
## Fontes Inter
sudo apt install -y fonts-inter
## Ícones Papirus
wget -q --show-progress http://ftp.us.debian.org/debian/pool/main/p/papirus-icon-theme/"$(curl -sSL http://ftp.us.debian.org/debian/pool/main/p/papirus-icon-theme/ | grep git | grep all.deb | cut -d '"' -f8)"
sudo apt install -y "$PWD"/papirus-icon-theme*.deb
rm "$PWD"/*.deb
sudo mkdir -p /usr/local/share/icons/Papirus-Dark/128x128/{apps,mimetypes}