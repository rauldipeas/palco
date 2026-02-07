#!/bin/bash
set -e
sudo apt install -y plymouth-themes
theme='bgrt-mac-style'
sudo wget -q --show-progress https://github.com/rauldipeas/palco/raw/main/assets/custom-root/bgrt-mac-style.zip
unzip -oqq "$(find "$PWD" -type f -name "$theme".zip)"
sudo cp -r "$theme" /usr/share/plymouth/themes/
rm -r "$theme" "$theme".zip
sudo mv /usr/share/desktop-base/debian-logos/logo-text-version-64.png /usr/share/desktop-base/debian-logos/logo-text-version-64-no-plymouth.png
sudo plymouth-set-default-theme -R "$theme"
sudo chmod -x /etc/grub.d/05_debian_theme
sudo update-initramfs -u -k all