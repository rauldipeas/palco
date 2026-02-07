#!/bin/bash
set -e
sudo sed -i 's/Live Boot Menu with GRUB/Menu de inicialização do Palco/' "$HOME"/Cubic/Palco/custom-disk/boot/grub/live-theme/theme.txt
sudo cp -v "$PWD"/assets/custom-disk/grub.cfg "$HOME"/Cubic/Palco/custom-disk/boot/grub/
sudo cp -v "$PWD"/assets/custom-disk/live.cfg "$HOME"/Cubic/Palco/custom-disk/isolinux/
sudo cp -v "$PWD"/assets/custom-disk/menu.cfg "$HOME"/Cubic/Palco/custom-disk/isolinux/
sudo cp -v "$PWD"/assets/custom-disk/splash.png "$HOME"/Cubic/Palco/custom-disk/boot/grub/
sudo cp -v "$PWD"/assets/custom-disk/splash.png "$HOME"/Cubic/Palco/custom-disk/isolinux/