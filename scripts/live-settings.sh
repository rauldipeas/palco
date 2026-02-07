#!/bin/bash

# /etc/live/config.conf.d/pt-br.conf
# /usr/bin/add-calamares-desktop-icon
# /usr/bin/calamares-install-debian
# /etc/calamares/branding/debian/branding.desc
# /etc/calamares/modules/locale.conf
# /etc/calamares/modules/partition.conf
# /etc/calamares/modules/users.conf

set -e
# Configurações do modo "live"
## Idioma, teclado e usuário
sudo tee /etc/live/config.conf.d/pt-br.conf >/dev/null <<EOF
LIVE_LOCALES="pt_BR.UTF-8"
LIVE_KEYBOARD_LAYOUTS="br"
LIVE_HOSTNAME="palco"
LIVE_USERNAME="criador"
LIVE_USER_FULLNAME="Criador de conteúdo"
LIVE_USER_AVATAR="/usr/share/icons/Papirus/64x64/apps/distributor-logo-madlinux.svg"
EOF
## Calamares
sudo chmod -x /usr/bin/add-calamares-desktop-icon
sudo sed -i 's/pkexec/sudo/' /usr/bin/calamares-install-debian
sudo sed -i 's/  - umount/  - shellprocess\n  - umount/' /etc/calamares/settings.conf
sudo tee /usr/share/applications/calamares-install-debian.desktop >/dev/null <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Instalar o Palco
GenericName=Instalador Calamares
Exec=calamares-install-debian
Comment=Instalador Calamares
Keywords=calamares;system;install;debian;installer
Icon=calamares
Terminal=false
Categories=Qt;System;
StartupWMClass=calamares
StartupNotify=True
EOF
sudo wget -qO /etc/calamares/branding/debian/branding.desc https://github.com/rauldipeas/palco/raw/main/assets/custom-root/branding.desc
#sudo wget -qO /etc/calamares/branding/debian/slide1.png https://github.com/rauldipeas/palco/raw/main/assets/custom-root/slide1.png
sudo wget -qO /etc/calamares/modules/locale.conf https://github.com/rauldipeas/palco/raw/main/assets/custom-root/locale.conf
sudo wget -qO /etc/calamares/modules/partition.conf https://github.com/rauldipeas/palco/raw/main/assets/custom-root/partition.conf
sudo wget -qO /etc/calamares/modules/shellprocess.conf https://github.com/rauldipeas/palco/raw/main/assets/custom-root/shellprocess.conf
sudo wget -qO /etc/calamares/modules/users.conf https://github.com/rauldipeas/palco/raw/main/assets/custom-root/users.conf
sudo wget -qO /usr/local/bin/gpu-driver https://github.com/rauldipeas/palco/raw/main/assets/custom-root/gpu-driver.sh
sudo chmod +x /usr/local/bin/gpu-driver
## Sincronização do relógio do sistema
sudo apt install -y ntpsec